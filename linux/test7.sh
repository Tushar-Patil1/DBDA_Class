#!/bin/bash
echo "enter a number"
read n1
for (( i=1; i<=10; i++ ))
do
res=$(($i * $n1))
echo $res
done
