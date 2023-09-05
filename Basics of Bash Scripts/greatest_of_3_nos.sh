#!/bin/bash
echo "Enter three no to find the greatest one"
read a
read b
read c
if [ $a -gt  $b ] && [ $a -gt $c ];
then
	echo "$a is the greatest one"
elif [ $b -gt $a ] && [ $b -gt $c ];
then
	echo "$b is the greatest one"
else
	echo "$c is the greates one"
fi
