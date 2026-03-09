# AGENTS.md - LabBook Python Development Guide

This document provides essential information for AI coding agents working on the LabBook Python codebase. LabBook is a Flask-based web application for laboratory data management with separate backend (labbook_BE) and frontend (labbook_FE) components.

## Build, Lint, and Test Commands

### Build Commands
- **Full build**: `make devbuild` - Builds Docker image from working directory
- **Production build**: `make build [VERSION=version]` - Builds production image from tagged version
- **Clean build**: `make devclean` - Removes development image

### Development Environment
- **Start application**: `make devrun` - Runs container with volume mounts for live development
- **Stop application**: `make devstop` - Stops the running container
- **Access application**: http://localhost:5000/sigl

### Database Commands
- **Initialize database**: `make dbinit` - Loads demo database from etc/sql/demo_dump.sql
- **Test connection**: `make dbtest` - Verifies database connectivity

### Testing
- **Run single test**: No standard test runner configured. Execute Python test files directly:
  - `python labbook_BE/script/test/test_template.py` - Test PDF template generation
  - `python labbook_BE/script/test/test_lab28.py` - Test Lab28 analyzer integration
  - `python labbook_BE/script/test/test_backup.sh` - Test backup functionality
- **Quality checks**: SonarQube analysis configured (sonar-project.properties)

### Code Quality
- **Linting**: No dedicated linter configured. Use SonarQube for static analysis
- **Type checking**: Not configured - add mypy for type checking if needed
- **Security scanning**: pip-audit available in dependencies for vulnerability checks

## Code Style Guidelines

### Python Version and Dependencies
- **Python version**: 3.11
- **Dependency management**: pipenv (Pipfile-based)
- **Virtual environment**: Required for both FE and BE components

### File Structure and Naming
- **Backend**: `labbook_BE/app/` - Main application code
- **Frontend**: `labbook_FE/app/` - Flask frontend with Jinja2 templates
- **Scripts**: `labbook_BE/script/` - Utility and test scripts
- **Naming conventions**: 
  - Classes: PascalCase (e.g., `TestResource`, `AuditManager`)
  - Functions/methods: snake_case (e.g., `get_user_data()`, `validate_input()`)
  - Variables: snake_case (e.g., `user_id`, `result_data`)
  - Constants: UPPER_CASE (e.g., `DB_HOST`, `LOG_LEVEL`)

### Import Organization
```python
# Standard library imports first
import os
import logging
from datetime import datetime

# Third-party imports
from flask import Flask, request
from flask_restful import Resource

# Local imports - organized by type
from app.models.User import User
from app.services.AuthService import AuthService
from app.security.oauth_routes import require_oauth
```

### Code Structure Patterns

#### REST Resources (Backend)
```python
class ExampleResource(Resource):
    log = logging.getLogger('log_services')

    @require_oauth()
    def get(self, param_id=None):
        audit_user = request.oauth_user
        try:
            # Business logic here
            result = self.process_request(param_id)

            # Audit logging
            details = {"result": "SUCCESS", "param_id": param_id}
            Audit.insertAudit(audit_user, "ExampleResource", "CATEGORY", param_id, "SUCCESS", details, "R")

            return compose_ret(result, Constants.cst_content_type_json)
        except Exception as err:
            self.log.error(Logs.fileline() + f' : ExampleResource ERROR: {str(err)}')
            return compose_ret({"error": str(err)}, Constants.cst_content_type_json, 500)
```

#### Error Handling
- Use try/except blocks for all database operations and external calls
- Log errors with context using `Logs.fileline() + ' : message'`
- Return appropriate HTTP status codes
- Include audit logging for security-critical operations

#### Logging
```python
log = logging.getLogger('log_services')
log.info(Logs.fileline() + ' : Operation completed successfully')
log.error(Logs.fileline() + f' : Error details: {str(err)}')
```

### Security Best Practices
- **Authentication**: OAuth2 required for all API endpoints except explicitly marked external
- **Input validation**: Validate all user inputs, especially file uploads
- **Audit logging**: Log all user actions with context
- **Secrets management**: Use environment variables for sensitive data
- **File operations**: Validate paths to prevent directory traversal
- **SQL injection**: Use parameterized queries (handled by ORM/models)

### Database and Models
- **ORM**: Custom model classes in `app/models/`
- **Connection**: MySQL/MariaDB with UTF-8 encoding
- **Migrations**: Alembic for schema changes
- **Transactions**: Handle database transactions appropriately

### Internationalization
- **i18n**: Use gettext `_()` for user-facing strings
- **Language support**: Multiple languages (fr_FR, en_GB, en_US, es, ar, km, lo, mg, pt)
- **Database content**: Language-specific content handled via `Various.useLangDB()`

### Configuration
- **Settings**: `default_settings.py` for defaults, `local_settings.py` for overrides
- **Environment variables**: Override settings via `LOCAL_SETTINGS` env var
- **Database config**: Separate config file `labbook.conf` in `~/.config/` or home directory

### Frontend Integration
- **Templates**: Jinja2 templates in `labbook_FE/app/templates/`
- **Static files**: CSS/JS in `labbook_FE/app/static/`
- **API calls**: RESTful communication between FE and BE
- **State management**: Session-based with Flask sessions

### Development Workflow
1. **Setup**: Run `make dbinit` to set up demo database
2. **Development**: Use `make devrun` for live development with volume mounts
3. **Testing**: Run individual test scripts or create new ones as needed
4. **Quality**: Ensure SonarQube passes for code quality
5. **Deployment**: Use `make build` and `make save` for production releases

### Common Patterns
- **Response formatting**: Use `compose_ret()` for consistent API responses
- **Constants**: Import from `app.models.Various.Constants`
- **User context**: Access via `request.oauth_user`
- **File paths**: Use absolute paths, validate before operations
- **Date handling**: Use Python datetime objects consistently

### Performance Considerations
- **Database queries**: Optimize with appropriate indexes
- **Caching**: Consider Flask-Caching for expensive operations
- **File operations**: Handle large files carefully
- **Memory usage**: Monitor for memory leaks in long-running processes

### Documentation
- **API docs**: Interactive docs at `/sigl/api`
- **Code comments**: Use docstrings for complex functions
- **Change logs**: Update CHANGELOG.md for significant changes
- **Technical docs**: See `doc/` directory for detailed documentation

This guide should be updated as development practices evolve. Always check the actual codebase for the latest patterns and ensure compliance with security requirements.