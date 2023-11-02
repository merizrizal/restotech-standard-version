<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Available Restaurant';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-lg-5">
            <div class="form-group">
                <?php
                foreach ($directories as $directory) {
                    echo Html::a("<h3>$directory</h3>", "app/$directory", ['class' => 'control-label']); 
                } ?>
            </div>
        </div>
    </div>
</div>
