#!/bin/bash

DEPENDS=" \
	jpeg flac libvorbis theora pango cairo aalib libcaca gdk-pixbuf libvpx wavpack \
	faad2 faac x265 gtk+3 libxml lame x264 mad \
"
VERSION="1.8.1"

function main()
{
		init_env
		install_deps
		do_install gstreamer ${VERSION}
		do_install orc 0.4.25
		do_install gst-plugins-base ${VERSION}
		do_install gst-plugins-good ${VERSION}
		do_install gst-plugins-bad ${VERSION}
		do_install gst-plugins-ugly ${VERSION}
		do_install gst-libav ${VERSION}
}

function init_env()
{
		export CFLAGS="-L/usr/local/lib"
		export CXXFLAGS=${CFLAGS}
}

function install_deps()
{
		brew install ${DEPENDS}
}

function do_install()
{
		TARGET=${1}
		VER=${2}
		wget https://gstreamer.freedesktop.org/src/gstreamer/${TARGET}-${VER}.tar.xz
		tar xf ${TARGET}-${VER}.tar.xz
		cd ${TARGET}-${VER}
		./configure
		make -j4
		make install -j4
}
