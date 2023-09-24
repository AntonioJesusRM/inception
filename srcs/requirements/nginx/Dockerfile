FROM	debian:buster

# Install nginx and openssl
RUN		apt-get update && \
		apt-get install -y nginx openssl &&\
		rm -rf /var/lib/apt/lists/*

# SSL CERTIFICATE
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/aruiz-mo.crt \
       -keyout /etc/nginx/ssl/aruiz-mo.key \
       -subj "/C=ES/ST=Andalucia/L=Malaga/O=42 School/OU=aruiz-mo/CN=aruiz-mo/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# Port
EXPOSE	443

# Start nginx when exec container
CMD ["nginx", "-g", "daemon off;"]