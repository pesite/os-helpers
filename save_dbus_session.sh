#!/bin/sh
## from http://unix.stackexchange.com/questions/111188/using-notify-send-with-cron

touch ${HOME}/.dbus/Xdbus
chmod 600 ${HOME}/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > ${HOME}/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> ${HOME}/.dbus/Xdbus

exit 0
