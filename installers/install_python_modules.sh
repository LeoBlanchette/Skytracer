#!/usr/bin/env bash


#Django https://www.djangoproject.com/
#Gunicorn https://gunicorn.org/
#Open CV https://opencv.org/ https://pypi.org/project/opencv-python/

echo "Creating python3 virtual environment..."

python3 -m venv $SKYTRACER_HOME

echo "Activating virtual environment..."

source $SKYTRACER_HOME/bin/./activate

echo Installing python modules...

pip install \
Django \
gunicorn \
opencv-python \
pyzmq \

cp -f $SKYTRACER_HOME/installers/configfiles/gethostname $SKYTRACER_HOME/bin/gethostname
