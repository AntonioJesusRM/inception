#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	rm -rf latest.tar.gz

	mv wordpress/* /var/www/html/
	rm -rf wordpress
	cd /var/www/html/

	#Inport env variables in the config file
	cp wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/" wp-config.php
	sed -i "s/username_here/$MYSQL_USER/" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/" wp-config.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/" wp-config.php
	curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> wp-config.php

	cd ~
fi

exec "$@"