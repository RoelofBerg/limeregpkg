Update the package like this:

cd .../limereg

Update version info in configure.ac, add release notes to NEWS

Create a signed tag:
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push --tags

If new minor or major version: Create a branch:
git checkout -b v1.x
git push origin v1.x
(Later back: git checkout master)

./generate-tarball-distro.sh

cd .../limeregpkg

Update version information (etc.) in debian/changelog
Also upate version strings in makepackage.sh
./cleanup.sh
./makepackage.sh
dput -f ppa:roelofberg/limereg limereg_1.x.0-0ubuntu1_source.changes

If Launchpad rejects the file:

Optional: If something goes wrong call git-buildpackage without the -S option and use
sudo pbuilder --build limereg_1.x.0-0.dsc  (as written in makepackage.sh)
to debug the package building process locally.

