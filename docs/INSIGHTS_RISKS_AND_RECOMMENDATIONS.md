# Insights, Risks, and Recommendations

## 1. Key insights from the current implementation

1. The project is a generator-first architecture, not a single monolithic POS app.
2. Business logic is intentionally outsourced to vendor packages (`synctech/restotech-standard`).
3. Tenant provisioning is practical and simple (copy directory + create DB), but currently has minimal guards.
4. Repository contains legacy Yii2-era infrastructure patterns and likely needs modernization.

## 2. High-risk findings (prioritized)

### 2.1 Unauthenticated generation endpoint

- `generate/backend/controllers/SiteController.php`
- `generate-pos` is allowed for everyone in access rules.

Impact:
- Any unauthenticated user can trigger filesystem and DB provisioning.

Recommendation:
- Restrict `generate-pos` (and likely `index`) to authenticated admin users only.

### 2.2 Unsanitized `restaurant_id` used in filesystem and SQL

Direct usages:
- Destination path: `.../app/` + `restaurant_id`
- SQL: `CREATE DATABASE ` + `restaurant_id`

Impact:
- Path traversal risk (`../` payloads)
- SQL injection / malformed DB name risk
- Operational corruption risk

Recommendation:
- Validate `restaurant_id` strictly (e.g., regex allowlist `[A-Za-z0-9_]+` with fixed length).
- Quote identifiers safely for SQL or use validated-only identifier handling.
- Reject existing DB/app collisions explicitly.

### 2.3 Missing required local bootstrap file can break generated app

- `template/engine/common/config/bootstrap.php` requires `bootstrap-local.php`
- That file is gitignored and absent in clean clone.

Impact:
- Generated app can fail immediately if file is missing.

Recommendation:
- Provide tracked example template (`bootstrap-local.example.php`) and copy during generation.
- Add preflight checks before copy/import.

### 2.4 Error handling leaks internal details

Current behavior prints raw exception messages/trace snippets in multiple catch blocks.

Impact:
- Internal path/server info leakage to client.

Recommendation:
- Use structured logging + user-safe error response.
- Return controlled error pages/messages.

## 3. Medium-risk / quality issues

1. No transaction-like compensation across FS + DB steps.
   - If DB import fails after directory copy, system remains partial.
2. Hardcoded DB host (`restotech_mariadb_server`) in multiple places.
3. Legacy dependency set (`yii2 ~2.0.6`, very old baseline).
4. Charset mismatch potential (`latin1` schema template vs UTF-8 app connection).
5. Generator performs heavy operations in web request context.

## 4. Recommended roadmap

### Phase 1 (Safety first)

1. Add auth guard and authorization checks for generation.
2. Add request validation model for generation inputs.
3. Enforce idempotency checks:
   - directory exists?
   - DB exists?
4. Replace raw `echo` exception outputs with logging + safe UX message.

### Phase 2 (Operational stability)

1. Add preflight diagnostics page/command:
   - local files present
   - DB reachable
   - writable paths
2. Implement rollback strategy on failure:
   - remove copied directory if DB creation/import fails
   - drop DB on partial import failures (with care)
3. Externalize DB host and credentials to dedicated config keys.

### Phase 3 (Modernization)

1. Upgrade PHP and Yii dependency baseline.
2. Introduce migrations as source of truth (or regenerate SQL from migrations).
3. Add automated integration tests for generation flow.
4. Consider asynchronous job queue for generation operations.

## 5. Documentation gap closed by this study

Before this documentation, the repository had only brief README context.
This `docs/` set now provides:
- architecture map,
- runtime flow,
- setup expectations,
- DB baseline,
- and explicit engineering risk analysis.
