#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

#############################
# Edited by: Sed Centeno
# Date: 9/25/2024
#
# Description:
# This script has been modified to include two new arguments, "blink N".
# This will instruct User LED3 to blink N times at a rate of 0.5 Hz.
#
# New Arguments:
# Arg 1: blink
# Arg 2: N
#
# New Example Invocation:
# ./led-hw4.sh blink 10
#############################

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash, status, or blink N  \n e.g. bashLED on\n e.g. blink 5 "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
elif [ "$1" == "blink" ]; then # New Argument Addition
  if [ "$#" -eq 1 ]; then # Checks if integer is also inputted
    echo -e "Please supply an interger.\ne.g blink 5" # Quits if not
    exit 2
  fi
  
  removeTrigger # Clears previous LED setting
  Count=$2
  while [ $Count -gt 0 ]; do
    echo "1" > "$LED3_PATH/brightness" # Turn LED on, wait 1 second
    echo "LED is on"
    sleep 1
    echo "0" >> "$LED3_PATH/brightness" # Turn LED off, wait 1 second
    echo "LED is off"
    sleep 1
    ((Count--))
  done
fi
echo "End of the LED Bash Script"
