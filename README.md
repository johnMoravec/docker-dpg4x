# docker-dpg4x
A Docker installation of DPG4X, allows you to have the specific version of Python that it plays nice with, and access the UI through VNC.

DPG4X can be found here: https://sourceforge.net/projects/dpg4x/

# Environment file
The docker-compose used here expects an .env file with values for:

PUID - default user id

PGID - same but for groups

TZ - timezone

ROOT - root directory to work from

# logging in
You can login to the vnc server with a web browser on 5800, or with a vnc client on 5900.
