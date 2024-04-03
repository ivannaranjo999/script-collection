#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "2 arguments necessary"
	echo ""
	echo -e "\t- Path to rtmc directory"
	echo -e "\t- Path to patch file"
	exit 1
fi

cd $1
files=$(git diff --name-only master HEAD)
cd - > /dev/null
cd $2

for fn in $files; do
	mkdir -p $(dirname $fn)
	cp ../$1/$fn $(dirname $fn)
	echo "$(basename $fn) copied"	
done

echo "Exiting..."
exit 0
