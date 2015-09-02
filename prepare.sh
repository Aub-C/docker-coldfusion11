#!/bin/sh

cd $(dirname "$0")
cd build/install

if [ ! -f "ColdFusion_11_WWEJ_linux64.bin" ]
then
	wget http://idguk.misc-files.s3.amazonaws.com/ColdFusion_11_WWEJ_linux64.bin
	chmod 755 ColdFusion_11_WWEJ_linux64.bin
fi
