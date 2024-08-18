#!/bin/bash
sudo systemctl start mariadb.service
sudo systemctl start apache2.service
sudo systemctl start php8.3-fpm.service
