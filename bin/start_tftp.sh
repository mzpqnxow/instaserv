#!/bin/bash
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
SUDO=sudo
# SUDO=
# Development mode, running directory from git repo root
if [ -z ${VIRTUAL_ENV+x} ]; then
    source ../venv/bin/activate
fi
# echo Enter venv ...
# source venv/bin/activate || (echo Building venv && make rebuild && source venv/bin/activate)
# echo Starting tftp server ...

declare -r VENV_ROOT="${VIRTUAL_ENV}"
PYTHON=$(command -v python3)
TFTP_SERVER="tftpy_server.py"
TFTP_ROOT="${VENV_ROOT}/serv/tftproot"
FAKE_SUCCESS=/bin/true
USERNAME="$(whoami)"
VENV_BIN=${VENV_ROOT}/bin
UMASK=000
XTERM_TITLE='TFTP Server'
######################################################################
deactivate 2>&1 2>/dev/null || ${FAKE_SUCCESS}
nohup xterm -bg black -T "${XTERM_TITLE}" -fg green -geometry 0x60x20 -e ${SUDO} ${VENV_BIN}/${PYTHON} ${TFTP_SERVER} -r ${TFTP_ROOT} &
if [ "$?" -eq "0" ]; then
  echo Started successfully @ "${TFTP_ROOT}" || echo Failed to start
else
  echo Failed to start, check nohup log
fi

