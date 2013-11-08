#!/bin/bash

#requres virtualhost.sh and dnsmasq. 
#edit MYPASS with the mysql username you would like to use and MYPASS with mysql password. Probably not root. 
MYUSER=drupaluser
MYPASS=drupaluser
MYHOST=localhost

HOST=$2
DATABASE=${HOST/./_}
create() {
	#first lets create a virtual host 
	virtualhost.sh $HOST 

	#now lets install a drupal site at this addresss 
	cd ~/Sites/$HOST/
	rm -Rf *  #really don't like this here. Has to be a better way.

	#create database 
	echo "MYSQL Password"
	mysql -u $MYUSER -p -e "CREATE DATABASE $DATABASE"

	#clone a recent 7.x Drupal site
	git clone --branch 7.x http://git.drupal.org/project/drupal.git .

	#do a site install
	drush site-install --db-url=mysql://$MYUSER:$MYPASS@$MYHOST/$DATABASE 
}

delete() {
	#delete virtualhost this will also give you the option to delete the root folder.
	virtualhost.sh --delete $HOST 
	#echo $HOST
	#now we need to delete that pesky database
	echo "MYSQL Password"
	mysql -u $MYUSER -p -e "DROP DATABASE $DATABASE"
	
	}
	
#There might be a better way to do this but this will have your first argument call the function desired. 
$1
