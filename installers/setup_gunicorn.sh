#!/usr/bin/env bash

echo Setting up Gunicorn...

sudo usermod -a -G www-data $USER

REPLACEHOME=$SKYTRACER_HOME

source $SKYTRACER_HOME/bin/./activate
REPLACEGUNICORN=$(which gunicorn)

sudo cp -f $SKYTRACER_HOME/installers/configfiles/skytracer.socket /etc/systemd/system/
sudo cp -f $SKYTRACER_HOME/installers/configfiles/skytracer.service /etc/systemd/system/

sudo sed -i 's|{REPLACEHOME}|'"${REPLACEHOME}"'|g' /etc/systemd/system/skytracer.service
sudo sed -i 's|{REPLACEGUNICORN}|'"${REPLACEGUNICORN}"'|g' /etc/systemd/system/skytracer.service
sudo sed -i 's|{REPLACEUSER}|'"${USER}"'|g' /etc/systemd/system/skytracer.service

sudo systemctl daemon-reload
sudo systemctl start skytracer.socket
sudo systemctl enable skytracer.socket

deactivate


