#!/usr/bin/env bash
## after http://unix.stackexchange.com/questions/31824/how-to-attach-terminal-to-detached-process
## and http://etbe.coker.com.au/2008/02/27/redirecting-output-from-a-running-process/

## take a running process of PID and redirect its output to OUT_FILE using gdb

set -xue

GDB=$(command -v gdb)

PID="$1"
OUT_FILE="$2"

${GDB} -p ${PID} -ex 'call close (1)' -ex 'p creat("'${OUT_FILE}'", 0600)' -ex 'continue' -ex 'quit'
