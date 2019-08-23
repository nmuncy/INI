#!/bin/bash




workDir=~/compute/SleepBrain_BIDS
scriptDir=${workDir}/code
slurmDir=${workDir}/derivatives/Slurm_out
time=`date '+%Y_%m_%d-%H_%M_%S'`
outDir=${slurmDir}/MVMp_${time}

mkdir -p $outDir

cd ${workDir}/derivatives
for i in s*; do

	sbatch \
	-o ${outDir}/output_MVMp_${i}.txt \
	-e ${outDir}/error_MVMp_${i}.txt \
	${scriptDir}/MVM_prepare.sh $i

	sleep 1
done

