#!/bin/bash
CURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
SUDO=sudo
# Uncomment the next line if you are already running this script as root
# SUDO=
PYTHON=python3
TFTP_SERVER="tftpy_server.py"
TFTP_ROOT="${CURDIR}/tftproot"
FAKE_SUCCESS=/bin/true
USERNAME="$(whoami)"
VENV_BIN=${CURDIR}/venv/bin
UMASK=000
XTERM_TITLE='TFTP Server'
######################################################################
deactivate 2>&1 2>/dev/null || ${FAKE_SUCCESS}
# echo Enter venv ...
# source venv/bin/activate || (echo Building venv && make rebuild && source venv/bin/activate)
# echo Starting tftp server ...
# nohup aterm -bg black -fg green -geometry 0x60x20 -e ${SUDO} ${VENV_BIN}/${PYTHON} ${VENV_BIN}/${TFTP_SERVER} -r ${TFTP_ROOT} &
nohup xterm -bg black -T "${XTERM_TITLE}" -fg green -geometry 0x60x20 -e ${SUDO} ${VENV_BIN}/${PYTHON} -mSimpleHTTPServer 80 &
if [ "$?" -eq "0" ]; then
  echo Started successfully @ "${TFTP_ROOT}" || echo Failed to start
else
  echo Failed to start, check nohup log
fi

