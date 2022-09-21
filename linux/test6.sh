#!/bin/bash
echo "Enter any number"
read num
if [[ $num -gt 35 ]]
then
echo "pass"
elif [[ $num -eq 35 ]]
then
echo "just passed"
else
echo "fail"
fi


