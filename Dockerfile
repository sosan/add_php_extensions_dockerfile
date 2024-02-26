FROM php:8.3-apache
RUN \
    PHP_EXTENSION_INSTALLER_VERSION=$(curl -s https://api.github.com/repos/mlocati/docker-php-extension-installer/releases/latest | grep 'tag_name' | cut -d '"' -f4) ; \
    echo "install-php-extensions Version: ${PHP_EXTENSION_INSTALLER_VERSION}" ; \
    curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${PHP_EXTENSION_INSTALLER_VERSION}/install-php-extensions -o /usr/local/bin/install-php-extensions ; \
    chmod +x /usr/local/bin/install-php-extensions ; \
    /usr/local/bin/install-php-extensions imagick
# You should add "extension=imagick.so" to php.ini
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
EXPOSE 80 443
CMD ["php", "-m"]
# [PHP Modules]
# Core
# ctype
# curl
# date
# dom
# fileinfo
# filter
# hash
# iconv
# imagick --------->
# json
# libxml
# mbstring
# mysqlnd
# openssl
# pcre
# PDO
# pdo_sqlite
# Phar
# posix
# random
# readline
# Reflection
# session
# SimpleXML
# sodium
# SPL
# sqlite3
# standard
# tokenizer
# xml
# xmlreader
# xmlwriter
# zlib
# [Zend Modules]
