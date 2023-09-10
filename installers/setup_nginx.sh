#!/usr/bin/env bash

echo Setting up NGINX Site...

REPLACEHOME=$SKYTRACER_HOME
REPLACEONIONSITE=$($SKYTRACER_HOME/bin/./gethostname )

echo $REPLACEONIONSITE

sudo sed -i 's|# server_names_hash_bucket_size 64|'"server_names_hash_bucket_size 512"'|g' /etc/nginx/nginx.conf

sudo cp -f $SKYTRACER_HOME/installers/configfiles/nginx-default /etc/nginx/sites-available/onionsite

sudo sed -i 's|{REPLACEONIONSITE}|'"${REPLACEONIONSITE}"'|g' /etc/nginx/sites-available/onionsite

sudo sed -i 's|{REPLACEHOME}|'"${REPLACEHOME}"'|g' /etc/nginx/sites-available/onionsite

sudo ln -s -f /etc/nginx/sites-available/onionsite /etc/nginx/sites-enabled/onionsite

#create directory for web files...

mkdir -p $SKYTRACER_HOME/.skytracer_web 

mkdir -p $SKYTRACER_HOME/.skytracer_web/static 

mkdir -p $SKYTRACER_HOME/.skytracer_web/media 


sudo sed -i 's|{SKYTRACER_HOME}|'"${SKYTRACER_HOME}"'|g' /etc/nginx/sites-available/onionsite


sudo service nginx restart
