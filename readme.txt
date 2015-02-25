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

Optional: If something goes wrong call git-buildpackage without the -S option and use
sudo pbuilder --build limereg0_0.9.0-1.dsc  (as written in makepackage.sh)
to debug the package building process locally.

Delete the tags again: git tag -d v0.9.0 && git push origin :refs/tags/v0.9.0
Fix the bug
Add tags again as shown above
(You may want to cherry pick the fix to master lateron.)
In debian/changelog raise the subsubminor version: liblimereg0_0.9.0-0ubuntu1 liblimereg0_0.9.0-1ubuntu1
Repeat clean, build and dput (use the risn subsubminor also in dput)
