Update the package like this:
(Note: Minor edits possible by just changing the -1 suffig in debian/files ?)

Create a signed tag:
git tag -s -a v1.x.0 -m "Version 1.x.0"
git push

Create a branch:
git checkout -b v1.x
git push origin v1.x
(Later back: git checkout master)

Update all information in the debian folder, esp. versions
./cleanup.sh
./makepackage.sh
cd limereg
git-buildpackage --git-ignore-new -S
cd ..
dput -f ppa:roelofberg/limereg limereg_1.x.0-0ubuntu1_source.changes

If something goes wrong call git-buildpackage without the -S option and use
sudo pbuilder --build limereg_1.x.0-1.dsc  (as written in makepackage.sh)
to debug the package building process locally.

