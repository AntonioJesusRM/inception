#!/bin/sh
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	rm -rf latest.tar.gz

	mv wordpress/* .
	mv rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"