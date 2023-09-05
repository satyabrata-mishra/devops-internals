#!/bin/bash
sum=0
echo "Enter nos separated by spaces"
read x
for i in $x;
do
	sum=$((sum+i))
done
echo "Total sum is $sum"

