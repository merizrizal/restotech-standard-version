<img src="restotech-logo.png" alt="Restotech logo">

# Restotech Standard Version

**Restotech is a Yii2 + MariaDB restaurant POS generator.**

Use one central generator app to create ready-to-run restaurant instances. Each generated restaurant gets its own copied app scaffold under `app/<restaurant_id>` and its own MariaDB database initialized from SQL templates.

## Why this is useful

- Generate a new restaurant POS instance from a web form.
- Keep each restaurant separated by folder and database.
- Start with baseline schema, company settings, and optional operational demo data.
- Run frontend, backend/admin, and API entry points from the generated scaffold.
- Extend business behavior through the `synctech/restotech-standard` package.

## Quick start

The easiest way to run this project is with the companion Docker setup:

- <https://github.com/merizrizal/docker-restotech-standard>

After the stack is running, open the generator:

```text
http://localhost:8180/generate/backend/web/
```

Fill in:

- Restaurant ID
- Restaurant name
- Address
- Phone
- Optional: `Generate Seed Data` for realistic demo operations data

The generator copies `template/`, creates the restaurant database, imports the base SQL templates, and returns the generated restaurant URL.

## Online demo

Demo URL:

- <https://restotech.merizrizal.com/>

Demo login:

```text
username: T001
password: 123456
```

## Project map

- `generate/` — generator web application
- `template/` — source scaffold copied into each generated restaurant
- `dbtemplate/` — database templates and optional operational seed data
- `app/` — generated restaurant instances
- `docs/` — architecture, setup, database, and risk notes

## Read next

- [`docs/PROJECT_OVERVIEW.md`](docs/PROJECT_OVERVIEW.md) — what this repository is
- [`docs/SETUP_AND_OPERATIONS.md`](docs/SETUP_AND_OPERATIONS.md) — local setup expectations
- [`docs/ARCHITECTURE_AND_FLOW.md`](docs/ARCHITECTURE_AND_FLOW.md) — generation flow
- [`docs/DATABASE_BASELINE.md`](docs/DATABASE_BASELINE.md) — SQL templates and seed data
- [`docs/INSIGHTS_RISKS_AND_RECOMMENDATIONS.md`](docs/INSIGHTS_RISKS_AND_RECOMMENDATIONS.md) — known risks and roadmap

## Technology

- Yii2 Advanced Template lineage
- MariaDB/MySQL
- Composer packages including `synctech/restotech-standard`

## Contact

For questions or support: meriz.rizal@gmail.com
