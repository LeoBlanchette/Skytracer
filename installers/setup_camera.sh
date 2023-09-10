#!/usr/bin/env bash

echo Setting up camera controller...

#Ensure we are in the virtual env before doing this setup

source $SKYTRACER_HOME/bin/./activate

REPLACEPYTHON=$(which python)

REPLACESCRIPT=$SKYTRACER_HOME/skytracer/camera/skycam.py

REPLACEUSER=$(whoami)

sudo cp -f $SKYTRACER_HOME/installers/configfiles/skytracercam.service /etc/systemd/system/skytracercam.service

sudo sed -i 's|{REPLACEPYTHON}|'"${REPLACEPYTHON}"'|g' /etc/systemd/system/skytracercam.service

sudo sed -i 's|{REPLACESCRIPT}|'"${REPLACESCRIPT}"'|g' /etc/systemd/system/skytracercam.service

sudo sed -i 's|{REPLACEUSER}|'"${REPLACEUSER}"'|g' /etc/systemd/system/skytracercam.service

sudo systemctl start skytracercam.service
