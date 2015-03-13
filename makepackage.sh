#!/bin/bash

#Procedure taken from: http://grumbel.blogspot.de/2010/05/how-to-build-ubuntu-package.html

#prerequisites:
#sudo apt-get install dh-make git
#gpg --gen-key

#Import the tar distribution to a new git upstream folder
./cleanup.sh
mkdir limereg
pushd limereg
git init
git-import-orig -u 1.3.0 ../../limereg/limereg-1.3.0.tar.gz

#When executed for the first time the package description folder debian,
#which I decided to store in a file debian.tar.gz, has to be generated by:
#export EMAIL=rberg@berg-solutions.de
#dh_make -s -c bsd -p limereg_1.1.0 -f ../limereg-1.1.0.tar.gz
#Then modify the directories content as written in http://grumbel.blogspot.de/2010/05/how-to-build-ubuntu-package.html
#tar -czf ../debian.tar.gz debian/*

#When debian.tar.gz exists on subsequent runs, restore the debian folder created above
cp -r ../debian .
#export DEB_BUILD_OPTIONS="CFLAGS=\"-Ofast\" CXXFLAGS=\"-Ofast\""

cd limereg
git-buildpackage --git-ignore-new
# -S
echo For testing use instead: git-buildpackage --git-ignore-new
cd ..
echo Check the lint output for warnings and errors.
echo look at the content with dpkg-deb -c *.deb
echo test the installation with dpkg -i *.deb
echo Test the package by calling
echo apt-get install pbuilder
echo sudo pbuilder create --mirror "http://archive.ubuntu.com/ubuntu"
echo optional: sudo pbuilder update --components "main restricted universe multiverse" --override-config --mirror "http://archive.ubuntu.com/ubuntu"
echo sudo pbuilder --build limereg_1.3.0-0.dsc
echo pushd /var/cache/pbuilder/result
echo dpkg -c ...
echo popd
echo Then publish on launchpad.net, create an account there
echo add a PPA - not a project-, upload your gnugp key, sign the Ubuntu code
echo of conduct
echo dput ppa:roelofberg/limereg limereg_1.3.0-0ubuntu1_source.changes
echo Test the repository
echo sudo add-apt-repository ppa:your_username/ppa
echo sudo apt-get update
echo sudo apt-get install limereg
