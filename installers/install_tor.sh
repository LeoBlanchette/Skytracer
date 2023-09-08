#!/usr/bin/env bash

: ' 
Tor allows us to instantaniously deploy a website without using a paid registrar. 
Skytracer nodes can also benefit from the anonyminity that tor generally provides. 
'


# Install Tor 
# https://support.torproject.org/apt/tor-deb-repo/
echo Installing Tor... 

sudo apt install apt-transport-https

#according to https://support.torproject.org/apt/tor-deb-repo/ 
RELEASE_CODENAME=$(lsb_release -sc)

#remove old tor.list to avoid duplicates
sudo rm -f -- /etc/apt/sources.list.d/tor.list
#recreate tor.list file new
sudo touch /etc/apt/sources.list.d/tor.list

echo   deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] \
https://deb.torproject.org/torproject.org \
$RELEASE_CODENAME main | sudo tee -a /etc/apt/sources.list.d/tor.list

echo   deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] \
https://deb.torproject.org/torproject.org \
$RELEASE_CODENAME main | sudo tee -a /etc/apt/sources.list.d/tor.list

sudo wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc \
| gpg --dearmor | sudo tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null

sudo apt update
sudo apt install tor deb.torproject.org-keyring 
sudo apt install tor 

sudo cp -f $SKYTRACER_HOME/installers/configfiles/torrc /etc/tor/torrc

sudo systemctl restart tor
