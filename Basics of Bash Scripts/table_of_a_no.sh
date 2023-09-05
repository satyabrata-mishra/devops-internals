#!/bin/bash
echo "Enter a number to display its table"
read num
i=0
while [ $i -le 10 ];
do
	echo "$num * $i = "$((num*i))
	i=$((i+1))
done
