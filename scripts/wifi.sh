#!/bin/bash

nmcli d wifi list

echo "SSID :"
read SSID

echo "password :"
read password

nmcli d wifi connect $SSID password $password
