#!/usr/bin/env bash

echo Setting up camera controller...

source $SKYTRACER_HOME/bin/./activate

REPLACEPYTHON=$(which python)

REPLACESCRIPT=$SKYTRACER_HOME/skytracer/camera/capture.py

REPLACEUSER=$(whoami)

sudo cp -f $SKYTRACER_HOME/installers/configfiles/skytracer_cron /etc/cron.d/skytracer_capture

sudo sed -i 's|{REPLACEPYTHON}|'"${REPLACEPYTHON}"'|g' /etc/cron.d/skytracer_capture

sudo sed -i 's|{REPLACESCRIPT}|'"${REPLACESCRIPT}"'|g' /etc/cron.d/skytracer_capture

sudo sed -i 's|{REPLACEUSER}|'"${REPLACEUSER}"'|g' /etc/cron.d/skytracer_capture

