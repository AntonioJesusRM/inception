FROM	debian:buster

RUN	apt-get update && apt-get install -y \
	curl \
	php7.3 \
	php7.3-mysql \
	php7.3-curl \
	php7.3-gd \
	php7.3-mbstring \
	php7.3-xml \
	php7.3-fpm && \
	rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

# Port
EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]