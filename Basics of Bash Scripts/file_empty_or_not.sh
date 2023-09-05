#!bin/bash
echo "Enter a file to check weather it is empty of not?"
read file
if [ -s $file ];then
echo "File is not Empty"
else
echo "File is Empty"
fi

