#!/usr/bin/env bash

echo Setting up Django...

$SKYTRACER_HOME/skytracer/./manage.py collectstatic --noinput

