#!/bin/bash
function sum()
{
result=0
for i in "$@"
do
result=$(($result + $i))
echo $result
done
#echo "enter a number"
#read a
#echo "enter another number"
#read b
#echo $(($a + $b))
}
sum 1 2 3 4 5 6 7 8 9 

