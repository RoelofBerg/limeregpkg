#!/bin/bash

#Procedure taken from: http://grumbel.blogspot.de/2010/05/how-to-build-ubuntu-package.html

#prerequisites:
#sudo apt-get install dh-make git
#gpg --gen-key

#Compress the source archive to a tar distribution
#(Note: The folder should not contain a subfolder named like the project)
pushd ../liblimereg
git archive v0.9.1 --format=tar.gz --prefix=liblimereg-dev-0.9.1/ . > ../limeregpkg/liblimereg-dev-0.9.1.tar.gz
popd

#Import the tar distribution to a new git upstream folder
mkdir liblimereg-dev
pushd liblimereg-dev
git init
git-import-orig -u 0.9.1 ../liblimereg-dev-0.9.1.tar.gz

#When executed for the first time the package description folder debian,
#which I decided to store in a file debian.tar.gz, has to be generated by:
#export EMAIL=rberg@berg-solutions.de
#dh_make -s -c bsd -p limereg_1.1.0 -f ../limereg-1.1.0.tar.gz
#Then modify the directories content as written in http://grumbel.blogspot.de/2010/05/how-to-build-ubuntu-package.html
#tar -czf ../debian.tar.gz debian/*

#When debian.tar.gz exists on subsequent runs, restore the debian folder created above
cp -r ../debian .

echo Now adapt the files in the folder liblimereg/debian to the new version, e.g. version number
echo Then execute:
echo cd liblimereg-dev
echo git-buildpackage --git-ignore-new
echo Add -S option for a launchpad source package
echo cd ..
echo Check the lint output for warnings and errors.
echo look at the content with dpkg-deb -c *.deb
echo test the installation with dpkg -i *.deb
echo Test the package by calling
echo apt-get install pbuilder
echo sudo pbuilder --create 
echo optional: sudo pbuilder update --components "main restricted universe multiverse" --override-config
echo sudo pbuilder --build liblimereg-dev_0.9.1-0.dsc
echo ls /var/cache/pbuilder/results
echo Then publish on launchpad.net, create an account there
echo add a PPA - not a project-, upload your gnugp key, sign the Ubuntu code
echo of conduct
echo dput ppa:roelofberg/limereg liblimereg-dev_0.9.1-0ubuntu1_source.changes
echo Test the repository
echo sudo add-apt-repository ppa:your_username/ppa
echo sudo apt-get update
echo sudo apt-get install limereg
