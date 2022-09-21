#!/bin/bash
echo "enter a number"
read n1
i=0
while [[ $i -le $n1 ]]
do
echo $i
(( i++ ))
done

