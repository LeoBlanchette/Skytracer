#!/usr/bin/env bash

echo Setting up NGINX Site...

ONION=$(../Bin/./gethostname )

echo $ONION

sudo cp -f configfiles/django.conf /etc/nginx/conf.d/

sudo sed -i 's|{ONIONSITE}|'"${ONION}"'|g' /etc/nginx/conf.d/django.conf
sudo sed -i 's|# server_names_hash_bucket_size 64|'"server_names_hash_bucket_size 512"'|g' /etc/nginx/nginx.conf

sudo service nginx restart
