<?php
return [
    'checkbox-radio-script' => function() {        
        $jscript = '$(\'input[type="radio"], input[type="checkbox"]\').iCheck({
                    checkboxClass: "icheckbox_minimal-red",
                    radioClass: "iradio_minimal-red"
                });';
        
        return $jscript;
    },
    'subprogramLocal' => 'pos',
            
    'navigation' => [
        'transaction' => [
            'label' => 'Open Transaksi',
            'iconClass' => 'fa fa-check fa-5x',
            'url' => ['standard/home/transaction'],
        ],
        'reprintInvoice' => [
            'label' => 'Reprint Faktur',
            'iconClass' => 'fa fa-print fa-5x',
            'url' => ['standard/home/reprint-invoice'],
        ],
    ],
];