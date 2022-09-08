FROM thecodingmachine/php:8.1-v4-apache

ENV APACHE_PORT=8080 \
    APACHE_SSL_PORT=8443
    #KUBERO_DOCUMENT_ROOT=/app/public \

RUN sudo sed -i 's/80/\${APACHE_PORT}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/443/\${APACHE_SSL_PORT}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/80/\${APACHE_PORT}/g' /etc/apache2/sites-available/000-default.conf && \
    sudo sed -i 's/443/\${APACHE_SSL_PORT}/g' /etc/apache2/sites-available/default-ssl.conf
    #sudo sed -i 's/\${ABSOLUTE_APACHE_DOCUMENT_ROOT}/\${KUBERO_DOCUMENT_ROOT}/g' /etc/apache2/sites-available/000-default.conf && \
    #sudo sed -i 's/\${ABSOLUTE_APACHE_DOCUMENT_ROOT}/\${KUBERO_DOCUMENT_ROOT}/g' /etc/apache2/apache2.conf && \
    #sudo sed -i 's/\${ABSOLUTE_APACHE_DOCUMENT_ROOT}/\${KUBERO_DOCUMENT_ROOT}/g' /etc/apache2/conf-available/docker-php.conf && \