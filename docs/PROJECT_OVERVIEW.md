# Project Overview

## 1. What this project is

This codebase is a customized Yii2 Advanced Template used to:
- Run a central generator application (`generate/backend`) to create new restaurant POS instances.
- Clone a prebuilt runtime scaffold (`template/`) into `app/<restaurant_id>`.
- Create and initialize each restaurant database from SQL templates.

The generated restaurant instance contains:
- Frontend app entry: `app/<restaurant_id>/index.php`
- Backend/admin entry: `app/<restaurant_id>/admin/index.php`
- API entry: `app/<restaurant_id>/api/index.php`

## 2. Core technology baseline

- Framework: Yii2 Advanced Template lineage (`yiisoft/yii2-app-advanced`)
- PHP constraint in `composer.json`: `>=5.4.0` (legacy baseline)
- Main framework requirement: `yiisoft/yii2 ~2.0.6`
- DB engine in practice: MariaDB/MySQL
- UI libs include Kartik Yii2 widgets

## 3. Repository structure (meaningful parts)

- `generate/`
  - Active generator app used to create restaurant deployments.
- `template/`
  - Source scaffold copied into each generated restaurant folder.
  - Includes `engine/{common,frontend,backend,api,console}` configs/tests.
- `dbtemplate/`
  - SQL templates applied to newly created DB.
- `app/`
  - Output folder for generated restaurant instances.
- `environments/`, `init`
  - Standard Yii environment bootstrap tooling.
- `vagrant/`, `Vagrantfile`
  - Legacy local VM provisioning option.

## 4. External package dependencies that provide business logic

The generated apps merge config from Composer packages:
- `synctech/restotech-standard`
- `synctech/yii2-synctbase`

Evidence in config:
- `template/engine/frontend/config/main.php`
- `template/engine/backend/config/main.php`
- `template/engine/api/config/main.php`

These files load module configs from `vendor/synctech/restotech-standard/*/config/main.php`.

## 5. Active entry points in this repository

- Generator web app entry:
  - `generate/backend/web/index.php`
- Generated tenant runtime entries (from template):
  - `template/index.php`
  - `template/admin/index.php`
  - `template/api/index.php`

## 6. Current state notes

- `app/` currently only has `.gitignore` in this snapshot (no generated restaurants committed).
- `vendor/` is gitignored and not present in repository snapshot by default.
- Several local config files are intentionally not tracked and must be supplied per environment.
