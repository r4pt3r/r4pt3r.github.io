---
layout: post
title: "Installing Magento 2"
description: "Documentation of installing Magento 2 framework"
date: 2019-02-14
tags: magento-2, web-framework, e-commerce, web-devolpment
comments: true
---

This blog guides you on installing Magento 2

### What is Magento ?
Magento is a web framework for e-commerce website. Magento have two versions which are Magento 1 and Magento 2. Magento 2 is having more good features.

### System requirements

* Apache 2.2 or 2.4
* Nginx 1.x
* MySQL 5.6, 5.7
* PHP 7.1.3+, 7.2.x

### Follow with the commands
Update all the packages

 ```bash
 sudo apt-get update
 ```

 Install PHP MySQl and all other extensions

```bash
sudo apt-get install apache2 php libapache2-mod-php mysql-server php-mysql php-dom php-simplexml php-curl php-intl php-xsl php-mbstring php-zip php-xml composer
```

```bash
sudo apt-get install php7.0-gd
```

```bash
sudo apt-get install php7.0-mcrypt
```

```bash
sudo a2enmod rewrite
```
Go inside Apache2 config files and search for Indexes, then change AllowOverride from 'none' to 'all'

```bash
sudo vim /etc/apache2/apache2.conf
```

Then restart Apache

```bash
systemctl restart apache2.service
```

Go inside the /var/www/html clone the Magento 2 files

```bash
sudo git clone https://github.com/magento/magento2.git
```
```bash
cd magento2
```
```bash
composer install
```
Change permissions

```bash
sudo chown -R www-data:www-data .
```
Now the Magento 2 is installed. Now you can check your localhost and configure Magento 2. You have to make a database for Magento 2. Intsalling instructions will guides you further. 