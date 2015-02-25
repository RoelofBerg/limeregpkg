Update the package like this:

Update version info in the source (limereg_common.h), releasenotes.txt, Makefile and Doxyfile
(plus checkin !)

Create a signed tag:
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push --tags

Create a branch:
git checkout -b v1.x
git push origin v1.x
(Later back: git checkout master)

Update version information (etc.) in the debian folder: changelog, files
Also upate makepackage.sh
./cleanup.sh
./makepackage.sh
cd limereg
git-buildpackage --git-ignore-new -S
cd ..
dput -f ppa:roelofberg/limereg limereg_1.x.0-0ubuntu1_source.changes

If Launchpad rejects the file:

Optional: If something goes wrong, raise the version. E.g. 0.9.0 to 0.9.1
Don't try anything else. Launchpad will block any attempt.
(Raise in all files, about 5-10. Create new signed tags ...)
