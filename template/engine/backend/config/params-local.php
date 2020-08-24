<?php
return [
    'checkbox-radio-script' => function() {        
        $jscript = '$(\'input[type="radio"], input[type="checkbox"]\').iCheck({
                    checkboxClass: "icheckbox_minimal-red",
                    radioClass: "iradio_minimal-red"
                });';
        
        return $jscript;
    },
    'subprogramLocal' => 'administrator',
            
    'navigation' => [
        'dashboard' => [
            'label' => 'Dashboard',
            'iconClass' => 'fa fa-dashboard',
            'url' => ['standard/page/dashboard'],
        ],
        'masterData' => [
            'label' => 'Master Data',
            'iconClass' => 'fa fa-book',
            'navigation' => [
                'employee' => [
                    'label' => 'Karyawan',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/employee/index'],
                ],
                'shift' => [
                    'label' => 'Shift',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/shift/index'],
                ],
                'saldoKasir' => [
                    'label' => 'Saldo Kasir',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/saldo-kasir/index'],
                ],
                'storage' => [
                    'label' => 'Gudang',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/storage/init'],
                ],
                'menuSatuan' => [
                    'label' => 'Satuan Menu',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/menu-satuan/index'],
                ],
                'menuCategory' => [
                    'label' => 'Kategori Menu',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/menu-category/index'],
                ],
                'menu' => [
                    'label' => 'Menu',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/menu/index'],
                ],
                'paymentMethod' => [
                    'label' => 'Metode Pembayaran',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/payment-method/init'],
                ],
                'mtableCategory' => [
                    'label' => 'Ruangan / Meja',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/mtable-category/init'],
                ],
            ]
        ],
        'stockManagement' => [
            'label' => 'Manajemen Stok',
            'iconClass' => 'fa fa-cubes',
            'navigation' => [
                'itemCategory' => [
                    'label' => 'Kategori Item',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/item-category/index'],
                ],
                'item' => [
                    'label' => 'Item',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/item/index'],
                ],
            ]
        ],
        'purchase' => [
            'label' => 'Pembelian',
            'iconClass' => 'fa fa-truck',
            'navigation' => [                
                'directPurchase' => [
                    'label' => 'Pembelian Langsung',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/direct-purchase/index'],
                ],
            ]
        ],
        'sale' => [
            'label' => 'Penjualan',
            'iconClass' => 'fa fa-shopping-cart',
            'navigation' => [
                'startDay' => [
                    'label' => 'Start Day',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/transaction-day/start-day'],
                ],
                'endDay' => [
                    'label' => 'End Day',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/transaction-day/end-day'],
                ],
                'pos' => [
                    'label' => 'Point Of Sale',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => '..',
                ],
                'ar' => [
                    'label' => 'Piutang',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice-payment/ar'],
                ],
            ]
        ],
        'report' => [
            'label' => 'Laporan',
            'iconClass' => 'fa fa-file-pdf-o',
            'navigation' => [
                'penjualan' => [
                    'label' => 'Penjualan',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice/report-penjualan'],
                ],
                'penjualanHpp' => [
                    'label' => 'Penjualan & HPP',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice/report-penjualan-hpp'],
                ],
                'kasKasir' => [
                    'label' => 'Kas Kasir',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice/report-penjualan-hpp'],
                ],
                'rekapPenjualan' => [
                    'label' => 'Rekap Penjualan',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice/report-rekap-penjualan'],
                ],
                'piutang' => [
                    'label' => 'Piutang',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice-payment/report-piutang'],
                ],
                'pembayaranPiutang' => [
                    'label' => 'Pembayaran Piutang',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/sale-invoice-ar-payment/report-pembayaran-piutang'],
                ],
            ]
        ],
        'userManagement' => [
            'label' => 'Manajemen User',
            'iconClass' => 'fa fa-users',
            'navigation' => [
                'user' => [
                    'label' => 'Data User',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/user/index'],
                ],
                'userLevel' => [
                    'label' => 'Data User Level',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/user-level/index'],
                ],
                'userAppModule' => [
                    'label' => 'Modul Aplikasi',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/user-app-module/index'],
                ],
            ]
        ],
        'setting' => [
            'label' => 'Setting',
            'iconClass' => 'fa fa-wrench',
            'navigation' => [
                'company' => [
                    'label' => 'Profile Perusahaan',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting', 'id' => 'company'],
                ],
                'taxService' => [
                    'label' => 'Nilai Pajak & Service Charge',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting', 'id' => 'tax-sc'],
                ],
                'includeTaxService' => [
                    'label' => 'Pajak Include Service Charge',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting', 'id' => 'include-tax-sc'],
                ],
                'transactionDay' => [
                    'label' => 'Transaction Day',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting' , 'id' => 'transaction-day'],
                ],
                'printer' => [
                    'label' => 'Printer',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/printer/index'],
                ],
                'printServer' => [
                    'label' => 'Print Server',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting', 'id' => 'printserver'],
                ],
                'struk' => [
                    'label' => 'Setting Struk',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/update-setting', 'id' => 'struk'],
                ],
                'virtualKeyboard' => [
                    'label' => 'Virtual Keyboard',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/show-virtual-keyboard'],
                ],
                'license' => [
                    'label' => 'Lisensi',
                    'iconClass' => 'fa fa-angle-double-right',
                    'url' => ['standard/settings/license'],
                ],
            ]
        ],
    ]
];