First time:
Prepare a debian build system with git and git auto login
mkdir ~/debian-science/
cp test-autopkgtest.sh ~/debian-science/
mkdir ~/debian-schience/limereg
cd ~/debian-schience/limereg
There git checkout the limereg repo of debian-science

Subsequent times:
On a Debian system download the tarball to ~/Downloads
cd ~/debian-schience/limereg
Create a new entry in the file 'debian/changelog'
Enter the 'New upstream release' marker as you can see in V 1.4.1
save file and commit to git
Like written in:
  https://wiki.debian.org/PackagingWithGit#Upgrading_to_new_upstream_version
do:
gbp import-orig --sign-tags --pristine-tar ~/Downloads/limereg..1.4.1...tar
after that, check that the build would pass:
cd ..
test-autopkgtest.sh
