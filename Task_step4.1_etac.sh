#!/bin/bash

#SBATCH --time=05:00:00   # walltime
#SBATCH --ntasks=10   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=8gb   # memory per CPU core
#SBATCH -J "TS4"   # job name

# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



# General variables
parDir=~/compute/SleepBrain_BIDS
workDir=${parDir}/derivatives								# par dir of data
outDir=${parDir}/Analyses/grpAnalysis						# where output will be written (should match step3)


cd $outDir

3dttest++ \
-mask Intersection_GM_mask+tlrc \
-prefix GxYN \
-prefix_clustsim GxYN_clustsim \
-ETAC \
-ETAC_blur 6 8 10 \
-ETAC_opt name=NN1:NN1:2sid:pthr=0.01,0.005,0.001 \
-setA A sub-002 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/YNIN_stats_REML+tlrc[3] sub-003 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/YNIN_stats_REML+tlrc[3] sub-005 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/YNIN_stats_REML+tlrc[3] sub-006 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/YNIN_stats_REML+tlrc[3] sub-008 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/YNIN_stats_REML+tlrc[3] sub-009 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/YNIN_stats_REML+tlrc[3] sub-013 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/YNIN_stats_REML+tlrc[3] sub-014 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/YNIN_stats_REML+tlrc[3] sub-018 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/YNIN_stats_REML+tlrc[3] sub-019 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/YNIN_stats_REML+tlrc[3] sub-021 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/YNIN_stats_REML+tlrc[3] sub-022 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/YNIN_stats_REML+tlrc[3] sub-032 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/YNIN_stats_REML+tlrc[3] sub-036 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/YNIN_stats_REML+tlrc[3] sub-037 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/YNIN_stats_REML+tlrc[3] sub-040 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/YNIN_stats_REML+tlrc[3] sub-042 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/YNIN_stats_REML+tlrc[3] sub-045 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/YNIN_stats_REML+tlrc[3] sub-046 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/YNIN_stats_REML+tlrc[3] sub-049 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/YNIN_stats_REML+tlrc[3] sub-051 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/YNIN_stats_REML+tlrc[3] sub-053 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/YNIN_stats_REML+tlrc[3] sub-055 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/YNIN_stats_REML+tlrc[3] \
-setB B sub-004 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/YNIN_stats_REML+tlrc[3] sub-007 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/YNIN_stats_REML+tlrc[3] sub-010 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/YNIN_stats_REML+tlrc[3] sub-011 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/YNIN_stats_REML+tlrc[3] sub-012 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/YNIN_stats_REML+tlrc[3] sub-018 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/YNIN_stats_REML+tlrc[3] sub-020 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/YNIN_stats_REML+tlrc[3] sub-022 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/YNIN_stats_REML+tlrc[3] sub-023 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/YNIN_stats_REML+tlrc[3] sub-024 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/YNIN_stats_REML+tlrc[3] sub-026 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/YNIN_stats_REML+tlrc[3] sub-035 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/YNIN_stats_REML+tlrc[3] sub-038 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/YNIN_stats_REML+tlrc[3] sub-039 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/YNIN_stats_REML+tlrc[3] sub-041 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/YNIN_stats_REML+tlrc[3] sub-044 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/YNIN_stats_REML+tlrc[3] sub-047 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/YNIN_stats_REML+tlrc[3] sub-048 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/YNIN_stats_REML+tlrc[3] sub-050 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/YNIN_stats_REML+tlrc[3] sub-052 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/YNIN_stats_REML+tlrc[3] sub-054 /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/YNIN_stats_REML+tlrc[3]



3dcopy GxYN_clustsim.NN1.ETACmask.global.2sid.5perc.nii.gz FINALall_GxYN+tlrc

mkdir etac_{extra,scripts,indiv}
mv *.sh etac_scripts
mv Group* etac_extra
mv Prior* etac_extra
mv global* etac_extra
mv *ETAC* etac_extra
