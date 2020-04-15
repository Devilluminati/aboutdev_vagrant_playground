#!/bin/bash

sudo locale-gen de_DE.UTF-8
sudo update-locale LANG=de_DE.UTF-8
sudo sed -i 's/XKBLAYOUT="us"/XKBLAYOUT="de"/' /etc/default/keyboard
