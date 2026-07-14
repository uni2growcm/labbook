#!/bin/bash
# =============================================================================
# deploy-labbook.sh - Script de mise en production de LabBook
# =============================================================================
set -euo pipefail

# =============================================================================
# CONFIGURATION - Editez ces variables selon votre environnement
# =============================================================================
LABBOOK_DB_USER="isf"
LABBOOK_DB_PWD="isf123"
LABBOOK_DB_NAME="SIGL"
LABBOOK_DB_HOST="185.98.136.222" #Adresse IP du serveur MySQL distant
LABBOOK_VERSION="3.6.15"
INSTALL_DIR="/opt/labbook"
POD_NAME="labbook"
CONTAINER_NAME="labbook_python"
STORAGE_DIR="/var/lib/labbook/storage"
LOGS_DIR="/var/lib/labbook/logs"
POD_PORT=5000
IMAGE_NAME="localhost/labbook-python"
SERVICE_DIR="/etc/systemd/system"

# =============================================================================
# COULEURS
# =============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# =============================================================================
# 1. VERIFICATIONS PREALABLES
# =============================================================================
info "Etape 1/6 : Verifications prealables..."

# Verifier root
if [ "$(id -u)" -ne 0 ]; then
    error "Ce script doit etre execute en tant que root (sudo ./deploy-labbook.sh)"
fi

# Verifier podman ou docker
if command -v podman &> /dev/null; then
    CONTAINER_CMD="podman"
elif command -v docker &> /dev/null; then
    CONTAINER_CMD="docker"
else
    error "Ni podman ni docker n'est installe."
fi
info "Utilisation de $CONTAINER_CMD"

# Verifier que le repertoire source existe
if [ ! -f "${INSTALL_DIR}/source/labbook/Makefile" ]; then
    error "Makefile non trouve dans ${INSTALL_DIR}/source/labbook/"
fi

# Verifier la version de l'image
IMAGE_TAG="${IMAGE_NAME}:${LABBOOK_VERSION}"
if ! $CONTAINER_CMD image exists "$IMAGE_TAG" 2>/dev/null; then
    error "L'image $IMAGE_TAG n'existe pas. Lancez 'make build VERSION=${LABBOOK_VERSION}' d'abord."
fi
info "Image $IMAGE_TAG trouvee"

# Verifier connectivite MySQL
info "Test de connexion a MySQL (${LABBOOK_DB_USER}@${LABBOOK_DB_HOST})..."
if ! mysql -u "$LABBOOK_DB_USER" -p"$LABBOOK_DB_PWD" -h "$LABBOOK_DB_HOST" -e "SELECT 1" &>/dev/null; then
    error "Impossible de se connecter a MySQL. Verifiez les identifiants et que MySQL accepte les connexions."
fi
info "Connexion MySQL OK"

# Verifier que la base de donnees existe
if ! mysql -u "$LABBOOK_DB_USER" -p"$LABBOOK_DB_PWD" -h "$LABBOOK_DB_HOST" -e "USE ${LABBOOK_DB_NAME}" &>/dev/null; then
    warn "La base ${LABBOOK_DB_NAME} n'existe pas. Creation..."
    mysql -u "$LABBOOK_DB_USER" -p"$LABBOOK_DB_PWD" -h "$LABBOOK_DB_HOST" -e \
        "CREATE DATABASE IF NOT EXISTS ${LABBOOK_DB_NAME} CHARACTER SET utf8 COLLATE utf8_unicode_ci; GRANT ALL PRIVILEGES ON ${LABBOOK_DB_NAME}.* TO '${LABBOOK_DB_USER}'@'%'; FLUSH PRIVILEGES;"
    info "Base ${LABBOOK_DB_NAME} creee"
fi
info "Base ${LABBOOK_DB_NAME} accessible"

# =============================================================================
# 2. CREER LE FICHIER DE CONFIGURATION
# =============================================================================
info "Etape 2/6 : Creation de labbook.conf..."

CONFIG_DIR="${HOME}/.config"
mkdir -p "$CONFIG_DIR"
CONFIG_FILE="${CONFIG_DIR}/labbook.conf"

