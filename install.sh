#!/usr/bin/env bash
echo Installing Skytracer...
sudo apt update
sudo apt upgrade

installers/./install_main_dependencies.sh
installers/./install_tor.sh
installers/./install_python_modules.sh
