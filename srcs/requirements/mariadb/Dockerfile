FROM debian:buster

# Install mariadb

RUN apt-get update && \
	apt-get install -y mariadb-server mariadb-client && \
	rm -rf /var/lib/apt/lists/*

# Port
EXPOSE 3306

# Configure init mysql
COPY conf/mysql.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sql

# Define a main command that will be executed when you start the content
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]