cat > "$CONFIG_FILE" << EOF
LABBOOK_DB_USER = ${LABBOOK_DB_USER}
LABBOOK_DB_PWD = ${LABBOOK_DB_PWD}
LABBOOK_DB_NAME = ${LABBOOK_DB_NAME}
LABBOOK_DB_HOST = ${LABBOOK_DB_HOST}
LABBOOK_DEBUG = 0
LABBOOK_ROOTLESS = 1
LABBOOK_URL_PREFIX = /sigl
LABBOOK_TEST_OK =
LABBOOK_TEST_KO =
LABBOOK_USER = root
LABBOOK_MEDIA_DIR =
LABBOOK_DUMP_COL_STATS =
EOF
info "Fichier ${CONFIG_FILE} cree"

# =============================================================================
# 3. CREER LES REPERTOIRES
# =============================================================================
info "Etape 3/6 : Creation des repertoires..."

mkdir -p "$STORAGE_DIR" "$LOGS_DIR"
info "Repertoires crees : ${STORAGE_DIR}, ${LOGS_DIR}"

# =============================================================================
# 4. INSTALLER LES SERVICES SYSTEMD
# =============================================================================
info "Etape 4/6 : Installation des services systemd..."

# Service pod
cat > "${SERVICE_DIR}/pod-${POD_NAME}.service" << EOF
# pod-${POD_NAME}.service
[Unit]
Description=Podman pod-${POD_NAME}.service
Documentation=man:podman-generate-systemd(1)
Wants=network.target
After=network-online.target
Requires=container-${CONTAINER_NAME}.service
Before=container-${CONTAINER_NAME}.service

[Service]
Environment=PODMAN_SYSTEMD_UNIT=%n
Restart=on-failure
TimeoutStopSec=70
ExecStartPre=/bin/rm -f %t/pod-${POD_NAME}.pid %t/pod-${POD_NAME}.pod-id
ExecStartPre=/usr/bin/podman pod create --infra-conmon-pidfile %t/pod-${POD_NAME}.pid --pod-id-file %t/pod-${POD_NAME}.pod-id --name ${POD_NAME} --network slirp4netns:allow_host_loopback=true --publish ${POD_PORT}:80 --replace
ExecStart=/usr/bin/podman pod start --pod-id-file %t/pod-${POD_NAME}.pod-id
ExecStop=/usr/bin/podman pod stop --ignore --pod-id-file %t/pod-${POD_NAME}.pod-id -t 10
ExecStopPost=/usr/bin/podman pod rm --ignore -f --pod-id-file %t/pod-${POD_NAME}.pod-id
PIDFile=%t/pod-${POD_NAME}.pid
Type=forking

[Install]
WantedBy=multi-user.target default.target
EOF
info "Service pod-${POD_NAME}.service cree"

# Service container
cat > "${SERVICE_DIR}/container-${CONTAINER_NAME}.service" << EOF
# container-${CONTAINER_NAME}.service
[Unit]
Description=Podman container-${CONTAINER_NAME}.service
Documentation=man:podman-generate-systemd(1)
Wants=network.target
After=network-online.target
BindsTo=pod-${POD_NAME}.service
After=pod-${POD_NAME}.service

[Service]
Environment=PODMAN_SYSTEMD_UNIT=%n
Restart=on-failure
TimeoutStopSec=70
ExecStartPre=/bin/rm -f %t/container-${CONTAINER_NAME}.pid %t/container-${CONTAINER_NAME}.ctr-id
ExecStart=/usr/bin/podman run --conmon-pidfile %t/container-${CONTAINER_NAME}.pid --cidfile %t/container-${CONTAINER_NAME}.ctr-id --cgroups=no-conmon --pod-id-file %t/pod-${POD_NAME}.pod-id --replace -d --name ${CONTAINER_NAME} --pod ${POD_NAME} --tz=local --env TZ --env LANG --env LABBOOK_DB_USER=${LABBOOK_DB_USER} --env LABBOOK_DB_PWD=${LABBOOK_DB_PWD} --env LABBOOK_DB_NAME=${LABBOOK_DB_NAME} --env LABBOOK_DB_HOST=${LABBOOK_DB_HOST} --env LABBOOK_DEBUG=0 --volume=${STORAGE_DIR}:/storage:Z --volume=${LOGS_DIR}:/home/apps/logs:Z ${IMAGE_TAG}
ExecStop=/usr/bin/podman stop --ignore --cidfile %t/container-${CONTAINER_NAME}.ctr-id -t 10
ExecStopPost=/usr/bin/podman rm --ignore -f --cidfile %t/container-${CONTAINER_NAME}.ctr-id
PIDFile=%t/container-${CONTAINER_NAME}.pid
Type=forking

