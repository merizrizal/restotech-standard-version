<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Generate POS';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Silakan isi form dibawah</p>

    <div class="row">
        <div class="col-lg-5">
            <?= Html::beginForm(['site/generate-pos']) ?>

                <div class="form-group">
                    <?= Html::label('Restaurant ID', null, ['class' => 'control-label']) ?>
                    <?= Html::textInput('restaurant_id', null, ['class' => 'form-control']) ?>
                </div>
            
                <div class="form-group">
                    <?= Html::label('Nama Restaurant', null, ['class' => 'control-label']) ?>
                    <?= Html::textInput('restaurant_name', null, ['class' => 'form-control']) ?>
                </div>
            
                <div class="form-group">
                    <?= Html::label('Alamat', null, ['class' => 'control-label']) ?>
                    <?= Html::textInput('alamat', null, ['class' => 'form-control']) ?>
                </div>
            
                <div class="form-group">
                    <?= Html::label('Telepon', null, ['class' => 'control-label']) ?>
                    <?= Html::textInput('phone', null, ['class' => 'form-control']) ?>
                </div>
            
                <div class="form-group">
                    <?= Html::submitButton('Generate', ['class' => 'btn btn-primary', 'name' => 'generate-button']) ?>
                </div>

            <?= Html::endForm() ?>
        </div>
    </div>
</div>
