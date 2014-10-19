#!/usr/bin/env bash

echo "Hello Hello, we do ingres community edition installation for you"

cd /vagrant/place-ingres-here

[ ! -r ing*.tgz ] && echo "No ingres*.tgz found from place-ingres-here. Acquire it and place it" && exit 1

[[ -d ingres* ]] && echo "Seems like shared path has unpacked ingres, removing..." && rm -rf ingres*

INGRES_PACKAGE=`find / -type f -name "ing*.tgz" -print`
echo "Unpacking $INGRES_PACKAGE"

tar -xf $INGRES_PACKAGE

groupadd ww_eng

echo "Installing ingres express..."
cd ingres*
echo "Y" | sh ingres_express_install.sh

if [ $? == 6 ]
  then
	echo "Box had ingres installed already, that is ok"
fi

echo "Setting up ingres environment for user vagrant and for user ingres as well"
cp /home/ingres/.ingIIbash /home/vagrant/.ingIIbash
chown vagrant:vagrant /home/vagrant/.ingIIbash
echo "source .ingIIbash" >> /home/vagrant/.bash_profile
echo "source .ingIIbash" >> /home/ingres/.bash_profile
