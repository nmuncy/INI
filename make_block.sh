#!/bin/bash



arr1=(`cat list.txt | awk '{print $1}'`)
arr2=(`cat list.txt | awk '{print $2}'`)
arr3=(`cat list.txt | awk '{print $3}'`)

arrA=("Y I" "Y N" "N I" "N N")
arrB=(1 3 5 7)

out=out.txt
>$out

c=0; while [ $c -lt ${#arr1[@]} ]; do
	d=0; while [ $d -lt ${#arrB[@]} ]; do

		echo "${arr1[$c]} ${arr2[$c]} ${arr3[$c]} ${arrA[$d]} /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/${arr1[$c]}'YNIN_stats_REML_blur6+tlrc[${arrB[$d]}]' \\" >> $out
		let d+=1
	done
	let c+=1
done


