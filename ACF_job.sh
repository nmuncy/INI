#!/bin/bash

#SBATCH --time=10:00:00   # walltime
#SBATCH --ntasks=6   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=8gb   # memory per CPU core
#SBATCH -J "ACF"   # job name



# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



# Set up nate fashion
workDir=~/compute/SleepBrain_BIDS
grpDir=${workDir}/Analyses/grpAnalysis

printRaw=${grpDir}/ACF_wholeBrain_raw.txt
printFinal=${grpDir}/ACF_wholeBrain_MC.txt
mask=${grpDir}/Intersection_GM_mask+tlrc

> $printRaw



# get noise estimates from e/person
cd ${workDir}/derivatives
for i in s*; do
	3dFWHMx -mask $mask -input ${i}/YNIN_stats_REML_blur6+tlrc -acf >> $printRaw
done


# model noise, determine threshold
cd $grpDir
sed '/ 0  0  0    0/d' $printRaw > tmp

xA=`awk '{ total += $1 } END { print total/NR }' tmp`
xB=`awk '{ total += $2 } END { print total/NR }' tmp`
xC=`awk '{ total += $3 } END { print total/NR }' tmp`

3dClustSim -mask $mask -LOTS -iter 10000 -acf $xA $xB $xC > $printFinal
rm tmp


