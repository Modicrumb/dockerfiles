FROM php:7.2-apache
MAINTAINER "Richard Sacco"
RUN apt-get -y update && apt-get install -y \
  vim \
  git \
  curl \
  wget \
  sendmail-bin \
  sendmail \
  sqlite3 \
  libsqlite3-dev \
  libicu-dev \
  ghostscript \
  imagemagick \
  unzip \
  zlib1g-dev \
  && docker-php-ext-install -j$(nproc) intl pdo_mysql zip
RUN a2enmod rewrite
ADD composer.sh /
RUN chmod +x /composer.sh
RUN /composer.sh
RUN rm /composer.sh
      


