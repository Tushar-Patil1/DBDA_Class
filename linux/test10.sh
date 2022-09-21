#!/bin/bash
u=(10 20 30 40)
i=0
while [[ $i -lt ${#u[@]} ]]
do
echo ${u[$i]}
(( i++ ))
done

