# alpine-data

Minimal [Alpine][alpine] image used as a data container.

## Dependencies
```curl```: https://curl.haxx.se  
```grep```: http://www.gnu.org/software/grep  
```jq```: https://stedolan.github.io/jq  
```procps```: https://gitlab.com/procps-ng/procps  
```sed```: http://www.gnu.org/software/sed  
```su-exec```: https://github.com/ncopa/su-exec  
```tini```: https://github.com/krallin/tini  

## Utilities
```/usr/local/sbin/apk-cleanup```: Clear apk's cache  
```/usr/local/sbin/apk-install```: Add packages  
```/usr/local/sbin/apk-remove```: Remove packages  
```/usr/local/sbin/apk-upgrade```: Upgrade currently installed packages  
```/usr/local/sbin/gh-downloader```: [Simple utility to download files from GitHub Repository][gh-downloader]  
```/usr/local/sbin/templater```: [Simple templating system that replaces {{VAR}} by the value of $VAR][sh-templater]  
```/usr/local/sbin/wait-host```: [Wait for host and TCP port availability][wait-host]  

## Volume
```/data```: This is the current directory  


[alpine]: http://alpinelinux.org/
[gh-downloader]: https://github.com/CraftDock/gh-downloader
[sh-templater]: https://github.com/CraftDock/sh-templater
[wait-host]: https://raw.githubusercontent.com/CraftShell/wait-host/master/wait-host.sh
