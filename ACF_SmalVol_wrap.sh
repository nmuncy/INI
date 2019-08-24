#!/bin/bash




workDir=~/compute/SleepBrain_BIDS
scriptDir=${workDir}/code
slurmDir=${workDir}/derivatives/Slurm_out
time=`date '+%Y_%m_%d-%H_%M_%S'`
outDir=${slurmDir}/ACF_SmalVol${time}

mkdir -p $outDir


sbatch \
-o ${outDir}/output_ACF.txt \
-e ${outDir}/error_ACF.txt \
${scriptDir}/ACF_SmalVol_job.sh
