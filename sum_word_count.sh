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
dir=/var/opt/iawordcounts
name=_merged_file.txt
total=_sum.txt
tdir=totals

#merge all files for a title together
cat $dir/$coll/* > $dir/$tdir/$coll$name

#perform sumation of numbers in the merged file
cat $dir/$tdir/$coll$name
sum=0; while read num ; do sum=$(($sum + $num)); done < $dir/$tdir/$coll$name

#save file with sumation
echo "$sum" > "$dir/$tdir/$coll$total"
