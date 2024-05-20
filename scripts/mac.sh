#!/bin/bash

# Usage :
# Utiliser avec wlan0 ou eno1 pour ne modifier qu'une des interface
# sudo ip link set dev <interface> address <address> pour mettre une adresse choisie
# macchanger -p <interface> pour remettre l'adresse mac permanente

if [ -z "$1" ]; then
	echo -e "No arguments supplied, changing wlan0 and eno1\n"

	# Down des interfaces
	sudo ip link set dev wlan0 down
	sudo ip link set dev eno1 down

	echo "wlan0 :"
	sudo macchanger -r wlan0
	echo
	echo "eno1 :"
	sudo macchanger -r eno1

	sudo ip link set dev wlan0 up
	sudo ip link set dev eno1 up

elif [ "$1" == "wlan0" ]; then
	echo -e "Changing wlan0\n"

	sudo ip link set dev wlan0 down

	sudo macchanger -r wlan0

	sudo ip link set dev wlan0 up

elif [ "$1" == "eno1" ]; then
	echo -e "Changing eno1\n"

	sudo ip link set dev eno1 down

	sudo macchanger -r eno1

	sudo ip link set dev eno1 up

fi
