#!/bin/bash
x= usr/bin/htop

if [ -f $x ]
then 	
	echo "package exist"
else
	sudo apt update && sudo apt install -y htop
fi

