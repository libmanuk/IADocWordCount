#!/bin/bash
# @copyright Copyright 2017 Eric C. Weig 

#check to see if there is 1 argument given
if [[ $# != 1 ]] ; then 
    echo 'no argument povided'
    echo 'process failed'
    exit 1
fi

#store commandline argument as variable
coll=$1

#set variables for path to files
dir=/var/opt/iawordcounts/totals
name=_merged_file.txt
total=_sum.txt

#merge all files for a title together
cat $dir/$coll/* > $dir/$coll$name

#perform sumation of numbers in the merged file
sum=(awk '{ sum += $1 } END { print sum }' $dir/$coll$name)

#save file with sumation
echo "$sum" > "$dir/$coll$total"

