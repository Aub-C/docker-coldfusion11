#!/bin/sh
#
cd $HOME
if [ ! -f "ImageMagick.tar.gz" ]
then
    wget -O ImageMagick.tar.gz http://www.imagemagick.org/download/binaries/ImageMagick-x86_64-apple-darwin14.3.0.tar.gz
fi

tar xvzf ImageMagick.tar.gz

mv ImageMagick-* ImageMagick

export MAGICK_HOME="$HOME/ImageMagick"

export PATH="$MAGICK_HOME/bin:$PATH"

export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/
