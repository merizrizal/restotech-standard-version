# Setup and Operations

## 1. Basic setup expectations

This repository is not fully runnable from git clone only. Required local steps:

1. Install dependencies with Composer to create `vendor/`.
2. Provide missing local config files (ignored by git).
3. Ensure MariaDB host and credentials expected by generator are reachable.

## 2. Required local files and placeholders

### 2.1 Generator local files

Common expected local files include:
- `generate/backend/config/params-local.php` (ignored by git)
- `generate/backend/config/test-local.php` (ignored by git)
- `generate/common/config/main-local.php` (tracked, default localhost DB)

The generator code references:
- `Yii::$app->params['database']['user']`
- `Yii::$app->params['database']['password']`

So `generate/backend/config/params-local.php` should define:
- `database.user`
- `database.password`

### 2.2 Template local file (critical)

`template/engine/common/config/bootstrap.php` executes:
- `require('bootstrap-local.php');`

And `.gitignore` in same folder ignores:
- `bootstrap-local.php`

Therefore, `template/engine/common/config/bootstrap-local.php` must exist locally before generation, typically defining aliases such as `@rootUrl`.

## 3. Operational flow to generate restaurant

1. Open generator app URL:
- `http://<host>/generate/backend/web/`

2. Submit form fields:
- Restaurant ID
- Restaurant name
- Address
- Phone

3. System performs:
- Copy scaffold directory
- Config token replacement
- Database create + SQL import
- Returns generated restaurant URL

## 4. Environment and infra hints in repo

- README references Docker-compose project:
  - `docker-restotech-standard`
- Generator and template code assume DB host name:
  - `restotech_mariadb_server`
- Vagrant setup exists but is legacy (`ubuntu-16.04` baseline).

## 5. Observed operational assumptions

- MySQL user has permission to run `CREATE DATABASE`.
- SQL template import runs as a single large command string.
- Web server has write access to `app/` directory.
- Long-running operation enabled in template entries (`max_execution_time = 0`).

## 6. Testing state

Repository includes Codeception scaffolding/tests in many app folders, but no test run was executed during this study.
