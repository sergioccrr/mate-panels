#!/bin/bash

CONF=""
MONITORS=$(xrandr | grep -c " connected")

case $MONITORS in
	1)
		CONF="one.ini"
	;;
	2)
		CONF="two.ini"
	;;
	*)
		echo "No configuration found for current number of monitors"
		exit 1
	;;
esac

mate-panel --reset
sleep 2
dconf load /org/mate/panel/ < $CONF