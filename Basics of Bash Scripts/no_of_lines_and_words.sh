#!bin/bash
echo "Enter the file name"
read file
no_of_line=0
word=0
while read -r line;
do
	no_of_line=$((no_of_line+1))
	word=$((word+${#line}))
done < "$file"
echo "No of line in the file is $no_of_line"
echo "No of words in the file is $word"
