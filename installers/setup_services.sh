#!/usr/bin/env bash

echo Setting up services to run on boot...

sudo systemctl daemon-reload

sudo systemctl enable nginx
sudo systemctl enable tor
sudo systemctl enable skytracer
sudo systemctl enable skytracercam
