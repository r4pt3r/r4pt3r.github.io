---
layout: post
title: "How to install InvoiceNinja"
description: "Documentation of installing InvoiceNinja in LAMP"
date: 2019-08-19
tags: invoiceNinja, invoice-generator, webapp, billing-software
keywords: how to install invoiceninja, invoiceninja, lamp
comments: true
---

### What is InvoiceNinja ?
InvoiceNinja is a opensource billing web-application which can generate invoices. It have many options like manage inventory, pycharts, sales of a day etc. InvoiceNinja have it's own paid version also. In the opensource version it will have a watermark of InvoiceNinja for generating invoices.

### System requirements

* LAMP

### Follow the commands
Make the following changes on the php config files which is php.

```
sudo vim /etc/php/7.2/apache2/php.ini
```

```
file_uploads = On
allow_url_fopen = On
short_open_tag = On
memory_limit = 256M
upload_max_filesize = 100M
max_execution_time = 360
date.timezone = Asia/Kolkata
```

Restart apache server
```
sudo service apache2 restart
```

Create a database for InvoiceNinja
```
mysql -u root -p
```
```
create database invoiceninja;
```

Install curl and git if you don't have

```
sudo apt install curl git
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```

Go to the localhost directory
```
cd /var/www/html
sudo git clone https://github.com/invoiceninja/invoiceninja.git
cd /var/www/html/invoiceninja
sudo composer install
```
If you don't have composer just install it

Run these permissions in the folder where your InvoiceNinja is placed
```
sudo chown -R www-data:www-data /var/www/html/invoiceninja/
sudo chmod -R 755 /var/www/html/invoiceninja/
```

Create new apache conf file
```
sudo vim /etc/apache2/sites-available/invoiceninja.conf
```

Paste this in the conf file
```
<VirtualHost *:80>
     ServerAdmin admin@example.com
     DocumentRoot /var/www/html/invoiceninja/public
     ServerName example.com
     ServerAlias www.example.com

     <Directory /var/www/html/invoiceninja/public>
        Options +FollowSymlinks
        AllowOverride All
        Require all granted
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Check the document root given as correct with your respective
Server name the domain name like thing we added for our localhost, So we can access the installation of InvoiceNinja there

So we have to add rule that example.com to our localhost

```
127.0.0.1	localhost
127.0.1.1	X510UNR
<your ip>	example.com

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

Add your ip there, Your ip can be found by the command 'ifconfig'. In ifconfig In 'wlp2s0' section there will be 'inet addr' after that will be your ip.

Enable the InvoiceNinja Conf File and Rewrite Module

```
sudo a2ensite invoiceninja.conf
sudo a2enmod rewrite
```

Restart apache
```
sudo service apache2 restart
```

Now the installation is finished. Open the browser and go to example.com you can find the setup page of InvoiceNinja. Give the respective details and start installation. It will take some time to complete the installation.
