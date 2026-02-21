# Architecture and Runtime Flow

## 1. High-level architecture

This project follows a two-layer design:

1. Generator layer (`generate/backend`)
- Provides UI and action to create restaurant instances.
- Handles filesystem copy + config token replacement + DB provisioning.

2. Generated restaurant layer (`app/<restaurant_id>`)
- Each generated app is an independent Yii web application with frontend/backend/api entries.
- Runtime modules come from `synctech/restotech-standard` package.

## 2. Main generation controller behavior

Primary implementation is in:
- `generate/backend/controllers/SiteController.php`

Key actions:

- `actionIndex($generate = 0)`
  - Reads subdirectories under `app/`.
  - If directories exist and `generate` flag is false, shows “Available Restaurant” links.
  - Otherwise renders generation form.

- `actionGeneratePos()`
  - Reads POST fields: `restaurant_id`, `restaurant_name`, `alamat`, `phone`.
  - Copies `template/` to `app/<restaurant_id>`.
  - Replaces tokens in generated config:
    - `<generatedId>`
    - `<generatedDbUsername>`
    - `<generatedDbPassword>`
  - Creates database named `<restaurant_id>` on host `restotech_mariadb_server`.
  - Executes:
    - `dbtemplate/restotech_template.sql`
    - `dbtemplate/company_template.sql` (with name/address/phone placeholders replaced)
  - Returns generated URL page.

## 3. Config composition model

### 3.1 Generator app composition

`generate/backend/web/index.php` merges:
- `generate/common/config/main.php`
- `generate/common/config/main-local.php`
- `generate/backend/config/main.php`
- `generate/backend/config/main-local.php`

### 3.2 Generated app composition (frontend example)

`template/index.php` merges:
- `template/engine/common/config/main-local.php`
- `template/engine/frontend/config/main.php`
- `template/engine/frontend/config/main-local.php`

Inside `template/engine/frontend/config/main.php`, final config merges in:
- `vendor/synctech/restotech-standard/frontend/config/main.php`

Same pattern exists for backend/api.

## 4. URL and webserver behavior

All web roots use rewrite-to-index behavior via `.htaccess`:
- `template/.htaccess`
- `template/admin/.htaccess`
- `template/api/.htaccess`
- `generate/backend/web/.htaccess`

This means routes are handled by Yii routing once request is mapped to `index.php`.

## 5. Authentication model in generator app

- Access control in `SiteController::behaviors()` currently allows unauthenticated access to:
  - `index`, `login`, `error`, `generate-pos`
- Login uses standard Yii form model:
  - `generate/common/models/LoginForm.php`
  - `generate/common/models/User.php`

Important mismatch:
- `generate/common/models/User` expects fields like `username`, `password_hash`, `status`.
- Generated POS SQL `user` table has fields `id`, `password`, etc., with different schema.
- This is acceptable because generator app DB and generated POS DB are conceptually separate.

## 6. Multi-tenant style

This is effectively “directory-per-restaurant + database-per-restaurant” provisioning:
- Filesystem tenant boundary: `app/<restaurant_id>/...`
- Database tenant boundary: `<restaurant_id>` database

Isolation is operational, not containerized by this repository itself.
