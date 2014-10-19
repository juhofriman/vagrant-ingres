#!/usr/bin/env bash

echo "Hello Hello, we do ingres community edition installation for you..."

cd /vagrant/place-ingres-here

[ ! -r ing*.tgz ] && echo "No ingres*.tgz found from /vagrant/place-ingres-here. Acquire it." && exit 1

INGRES_PACKAGE=`find / -type f -name "ing*.tgz" -print`
echo "Unpacking $INGRES_PACKAGE"

tar -xf $INGRES_PACKAGE

if grep -q ww_eng /etc/group
then
   echo "group ww_eng exists..."
else
   echo "group ww_eng does not exist, Creating..."
   groupadd ww_eng
fi

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
source .ingIIbash

[ ! -d /home/ingres/spec ] && mkdir /home/ingres/spec
cp /vagrant/spec/vagrant-user-spec.sql /home/ingres/spec/vagrant-user-spec.sql

# This should be done to every sql-file in spec
su - ingres -c "sql iidbdb < /home/ingres/spec/vagrant-user-spec.sql"

cd /vagrant/database-auto-create/databases
for i in $(ls -d */)
  do 
    DB_NAME=${i%%/}
    createdb -uvagrant $DB_NAME
    if [ $? != 0 ]
       then
          echo "database $DB_NAME already exists in box. Skipping."
       else
          echo "Database $DB_NAME created."
          cd $DB_NAME
          sql $DB_NAME < copy.in
          cd ..
    fi
done

echo "Yeow!! vagrant ssh and start ingresing! See password from spec/vagrant-user-spec.sql. It is likely that it is NOPASSWORD"
