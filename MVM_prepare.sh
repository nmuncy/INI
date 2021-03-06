#!/bin/bash

#SBATCH --time=00:10:00   # walltime
#SBATCH --ntasks=2   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4gb   # memory per CPU core
#SBATCH -J "MVMp"   # job name



# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



subjDir=~/compute/SleepBrain_BIDS/derivatives/$1
cd $subjDir


if [ ! -f YNIN_stats_REML_blur6+tlrc.HEAD ]; then
	3dmerge -prefix YNIN_stats_REML_blur6 -1blur_fwhm 6 -doall YNIN_stats_REML+tlrc
fi