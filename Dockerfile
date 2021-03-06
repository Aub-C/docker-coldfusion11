FROM phusion/baseimage:0.9.17
MAINTAINER pressrelations
EXPOSE 80 8500
VOLUME ["/var/www", "/tmp/config"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget unzip xsltproc apache2 ccze openjdk-7-jdk && apt-get clean
#apache rewrite
RUN a2enmod rewrite
ADD ./build/install/ /tmp/
ADD ./build/service/ /etc/service/
ADD ./build/my_init.d/ /etc/my_init.d/
RUN /tmp/install-cf11.sh
RUN /tmp/install-hotfix.sh
ADD ./build/apache2/sites-enabled/ /etc/apache2/sites-enabled-cms/
RUN cp /etc/apache2/sites-enabled-cms/*.conf /etc/apache2/sites-enabled/
