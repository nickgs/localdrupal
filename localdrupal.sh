#!/bin/bash

#requres virtualhost.sh and dnsmasq. 

HOST=$1
DATABASE=${HOST/./_}

#first lets create a virtual host 
virtualhost.sh $HOST 

#now lets install a drupal site at this addresss 
cd ~/Sites/$HOST/
rm -Rf *  #really don't like this here. Has to be a better way.

#create database 
mysql -u drupaluser -pdrupaluser -e "CREATE DATABASE $DATABASE"

#clone a recent 7.x Drupal site
git clone --branch 7.x http://git.drupal.org/project/drupal.git .

#do a site install
drush site-install --db-url=mysql://drupaluser:drupaluser@localhost/$DATABASE 
