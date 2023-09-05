#1 /bin/bash
echo "Enter a string to check if it is Palindrome"
read str
echo "Length of str is" ${#str}
rev=$(echo $str|rev)
echo "Reverse of str is" $rev
if [ "$str" = "$rev" ];
then
echo "Palindrome"
else
echo "Not Palindrome"
fi