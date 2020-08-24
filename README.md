<img src="restotech-logo.png">

<p><b><h1>Software sistem manajemen restoran dan POS</h1></b></p>

<p>Created using <a href="https://www.yiiframework.com/">Yii2 Framework</a></p>
<p>Using <a href="https://mariadb.org/">MariaDB as Database</a></p>

--------------------------------------------------------

Run composer update first

Create file `generate/backend/config/params-local.php`, then add this
```php
<?php
return [
    'database' => [
        'user' => 'this-is-username-of-your-database',
        'password' => 'this-is-password-of-your-database'
    ]
];
```

Create file `template/engine/common/config/bootstrap-local.php`, and add this
```php
<?php
Yii::setAlias('@rootUrl', '/this-is-your-root-url/restotech-standard-version/app/<generatedId>');
```

Connect to address `http://your-site/generate/backend/web` for generating new restaurant`

username: T001
password: 123456
