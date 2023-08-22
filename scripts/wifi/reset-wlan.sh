#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

sudo airmon-ng stop mon0
sudo airmon-ng stop wlan0
sudo ifconfig wlan0 down
sudo ifconfig wlan0 up
