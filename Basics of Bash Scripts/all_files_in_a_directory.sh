#!/bin/bash
echo "Enter the directory to find all the files inside it"
read dir_name
for entry in `ls $dir_name`;
do
	echo $entry
done
