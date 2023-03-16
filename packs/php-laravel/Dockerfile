FROM thecodingmachine/php:8.1-v4-apache

ENV PORT=8080 \
    PORT_SSL=8443 \
    APACHE_DOCUMENT_ROOT=/app/public

RUN sudo sed -i 's/80/\${PORT}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/443/\${PORT_SSL}/g' /etc/apache2/ports.conf && \
    sudo sed -i 's/80/\${PORT}/g' /etc/apache2/sites-available/000-default.conf && \
    sudo sed -i 's/443/\${PORT_SSL}/g' /etc/apache2/sites-available/default-ssl.conf