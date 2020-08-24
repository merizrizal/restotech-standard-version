<?php
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@backend', dirname(dirname(__DIR__)) . '/backend');
Yii::setAlias('@frontend', dirname(dirname(__DIR__)) . '/frontend');
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');

Yii::setAlias('@root', dirname(dirname(dirname(__DIR__))));
Yii::setAlias('@uploads', Yii::getAlias('@root') . '/uploads');

Yii::setAlias('@rootUrl', '/synctech/restotech-standard-version/app/<generatedId>');
Yii::setAlias('@uploadsUrl', Yii::getAlias('@rootUrl') . '/uploads');
