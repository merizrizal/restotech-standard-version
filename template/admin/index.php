<?php
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');
	
ini_set('max_execution_time', 0);
ini_set('memory_limit', '1000M');

require(dirname(dirname(dirname(__DIR__)))  . '/vendor/autoload.php');
require(dirname(dirname(dirname(__DIR__))) . '/vendor/yiisoft/yii2/Yii.php');
require(__DIR__ . '/../engine/common/config/bootstrap.php');

$config = yii\helpers\ArrayHelper::merge(    
    require(__DIR__ . '/../engine/common/config/main-local.php'),
    require(__DIR__ . '/../engine/backend/config/main.php'),
    require(__DIR__ . '/../engine/backend/config/main-local.php')
);

$application = new yii\web\Application($config);
$application->run();
