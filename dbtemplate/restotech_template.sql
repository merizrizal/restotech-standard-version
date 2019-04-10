/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  meriz
 * Created: Feb 6, 2018
 */

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2018 at 01:03 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;

--
-- Database: `restotech_template`
--

-- --------------------------------------------------------

--
-- Table structure for table `direct_purchase`
--

CREATE TABLE `direct_purchase` (
  `id` varchar(13) NOT NULL,
  `date` date DEFAULT NULL,
  `jumlah_item` float UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `direct_purchase_trx`
--

CREATE TABLE `direct_purchase_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `direct_purchase_id` varchar(13) NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_id` varchar(7) NOT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah_item` float UNSIGNED NOT NULL,
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `kd_karyawan` varchar(25) NOT NULL,
  `password_absen` varchar(32) DEFAULT NULL,
  `nama` varchar(64) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `limit_officer` float UNSIGNED DEFAULT NULL,
  `sisa` float UNSIGNED DEFAULT NULL,
  `not_active` tinyint(1) DEFAULT '0',
  `image` text,
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`kd_karyawan`, `password_absen`, `nama`, `alamat`, `jenis_kelamin`, `phone1`, `phone2`, `limit_officer`, `sisa`, `not_active`, `image`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
('T18010001', '123456', 'Tony Stark', 'Bandung', 'Pria', NULL, NULL, NULL, NULL, 0, '1109s3ZKNIjnTM7mOzRd.jpg', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` varchar(16) NOT NULL,
  `parent_item_category_id` varchar(16) NOT NULL,
  `item_category_id` varchar(16) DEFAULT NULL,
  `nama_item` varchar(32) NOT NULL,
  `keterangan` text,
  `not_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` varchar(16) NOT NULL,
  `nama_category` varchar(32) NOT NULL,
  `parent_category_id` varchar(16) DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_sku`
--

CREATE TABLE `item_sku` (
  `id` varchar(16) NOT NULL,
  `item_id` varchar(16) DEFAULT NULL,
  `nama_sku` varchar(32) DEFAULT NULL,
  `no_urut` int(10) UNSIGNED DEFAULT NULL,
  `stok_minimal` float UNSIGNED DEFAULT NULL,
  `per_stok` float UNSIGNED DEFAULT NULL,
  `storage_id` varchar(12) DEFAULT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` varchar(32) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `menu_category_id` varchar(32) NOT NULL,
  `menu_satuan_id` varchar(7) NOT NULL,
  `keterangan` text,
  `not_active` tinyint(1) DEFAULT '0',
  `harga_pokok` decimal(14,0) UNSIGNED DEFAULT '0',
  `harga_jual` decimal(14,0) UNSIGNED DEFAULT '0',
  `image` text,
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `id` varchar(32) NOT NULL,
  `nama_category` varchar(128) NOT NULL,
  `parent_category_id` varchar(32) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `keterangan` text,
  `is_antrian` tinyint(1) DEFAULT NULL,
  `not_active` tinyint(1) DEFAULT NULL,
  `not_discount` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_category_printer`
--

CREATE TABLE `menu_category_printer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_category_id` varchar(32) NOT NULL,
  `printer` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_condiment`
--

CREATE TABLE `menu_condiment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_menu_id` varchar(50) NOT NULL,
  `menu_id` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_hpp`
--

CREATE TABLE `menu_hpp` (
  `id` varchar(32) NOT NULL,
  `date` datetime NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `harga_pokok` decimal(14,0) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_recipe`
--

CREATE TABLE `menu_recipe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `jumlah` float UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_satuan`
--

CREATE TABLE `menu_satuan` (
  `id` varchar(7) NOT NULL,
  `nama_satuan` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable`
--

CREATE TABLE `mtable` (
  `id` varchar(24) NOT NULL,
  `mtable_category_id` bigint(20) UNSIGNED NOT NULL,
  `nama_meja` varchar(32) DEFAULT NULL,
  `kapasitas` int(10) UNSIGNED DEFAULT NULL,
  `not_active` tinyint(1) DEFAULT '0',
  `keterangan` text,
  `not_ppn` tinyint(1) DEFAULT NULL,
  `not_service_charge` tinyint(1) DEFAULT NULL,
  `image` text,
  `layout_x` int(10) UNSIGNED DEFAULT NULL,
  `layout_y` int(10) UNSIGNED DEFAULT NULL,
  `shape` enum('Circle','Rectangle') DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_booking`
--

CREATE TABLE `mtable_booking` (
  `id` varchar(16) NOT NULL,
  `mtable_id` varchar(24) NOT NULL,
  `nama_pelanggan` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `keterangan` text,
  `is_closed` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_category`
--

CREATE TABLE `mtable_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_category` varchar(32) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `keterangan` text,
  `image` text,
  `not_active` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_join`
--

CREATE TABLE `mtable_join` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active_mtable_session_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_order`
--

CREATE TABLE `mtable_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mtable_session_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `catatan` text,
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT '0',
  `jumlah` float UNSIGNED DEFAULT '0',
  `is_free_menu` tinyint(1) DEFAULT '0',
  `free_menu_at` datetime DEFAULT NULL,
  `user_free_menu` varchar(32) DEFAULT NULL,
  `is_void` tinyint(1) DEFAULT '0',
  `void_at` datetime DEFAULT NULL,
  `user_void` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_order_queue`
--

CREATE TABLE `mtable_order_queue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mtable_order_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `jumlah` float UNSIGNED NOT NULL,
  `keterangan` text,
  `is_finish` tinyint(1) DEFAULT '0',
  `is_send` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_session`
--

CREATE TABLE `mtable_session` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mtable_id` varchar(24) NOT NULL,
  `nama_tamu` varchar(64) DEFAULT NULL,
  `jumlah_tamu` int(10) UNSIGNED DEFAULT NULL,
  `catatan` text,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT '0',
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `pajak` float UNSIGNED DEFAULT '0',
  `service_charge` float UNSIGNED DEFAULT '0',
  `opened_at` datetime DEFAULT NULL,
  `user_opened` varchar(32) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT '0',
  `closed_at` datetime DEFAULT NULL,
  `user_closed` varchar(32) DEFAULT NULL,
  `is_join_mtable` tinyint(1) DEFAULT '0',
  `bill_printed` tinyint(1) DEFAULT '0',
  `is_paid` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtable_session_join`
--

CREATE TABLE `mtable_session_join` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mtable_session_id` bigint(20) UNSIGNED NOT NULL,
  `mtable_join_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` varchar(16) NOT NULL,
  `nama_payment` varchar(32) NOT NULL,
  `type` enum('Purchase','Sale') DEFAULT NULL,
  `method` enum('Cash','Credit-Card','Debit-Card','Account-Payable','Account-Receiveable','Etc') DEFAULT NULL,
  `keterangan` text,
  `not_active` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `printer` varchar(128) NOT NULL,
  `type` enum('cashier','kitchen') NOT NULL,
  `is_autocut` tinyint(1) DEFAULT '0',
  `not_active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` varchar(13) NOT NULL,
  `date` date DEFAULT NULL,
  `kd_supplier` varchar(8) NOT NULL,
  `jumlah_item` float UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_trx`
--

CREATE TABLE `purchase_order_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` varchar(13) NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `jumlah_order` float UNSIGNED NOT NULL,
  `jumlah_terima` float UNSIGNED DEFAULT '0',
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT '0',
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retur_purchase`
--

CREATE TABLE `retur_purchase` (
  `id` varchar(13) NOT NULL,
  `date` date DEFAULT NULL,
  `kd_supplier` varchar(8) NOT NULL,
  `jumlah_item` float UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retur_purchase_trx`
--

CREATE TABLE `retur_purchase_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retur_purchase_id` varchar(13) NOT NULL,
  `supplier_delivery_id` varchar(13) NOT NULL,
  `supplier_delivery_trx_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_id` varchar(7) NOT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah_item` float UNSIGNED DEFAULT NULL,
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `saldo_kasir`
--

CREATE TABLE `saldo_kasir` (
  `id` varchar(10) NOT NULL,
  `shift_id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `user_active` varchar(32) NOT NULL,
  `saldo_awal` decimal(14,0) UNSIGNED NOT NULL,
  `saldo_akhir` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice`
--

CREATE TABLE `sale_invoice` (
  `id` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `mtable_session_id` bigint(20) UNSIGNED NOT NULL,
  `user_operator` varchar(32) DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `pajak` float UNSIGNED DEFAULT NULL,
  `service_charge` float UNSIGNED DEFAULT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_kembali` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_ar_payment`
--

CREATE TABLE `sale_invoice_ar_payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_payment_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_correction`
--

CREATE TABLE `sale_invoice_correction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_id` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `mtable_session_id` bigint(20) UNSIGNED NOT NULL,
  `user_operator` varchar(32) DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `pajak` float UNSIGNED DEFAULT NULL,
  `service_charge` float UNSIGNED DEFAULT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_kembali` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_payment`
--

CREATE TABLE `sale_invoice_payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_id` varchar(15) NOT NULL,
  `payment_method_id` varchar(16) NOT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_payment_correction`
--

CREATE TABLE `sale_invoice_payment_correction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_correction_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` varchar(16) NOT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_retur`
--

CREATE TABLE `sale_invoice_retur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_trx_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `menu_id` varchar(32) NOT NULL,
  `jumlah` float UNSIGNED DEFAULT NULL,
  `discount_type` enum('Percent','Value') DEFAULT NULL,
  `discount` decimal(14,0) UNSIGNED DEFAULT NULL,
  `harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_trx`
--

CREATE TABLE `sale_invoice_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_id` varchar(15) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `catatan` text,
  `jumlah` float UNSIGNED DEFAULT NULL,
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `is_free_menu` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_trx_correction`
--

CREATE TABLE `sale_invoice_trx_correction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_invoice_correction_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  `catatan` text,
  `jumlah` float UNSIGNED DEFAULT NULL,
  `discount_type` enum('Percent','Value') DEFAULT 'Percent',
  `discount` decimal(14,0) UNSIGNED DEFAULT '0',
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `is_free_menu` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `setting_name` varchar(96) NOT NULL,
  `setting_value` longtext,
  `type` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_name`, `setting_value`, `type`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(3, 'company_city', 'Bandung (Silakan Edit)', 'short_text', NULL, NULL, '2016-05-25 16:10:29', NULL),
(5, 'company_postal_code', '40286 (Silakan Edit)', 'short_text', NULL, NULL, '2016-05-25 16:10:29', NULL),
(8, 'tax_amount', '10', 'number', NULL, NULL, '2017-04-21 16:37:41', NULL),
(9, 'service_charge_amount', '5', 'number', NULL, NULL, '2017-04-21 16:37:41', NULL),
(10, 'no_po', '1', 'number', NULL, NULL, '2018-01-29 07:47:00', NULL),
(11, 'no_po_format', '{date}PO-{inc}:5', 'short_text', NULL, NULL, '2015-01-21 06:34:46', NULL),
(12, 'no_sd', '1', 'number', NULL, NULL, '2018-01-29 07:48:00', NULL),
(13, 'no_sd_format', '{date}SD-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(14, 'no_dp', '1', 'number', NULL, NULL, '2018-01-26 06:03:00', NULL),
(15, 'no_dp_format', '{date}DP-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(16, 'no_rp', '1', 'number', NULL, NULL, '2018-01-29 07:49:00', NULL),
(17, 'no_rp_format', '{date}RP-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(18, 'no_inv', '1', 'number', NULL, NULL, '2018-01-29 08:06:00', NULL),
(19, 'no_inv_format', '{date}INV-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(20, 'struk_invoice_header', 'Temannasi\r\nJalan Tata Surya No. 41\r\nBandung', 'long_text', NULL, NULL, '2016-10-26 09:30:45', NULL),
(21, 'struk_invoice_footer', 'Terima Kasih\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'long_text', NULL, NULL, '2017-08-09 09:36:00', NULL),
(22, 'struk_order_header', 'Temannasi\r\nJalan Tata Surya No. 41\r\nBandung', 'long_text', NULL, NULL, '2015-07-30 14:27:00', NULL),
(23, 'struk_order_footer', 'Terima kasih !!\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'long_text', NULL, NULL, '2018-01-26 06:10:00', NULL),
(24, 'no_booking', '1', 'number', NULL, NULL, '2018-01-29 07:56:00', NULL),
(25, 'no_booking_format', '{date}BK-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(26, 'no_sdinv', '1', 'number', NULL, NULL, '2018-01-29 07:48:00', NULL),
(27, 'no_sdinv_format', '{date}SDI-{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(44, 'tax_include_service_charge', '1', 'boolean', '2015-08-26 13:07:53', NULL, '2017-02-27 04:13:30', NULL),
(45, 'auto_fullscreen', '0', 'boolean', '2015-08-28 05:39:09', NULL, '2015-09-18 20:02:06', NULL),
(47, 'transaction_day_start', '08:45', 'time', NULL, NULL, '2017-11-08 00:16:00', NULL),
(48, 'transaction_day_end', '23:00', 'time', NULL, NULL, '2017-11-08 00:16:00', NULL),
(49, 'transaction_day_is_over_24', '1', 'boolean', NULL, NULL, '2016-11-30 11:59:19', NULL),
(50, 'print_server_ip_address', '127.0.0.1', 'short_text', NULL, NULL, '2017-08-10 08:15:00', NULL),
(51, 'print_server_port', '7877', 'number', NULL, NULL, NULL, NULL),
(52, 'slideshow_top_count', '2', 'number', NULL, NULL, '2017-02-07 07:39:43', NULL),
(53, 'slideshow_bottom_count', '1', 'number', NULL, NULL, NULL, NULL),
(54, 'slideshow_top_value_1', '1109.jpg.jpg', NULL, '2017-02-07 07:39:39', NULL, '2017-02-07 07:39:59', NULL),
(55, 'slideshow_top_value_2', 'komp.jpg.jpg', NULL, '2017-02-07 07:39:44', NULL, '2017-02-07 07:40:32', NULL),
(56, 'id_supplier', '1', 'number', NULL, NULL, '2017-03-21 04:30:54', NULL),
(57, 'id_supplier_format', '{AA}{date}{inc}:3', 'short_text', NULL, NULL, NULL, NULL),
(58, 'id_gudang', '1', 'number', NULL, NULL, '2017-02-27 08:06:46', NULL),
(59, 'id_gudang_format', '{AA}{date}{inc}:2', 'short_text', NULL, NULL, NULL, NULL),
(60, 'id_menu_satuan', '1', 'number', NULL, NULL, '2018-01-26 05:48:00', NULL),
(61, 'id_menu_satuan_format', '{AA}{date}{inc}:2', 'short_text', NULL, NULL, NULL, NULL),
(62, 'id_menu_category', '1', 'number', NULL, NULL, '2017-08-10 07:30:00', NULL),
(63, 'id_menu_category_format', '{AA}{date}{inc}:3', 'short_text', NULL, NULL, NULL, NULL),
(64, 'id_menu', '1', 'number', NULL, NULL, '2017-10-19 03:22:00', NULL),
(65, 'id_menu_format', '{AA}{date}{inc}:4', 'short_text', NULL, NULL, NULL, NULL),
(66, 'id_karyawan', '1', 'number', NULL, NULL, '2018-01-24 03:55:00', NULL),
(67, 'id_karyawan_format', '{AA}{date}{inc}:4', 'short_text', NULL, NULL, NULL, NULL),
(68, 'id_item_category', '1', 'number', NULL, NULL, '2018-01-26 05:59:00', NULL),
(69, 'id_item_category_format', '{AA}{date}{inc}:3', 'short_text', NULL, NULL, NULL, NULL),
(70, 'id_item', '1', 'number', NULL, NULL, '2018-01-26 06:00:00', NULL),
(71, 'id_item_format', '{AA}{date}{inc}:4', 'short_text', NULL, NULL, NULL, NULL),
(72, 'id_payment_method', '1', 'number', NULL, NULL, '2017-08-01 00:35:00', NULL),
(73, 'id_payment_method_format', '{AA}{date}{inc}:2', 'short_text', NULL, NULL, NULL, NULL),
(75, 'id_voucher', '1', 'number', NULL, NULL, '2017-05-22 09:54:27', NULL),
(76, 'id_voucher_format', 'VC{date}{inc}:5', 'short_text', NULL, NULL, NULL, NULL),
(77, 'id_mtable', '1', 'number', NULL, NULL, '2018-01-23 12:05:00', NULL),
(78, 'id_mtable_format', '{AA}{date}{inc}:3', 'short_text', NULL, NULL, NULL, NULL),
(79, 'print_server_url', 'http://localhost/syncproject/restotech/site/print', 'short_text', NULL, NULL, '2017-08-10 08:15:00', NULL),
(80, 'print_server_cross_domain', '0', 'boolean', NULL, NULL, '2017-08-10 08:15:00', NULL),
(81, 'print_paper_width', '32', 'number', NULL, NULL, '2017-08-09 09:36:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` varchar(32) NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_id` varchar(12) NOT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah_stok` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_koreksi`
--

CREATE TABLE `stock_koreksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_id` varchar(12) NOT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah` float NOT NULL,
  `jumlah_awal` float DEFAULT NULL,
  `jumlah_adjustment` float DEFAULT NULL,
  `action` enum('Waiting','Approved','Rejected') DEFAULT 'Waiting',
  `date_action` datetime DEFAULT NULL,
  `user_action` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement`
--

CREATE TABLE `stock_movement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Init-Stock','Koreksi','Inflow','Inflow-PO','Inflow-PO-Delete','Inflow-DP','Inflow-DP-Delete','Inflow-DP-Edit','Inflow-Convert','Outflow','Outflow-RP','Outflow-RP-Delete','Outflow-DP-Edit','Outflow-Menu','Outflow-Convert','Transfer') NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_from` varchar(7) DEFAULT NULL,
  `storage_rack_from` bigint(20) UNSIGNED DEFAULT NULL,
  `storage_to` varchar(7) DEFAULT NULL,
  `storage_rack_to` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah` float UNSIGNED DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `id` varchar(7) NOT NULL,
  `nama_storage` varchar(32) NOT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage_rack`
--

CREATE TABLE `storage_rack` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `storage_id` varchar(12) NOT NULL,
  `nama_rak` varchar(32) NOT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` varchar(8) NOT NULL,
  `nama` varchar(48) NOT NULL,
  `alamat` text,
  `telp` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `keterangan` text,
  `kontak1` varchar(48) DEFAULT NULL,
  `kontak1_telp` varchar(15) DEFAULT NULL,
  `kontak2` varchar(48) DEFAULT NULL,
  `kontak2_telp` varchar(15) DEFAULT NULL,
  `kontak3` varchar(48) DEFAULT NULL,
  `kontak3_telp` varchar(15) DEFAULT NULL,
  `kontak4` varchar(48) DEFAULT NULL,
  `kontak4_telp` varchar(15) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_delivery`
--

CREATE TABLE `supplier_delivery` (
  `id` varchar(13) NOT NULL,
  `date` date DEFAULT NULL,
  `kd_supplier` varchar(8) NOT NULL,
  `jumlah_item` float UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_delivery_invoice`
--

CREATE TABLE `supplier_delivery_invoice` (
  `id` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `supplier_delivery_id` varchar(13) NOT NULL,
  `payment_method` varchar(16) NOT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT '0',
  `jumlah_bayar` decimal(14,0) UNSIGNED DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_delivery_invoice_payment`
--

CREATE TABLE `supplier_delivery_invoice_payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_delivery_invoice_id` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `jumlah_bayar` decimal(14,0) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_delivery_invoice_trx`
--

CREATE TABLE `supplier_delivery_invoice_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_delivery_invoice_id` varchar(16) NOT NULL,
  `item_id` varchar(16) DEFAULT NULL,
  `item_sku_id` varchar(16) DEFAULT NULL,
  `jumlah_item` float DEFAULT NULL,
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_delivery_trx`
--

CREATE TABLE `supplier_delivery_trx` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_delivery_id` varchar(13) NOT NULL,
  `purchase_order_id` varchar(13) NOT NULL,
  `purchase_order_trx_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` varchar(16) NOT NULL,
  `item_sku_id` varchar(16) NOT NULL,
  `storage_id` varchar(7) NOT NULL,
  `storage_rack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah_order` float UNSIGNED DEFAULT NULL,
  `jumlah_terima` float UNSIGNED NOT NULL,
  `harga_satuan` decimal(14,0) UNSIGNED DEFAULT NULL,
  `jumlah_harga` decimal(14,0) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_account`
--

CREATE TABLE `transaction_account` (
  `id` varchar(16) NOT NULL,
  `nama_account` varchar(32) NOT NULL,
  `account_type` enum('Cash-In','Cash-Out') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_cash`
--

CREATE TABLE `transaction_cash` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `jumlah` decimal(14,0) UNSIGNED DEFAULT NULL,
  `reference_id` varchar(32) DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_day`
--

CREATE TABLE `transaction_day` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `kd_karyawan` varchar(25) NOT NULL,
  `password` varchar(64) NOT NULL,
  `user_level_id` int(10) UNSIGNED NOT NULL,
  `not_active` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `kd_karyawan`, `password`, `user_level_id`, `not_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
('T001', 'T18010001', '$2y$13$krVjKY4tTsj1Hqt.L79dm.QrXTifc51VImmAqcXKDWPtypyakvaMG', 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_akses`
--

CREATE TABLE `user_akses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_level_id` int(10) UNSIGNED NOT NULL,
  `user_app_module_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_app_module`
--

CREATE TABLE `user_app_module` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_program` varchar(128) NOT NULL,
  `nama_module` varchar(128) NOT NULL,
  `module_action` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_app_module`
--

INSERT INTO `user_app_module` (`id`, `sub_program`, `nama_module`, `module_action`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'administrator', 'standard/user', 'index', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(2, 'administrator', 'standard/user', 'create', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(3, 'administrator', 'standard/user', 'update', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(4, 'administrator', 'standard/user', 'view', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(5, 'administrator', 'standard/user', 'delete', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(6, 'administrator', 'standard/user', 'update-password', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(7, 'administrator', 'standard/user-level', 'index', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(8, 'administrator', 'standard/user-level', 'create', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(9, 'administrator', 'standard/user-level', 'update', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(10, 'administrator', 'standard/user-level', 'view', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(11, 'administrator', 'standard/user-level', 'delete', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(12, 'administrator', 'standard/user-app-module', 'index', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(13, 'administrator', 'standard/user-app-module', 'create', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(14, 'administrator', 'standard/user-app-module', 'update', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(15, 'administrator', 'standard/user-app-module', 'view', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(16, 'administrator', 'standard/user-app-module', 'delete', '2015-04-13 11:54:44', NULL, '2015-04-13 11:54:44', NULL),
(17, 'administrator', 'standard/employee', 'index', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(18, 'administrator', 'standard/employee', 'create', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(19, 'administrator', 'standard/employee', 'update', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(20, 'administrator', 'standard/employee', 'view', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(21, 'administrator', 'standard/employee', 'delete', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(22, 'administrator', 'standard/employee', 'update-limit-officer', '2017-06-04 19:41:09', NULL, '2017-06-04 19:41:09', NULL),
(23, 'administrator', 'standard/shift', 'index', '2017-06-04 20:21:04', NULL, '2017-06-04 20:21:04', NULL),
(24, 'administrator', 'standard/shift', 'create', '2017-06-04 20:21:04', NULL, '2017-06-04 20:21:04', NULL),
(25, 'administrator', 'standard/shift', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(26, 'administrator', 'standard/shift', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(27, 'administrator', 'standard/shift', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(28, 'administrator', 'standard/saldo-kasir', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(29, 'administrator', 'standard/saldo-kasir', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(30, 'administrator', 'standard/saldo-kasir', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(31, 'administrator', 'standard/saldo-kasir', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(32, 'administrator', 'standard/saldo-kasir', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(33, 'administrator', 'standard/supplier', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(34, 'administrator', 'standard/supplier', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(35, 'administrator', 'standard/supplier', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(36, 'administrator', 'standard/supplier', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(37, 'administrator', 'standard/supplier', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(38, 'administrator', 'standard/storage', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(39, 'administrator', 'standard/storage', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(40, 'administrator', 'standard/storage', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(41, 'administrator', 'standard/storage', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(42, 'administrator', 'standard/storage', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(43, 'administrator', 'standard/storage-rack', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(44, 'administrator', 'standard/storage-rack', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(45, 'administrator', 'standard/storage-rack', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(46, 'administrator', 'standard/storage-rack', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(47, 'administrator', 'standard/storage-rack', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(48, 'administrator', 'standard/menu-satuan', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(49, 'administrator', 'standard/menu-satuan', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(50, 'administrator', 'standard/menu-satuan', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(51, 'administrator', 'standard/menu-satuan', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(52, 'administrator', 'standard/menu-satuan', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(53, 'administrator', 'standard/menu-category', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(54, 'administrator', 'standard/menu-category', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(55, 'administrator', 'standard/menu-category', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(56, 'administrator', 'standard/menu-category', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(57, 'administrator', 'standard/menu-category', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(58, 'administrator', 'standard/menu-category', 'printer', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(59, 'administrator', 'standard/menu-category', 'printer-delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(60, 'administrator', 'standard/menu', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(61, 'administrator', 'standard/menu', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(62, 'administrator', 'standard/menu', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(63, 'administrator', 'standard/menu', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(64, 'administrator', 'standard/menu', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(65, 'administrator', 'standard/menu', 'condiment', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(66, 'administrator', 'standard/payment-method', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(67, 'administrator', 'standard/payment-method', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(68, 'administrator', 'standard/payment-method', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(69, 'administrator', 'standard/payment-method', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(70, 'administrator', 'standard/payment-method', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(71, 'administrator', 'standard/voucher', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(72, 'administrator', 'standard/voucher', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(73, 'administrator', 'standard/voucher', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(74, 'administrator', 'standard/voucher', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(75, 'administrator', 'standard/voucher', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(76, 'administrator', 'standard/mtable-category', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(77, 'administrator', 'standard/mtable-category', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(78, 'administrator', 'standard/mtable-category', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(79, 'administrator', 'standard/mtable-category', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(80, 'administrator', 'standard/mtable-category', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(81, 'administrator', 'standard/mtable', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(82, 'administrator', 'standard/mtable', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(83, 'administrator', 'standard/mtable', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(84, 'administrator', 'standard/mtable', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(85, 'administrator', 'standard/mtable', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(86, 'administrator', 'standard/mtable', 'table-layout', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(87, 'administrator', 'standard/item-category', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(88, 'administrator', 'standard/item-category', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(89, 'administrator', 'standard/item-category', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(90, 'administrator', 'standard/item-category', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(91, 'administrator', 'standard/item-category', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(92, 'administrator', 'standard/item-category', 'sub-item-category', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(93, 'administrator', 'standard/item', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(94, 'administrator', 'standard/item', 'create', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(95, 'administrator', 'standard/item', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(96, 'administrator', 'standard/item', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(97, 'administrator', 'standard/item', 'delete', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(98, 'administrator', 'standard/stock-movement', 'index', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(99, 'administrator', 'standard/stock-movement', 'update', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(100, 'administrator', 'standard/stock-movement', 'view', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(101, 'administrator', 'standard/stock-movement', 'convert', '2017-06-04 20:21:05', NULL, '2017-06-04 20:21:05', NULL),
(102, 'administrator', 'standard/stock', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(103, 'administrator', 'standard/stock', 'input-stock', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(104, 'administrator', 'standard/stock', 'stock-convert', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(105, 'administrator', 'standard/stock', 'get-sku-item', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(106, 'administrator', 'standard/stock', 'get-storage', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(107, 'administrator', 'standard/stock', 'get-storage-rack', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(108, 'administrator', 'standard/stock', 'get-sku-item-descent', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(109, 'administrator', 'standard/purchase-order', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(110, 'administrator', 'standard/purchase-order', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(111, 'administrator', 'standard/purchase-order', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(112, 'administrator', 'standard/purchase-order', 'view', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(113, 'administrator', 'standard/purchase-order', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(114, 'administrator', 'standard/purchase-order', 'get-po', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(115, 'administrator', 'standard/purchase-order', 'print', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(116, 'administrator', 'standard/supplier-delivery', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(117, 'administrator', 'standard/supplier-delivery', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(118, 'administrator', 'standard/supplier-delivery', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(119, 'administrator', 'standard/supplier-delivery', 'view', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(120, 'administrator', 'standard/supplier-delivery', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(121, 'administrator', 'standard/supplier-delivery', 'get-sd', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(122, 'administrator', 'standard/supplier-delivery', 'get-sd-by-id', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(123, 'administrator', 'standard/supplier-delivery', 'print', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(124, 'administrator', 'standard/supplier-delivery-invoice', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(125, 'administrator', 'standard/supplier-delivery-invoice', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(126, 'administrator', 'standard/supplier-delivery-invoice', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(127, 'administrator', 'standard/supplier-delivery-invoice', 'view', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(128, 'administrator', 'standard/supplier-delivery-invoice', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(129, 'administrator', 'standard/supplier-delivery-invoice-payment', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(130, 'administrator', 'standard/supplier-delivery-invoice-payment', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(131, 'administrator', 'standard/supplier-delivery-invoice-payment', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(132, 'administrator', 'standard/retur-purchase', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(133, 'administrator', 'standard/retur-purchase', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(134, 'administrator', 'standard/retur-purchase', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(135, 'administrator', 'standard/retur-purchase', 'view', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(136, 'administrator', 'standard/retur-purchase', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(137, 'administrator', 'standard/retur-purchase', 'get-rp-by-id', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(138, 'administrator', 'standard/direct-purchase', 'index', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(139, 'administrator', 'standard/direct-purchase', 'create', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(140, 'administrator', 'standard/direct-purchase', 'update', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(141, 'administrator', 'standard/direct-purchase', 'view', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(142, 'administrator', 'standard/direct-purchase', 'delete', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(143, 'administrator', 'standard/direct-purchase', 'print', '2017-06-04 21:49:00', NULL, '2017-06-04 21:49:00', NULL),
(144, 'administrator', 'standard/transaction-day', 'start-day', '2017-06-05 08:13:36', NULL, '2017-06-05 08:13:36', NULL),
(145, 'administrator', 'standard/transaction-day', 'end-day', '2017-06-05 08:13:36', NULL, '2017-06-05 08:13:36', NULL),
(146, 'administrator', 'standard/sale-invoice', 'refund', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(147, 'administrator', 'standard/sale-invoice', 'view', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(148, 'administrator', 'standard/sale-invoice-payment', 'ar', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(149, 'administrator', 'standard/sale-invoice-payment', 'payment', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(150, 'administrator', 'standard/transaction-account', 'index', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(151, 'administrator', 'standard/transaction-account', 'create', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(152, 'administrator', 'standard/transaction-account', 'update', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(153, 'administrator', 'standard/transaction-account', 'view', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(154, 'administrator', 'standard/transaction-account', 'delete', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(155, 'administrator', 'standard/transaction-cash', 'index', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(156, 'administrator', 'standard/transaction-cash', 'create', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(157, 'administrator', 'standard/transaction-cash', 'update', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(158, 'administrator', 'standard/transaction-cash', 'view', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(159, 'administrator', 'standard/transaction-cash', 'delete', '2017-06-05 08:23:23', NULL, '2017-06-05 08:23:23', NULL),
(160, 'administrator', 'standard/printer', 'index', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(161, 'administrator', 'standard/printer', 'create', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(162, 'administrator', 'standard/printer', 'update', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(163, 'administrator', 'standard/printer', 'view', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(164, 'administrator', 'standard/printer', 'delete', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(165, 'administrator', 'standard/settings', 'update-setting', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(166, 'administrator', 'standard/settings', 'show-virtual-keyboard', '2017-06-05 08:27:08', NULL, '2017-06-05 08:27:08', NULL),
(167, 'pos', 'standard/home', 'index', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(168, 'pos', 'standard/home', 'load-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(169, 'pos', 'standard/home', 'room', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(170, 'pos', 'standard/home', 'table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(171, 'pos', 'standard/home', 'room-layout', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(172, 'pos', 'standard/home', 'view-session', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(173, 'pos', 'standard/home', 'open-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(174, 'pos', 'standard/home', 'payment', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(175, 'pos', 'standard/home', 'opened-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(176, 'pos', 'standard/home', 'menu-queue', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(177, 'pos', 'standard/home', 'menu-queue-finished', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(178, 'pos', 'standard/home', 'reprint-invoice', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(179, 'pos', 'standard/home', 'reprint-invoice-submit', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(180, 'pos', 'standard/home', 'correction-invoice', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(181, 'pos', 'standard/home', 'correction-invoice-submit', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(182, 'pos', 'standard/home', 'booking', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(183, 'pos', 'standard/home', 'create-booking', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(184, 'pos', 'standard/action', 'save-order', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(185, 'pos', 'standard/action', 'info-tamu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(186, 'pos', 'standard/action', 'catatan', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(187, 'pos', 'standard/action', 'free-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(188, 'pos', 'standard/action', 'void-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(189, 'pos', 'standard/action', 'discount-bill', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(190, 'pos', 'standard/action', 'discount-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(191, 'pos', 'standard/action', 'close-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(192, 'pos', 'standard/action', 'split', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(193, 'pos', 'standard/action', 'queue-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(194, 'pos', 'standard/action', 'print-bill', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(195, 'pos', 'standard/action', 'unlock-bill', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(196, 'pos', 'standard/action', 'change-qty', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(197, 'pos', 'standard/action', 'cashdrawer', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(198, 'pos', 'standard/action', 'transfer-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(199, 'pos', 'standard/action', 'transfer-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(200, 'pos', 'standard/action', 'join-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(201, 'pos', 'standard/action', 'payment', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(202, 'pos', 'standard/action', 'payment-correction', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(203, 'pos', 'standard/action', 'queue-finish', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(204, 'pos', 'standard/action', 'queue-send', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(205, 'pos', 'standard/action', 'create-booking', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(206, 'pos', 'standard/action', 'booking-open', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(207, 'pos', 'standard/data', 'date-time', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(208, 'pos', 'standard/data', 'table-layout', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(209, 'pos', 'standard/data', 'info-table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(210, 'pos', 'standard/data', 'search-menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(211, 'pos', 'standard/data', 'menu-category', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(212, 'pos', 'standard/data', 'menu', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(213, 'pos', 'standard/data', 'condiment', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(214, 'pos', 'standard/data', 'table-category', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(215, 'pos', 'standard/data', 'table', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(216, 'pos', 'standard/data', 'limit-karyawan', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(217, 'pos', 'standard/data', 'voucher', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(218, 'pos', 'standard/data', 'get-mtable', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(220, 'pos', 'standard/transaction-day', 'start-day', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL),
(221, 'pos', 'standard/transaction-day', 'end-day', '2017-06-05 16:32:37', NULL, '2017-06-05 16:32:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_level` varchar(32) NOT NULL,
  `is_super_admin` tinyint(1) DEFAULT '0',
  `default_action` int(10) UNSIGNED DEFAULT NULL,
  `keterangan` text,
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `nama_level`, `is_super_admin`, `default_action`, `keterangan`, `is_deleted`, `created_at`, `user_created`, `updated_at`, `user_updated`) VALUES
(1, 'Administrator', 1, 1, '', 0, NULL, NULL, '2017-06-08 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` varchar(16) NOT NULL,
  `voucher_type` enum('Percent','Value') NOT NULL,
  `jumlah_voucher` float UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `not_active` tinyint(1) DEFAULT '0',
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `user_created` varchar(32) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_updated` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `direct_purchase`
--
ALTER TABLE `direct_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `direct_purchase_trx`
--
ALTER TABLE `direct_purchase_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `direct_purchase_id` (`direct_purchase_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`kd_karyawan`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_category_id` (`item_category_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `parent_item_caegory_id` (`parent_item_category_id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `parent_id` (`parent_category_id`);

--
-- Indexes for table `item_sku`
--
ALTER TABLE `item_sku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `menu_category_id` (`menu_category_id`),
  ADD KEY `menu_satuan_id` (`menu_satuan_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indexes for table `menu_category_printer`
--
ALTER TABLE `menu_category_printer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_category_id` (`menu_category_id`),
  ADD KEY `printer` (`printer`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `menu_condiment`
--
ALTER TABLE `menu_condiment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_condiment_1_idx` (`parent_menu_id`),
  ADD KEY `fk_menu_condiment_2_idx` (`menu_id`),
  ADD KEY `fk_menu_condiment_3_idx` (`user_created`),
  ADD KEY `fk_menu_condiment_4_idx` (`user_updated`);

--
-- Indexes for table `menu_hpp`
--
ALTER TABLE `menu_hpp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_hpp_1_idx` (`menu_id`),
  ADD KEY `fk_menu_hpp_2_idx` (`user_created`),
  ADD KEY `fk_menu_hpp_3_idx` (`user_updated`);

--
-- Indexes for table `menu_recipe`
--
ALTER TABLE `menu_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `menu_satuan`
--
ALTER TABLE `menu_satuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable`
--
ALTER TABLE `mtable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mtable_category_id` (`mtable_category_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable_booking`
--
ALTER TABLE `mtable_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mtable_id` (`mtable_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable_category`
--
ALTER TABLE `mtable_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable_join`
--
ALTER TABLE `mtable_join`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `fk_mtable_join_1_idx` (`active_mtable_session_id`);

--
-- Indexes for table `mtable_order`
--
ALTER TABLE `mtable_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `mtable_session_id` (`mtable_session_id`),
  ADD KEY `user_void` (`user_void`),
  ADD KEY `user_free_menu` (`user_free_menu`),
  ADD KEY `fk_mtable_order_1_idx` (`parent_id`);

--
-- Indexes for table `mtable_order_queue`
--
ALTER TABLE `mtable_order_queue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mtable_order_id` (`mtable_order_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable_session`
--
ALTER TABLE `mtable_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mtable_id` (`mtable_id`),
  ADD KEY `user_opened` (`user_opened`),
  ADD KEY `user_closed` (`user_closed`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `mtable_session_join`
--
ALTER TABLE `mtable_session_join`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mtable_session_id_UNIQUE` (`mtable_session_id`),
  ADD KEY `fk_mtable_session_join_2_idx` (`mtable_join_id`),
  ADD KEY `fk_mtable_session_join_3_idx` (`user_created`),
  ADD KEY `fk_mtable_session_join_4_idx` (`user_updated`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`printer`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `kd_supplier` (`kd_supplier`);

--
-- Indexes for table `purchase_order_trx`
--
ALTER TABLE `purchase_order_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `purchase_order_id` (`purchase_order_id`);

--
-- Indexes for table `retur_purchase`
--
ALTER TABLE `retur_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_supplier` (`kd_supplier`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `retur_purchase_trx`
--
ALTER TABLE `retur_purchase_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `retur_purchase_id` (`retur_purchase_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `supplier_delivery_id` (`supplier_delivery_id`),
  ADD KEY `supplier_delivery_trx_id` (`supplier_delivery_trx_id`);

--
-- Indexes for table `saldo_kasir`
--
ALTER TABLE `saldo_kasir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `user_active` (`user_active`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mtable_session_id` (`mtable_session_id`),
  ADD KEY `user_operator` (`user_operator`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `sale_invoice_ar_payment`
--
ALTER TABLE `sale_invoice_ar_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sale_invoice_ar_payment_1_idx` (`sale_invoice_payment_id`),
  ADD KEY `fk_sale_invoice_ar_payment_2_idx` (`user_created`),
  ADD KEY `fk_sale_invoice_ar_payment_3_idx` (`user_updated`);

--
-- Indexes for table `sale_invoice_correction`
--
ALTER TABLE `sale_invoice_correction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mtable_session_id` (`mtable_session_id`),
  ADD KEY `user_operator` (`user_operator`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `fk_sale_invoice_correction_1_idx` (`sale_invoice_id`);

--
-- Indexes for table `sale_invoice_payment`
--
ALTER TABLE `sale_invoice_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_invoice_id` (`sale_invoice_id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `sale_invoice_payment_correction`
--
ALTER TABLE `sale_invoice_payment_correction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `fk_sale_invoice_payment_correction_1_idx` (`sale_invoice_correction_id`);

--
-- Indexes for table `sale_invoice_retur`
--
ALTER TABLE `sale_invoice_retur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sale_invoice_retur_1_idx` (`sale_invoice_trx_id`),
  ADD KEY `fk_sale_invoice_retur_2_idx` (`menu_id`),
  ADD KEY `fk_sale_invoice_retur_3_idx` (`user_created`),
  ADD KEY `fk_sale_invoice_retur_4_idx` (`user_updated`);

--
-- Indexes for table `sale_invoice_trx`
--
ALTER TABLE `sale_invoice_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_invoice_id` (`sale_invoice_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `sale_invoice_trx_correction`
--
ALTER TABLE `sale_invoice_trx_correction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `fk_sale_invoice_trx_correction_1_idx` (`sale_invoice_correction_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `stock_koreksi`
--
ALTER TABLE `stock_koreksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`),
  ADD KEY `user_approver` (`user_action`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `storage_from` (`storage_from`),
  ADD KEY `storage_rack_from` (`storage_rack_from`),
  ADD KEY `storage_to` (`storage_to`),
  ADD KEY `storage_rack_to` (`storage_rack_to`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `storage_rack`
--
ALTER TABLE `storage_rack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `supplier_delivery`
--
ALTER TABLE `supplier_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_supplier` (`kd_supplier`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `supplier_delivery_invoice`
--
ALTER TABLE `supplier_delivery_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_delivery_id` (`supplier_delivery_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `payment_method` (`payment_method`);

--
-- Indexes for table `supplier_delivery_invoice_payment`
--
ALTER TABLE `supplier_delivery_invoice_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_delivery_invoice_id` (`supplier_delivery_invoice_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `supplier_delivery_invoice_trx`
--
ALTER TABLE `supplier_delivery_invoice_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_delivery_invoice_id` (`supplier_delivery_invoice_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `supplier_delivery_trx`
--
ALTER TABLE `supplier_delivery_trx`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_sku_id` (`item_sku_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `supplier_delivery_id` (`supplier_delivery_id`),
  ADD KEY `purchase_order_id` (`purchase_order_id`),
  ADD KEY `purchase_order_trx_id` (`purchase_order_trx_id`),
  ADD KEY `storage_rack_id` (`storage_rack_id`),
  ADD KEY `storage_id` (`storage_id`);

--
-- Indexes for table `transaction_account`
--
ALTER TABLE `transaction_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `transaction_cash`
--
ALTER TABLE `transaction_cash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `transaction_day`
--
ALTER TABLE `transaction_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaction_day_2_idx` (`user_updated`),
  ADD KEY `fk_transaction_day_1_idx` (`user_created`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_karyawan` (`kd_karyawan`),
  ADD KEY `user_level` (`user_level_id`);

--
-- Indexes for table `user_akses`
--
ALTER TABLE `user_akses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level_id` (`user_level_id`),
  ADD KEY `user_app_module_id` (`user_app_module_id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `user_app_module`
--
ALTER TABLE `user_app_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`),
  ADD KEY `default_action` (`default_action`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_created` (`user_created`),
  ADD KEY `user_updated` (`user_updated`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `direct_purchase_trx`
--
ALTER TABLE `direct_purchase_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_category_printer`
--
ALTER TABLE `menu_category_printer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_condiment`
--
ALTER TABLE `menu_condiment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_recipe`
--
ALTER TABLE `menu_recipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_category`
--
ALTER TABLE `mtable_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_join`
--
ALTER TABLE `mtable_join`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_order`
--
ALTER TABLE `mtable_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_order_queue`
--
ALTER TABLE `mtable_order_queue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_session`
--
ALTER TABLE `mtable_session`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mtable_session_join`
--
ALTER TABLE `mtable_session_join`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_trx`
--
ALTER TABLE `purchase_order_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `retur_purchase_trx`
--
ALTER TABLE `retur_purchase_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_ar_payment`
--
ALTER TABLE `sale_invoice_ar_payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_correction`
--
ALTER TABLE `sale_invoice_correction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_payment`
--
ALTER TABLE `sale_invoice_payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_payment_correction`
--
ALTER TABLE `sale_invoice_payment_correction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_retur`
--
ALTER TABLE `sale_invoice_retur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_trx`
--
ALTER TABLE `sale_invoice_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_invoice_trx_correction`
--
ALTER TABLE `sale_invoice_trx_correction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_koreksi`
--
ALTER TABLE `stock_koreksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_movement`
--
ALTER TABLE `stock_movement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `storage_rack`
--
ALTER TABLE `storage_rack`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_delivery_invoice_payment`
--
ALTER TABLE `supplier_delivery_invoice_payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_delivery_invoice_trx`
--
ALTER TABLE `supplier_delivery_invoice_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_delivery_trx`
--
ALTER TABLE `supplier_delivery_trx`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_cash`
--
ALTER TABLE `transaction_cash`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction_day`
--
ALTER TABLE `transaction_day`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_akses`
--
ALTER TABLE `user_akses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_app_module`
--
ALTER TABLE `user_app_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `direct_purchase`
--
ALTER TABLE `direct_purchase`
  ADD CONSTRAINT `direct_purchase_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `direct_purchase_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `direct_purchase_trx`
--
ALTER TABLE `direct_purchase_trx`
  ADD CONSTRAINT `direct_purchase_trx_ibfk_1` FOREIGN KEY (`direct_purchase_id`) REFERENCES `direct_purchase` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_3` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_4` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_5` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_6` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `direct_purchase_trx_ibfk_7` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_ibfk_4` FOREIGN KEY (`parent_item_category_id`) REFERENCES `item_category` (`id`);

--
-- Constraints for table `item_category`
--
ALTER TABLE `item_category`
  ADD CONSTRAINT `item_category_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_category_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_category_ibfk_3` FOREIGN KEY (`parent_category_id`) REFERENCES `item_category` (`id`);

--
-- Constraints for table `item_sku`
--
ALTER TABLE `item_sku`
  ADD CONSTRAINT `item_sku_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `item_sku_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_sku_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `item_sku_ibfk_4` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `item_sku_ibfk_5` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_ibfk_5` FOREIGN KEY (`menu_category_id`) REFERENCES `menu_category` (`id`),
  ADD CONSTRAINT `menu_ibfk_6` FOREIGN KEY (`menu_satuan_id`) REFERENCES `menu_satuan` (`id`);

--
-- Constraints for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD CONSTRAINT `fk_menu_category_1` FOREIGN KEY (`parent_category_id`) REFERENCES `menu_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `menu_category_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_category_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `menu_category_printer`
--
ALTER TABLE `menu_category_printer`
  ADD CONSTRAINT `menu_category_printer_ibfk_1` FOREIGN KEY (`menu_category_id`) REFERENCES `menu_category` (`id`),
  ADD CONSTRAINT `menu_category_printer_ibfk_2` FOREIGN KEY (`printer`) REFERENCES `printer` (`printer`),
  ADD CONSTRAINT `menu_category_printer_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_category_printer_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `menu_condiment`
--
ALTER TABLE `menu_condiment`
  ADD CONSTRAINT `fk_menu_condiment_1` FOREIGN KEY (`parent_menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_condiment_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_condiment_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_condiment_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menu_hpp`
--
ALTER TABLE `menu_hpp`
  ADD CONSTRAINT `fk_menu_hpp_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_hpp_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_hpp_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menu_recipe`
--
ALTER TABLE `menu_recipe`
  ADD CONSTRAINT `menu_recipe_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_recipe_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_recipe_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `menu_recipe_ibfk_6` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `menu_recipe_ibfk_7` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Constraints for table `menu_satuan`
--
ALTER TABLE `menu_satuan`
  ADD CONSTRAINT `menu_satuan_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `menu_satuan_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable`
--
ALTER TABLE `mtable`
  ADD CONSTRAINT `mtable_ibfk_1` FOREIGN KEY (`mtable_category_id`) REFERENCES `mtable_category` (`id`),
  ADD CONSTRAINT `mtable_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_booking`
--
ALTER TABLE `mtable_booking`
  ADD CONSTRAINT `mtable_booking_ibfk_1` FOREIGN KEY (`mtable_id`) REFERENCES `mtable` (`id`),
  ADD CONSTRAINT `mtable_booking_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_booking_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_category`
--
ALTER TABLE `mtable_category`
  ADD CONSTRAINT `mtable_category_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_category_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_join`
--
ALTER TABLE `mtable_join`
  ADD CONSTRAINT `fk_mtable_join_1` FOREIGN KEY (`active_mtable_session_id`) REFERENCES `mtable_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mtable_join_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_join_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_order`
--
ALTER TABLE `mtable_order`
  ADD CONSTRAINT `fk_mtable_order_1` FOREIGN KEY (`parent_id`) REFERENCES `mtable_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `mtable_order_ibfk_1` FOREIGN KEY (`mtable_session_id`) REFERENCES `mtable_session` (`id`),
  ADD CONSTRAINT `mtable_order_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `mtable_order_ibfk_3` FOREIGN KEY (`user_free_menu`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_order_ibfk_4` FOREIGN KEY (`user_void`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_order_ibfk_5` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_order_ibfk_6` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_order_queue`
--
ALTER TABLE `mtable_order_queue`
  ADD CONSTRAINT `mtable_order_queue_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `mtable_order_queue_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_order_queue_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_order_queue_ibfk_4` FOREIGN KEY (`mtable_order_id`) REFERENCES `mtable_order` (`id`);

--
-- Constraints for table `mtable_session`
--
ALTER TABLE `mtable_session`
  ADD CONSTRAINT `mtable_session_ibfk_1` FOREIGN KEY (`mtable_id`) REFERENCES `mtable` (`id`),
  ADD CONSTRAINT `mtable_session_ibfk_2` FOREIGN KEY (`user_opened`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_session_ibfk_3` FOREIGN KEY (`user_closed`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_session_ibfk_4` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `mtable_session_ibfk_5` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `mtable_session_join`
--
ALTER TABLE `mtable_session_join`
  ADD CONSTRAINT `fk_mtable_session_join_1` FOREIGN KEY (`mtable_session_id`) REFERENCES `mtable_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mtable_session_join_2` FOREIGN KEY (`mtable_join_id`) REFERENCES `mtable_join` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mtable_session_join_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mtable_session_join_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `payment_method_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `printer`
--
ALTER TABLE `printer`
  ADD CONSTRAINT `printer_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `printer_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `purchase_order_trx`
--
ALTER TABLE `purchase_order_trx`
  ADD CONSTRAINT `purchase_order_trx_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`),
  ADD CONSTRAINT `purchase_order_trx_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `purchase_order_trx_ibfk_3` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `purchase_order_trx_ibfk_4` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `purchase_order_trx_ibfk_5` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `retur_purchase`
--
ALTER TABLE `retur_purchase`
  ADD CONSTRAINT `fk_retur_purchase_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `retur_purchase_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `retur_purchase_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `retur_purchase_trx`
--
ALTER TABLE `retur_purchase_trx`
  ADD CONSTRAINT `retur_purchase_trx_ibfk_1` FOREIGN KEY (`retur_purchase_id`) REFERENCES `retur_purchase` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_2` FOREIGN KEY (`supplier_delivery_id`) REFERENCES `supplier_delivery` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_3` FOREIGN KEY (`supplier_delivery_trx_id`) REFERENCES `supplier_delivery_trx` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_5` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_6` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_7` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_8` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `retur_purchase_trx_ibfk_9` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `saldo_kasir`
--
ALTER TABLE `saldo_kasir`
  ADD CONSTRAINT `saldo_kasir_ibfk_1` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`),
  ADD CONSTRAINT `saldo_kasir_ibfk_2` FOREIGN KEY (`user_active`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `saldo_kasir_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `saldo_kasir_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  ADD CONSTRAINT `sale_invoice_ibfk_1` FOREIGN KEY (`mtable_session_id`) REFERENCES `mtable_session` (`id`),
  ADD CONSTRAINT `sale_invoice_ibfk_2` FOREIGN KEY (`user_operator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice_ar_payment`
--
ALTER TABLE `sale_invoice_ar_payment`
  ADD CONSTRAINT `fk_sale_invoice_ar_payment_1` FOREIGN KEY (`sale_invoice_payment_id`) REFERENCES `sale_invoice_payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_invoice_ar_payment_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_invoice_ar_payment_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sale_invoice_correction`
--
ALTER TABLE `sale_invoice_correction`
  ADD CONSTRAINT `fk_sale_invoice_correction_1` FOREIGN KEY (`sale_invoice_id`) REFERENCES `sale_invoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_invoice_correction_ibfk_1` FOREIGN KEY (`mtable_session_id`) REFERENCES `mtable_session` (`id`),
  ADD CONSTRAINT `sale_invoice_correction_ibfk_2` FOREIGN KEY (`user_operator`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_correction_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_correction_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice_payment`
--
ALTER TABLE `sale_invoice_payment`
  ADD CONSTRAINT `sale_invoice_payment_ibfk_1` FOREIGN KEY (`sale_invoice_id`) REFERENCES `sale_invoice` (`id`),
  ADD CONSTRAINT `sale_invoice_payment_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `sale_invoice_payment_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_payment_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice_payment_correction`
--
ALTER TABLE `sale_invoice_payment_correction`
  ADD CONSTRAINT `fk_sale_invoice_payment_correction_1` FOREIGN KEY (`sale_invoice_correction_id`) REFERENCES `sale_invoice_correction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_invoice_payment_correction_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `sale_invoice_payment_correction_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_payment_correction_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice_retur`
--
ALTER TABLE `sale_invoice_retur`
  ADD CONSTRAINT `fk_sale_invoice_retur_1` FOREIGN KEY (`sale_invoice_trx_id`) REFERENCES `sale_invoice_trx` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_invoice_retur_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_invoice_retur_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sale_invoice_retur_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sale_invoice_trx`
--
ALTER TABLE `sale_invoice_trx`
  ADD CONSTRAINT `sale_invoice_trx_ibfk_1` FOREIGN KEY (`sale_invoice_id`) REFERENCES `sale_invoice` (`id`),
  ADD CONSTRAINT `sale_invoice_trx_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `sale_invoice_trx_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_trx_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `sale_invoice_trx_correction`
--
ALTER TABLE `sale_invoice_trx_correction`
  ADD CONSTRAINT `fk_sale_invoice_trx_correction_1` FOREIGN KEY (`sale_invoice_correction_id`) REFERENCES `sale_invoice_correction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_invoice_trx_correction_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `sale_invoice_trx_correction_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sale_invoice_trx_correction_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `settings_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `stock_ibfk_4` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `stock_ibfk_5` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_ibfk_6` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `stock_koreksi`
--
ALTER TABLE `stock_koreksi`
  ADD CONSTRAINT `stock_koreksi_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_2` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_3` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_4` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_5` FOREIGN KEY (`user_action`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_6` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_koreksi_ibfk_7` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD CONSTRAINT `stock_movement_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_2` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_3` FOREIGN KEY (`storage_from`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_4` FOREIGN KEY (`storage_rack_from`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_5` FOREIGN KEY (`storage_to`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_6` FOREIGN KEY (`storage_rack_to`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_7` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `stock_movement_ibfk_8` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `storage_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `storage_rack`
--
ALTER TABLE `storage_rack`
  ADD CONSTRAINT `storage_rack_ibfk_1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `storage_rack_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `storage_rack_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_delivery`
--
ALTER TABLE `supplier_delivery`
  ADD CONSTRAINT `supplier_delivery_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `supplier_delivery_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_delivery_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_delivery_invoice`
--
ALTER TABLE `supplier_delivery_invoice`
  ADD CONSTRAINT `supplier_delivery_invoice_ibfk_1` FOREIGN KEY (`supplier_delivery_id`) REFERENCES `supplier_delivery` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_ibfk_2` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_delivery_invoice_payment`
--
ALTER TABLE `supplier_delivery_invoice_payment`
  ADD CONSTRAINT `supplier_delivery_invoice_payment_ibfk_1` FOREIGN KEY (`supplier_delivery_invoice_id`) REFERENCES `supplier_delivery_invoice` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_payment_ibfk_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_payment_ibfk_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_delivery_invoice_trx`
--
ALTER TABLE `supplier_delivery_invoice_trx`
  ADD CONSTRAINT `supplier_delivery_invoice_trx_ibfk_1` FOREIGN KEY (`supplier_delivery_invoice_id`) REFERENCES `supplier_delivery_invoice` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_trx_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_trx_ibfk_3` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_trx_ibfk_4` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_delivery_invoice_trx_ibfk_5` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `supplier_delivery_trx`
--
ALTER TABLE `supplier_delivery_trx`
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_1` FOREIGN KEY (`supplier_delivery_id`) REFERENCES `supplier_delivery` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_2` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_3` FOREIGN KEY (`purchase_order_trx_id`) REFERENCES `purchase_order_trx` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_5` FOREIGN KEY (`item_sku_id`) REFERENCES `item_sku` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_6` FOREIGN KEY (`storage_rack_id`) REFERENCES `storage_rack` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_7` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_8` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `supplier_delivery_trx_ibfk_9` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `transaction_account`
--
ALTER TABLE `transaction_account`
  ADD CONSTRAINT `transaction_account_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaction_account_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `transaction_cash`
--
ALTER TABLE `transaction_cash`
  ADD CONSTRAINT `fk_transaction_cash_1` FOREIGN KEY (`account_id`) REFERENCES `transaction_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_cash_2` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_cash_3` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaction_day`
--
ALTER TABLE `transaction_day`
  ADD CONSTRAINT `fk_transaction_day_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_day_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`kd_karyawan`) REFERENCES `employee` (`kd_karyawan`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_level_id`) REFERENCES `user_level` (`id`);

--
-- Constraints for table `user_akses`
--
ALTER TABLE `user_akses`
  ADD CONSTRAINT `user_akses_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `user_level` (`id`),
  ADD CONSTRAINT `user_akses_ibfk_2` FOREIGN KEY (`user_app_module_id`) REFERENCES `user_app_module` (`id`),
  ADD CONSTRAINT `user_akses_ibfk_3` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_akses_ibfk_4` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_app_module`
--
ALTER TABLE `user_app_module`
  ADD CONSTRAINT `user_app_module_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_app_module_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_level`
--
ALTER TABLE `user_level`
  ADD CONSTRAINT `fk_user_level_1` FOREIGN KEY (`default_action`) REFERENCES `user_app_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_level_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_level_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `voucher_ibfk_2` FOREIGN KEY (`user_updated`) REFERENCES `user` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
