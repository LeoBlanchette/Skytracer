#!/usr/bin/env bash

echo Setting up NGINX Site...

REPLACEHOME=$SKYTRACER_HOME
REPLACEONIONSITE=$($SKYTRACER_HOME/bin/./gethostname )

echo $REPLACEONIONSITE

sudo sed -i 's|# server_names_hash_bucket_size 64|'"server_names_hash_bucket_size 512"'|g' /etc/nginx/nginx.conf

sudo cp -f $SKYTRACER_HOME/installers/configfiles/nginx-default /etc/nginx/sites-available/onionsite

sudo sed -i 's|{REPLACEONIONSITE}|'"${REPLACEONIONSITE}"'|g' /etc/nginx/sites-available/onionsite

sudo ln -s -f /etc/nginx/sites-available/onionsite /etc/nginx/sites-enabled/onionsite

sudo chown $USER:www-data -R /var/www


sudo service nginx restart
