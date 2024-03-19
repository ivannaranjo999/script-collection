#!/bin/bash

#diff <(sed 's/[0-9]//g' beforeSPR-oldBoards-warnings/MasterLog.txt) <(sed 's/[0-9]//g' afterSPR-oldBoards-warnings/MasterLog.txt)

if test "$#" -ne 2; then echo "Pass two directories to compare logs"; exit 1; fi

echo $1
echo $2

for fn in $1/*.txt; do fn=$(basename $fn) ; echo -e "\n@@@@@@@@@@@@@@@@@\n\nFile: $fn\n-----------------\n" ; diff <(sed 's/[0-9]//g' $1/$fn) <(sed 's/[0-9]//g' $2/$fn); done
