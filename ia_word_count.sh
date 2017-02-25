#!/bin/bash
# @copyright Copyright 2017 Eric C. Weig 

arkid=$1

coll=$2

meta="_meta.xml"

text="_djvu.txt"

words="_words.txt"

space="_"

destdir=/var/opt/iawordcounts

wget "https://archive.org/download/$arkid/$arkid$text"

wget -O "$destdir/date.txt" "http://archive.org/advancedsearch.php?q=$arkid&fl%5B%5D=date&page=1&output=json"

sed -i -E "s/.*docs//" $destdir/date.txt
sed -i -E "s/.*:\"//" $destdir/date.txt
sed -i -E "s/T00:00:00Z.*//" $destdir/date.txt
sed -i -E "s/-//" $destdir/date.txt
sed -i -E "s/-//" $destdir/date.txt

date=$(<$destdir/date.txt)

wc -w < $destdir/$arkid$text > $destdir/$coll/$coll$space$date$space$arkid$words

rm $destdir/$arkid$text

rm $destdir/date.txt
