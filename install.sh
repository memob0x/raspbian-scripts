#!/bin/sh

cwd=$(readlink -f "$(dirname "$0")")

. $cwd/common.sh

. $cwd/uninstall.sh

. $cwd/bin/lightdm-autologin.sh

if [ ! -d $DIR_BIN ]; then
	mkdir $DIR_BIN
fi

for bin in $LIST_SCRIPTS
do
        cp -r $cwd/bin/$bin $DIR_BIN
done

for conf in $LIST_CONFIGS
do
        cp -r $cwd/config/$conf $DIR_CONF
done

autologin_install kodi

for addon in $LIST_ADDONS
do
	cp -r $cwd/addons/$addon $DIR_KODI_ADDONS
done

for session in $LIST_XSESSIONS
do
        sudo cp $cwd/xsessions/$session $DIR_XSESSIONS
done

for service in $LIST_SYSTEMDS
do
        sudo cp $cwd/systemd/$service $DIR_SYSTEMD
        sudo chmod 664 $DIR_SYSTEMD/$service
done

systemds_reload

systemds_activate
