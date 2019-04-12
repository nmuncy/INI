#!/bin/bash



arr1=(`cat Sleep_list.txt | awk '{print $1}'`)
arr2=(`cat Sleep_list.txt | awk '{print $2}'`)

> Final_Sleep_List.txt

c=0; while [ $c -lt ${#arr1[@]} ]; do
	if [ ${arr2[$c]} == 0 ]; then
		echo -e "sub-0${arr1[$c]} \t Sleep" >> Final_Sleep_List.txt
	else
		echo -e "sub-0${arr1[$c]} \t NoSleep" >> Final_Sleep_List.txt
	fi
	let c=$[$c+1]
done
