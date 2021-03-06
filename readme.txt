Update the package like this:

cd .../limereg

Update version info in configure.ac, add release notes to NEWS
If necessary raise interface information in lib/Makefile.am and limereg.pc.in

In the limereg folder create a signed tag:
(Ensure that 'git branch' points to 'master')
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push --tags

If new minor or major version: Create a branch:
git checkout -b v1.x
git push origin v1.x
(Later back: git checkout master)

./generate-tarball-distro.sh

Upload to website.
Upload to debian:
Prepare a Debian system as written in debian-science/readme.txt
cd ~/debian-science/limereg
Download above created tarball to ~/Downloads
Create a new entry in the file 'debian/changelog'
Enter the 'New upstream release' marker as you can see in V 1.4.1
Update the version information inside all tests in debian/tests/* and debian/rules
save files and commit to git
In debian repo call:
git-import-orig --pristine-tar --sign-tags ~/devel/limereg/limereg-1.x.y.tar.gz
git push --all
git push --tag
Test ba calling 'sudo ./test-autopkgtest.sh' from '..' on the debian machine and tag the release
git tag -s -a debian/1.x.0-1 -m "Release 1.x.0-1"
git push --all
git push --tag
Then git-upload all branches, then send an email to the debian-science list.

As long as we're still in Launchpad:

cd .../limeregpkg

Update version information (etc.) in debian/changelog
Also upate version strings in makepackage.sh
./cleanup.sh
./makepackage.sh
dput -f ppa:roelofberg/limereg limereg_1.x.0-0ubuntu1_source.changes

Also tag the version of limeregpkg:
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push --tags

If Launchpad rejects the file:
If something goes wrong call git-buildpackage without the -S option and use
sudo pbuilder --build limereg_1.x.0-0.dsc  (as written in makepackage.sh)
to debug the package building process locally.