[Install]
WantedBy=multi-user.target default.target
EOF
info "Service container-${CONTAINER_NAME}.service cree"

# =============================================================================
# 5. ACTIVER ET DEMARRER LES SERVICES
# =============================================================================
info "Etape 5/6 : Activation des services..."

# Arreter les anciens services s'ils existent
systemctl stop "container-${CONTAINER_NAME}" 2>/dev/null || true
systemctl stop "pod-${POD_NAME}" 2>/dev/null || true

# Nettoyage des anciens containers
$CONTAINER_CMD stop "$CONTAINER_NAME" 2>/dev/null || true
$CONTAINER_CMD rm "$CONTAINER_NAME" 2>/dev/null || true
$CONTAINER_CMD pod stop "$POD_NAME" 2>/dev/null || true
$CONTAINER_CMD pod rm "$POD_NAME" 2>/dev/null || true

# Recharger et activer
systemctl daemon-reload
systemctl enable "pod-${POD_NAME}" "container-${CONTAINER_NAME}"
systemctl start "pod-${POD_NAME}"
info "Services demarres"

# =============================================================================
# 6. ATTENDRE QUE L'APPLI SOIT PRETE
# =============================================================================
info "Etape 6/6 : Attente du demarrage de l'application..."

MAX_WAIT=120
WAITED=0
while [ $WAITED -lt $MAX_WAIT ]; do
    if $CONTAINER_CMD exec "$CONTAINER_NAME" curl -sf localhost:8082/services/init/version &>/dev/null; then
        info "Application prete !"
        break
    fi
    sleep 2
    WAITED=$((WAITED + 2))
    echo -ne "\rAttente... ${WAITED}s/${MAX_WAIT}s"
done
echo ""

if [ $WAITED -ge $MAX_WAIT ]; then
    warn "L'application n'a pas repondu dans ${MAX_WAIT}s. Verifiez les logs :"
    warn "  journalctl -u container-${CONTAINER_NAME} --tail 50"
    exit 1
fi

# =============================================================================
# RESUME
# =============================================================================
echo ""
echo "=========================================="
echo "  DEPLOIEMENT LABBOOK TERMINE"
echo "=========================================="
echo ""
echo "  Version    : ${LABBOOK_VERSION}"
echo "  Image      : ${IMAGE_TAG}"
echo "  Container  : ${CONTAINER_NAME}"
echo "  Pod        : ${POD_NAME}"
echo "  Port       : ${POD_PORT}"
echo "  Base       : ${LABBOOK_DB_NAME}@${LABBOOK_DB_HOST}"
echo ""
echo "  URL locale : http://localhost:${POD_PORT}/sigl"
echo ""
echo "  Logs       : ${LOGS_DIR}/"
echo ""
echo "  Commandes utiles :"
echo "    Voir les logs      : journalctl -u container-${CONTAINER_NAME} -f"
echo "    Redemarrer         : systemctl restart container-${CONTAINER_NAME}"
echo "    Arreter            : systemctl stop container-${CONTAINER_NAME}"
echo "    Shell dans le cont : podman exec -it ${CONTAINER_NAME} bash"
echo ""
echo "  N'oubliez pas de configurer le reverse proxy Apache"
echo "  pour https://labbook.uni2growcameroun.com"
echo "=========================================="
