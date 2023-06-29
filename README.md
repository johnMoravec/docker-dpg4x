# docker-dpg4x
A Docker installation of DPG4X, allows you to have the specific version of Python that it plays nice with, and access the UI through VNC.

DPG4X can be found here: https://github.com/lifehackerhansol/dpg4x

Docker GUI image based from: https://github.com/jlesage/docker-baseimage-gui

# Docker command
The container can be started with the following command:

'''
docker run --rm -p 5800:5800 -p 5900:5900 -v ${ROOT}/TV:/media/TV -v ${ROOT}/output/:/media/output johnmoravec/docker-dpg4x
'''

Where ROOT is the directory you'd like mapped to the container

# Docker-Compose
You can use the included docker-compose file with the following .env setup.

# Environment file
The docker-compose used here expects an .env file with values for:

PUID - default user id

PGID - same but for groups

TZ - timezone

ROOT - root directory to work from

# logging in
You can login to the vnc server with a web browser on 5800, or with a vnc client on 5900.
