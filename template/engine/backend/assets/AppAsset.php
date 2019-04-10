<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot/media';
    public $baseUrl = '@web/media';
    
    public $css = [

    ];
    public $js = [
        
    ];
    public $depends = [
        'restotech\standard\backend\assets\AppAsset',
    ];
}
