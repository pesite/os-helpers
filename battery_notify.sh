#!/usr/bin/env bash

if [ -r "${HOME}/.dbus/Xdbus" ]; then
    . "${HOME}/.dbus/Xdbus"
fi

BATTERY_STATUS=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
PERCENTAGE="$(echo ${BATTERY_STATUS} | grep -o percentage:.* | cut -d ' ' -f 2 | cut -d '%' -f 1)"
NOTIFY=$(command -v notify-send)

if [ "$(echo ${BATTERY_STATUS} | grep -c state:.*discharging)" == "1" ]; then
    if [ "${PERCENTAGE}" -lt "33" ]; then
        ${NOTIFY} -c 'BATTERY' 'BATTERY DISCHARGING<br />Battery is discharging.<br />'"$(echo ${BATTERY_STATUS} | grep -o percentage:.*%)"
    fi
    exit 0
fi
if [ "$(echo ${BATTERY_STATUS} | grep -c state:.*charging)" == "1" ]; then
    if [ "${PERCENTAGE}" -gt "90" ]; then
        ${NOTIFY} -c 'BATTERY' 'BATTERY CHARGING<br />Battery is charging.<br />'"$(echo ${BATTERY_STATUS} | grep -o percentage:.*%)"
    fi
    exit 0
fi
