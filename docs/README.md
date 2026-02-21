# Restotech Standard Version - Project Documentation

This documentation is a comprehensive study of the active project at:
`/home/meriz/Documents/Synctech.ID/PHP/restotech-standard-version`

## Documentation Index

1. `docs/PROJECT_OVERVIEW.md`
   - High-level purpose, repository structure, dependencies, and runtime targets.
2. `docs/ARCHITECTURE_AND_FLOW.md`
   - How the generator app and generated POS instances are wired.
3. `docs/SETUP_AND_OPERATIONS.md`
   - Practical setup, required local files, and operational notes.
4. `docs/DATABASE_BASELINE.md`
   - SQL template contents, seeded defaults, and generated database behavior.
5. `docs/INSIGHTS_RISKS_AND_RECOMMENDATIONS.md`
   - Engineering insights, risks, and prioritized improvement plan.

## Quick Summary

- This repository is a Yii2-based **restaurant POS generator**.
- The active app is `generate/backend`.
- It creates tenant-like restaurant instances under `app/<restaurant_id>` by copying `template/`.
- It provisions a new MariaDB database from SQL templates in `dbtemplate/`.
- Core business modules are loaded from external Composer package `synctech/restotech-standard`.
