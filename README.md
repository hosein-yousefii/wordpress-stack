# wordpress-stack

[![GitHub license](https://img.shields.io/github/license/hosein-yousefii/docker-ansible)](https://github.com/hosein-yousefii/docker-ansible/blob/master/LICENSE)
![LinkedIn](https://shields.io/badge/style-hoseinyousefii-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/hoseinyousefi)


Several websites run on wordpress platform, and it's a good idea to integrate neccessary services to facilitate working on this area, so I've create a wordpress stack which implement wordpress platform, poste mailserver, filebrowser and phpmyadmin on kubernetes cluster.

## What is wordpress?

WordPress is open source software you can use to create a beautiful website, blog, or app which powers over 43% of the web.

### What is poste?

Full stack mailserver solution with SSL TLS support. POP3s, SMTP(s), IMAPs, RSPAMD, Clamav, Roundcube(HTTPS), SPF, DKIM with simple installation and web administration.

### What is filebrowser?

filebrowser provides a file managing interface within a specified directory and it can be used to upload, delete, preview, rename and edit your files. It allows the creation of multiple users and each user can have its own directory. It can be used as a standalone app or as a middleware.

### What is phpmyadmin?

phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB.

# Get started:

Before deploying wordpress stack, it's better to have a storage class on your cluster to automate private volume claim on kubernetes.

All these services have their own svc, pvc, congifmaps and secret so you just need to replace the neccessary values which face your requirements. Mysql in this stack deploy as a headless service and manage wordpress database (default password for mysql is "qazwsx"). filebrowser manage wordpress files, so you are able to easily upload and download any thing you wish. phpmyadmin responsibility is manage your mysql databases.

It's vital to khnow that there is an Ingress service which route all terrafic to these services based on your URI:

phpmyadmin.hosein.local refer to phpmyadmin

file.hosein.local       refer to filebrowser

mail.hosein.local       refer to poste mailserver

hosein.local            refer to your wordpress site

you should add these subdomain to your dns server with a correct LoadBalancer IP.

## Usage:

You can deploy all these services by executing deploy script:

```bash
./deploy.sh
```
At the end it shows your loadbalancer ip related to kubernetes cluster in order to add to your dns server or hosts file.

# How to contribute:

You are able to add other features related to this stack or expand it, it would be great to implement a master/slave mysql or anything you want.
Copyright 2021 Hosein Yousefi <yousefi.hosein.o@gmail.com>



