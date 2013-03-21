#!/bin/bash

for i in {1..4}
do
    case $1 in
    -d) shift; directory=$1; shift;;
    *) url=${url:-$1}; shift;;
    esac
done

echo $directory, $url
if [ ! -e $directory ]
then
    mkdir $directory;
fi
baseurl=$(echo $url| egrep -o "https?://[a-z.]+")
curl -s $url | egrep -o "<img src=[^>]*>" |
sed 's/<img src=\"\([^"]*\).*/\1/g' > /tmp/$$.list

cd $directory

while read filename
do 
    curl -s -O "$filename" --silent
    
done < /tmp/$$.list

echo $$
