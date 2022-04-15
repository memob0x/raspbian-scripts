#!/bin/sh

cwd=$(readlink -f "$(dirname "$0")")

. $cwd/common.sh

. $cwd/bin/lightdm-autologin.sh

autologin_uninstall

for bin in $LIST_SCRIPTS
do
	rm $DIR_BIN/$bin
done

for conf in $LIST_CONFIG
do
        rm -r $DIR_CONF/$conf
done

for addon in $LIST_ADDONS
do
	rm -rf $DIR_KODI_ADDONS/$addon
done

for session in $LIST_XSESSIONS
do
        sudo rm $DIR_XSESSIONS/$session
done

systemds_deactivate

for service in $LIST_SYSTEMDS
do
        sudo rm $DIR_SYSTEMD/$service
done

systemds_reload
