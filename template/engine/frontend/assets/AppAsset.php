<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
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
        'restotech\standard\frontend\assets\AppAsset',
    ];
}
