# pyinstaserv - quick file serve utility

This is intended for use in a lab environment when you need a quick tftp server capable of both read and write up in a pinch

## TFTP and HTTP File Root Directories

After installing in a virtualenv, you can find the tftproot and the httproot in `$VIRTUAL_ENV/serv/tftproot` and `$VIRTUAL_ENV/serv/httproot`. **File places here can be read by anyone on the network, and files can be written to the tftproot**

## Starting

To start the TFTP service, you can use 