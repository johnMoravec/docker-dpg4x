# dpg4x dockerfile
#

# pull base image
FROM jlesage/baseimage-gui:debian-11-v3

# other build arguments
ENV LANG C.UTF-8
ENV APP_NAME="DPG4X"

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=unknown

# Define software versions
ARG DPG4X_VERSION="3.0"

#define software download URLs
ARG DPG4X_PKGNAME=dpg4x_${DPG4X_VERSION}
ARG DPG4X_TARNAME=${DPG4X_PKGNAME}.tar.gz
ARG DPG4x_SOURCE="https://github.com/lifehackerhansol/dpg4x/archive/refs/tags/${DPG4X_TARNAME}"

# define working directory
WORKDIR /tmp

# dependencies
RUN \
	add-pkg wget curl xterm && \
	apt update && \
	apt install -y python3.9 && \
	apt install -y python3-pip && \
	apt install -y dbus-x11 mencoder mplayer python-wxtools python3-wxgtk4.0 \
		python3-pil libmariadb-dev-compat libmariadb-dev && \
	pip3 install --upgrade pip && \
	pip install mysqlclient

# get dpg4x and dependencies
RUN \
	wget --no-check-certificate ${DPG4x_SOURCE} && ls -lh && \
	tar -xf ${DPG4X_TARNAME} && \
	rm ${DPG4X_TARNAME} && \
	mkdir /dpg4x && \
	mv dpg4x-${DPG4X_PKGNAME}/* /dpg4x/

COPY startapp.sh /startapp.sh

# Adjust the openbox config.
RUN \
    # Maximize only the main/initial window.
    sed-patch 's/<application type="normal">/<application type="normal" title="dpg4x">/' \
        /etc/xdg/openbox/rc.xml && \
    # Make sure the main window is always in the background.
    sed-patch '/<application type="normal" title="dpg4x">/a \    <layer>below</layer>' \
        /etc/xdg/openbox/rc.xml
