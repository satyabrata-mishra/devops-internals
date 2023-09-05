#!/bin/sh
echo "Enter a no to find its factorial"
read num
ans=1
i=1
while [ $i -le $num ];
do
	ans=$((ans*i))
	i=$((i+1))
done
echo "Factorial of $num is $ans"
