<?php

$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'sXfVL07CFRSYNCTECHIDmipfSbqnpwNE',
        ],
    ],
];

if (!YII_ENV_TEST) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = 'yii\debug\Module';

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'allowedIPs' => ['127.0.0.1', '::1'],
        'generators' => [
            'model' => [
                'class' => 'yii\gii\generators\model\Generator',
                'templates' =>  ['synctech' => '@restotech/standard/backend/generator/model/sygen']
            ],
            'crud' => [
                'class' => 'yii\gii\generators\crud\Generator',
                'templates' =>  ['synctech' => '@restotech/standard/backend/generator/crud/sygen']
            ],            
        ]
    ];
}

return $config;