if test $# -lt 1;
then
	printf "Requires one argument - the git folder that shall be un-moduled\n";
	exit 0;
fi

FOLDER=${1%/}
TMPFOLDER=${FOLDER}_tmp

echo Moving $FOLDER via $TMPFOLDER

mv $FOLDER $TMPFOLDER
git submodule deinit $FOLDER
git rm --cached $FOLDER
mv $TMPFOLDER $FOLDER
rm -rf $FOLDER/.git
git add $FOLDER
