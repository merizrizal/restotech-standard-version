SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

INSERT INTO `employee` (`kd_karyawan`, `password_absen`, `nama`, `alamat`, `jenis_kelamin`, `phone1`, `phone2`, `limit_officer`, `sisa`, `not_active`, `image`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('T18010002', '654321', 'Maya Putri', 'Jl. Dago No. 12, Bandung', 'Wanita', '081234500002', NULL, NULL, NULL, 0, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('T18010003', '654321', 'Rizky Pratama', 'Jl. Setiabudi No. 25, Bandung', 'Pria', '081234500003', NULL, NULL, NULL, 0, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('T18010004', '654321', 'Dewi Lestari', 'Jl. Sukajadi No. 40, Bandung', 'Wanita', '081234500004', NULL, NULL, NULL, 0, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('T18010005', '654321', 'Ardi Saputra', 'Jl. Pasteur No. 18, Bandung', 'Pria', '081234500005', NULL, NULL, NULL, 0, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `storage` (`id`, `nama_storage`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('GUD001', 'Main Warehouse', 'Penyimpanan bahan baku utama', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('BAR001', 'Beverage Bar', 'Penyimpanan bahan minuman', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('KIT001', 'Kitchen Prep', 'Area prep dapur dan perlengkapan', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `storage_rack` (`id`, `storage_id`, `nama_rak`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'GUD001', 'A1 Dry Goods', 'Rak bahan kering', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(2, 'GUD001', 'A2 Proteins', 'Rak protein segar', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(3, 'BAR001', 'B1 Drinks', 'Rak bahan minuman', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(4, 'KIT001', 'C1 Consumables', 'Rak perlengkapan konsumsi', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `supplier` (`kd_supplier`, `nama`, `alamat`, `telp`, `fax`, `keterangan`, `kontak1`, `kontak1_telp`, `kontak2`, `kontak2_telp`, `kontak3`, `kontak3_telp`, `kontak4`, `kontak4_telp`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('SUP0001', 'PT Nusantara Fresh Produce', 'Jl. Soekarno-Hatta No. 88, Bandung', '0227001001', NULL, 'Supplier sayur, protein, dan bahan pokok', 'Andi Wijaya', '081234700001', 'Rina Saputra', '081234700002', NULL, NULL, NULL, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SUP0002', 'CV Sari Coffee Supply', 'Jl. Cihampelas No. 22, Bandung', '0227001002', NULL, 'Supplier kopi, teh, dan beverage base', 'Budi Santoso', '081234700003', 'Nina Marlina', '081234700004', NULL, NULL, NULL, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `payment_method` (`id`, `nama_payment`, `type`, `method`, `keterangan`, `not_active`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('PMS-CASH', 'Cash Sales', 'Sale', 'Cash', 'Pembayaran tunai pelanggan', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PMS-DEBIT', 'Debit Card', 'Sale', 'Debit-Card', 'Pembayaran kartu debit pelanggan', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PMS-QRIS', 'QRIS', 'Sale', 'Etc', 'Pembayaran non-tunai via QRIS', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PMP-CASH', 'Cash Purchase', 'Purchase', 'Cash', 'Pembayaran tunai ke supplier', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PMP-TERM', 'Supplier Term', 'Purchase', 'Account-Payable', 'Pembelian tempo ke supplier', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `item_category` (`id`, `nama_category`, `parent_category_id`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('IC001', 'Bahan Baku', NULL, 'Kategori utama bahan baku', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC101', 'Karbohidrat', 'IC001', 'Beras, mie, kentang', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC102', 'Protein', 'IC001', 'Ayam, telur, protein hewani', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC103', 'Bumbu & Minyak', 'IC001', 'Bumbu, saus, dan minyak', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC201', 'Minuman', NULL, 'Kategori utama bahan minuman', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC211', 'Teh & Kopi', 'IC201', 'Bahan dasar minuman hangat', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC212', 'Susu & Gula', 'IC201', 'Pemanis dan dairy', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC213', 'Buah Segar', 'IC201', 'Buah untuk jus dan dessert', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC301', 'Packaging', NULL, 'Kemasan dan perlengkapan sekali pakai', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IC311', 'Consumable', 'IC301', 'Cup, sedotan, dan perlengkapan consumable', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `item` (`id`, `parent_item_category_id`, `item_category_id`, `nama_item`, `keterangan`, `not_active`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('IT0001', 'IC001', 'IC101', 'Beras Premium', 'Beras kemasan 5 Kg', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0002', 'IC001', 'IC102', 'Ayam Fillet', 'Daging ayam tanpa tulang', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0003', 'IC001', 'IC103', 'Minyak Goreng', 'Minyak goreng 1 liter', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0004', 'IC001', 'IC101', 'Mie Basah', 'Mie untuk menu goreng', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0005', 'IC001', 'IC101', 'Kentang', 'Kentang untuk fries', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0006', 'IC201', 'IC211', 'Teh Celup', 'Teh celup premium', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0007', 'IC201', 'IC211', 'Kopi Bubuk', 'Kopi bubuk house blend', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0008', 'IC201', 'IC212', 'Gula Pasir', 'Gula pasir putih', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0009', 'IC201', 'IC212', 'Susu UHT', 'Susu cair untuk beverage', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0010', 'IC301', 'IC311', 'Cup 12oz', 'Cup minuman sekali pakai', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0011', 'IC301', 'IC311', 'Sedotan', 'Sedotan plastik', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0012', 'IC001', 'IC102', 'Telur Ayam', 'Telur ayam segar', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('IT0013', 'IC201', 'IC213', 'Alpukat', 'Buah alpukat matang', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `item_sku` (`id`, `item_id`, `nama_sku`, `no_urut`, `stok_minimal`, `per_stok`, `storage_id`, `storage_rack_id`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('SKU0001', 'IT0001', 'Sack 5 Kg', 1, 10, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0002', 'IT0002', 'Kg', 1, 8, 1, 'GUD001', 2, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0003', 'IT0003', 'Bottle 1 L', 1, 6, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0004', 'IT0004', 'Pack', 1, 8, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0005', 'IT0005', 'Kg', 1, 8, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0006', 'IT0006', 'Pack', 1, 12, 1, 'BAR001', 3, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0007', 'IT0007', 'Pack', 1, 10, 1, 'BAR001', 3, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0008', 'IT0008', 'Kg', 1, 15, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0009', 'IT0009', 'Liter', 1, 8, 1, 'BAR001', 3, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0010', 'IT0010', 'Pack', 1, 25, 1, 'KIT001', 4, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0011', 'IT0011', 'Pack', 1, 25, 1, 'KIT001', 4, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0012', 'IT0012', 'Tray', 1, 10, 1, 'GUD001', 2, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('SKU0013', 'IT0013', 'Kg', 1, 6, 1, 'GUD001', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `stock` (`id`, `item_id`, `item_sku_id`, `storage_id`, `storage_rack_id`, `jumlah_stok`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('STK0001', 'IT0001', 'SKU0001', 'GUD001', 1, 80, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0002', 'IT0002', 'SKU0002', 'GUD001', 2, 45, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0003', 'IT0003', 'SKU0003', 'GUD001', 1, 20, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0004', 'IT0004', 'SKU0004', 'GUD001', 1, 40, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0005', 'IT0005', 'SKU0005', 'GUD001', 1, 30, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0006', 'IT0006', 'SKU0006', 'BAR001', 3, 100, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0007', 'IT0007', 'SKU0007', 'BAR001', 3, 60, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0008', 'IT0008', 'SKU0008', 'GUD001', 1, 80, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0009', 'IT0009', 'SKU0009', 'BAR001', 3, 30, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0010', 'IT0010', 'SKU0010', 'KIT001', 4, 1000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0011', 'IT0011', 'SKU0011', 'KIT001', 4, 2000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0012', 'IT0012', 'SKU0012', 'GUD001', 2, 120, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('STK0013', 'IT0013', 'SKU0013', 'GUD001', 1, 20, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `stock_movement` (`id`, `type`, `item_id`, `item_sku_id`, `storage_from`, `storage_rack_from`, `storage_to`, `storage_rack_to`, `jumlah`, `tanggal`, `reference`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'Init-Stock', 'IT0001', 'SKU0001', NULL, NULL, 'GUD001', 1, 80, '2025-06-15', 'INIT-STOCK', 'Stok awal beras', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(2, 'Init-Stock', 'IT0002', 'SKU0002', NULL, NULL, 'GUD001', 2, 45, '2025-06-15', 'INIT-STOCK', 'Stok awal ayam', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(3, 'Init-Stock', 'IT0003', 'SKU0003', NULL, NULL, 'GUD001', 1, 20, '2025-06-15', 'INIT-STOCK', 'Stok awal minyak', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(4, 'Init-Stock', 'IT0004', 'SKU0004', NULL, NULL, 'GUD001', 1, 40, '2025-06-15', 'INIT-STOCK', 'Stok awal mie', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(5, 'Init-Stock', 'IT0005', 'SKU0005', NULL, NULL, 'GUD001', 1, 30, '2025-06-15', 'INIT-STOCK', 'Stok awal kentang', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(6, 'Init-Stock', 'IT0006', 'SKU0006', NULL, NULL, 'BAR001', 3, 100, '2025-06-15', 'INIT-STOCK', 'Stok awal teh', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(7, 'Init-Stock', 'IT0007', 'SKU0007', NULL, NULL, 'BAR001', 3, 60, '2025-06-15', 'INIT-STOCK', 'Stok awal kopi', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(8, 'Init-Stock', 'IT0008', 'SKU0008', NULL, NULL, 'GUD001', 1, 80, '2025-06-15', 'INIT-STOCK', 'Stok awal gula', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(9, 'Init-Stock', 'IT0009', 'SKU0009', NULL, NULL, 'BAR001', 3, 30, '2025-06-15', 'INIT-STOCK', 'Stok awal susu', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(10, 'Init-Stock', 'IT0010', 'SKU0010', NULL, NULL, 'KIT001', 4, 1000, '2025-06-15', 'INIT-STOCK', 'Stok awal cup', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(11, 'Init-Stock', 'IT0011', 'SKU0011', NULL, NULL, 'KIT001', 4, 2000, '2025-06-15', 'INIT-STOCK', 'Stok awal sedotan', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(12, 'Init-Stock', 'IT0012', 'SKU0012', NULL, NULL, 'GUD001', 2, 120, '2025-06-15', 'INIT-STOCK', 'Stok awal telur', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001'),
(13, 'Init-Stock', 'IT0013', 'SKU0013', NULL, NULL, 'GUD001', 1, 20, '2025-06-15', 'INIT-STOCK', 'Stok awal alpukat', '2025-06-15 08:05:00', 'T001', '2025-06-15 08:05:00', 'T001');

INSERT INTO `menu_satuan` (`id`, `nama_satuan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('PORSI', 'Porsi', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('GELAS', 'Gelas', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PCS', 'Pcs', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('BOTOL', 'Botol', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('PACK', 'Pack', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `printer` (`printer`, `type`, `is_autocut`, `not_active`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('CASHIER-01', 'cashier', 1, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('KITCHEN-01', 'kitchen', 1, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('BAR-01', 'kitchen', 1, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `menu_category` (`id`, `nama_category`, `parent_category_id`, `color`, `keterangan`, `is_antrian`, `not_active`, `not_discount`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('MCUTAMA', 'Main Menu', NULL, '#FF9800', 'Menu utama', 1, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MCFOOD', 'Food', 'MCUTAMA', '#FF9800', 'Menu utama dapur', 1, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MCDRINK', 'Drinks', 'MCUTAMA', '#2196F3', 'Menu minuman', 0, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MCSNACK', 'Snacks', 'MCUTAMA', '#4CAF50', 'Menu snack', 1, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MCDESSERT', 'Dessert', 'MCUTAMA', '#9C27B0', 'Menu penutup', 1, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `menu_category_printer` (`id`, `menu_category_id`, `printer`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'MCFOOD', 'KITCHEN-01', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(2, 'MCSNACK', 'KITCHEN-01', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(3, 'MCDESSERT', 'KITCHEN-01', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(4, 'MCDRINK', 'BAR-01', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `menu` (`id`, `nama_menu`, `menu_category_id`, `menu_satuan_id`, `keterangan`, `not_active`, `harga_pokok`, `harga_jual`, `image`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('MN0001', 'Nasi Goreng Ayam', 'MCFOOD', 'PORSI', 'Nasi goreng dengan ayam suwir', 0, 18000, 28000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0002', 'Mie Goreng Jawa', 'MCFOOD', 'PORSI', 'Mie goreng bumbu jawa', 0, 17000, 26000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0003', 'Ayam Bakar Rujak', 'MCFOOD', 'PORSI', 'Ayam bakar dengan bumbu rujak', 0, 23000, 35000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0004', 'French Fries', 'MCSNACK', 'PORSI', 'Kentang goreng crispy', 0, 9000, 18000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0005', 'Puding Cokelat', 'MCDESSERT', 'PCS', 'Dessert puding cokelat', 0, 7000, 12000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0006', 'Es Teh Manis', 'MCDRINK', 'GELAS', 'Teh manis dingin', 0, 2500, 8000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0007', 'Kopi Susu Aren', 'MCDRINK', 'GELAS', 'Kopi susu dengan gula aren', 0, 6000, 15000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('MN0008', 'Jus Alpukat', 'MCDRINK', 'GELAS', 'Jus alpukat segar', 0, 9000, 18000, NULL, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `menu_hpp` (`id`, `date`, `menu_id`, `harga_pokok`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('HPP0001', '2025-06-15 08:00:00', 'MN0001', 18000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0002', '2025-06-15 08:00:00', 'MN0002', 17000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0003', '2025-06-15 08:00:00', 'MN0003', 23000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0004', '2025-06-15 08:00:00', 'MN0004', 9000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0005', '2025-06-15 08:00:00', 'MN0005', 7000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0006', '2025-06-15 08:00:00', 'MN0006', 2500, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0007', '2025-06-15 08:00:00', 'MN0007', 6000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('HPP0008', '2025-06-15 08:00:00', 'MN0008', 9000, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `menu_recipe` (`id`, `menu_id`, `item_id`, `item_sku_id`, `jumlah`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'MN0001', 'IT0001', 'SKU0001', 0.18, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(2, 'MN0001', 'IT0002', 'SKU0002', 0.08, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(3, 'MN0001', 'IT0003', 'SKU0003', 0.03, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(4, 'MN0002', 'IT0004', 'SKU0004', 0.20, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(5, 'MN0002', 'IT0012', 'SKU0012', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(6, 'MN0002', 'IT0003', 'SKU0003', 0.03, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(7, 'MN0003', 'IT0002', 'SKU0002', 0.15, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(8, 'MN0003', 'IT0003', 'SKU0003', 0.04, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(9, 'MN0004', 'IT0005', 'SKU0005', 0.20, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(10, 'MN0004', 'IT0003', 'SKU0003', 0.05, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(11, 'MN0005', 'IT0009', 'SKU0009', 0.20, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(12, 'MN0005', 'IT0008', 'SKU0008', 0.03, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(13, 'MN0005', 'IT0010', 'SKU0010', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(14, 'MN0006', 'IT0006', 'SKU0006', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(15, 'MN0006', 'IT0008', 'SKU0008', 0.02, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(16, 'MN0006', 'IT0010', 'SKU0010', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(17, 'MN0007', 'IT0007', 'SKU0007', 0.02, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(18, 'MN0007', 'IT0008', 'SKU0008', 0.02, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(19, 'MN0007', 'IT0009', 'SKU0009', 0.10, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(20, 'MN0007', 'IT0010', 'SKU0010', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(21, 'MN0008', 'IT0013', 'SKU0013', 0.50, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(22, 'MN0008', 'IT0008', 'SKU0008', 0.02, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(23, 'MN0008', 'IT0009', 'SKU0009', 0.10, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(24, 'MN0008', 'IT0010', 'SKU0010', 1, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `mtable_category` (`id`, `nama_category`, `color`, `keterangan`, `image`, `not_active`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'Indoor', '#8BC34A', 'Area dalam ruangan', NULL, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(2, 'Outdoor', '#03A9F4', 'Area luar ruangan', NULL, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
(3, 'VIP', '#9C27B0', 'Ruang privat', NULL, 0, 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `mtable` (`id`, `mtable_category_id`, `nama_meja`, `kapasitas`, `not_active`, `keterangan`, `not_ppn`, `not_service_charge`, `image`, `layout_x`, `layout_y`, `shape`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('TBL-01', 1, 'Table 01', 4, 0, 'Meja dekat pintu masuk', 0, 0, NULL, 120, 120, 'Rectangle', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('TBL-02', 1, 'Table 02', 4, 0, 'Meja area indoor', 0, 0, NULL, 220, 120, 'Rectangle', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('TBL-03', 2, 'Table 03', 2, 0, 'Meja outdoor kecil', 0, 0, NULL, 120, 260, 'Rectangle', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('TBL-04', 2, 'Table 04', 6, 0, 'Meja outdoor besar', 0, 0, NULL, 220, 260, 'Rectangle', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001'),
('VIP-01', 3, 'VIP 01', 8, 0, 'Ruang VIP', 1, 1, NULL, 360, 180, 'Rectangle', 0, '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `mtable_booking` (`id`, `mtable_id`, `nama_pelanggan`, `date`, `time`, `keterangan`, `is_closed`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('BK2506150001', 'VIP-01', 'Andi Wijaya', '2025-06-16', '19:00:00', 'Booking makan malam keluarga', 0, '2025-06-15 09:00:00', 'T001', '2025-06-15 09:00:00', 'T001');

INSERT INTO `shift` (`id`, `start_time`, `end_time`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, '08:00:00', '23:00:00', 'Regular operational shift', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

INSERT INTO `transaction_day` (`id`, `start`, `end`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, '2025-06-15 08:00:00', '2025-06-15 23:00:00', '2025-06-15 23:05:00', 'T001', '2025-06-15 23:05:00', 'T001');

INSERT INTO `saldo_kasir` (`id`, `shift_id`, `date`, `user_active`, `saldo_awal`, `saldo_akhir`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('SK25061501', 1, '2025-06-15', 'T001', 500000, 571300, '2025-06-15 08:05:00', 'T001', '2025-06-15 20:05:00', 'T001');

INSERT INTO `mtable_session` (`id`, `mtable_id`, `nama_tamu`, `jumlah_tamu`, `catatan`, `jumlah_harga`, `discount_type`, `discount`, `pajak`, `service_charge`, `opened_at`, `user_opened`, `is_closed`, `closed_at`, `user_closed`, `is_join_mtable`, `bill_printed`, `is_paid`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1001, 'TBL-01', 'Budi Santoso', 3, 'Meja close dengan invoice contoh', 62000, 'Percent', 0, 6200, 3100, '2025-06-15 19:00:00', 'T001', 1, '2025-06-15 20:05:00', 'T001', 0, 1, 1, '2025-06-15 19:00:00', 'T001', '2025-06-15 20:05:00', 'T001');

INSERT INTO `mtable_order` (`id`, `parent_id`, `mtable_session_id`, `menu_id`, `catatan`, `discount_type`, `discount`, `harga_satuan`, `jumlah`, `is_free_menu`, `free_menu_at`, `user_free_menu`, `is_void`, `void_at`, `user_void`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, NULL, 1001, 'MN0001', 'Kurang pedas', 'Percent', 0, 28000, 1, 0, NULL, NULL, 0, NULL, NULL, '2025-06-15 19:05:00', 'T001', '2025-06-15 19:05:00', 'T001'),
(2, NULL, 1001, 'MN0006', 'Less sugar', 'Percent', 0, 8000, 2, 0, NULL, NULL, 0, NULL, NULL, '2025-06-15 19:06:00', 'T001', '2025-06-15 19:06:00', 'T001'),
(3, NULL, 1001, 'MN0004', '', 'Percent', 0, 18000, 1, 0, NULL, NULL, 0, NULL, NULL, '2025-06-15 19:07:00', 'T001', '2025-06-15 19:07:00', 'T001');

INSERT INTO `mtable_order_queue` (`id`, `mtable_order_id`, `menu_id`, `jumlah`, `keterangan`, `is_finish`, `is_send`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 1, 'MN0001', 1, 'Masuk antrian dapur', 1, 1, '2025-06-15 19:05:05', 'T001', '2025-06-15 19:05:05', 'T001'),
(2, 2, 'MN0006', 2, 'Masuk antrian bar', 1, 1, '2025-06-15 19:06:05', 'T001', '2025-06-15 19:06:05', 'T001'),
(3, 3, 'MN0004', 1, 'Masuk antrian dapur', 1, 1, '2025-06-15 19:07:05', 'T001', '2025-06-15 19:07:05', 'T001');

INSERT INTO `sale_invoice` (`id`, `date`, `mtable_session_id`, `user_operator`, `jumlah_harga`, `discount_type`, `discount`, `pajak`, `service_charge`, `jumlah_bayar`, `jumlah_kembali`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('INV250615000001', '2025-06-15 20:05:00', 1001, 'T001', 62000, 'Percent', 0, 6200, 3100, 71300, 0, '2025-06-15 20:05:00', 'T001', '2025-06-15 20:05:00', 'T001');

INSERT INTO `sale_invoice_trx` (`id`, `sale_invoice_id`, `menu_id`, `catatan`, `jumlah`, `discount_type`, `discount`, `harga_satuan`, `is_free_menu`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'INV250615000001', 'MN0001', 'Kurang pedas', 1, 'Percent', 0, 28000, 0, '2025-06-15 20:05:00', 'T001', '2025-06-15 20:05:00', 'T001'),
(2, 'INV250615000001', 'MN0006', 'Less sugar', 2, 'Percent', 0, 8000, 0, '2025-06-15 20:05:00', 'T001', '2025-06-15 20:05:00', 'T001'),
(3, 'INV250615000001', 'MN0004', '', 1, 'Percent', 0, 18000, 0, '2025-06-15 20:05:00', 'T001', '2025-06-15 20:05:00', 'T001');

INSERT INTO `sale_invoice_payment` (`id`, `sale_invoice_id`, `payment_method_id`, `jumlah_bayar`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'INV250615000001', 'PMS-CASH', 71300, 'Pembayaran tunai', '2025-06-15 20:05:00', 'T001', '2025-06-15 20:05:00', 'T001');

INSERT INTO `voucher` (`id`, `voucher_type`, `jumlah_voucher`, `start_date`, `end_date`, `not_active`, `keterangan`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('VC2506', 'Percent', 10, '2025-06-01', '2025-06-30', 0, 'Grand opening discount', '2025-06-15 08:00:00', 'T001', '2025-06-15 08:00:00', 'T001');

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
