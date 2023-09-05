#!bin/bash
echo "Enter a file name"
read file
if [ -e $file ];then
	cat $file
else
	touch $file
	nano $file
	cat $file
fi
