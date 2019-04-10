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
    'controllerNamespace' => 'api\controllers',
    'modules' => [
        'standard' => [
            'class' => 'restotech\standard\api\ApiModule',
        ],
    ],
    'components' => [

    ],
    'params' => $params,
];

$configReplace = [
    /*
    'defaultRoute' => 'standard/home/index',
    'components' => [
        'user' => [
            'loginUrl' => new \yii\helpers\ReplaceArrayValue(['standard/site/login']),
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
        require($webroot . '/vendor/synctech/restotech-standard/api/config/main.php'),
        $configReplace
);
