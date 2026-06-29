#!/bin/sh
set -eu

apt update
apt upgrade -y
apt install -y sudo

export DEBIAN_FRONTEND=noninteractive

apt install -y tzdata

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt install -y apache2 php8.3 php8.3-bz2 php8.3-cli php8.3-curl php8.3-fpm php8.3-gd php8.3-intl php8.3-mbstring \
    php8.3-mysql php8.3-xml php8.3-zip libapache2-mod-php8.3 git unzip curl

cp /root/initial-config/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /root/initial-config/99-config_overrides.ini /etc/php/8.3/apache2/conf.d/99-config_overrides.ini

a2enmod rewrite
a2enmod php8.3

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

composer --version