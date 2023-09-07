#!/usr/bin/env bash

echo Setting up NGINX Site...

REPLACEHOME=~
REPLACEONIONSITE=$($HOME/Skytracer/Bin/./gethostname )

echo $REPLACEONIONSITE

sudo cp -f $HOME/Skytracer/installers/configfiles/django.conf /etc/nginx/conf.d/

sudo sed -i 's|{REPLACEONIONSITE}|'"${REPLACEONIONSITE}"'|g' /etc/nginx/conf.d/django.conf
sudo sed -i 's|# server_names_hash_bucket_size 64|'"server_names_hash_bucket_size 512"'|g' /etc/nginx/nginx.conf

sudo cp -f $HOME/Skytracer/installers/configfiles/nginx-default /etc/nginx/sites-available/onionsite

sudo sed -i 's|{REPLACEONIONSITE}|'"${REPLACEONIONSITE}"'|g' /etc/nginx/sites-available/onionsite

sudo sed -i 's|{REPLACEHOME}|'"${REPLACEHOME}"'|g' /etc/nginx/sites-available/onionsite

sudo ln -s -f /etc/nginx/sites-available/onionsite /etc/nginx/sites-enabled/onionsite

sudo service nginx restart
