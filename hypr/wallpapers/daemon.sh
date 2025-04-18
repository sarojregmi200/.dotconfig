#!/bin/bash

# This script starts the swww-daemon if it';s not already running. 
swww query

if [ $? -ne 0 ]; then
    swww-daemon -q &
fi
