Update the package like this:

cd .../limereg

Update version info in configure.ac, add release notes to NEWS
If necessary raise interface information in lib/Makefile.am and limereg.pc.in

In the limereg folder create a signed tag:
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push --tags

If new minor or major version: Create a branch:
git checkout -b v1.x
git push origin v1.x
(Later back: git checkout master)

./generate-tarball-distro.sh

Upload to website.
Upload to debian
  (In debian repo call '
git-import-orig --pristine-tar --sign-tags ~/devel/limereg/limereg-1.x.y.tar.gz
git push --all
git push --tag
  ' and upload all branches, then send an email)

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

