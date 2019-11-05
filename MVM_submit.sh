#!/bin/bash




workDir=~/compute/SleepBrain_BIDS
scriptDir=${workDir}/code
slurmDir=${workDir}/derivatives/Slurm_out
time=`date '+%Y_%m_%d-%H_%M_%S'`
outDir=${slurmDir}/MVM_${time}

mkdir -p $outDir


sbatch \
-o ${outDir}/output_MVM.txt \
-e ${outDir}/error_MVM.txt \
${scriptDir}/MVM_sbatch.sh

