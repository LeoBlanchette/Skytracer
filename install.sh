#!/usr/bin/env bash
echo Installing Skytracer...
#Updates and upgrades...
sudo apt update
sudo apt upgrade

#Set up global variables
SCRIPT=$(readlink -f "$0")
export SKYTRACER_HOME=$(dirname "$SCRIPT")

#Main installations...
installers/./install_main_dependencies.sh
installers/./install_tor.sh
installers/./install_python_modules.sh

#General setup...
installers/./setup_gunicorn.sh
installers/./setup_nginx.sh
installers/./setup_services.sh

#Post notes...
installers/./postnotes.sh

