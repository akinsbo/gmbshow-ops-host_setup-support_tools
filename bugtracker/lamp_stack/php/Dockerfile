FROM php:7.2-apache

RUN a2enmod rewrite

# Install PHP extensions
RUN set -xe \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y libpng-dev --no-install-recommends apt-utils \
    libjpeg-dev libpq-dev libxml2-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring mysqli pgsql soap \
    && rm -rf /var/lib/apt/lists/*


# Set Mantisbt env variables 
# Todo: get the correct md5 for ver 2.14.0
ENV MANTIS_VER 2.14.0
ENV MANTIS_MD5 1ff28aca7944b2bc44c996933e2cd0e9
ENV MANTIS_URL https://sourceforge.net/projects/mantisbt/files/mantis-stable/${MANTIS_VER}/mantisbt-${MANTIS_VER}.tar.gz/download
ENV MANTIS_FILE mantisbt.tar.gz
#  Set timezone for php.ini
ENV TIMEZONE Africa/Lagos

# Download, extract and set default <apache-user>:<apache-group>(www-data:www-data) to own Mantisbt and content
RUN set -xe \
    && curl -fSL ${MANTIS_URL} -o ${MANTIS_FILE} \
    # && echo "${MANTIS_MD5}  ${MANTIS_FILE}" | md5sum -c \
    && tar -xz --strip-components=1 -f ${MANTIS_FILE} \
    && rm ${MANTIS_FILE} \
    && chown -R www-data:www-data .

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf

# To solve the ServerName localhost problem
RUN echo "ServerName localhost" >> /etc/apache2/http.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY php.ini /usr/local/etc/php/php.ini

# To solve /usr/share/zoneinfo/ timezone  not set warning
RUN set -xe \
    && ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo 'date.timezone = "${TIMEZONE}"' > /usr/local/etc/php/php.ini