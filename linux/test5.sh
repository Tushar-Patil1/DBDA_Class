#!/bin/bash
a=`expr 10 + 20`
echo $a
b=20
c=30
result=`expr $b + $c`
echo $result
mul=`expr $b \* $c`
echo $mul
mod=`expr $b % $c`
echo $mod
div=`expr $c / $b`
echo $div
asg=$b
echo $asg
echo $[$a == $c]
#echo $[[$a -eq $c]]
