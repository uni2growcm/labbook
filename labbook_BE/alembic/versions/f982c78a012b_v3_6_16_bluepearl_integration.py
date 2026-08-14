"""v3_6_16_bluepearl_integration

Revision ID: f982c78a012b
Revises: 43eed8e3b5c6
Create Date: 2026-08-13 16:00:00.000000

"""
from alembic import op
from sqlalchemy import text
from datetime import datetime


# revision identifiers, used by Alembic.
revision = 'f982c78a012b'
down_revision = '43eed8e3b5c6'
branch_labels = None
depends_on = None


def upgrade():
    print("--- " + str(datetime.today()) + "---")
    print("START of migration v3_6_16_bluepearl_integration revision=f982c78a012b")

    conn = op.get_bind()

    # ------------------------------------------------------------------
    # 1. bluepearl_map – mapping BPHT testId/ParameterId ↔ LabBook ana
    # ------------------------------------------------------------------
    conn.execute(text("""
        CREATE TABLE IF NOT EXISTS `bluepearl_map` (
            `bpm_ser`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
            `bpm_machinename`  VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'Machine identifier in BPHT / eLab',
            `bpm_test_id`      INT(11) NOT NULL COMMENT 'testId from BPHT',
            `bpm_test_name`    VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'testname label from BPHT',
            `bpm_param_id`     INT(11) NOT NULL COMMENT 'ParameterId from BPHT',
            `bpm_param_name`   VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'Parametername label from BPHT',
            `bpm_ana_id`       INT(10) UNSIGNED DEFAULT NULL COMMENT 'FK → sigl_05_data.id_data (analysis ref)',
            `bpm_var_id`       INT(10) UNSIGNED DEFAULT NULL COMMENT 'FK → sigl_07_data.id_data (variable ref)',
            `bpm_ana_code`     VARCHAR(10) DEFAULT NULL COMMENT 'Cached ana code for quick lookup',
            `bpm_var_code`     VARCHAR(10) DEFAULT NULL COMMENT 'Cached var code_var for quick lookup',
            `bpm_active`       VARCHAR(1) NOT NULL DEFAULT 'Y',
            `bpm_created_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `bpm_updated_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`bpm_ser`),
            UNIQUE KEY `uq_bpm_machine_test_param` (`bpm_machinename`, `bpm_test_id`, `bpm_param_id`),
            KEY `idx_bpm_ana` (`bpm_ana_id`),
            KEY `idx_bpm_var` (`bpm_var_id`),
            KEY `idx_bpm_test` (`bpm_test_id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci
        COMMENT='Mapping between BPHT/eLab test/parameter identifiers and LabBook analysis/variable';
    """))

    print("  Table bluepearl_map created")

    # ------------------------------------------------------------------
    # 2. bluepearl_ack – tracks which orders have been acknowledged by BPHT
    # ------------------------------------------------------------------
    conn.execute(text("""
        CREATE TABLE IF NOT EXISTS `bluepearl_ack` (
            `bpa_ser`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
            `bpa_barcode`      VARCHAR(50) NOT NULL COMMENT 'Sample barcode (maps to sigl_01_data.code)',
            `bpa_id_samp`      INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK → sigl_01_data.id_data',
            `bpa_sent`         TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=acknowledged by BPHT',
            `bpa_sent_date`    DATETIME DEFAULT NULL COMMENT 'Date when first sent to BPHT via GET',
            `bpa_ack_date`     DATETIME DEFAULT NULL COMMENT 'Date when BPHT acknowledged receipt',
            `bpa_created_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`bpa_ser`),
            UNIQUE KEY `uq_bpa_barcode` (`bpa_barcode`),
            KEY `idx_bpa_samp` (`bpa_id_samp`),
            KEY `idx_bpa_sent` (`bpa_sent`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci
        COMMENT='Tracks order acknowledgment status between LabBook and BPHT';
    """))

    print("  Table bluepearl_ack created")

    # ------------------------------------------------------------------
    # 3. Insert the BPHT OAuth2 client (client_credentials grant)
    # ------------------------------------------------------------------
    conn.execute(text("""
        INSERT IGNORE INTO `oauth2_client`
        (`oacl_client_id`, `oacl_client_secret`, `oacl_client_name`, `oacl_user_id`,
         `oacl_redirect_uris`, `oacl_scope`, `oacl_grant_types`, `oacl_response_types`,
         `oacl_token_endpoint_auth_method`, `oacl_is_active`)
        VALUES
        ('BPHT-API',
         'a3f0ab40d2bf9a2ec4fa8a01b622a3d8290234be4b5839e9b34f515a9125c45a,
         'Blue Pearl BPHT / eLab Machine Connect',
         0,
         '',
         'external/bluepearl',
         'client_credentials',
         'code',
         'client_secret_post',
         'Y');
    """))

    print("  OAuth2 client 'BPHT-API' inserted")

    print("END of migration v3_6_16_bluepearl_integration")


def downgrade():
    conn = op.get_bind()

    conn.execute(text("DELETE FROM oauth2_client WHERE oacl_client_id = 'BPHT-API'"))
    conn.execute(text("DROP TABLE IF EXISTS `bluepearl_ack`"))
    conn.execute(text("DROP TABLE IF EXISTS `bluepearl_map`"))
