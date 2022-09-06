FROM thecodingmachine/php:8.1-v4-apache

ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_DOCUMENT_ROOT=/app/public \
    APACHE_PORT=8080 \
    APACHE_SSL_PORT=8443

RUN sudo sed -i 's/80/\${APACHE_PORT}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/443/\${APACHE_SSL_PORT}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/80/\${APACHE_PORT}/g' /etc/apache2/sites-available/000-default.conf && \
    sudo sed -i 's/443/\${APACHE_SSL_PORT}/g' /etc/apache2/sites-available/default-ssl.conf