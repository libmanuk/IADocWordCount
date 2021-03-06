#!/bin/bash
# @copyright Copyright 2017 Eric C. Weig 

#check to see if there are 2 arguments given
if [[ $# != 2 ]] ; then 
    echo 'no arguments povided'
    echo 'process failed'
    exit 1
fi

#store commandline arguments as variables
arkid=$1
coll=$2

#set some needed variables
meta="_meta.xml"
text="_djvu.txt"
words="_words.txt"
space="_"
destdir=/var/opt/iawordcounts

#grab needed file from the Internet Archive
wget "https://archive.org/download/$arkid/$arkid$text"

#generate JSON file holding date metadata via Internet Archive API
wget -O "$destdir/date.txt" "http://archive.org/advancedsearch.php?q=$arkid&fl%5B%5D=date&page=1&output=json"

#parse the JSON date file to extract only the date and store as variable
sed -i -E "s/.*docs//" $destdir/date.txt
sed -i -E "s/.*:\"//" $destdir/date.txt
sed -i -E "s/T00:00:00Z.*//" $destdir/date.txt
sed -i -E "s/-//" $destdir/date.txt
sed -i -E "s/-//" $destdir/date.txt

date=$(<$destdir/date.txt)

#count the number of words in the djvu file and save this as a file
wc -w < $destdir/$arkid$text > $destdir/$coll/$coll$space$date$space$arkid$words

#cleanup by removing files no longer needed
rm $destdir/$arkid$text
rm $destdir/date.txt
