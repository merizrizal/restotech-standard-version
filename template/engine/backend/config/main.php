<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params-local.php')
);

$basePath =  dirname(__DIR__);
$webroot = dirname(dirname(dirname(dirname($basePath))));

$config = [
    'basePath' => $basePath,
    'runtimePath' => $basePath . '/runtime',
    'controllerNamespace' => 'backend\controllers',
    'modules' => [
        'standard' => [
            'class' => 'restotech\standard\backend\BackendModule',
        ],
    ],
    'components' => [
        
    ],
    'params' => $params,
];

$configReplace = [
    /*
    'defaultRoute' => 'standard/site/default',
    'components' => [
        'user' => [
            'loginUrl' => new \yii\helpers\ReplaceArrayValue(['site/login']),
        ],
        'errorHandler' => [
            'errorAction' => 'standard/site/error',
        ],
    ],
     * 
     */
];

$mainModule = 'standard';

return yii\helpers\ArrayHelper::merge(        
        $config,
        require($webroot . '/vendor/synctech/restotech-standard/backend/config/main.php'),
        $configReplace
);
