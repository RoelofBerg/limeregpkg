Update the package like this:

cd .../liblimereg

Update version info in configure.ac, add release notes to NEWS

Create a signed tag:
git tag -s -a v0.9.3 -m "Version 0.9.3"
git push --tags

If new minor or major version: Create a branch:
git checkout -b v0.9
git push origin v0.9
(Later back: git checkout master)

./generate-tarball-distro.sh

cd .../limeregpkg

Update version information (etc.) in debian/changelog
Also upate version strings in makepackage.sh
./cleanup.sh
./makepackage.sh
dput -f ppa:roelofberg/limereg liblimereg0_0.9.3-0ubuntu1_source.changes

If Launchpad rejects the file:

Optional: If something goes wrong call git-buildpackage without the -S option and use
sudo pbuilder --build limereg0_0.9.3-0.dsc  (as written in makepackage.sh)
to debug the package building process locally.

