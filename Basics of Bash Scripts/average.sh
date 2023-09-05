#!/bin/bash
sum=0
total_nos=0
echo "Enter numbers separated with spaces"
read x
for i in $x;
do
        sum=$((sum+i))
	total_nos=$((total_nos+1))
done
echo "The average is "$(($sum/$total_nos))

