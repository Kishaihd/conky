#!/bin/bash
# Starts the script

conky -dc ~/conkies/lconky.conf
sleep 1
conky -dc ~/conkies/rconky.conf
sleep 2
exit
