#!/usr/bin/env bash

echo "Hello Hello, we do ingres community edition installation for you..."

cd /vagrant/place-ingres-here

[ ! -r ing*.tgz ] && echo "No ingres*.tgz found from /vagrant/place-ingres-here. Acquire it." && exit 1

INGRES_PACKAGE=`find / -type f -name "ing*.tgz" -print`
echo "Unpacking $INGRES_PACKAGE"

tar -xf $INGRES_PACKAGE

groupadd ww_eng

echo "Installing ingres express and wait until it is running..."
cd ingres*
echo "Y" | sh ingres_express_install.sh
wait

if [ $? == 6 ]
  then
	echo "Box had ingres installed already, that is ok"
fi

echo "Setting up ingres environment for user vagrant and for user ingres as well"
cp /home/ingres/.ingIIbash /home/vagrant/.ingIIbash
chown vagrant:vagrant /home/vagrant/.ingIIbash
echo "source .ingIIbash" >> /home/vagrant/.bash_profile
echo "source .ingIIbash" >> /home/ingres/.bash_profile

mkdir /home/ingres/spec
cp /vagrant/spec/vagrant-user-spec.sql /home/ingres/spec/vagrant-user-spec.sql

# This should be done to every sql-file in spec
su - ingres -c "sql iidbdb < /home/ingres/spec/vagrant-user-spec.sql"

echo "Yeow!! vagrant ssh and start ingresing! See password from spec/vagrant-user-spec.sql"
