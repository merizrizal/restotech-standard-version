composer update

cp /root/initial-config/params-local.php /var/www/html/generate/backend/config/params-local.php
cp /root/initial-config/bootstrap-local.php /var/www/html/template/engine/common/config/bootstrap-local.php
chown -R www-data:www-data /var/www/html