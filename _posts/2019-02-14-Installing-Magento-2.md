---
layout: post
title: "Installing Magento 2"
description: "Documentation of installing Magento 2 framework"
date: 2019-02-14
tags: magento-2, web-framework, e-commerce, web-devolpment
keywords: magento 2, deploy, install
comments: true
---

How to install Magento 2 on Ubuntu 

### What is Magento ?
Magento is a web framework for e-commerce websites. Magento have two versions which are Magento 1.x and Magento 2.x. Magento 2.x is having more cool features.

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
sudo apt-get install php7.2-gd
```

```bash
sudo apt-get install php7.2-mcrypt
```
```bash
sudo apt-get install php-soap
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
If composer install shows any errors it maybe missing of any php extensions, then just try once more after installing those php extensions.

Change permissions

```bash
sudo chown -R www-data:www-data .
```
Now the Magento 2 is installed. Now you can check your localhost and configure Magento 2. You have to make a database for Magento 2. Intsalling instructions will guides you further. 
