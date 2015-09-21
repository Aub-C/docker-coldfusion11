FROM phusion/baseimage:0.9.17
MAINTAINER pressrelations
EXPOSE 80 8500
VOLUME ["/var/www", "/tmp/config"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget unzip xsltproc apache2 php5 libapache2-mod-php5 php5-mcrypt php5-gd pngcrush gifsicle
#apache rewrite
RUN php5enmod mcrypt
RUN a2enmod rewrite
ADD ./build/install/ /tmp/
ADD ./build/service/ /etc/service/
ADD ./build/my_init.d/ /etc/my_init.d/
RUN /tmp/install-cf11.sh
ADD ./build/apache2/sites-enabled/ /etc/apache2/sites-enabled-cms/
RUN cp /etc/apache2/sites-enabled-cms/*.conf /etc/apache2/sites-enabled/

#image magick
WORKDIR /opt
RUN wget -O ImageMagick.tar.gz http://www.imagemagick.org/download/binaries/ImageMagick-x86_64-apple-darwin14.3.0.tar.gz
RUN tar xvzf ImageMagick.tar.gz; mv ImageMagick-* ImageMagick
ENV MAGICK_HOME="/opt/ImageMagick" DYLD_LIBRARY_PATH="/opt/ImageMagick/lib/"
RUN export PATH=/opt/ImageMagick/bin:$PATH
#end image magick
