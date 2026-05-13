#!/bin/bash
# Jadon Kosberg

if [ $# -ne 2 ]; then
    echo "usage: $0 url newname" >&2
    exit 1
fi

newname=$2

# check the url
echo "checking url"
rsc=$(curl -Is $1 2> /dev/null | head -1 | cut -d " " -f 2)
if [ -z "$rsc" ]; then
    echo "could not reach url" >&2
    exit 1
elif [ "$rsc" != "200" ]; then
    echo "bad status: $rsc" >&2
    exit 1
fi

# get filename from the url
filename=$(echo $1 | rev | cut -d "/" -f 1 | rev)

echo "downloading $filename"
wget -q $1

echo "scanning for viruses"
infected=$(clamscan --no-summary -i $filename)
if [ -n "$infected" ]; then
    echo "file is infected" >&2
    rm $filename
    exit 1
fi

# convert to jpg
if file $filename | grep JPEG > /dev/null; then
    cp $filename $newname.jpg
else
    echo "converting to jpg"
    convert $filename $newname.jpg
fi

# get the resolution
res=$(file $newname.jpg | grep -Eo '[0-9]{4}(\s|)x(\s|)[0-9]{4}' | sed 's/\s//g')

# rename with the resolution
echo "renaming"
mv $newname.jpg ${newname}_${res}.jpg

# remove the original download
rm $filename

echo "done"
