#!/bin/bash

FONT_D=/usr/local/share/fonts

# Fixedsys 3
wget http://www.fixedsysexcelsior.com/fonts/FSEX300.ttf

if [[ ! -e ${FONT_D} ]]; then
	sudo mkdir ${FONT_D}
fi
sudo mv -vf *.ttf ${FONT_D}
sudo chmod 775 -R ${FONT_D}
sudo fc-cache -fv
