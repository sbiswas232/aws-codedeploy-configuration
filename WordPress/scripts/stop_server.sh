#!/bin/bash
isExistApp=pgrep httpd
if [[ -n $isExistApp ]]; then
		sudo systemctl stop apache2.service
fi
isExistApp=pgrep mysqld
if [[ -n $isExistApp ]]; then
		sudo systemctl stop mariadb.service
fi
isExistApp=pgrep php-fpm
if [[ -n $isExistApp ]]; then
		sudo systemctl stop php8.3-fpm.service
fi
