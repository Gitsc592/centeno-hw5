#!/bin/bash

############################
# Author : Sed Centeno
# Date : 10/4/2024
#
# Description:
# This script turns LED USR3 on, off, prints the status,
# then flashes it for 5 seconds each and then finally blinks it 3 times.
# It does this by invoking "led-hw4.sh" for its tasks. The Wait Time and Blink
# Amount can be adjusted by changing the variables below.
#
# Arguments: None
#
# Example Invocation:
# sudo ./commanderBash.sh
#
# NOTE:
# commanderBash.sh MUST be run as sudo since the flash task requires editing
# files the current user does not have privledges for.
#############################

Wait_Time=5
Blink_Amount=3

echo "Turning LED on..."
./led-hw4.sh on
sleep $Wait_Time

echo "Turning LED off..."
./led-hw4.sh off
sleep $Wait_Time

echo "Printing current status:"
./led-hw4.sh status
sleep $Wait_Time

echo "Flashing the LED for 5 seconds..."
./led-hw4.sh flash
sleep $Wait_Time

echo "Blinking the LED 3 times..."
./led-hw4.sh blink $Blink_Amount
