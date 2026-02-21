# Database Baseline

## 1. SQL template files

- Main schema/data template:
  - `dbtemplate/restotech_template.sql` (2704 lines)
- Company profile override template:
  - `dbtemplate/company_template.sql` (6 lines)

## 2. Template scale metrics

From static scan of `restotech_template.sql`:
- `CREATE TABLE` statements: 57
- `INSERT INTO` statements: 5
- `ADD CONSTRAINT` occurrences: 215
- `ADD PRIMARY KEY|ADD KEY` occurrences: 269

## 3. Functional domains represented by tables

Key domain groupings visible in table names:
- Purchasing and suppliers:
  - `direct_purchase*`, `purchase_order*`, `supplier*`, `retur_purchase*`
- Menu and ingredients:
  - `menu*`, `item*`, `stock*`, `storage*`
- Dine-in operations:
  - `mtable*`, queue/session/booking tables
- Sales and payments:
  - `sale_invoice*`, `payment_method`, `voucher`, `saldo_kasir`
- Accounting/transactions:
  - `transaction_cash`, `transaction_account`, `transaction_day`
- Access control / user model:
  - `user`, `user_level`, `user_akses`, `user_app_module`
- System config:
  - `settings`, `printer`, `shift`, `employee`

## 4. Seeded default records (important)

Notable pre-seeded defaults include:
- Employee seed:
  - `employee.kd_karyawan = 'T18010001'`
- POS user seed:
  - `user.id = 'T001'`
  - Hashed password is preloaded in SQL.
- User level seed:
  - `Administrator` super admin role.
- Extensive module/action seed:
  - `user_app_module` many rows for access matrix.

`company_template.sql` customizes initial company settings with placeholders:
- `<generatedRestaurantName>`
- `<generatedAlamat>`
- `<generatedPhone>`

## 5. Database naming behavior

Generator creates DB name directly from submitted `restaurant_id`:
- `CREATE DATABASE <restaurant_id>`

Then imports SQL templates into that DB.

## 6. Charset and compatibility notes

Many tables use `DEFAULT CHARSET=latin1` in template SQL, while Yii DB connection uses UTF-8 charset setting. This mixed baseline can affect multilingual data behavior.
