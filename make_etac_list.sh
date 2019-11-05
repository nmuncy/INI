#!/bin/bash





parDir=~/compute/SleepBrain_BIDS
workDir=${parDir}/derivatives								# par dir of data
outDir=${parDir}/Analyses/grpAnalysis

arrRem=(`cat ${outDir}/info_rmSubj_YNIN.txt`)


MatchString () {

	local e match="$1"

	shift
	for e; do
		[[ "$e" == "$match" ]] && return 0
	done
	return 1
}



unset ListA
unset ListB
for i in ${workDir}/s*; do


	scan=YNIN_stats_REML_blur6+tlrc
	brik1=3

	subj=${i##*\/}
	MatchString "$subj" "${arrRem[@]}"

	if [ $? == 1 ]; then
		ListA+="$subj ${i}/${scan}[${brik1}] "
		ListB+="$subj ${i}/${scan}[${brik1}] "
	fi
done

echo $ListA > listA.txt
echo $ListB > listB.txt
