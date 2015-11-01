#!/usr/bin/env bash

## in case you wanted to monitor a process by id and do something, if it exits

set -xue

KILL=$(command -v kill)

COMMAND="$1"
AFTER_PID="$2"

while [ "$?" == "0" ]; do
    sleep 60
    ${KILL} -0 ${AFTER_PID} || break
done

${COMMAND}
