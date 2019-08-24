#!/bin/bash

#SBATCH --time=10:00:00   # walltime
#SBATCH --ntasks=6   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=8gb   # memory per CPU core
#SBATCH -J "MVM_noCal"   # job name



# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



cd /fslhome/fslcollab165/compute/SleepBrain_BIDS/Analyses/grpAnalysis


module load r/3.6


3dMVM -prefix PartInt_FeedBack \
-jobs 6 \
-mask Intersection_GM_mask+tlrc \
-bsVars BSVARS \
-wsVars 'PartInt*FeedBack' \
-num_glt 6 \
-gltLabel 1 Group_PartInt -gltCode 1 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y -1*N' \
-gltLabel 2 Group_FeedBack -gltCode 2 'BSVARS: 1*Sleep -1*NoSleep FeedBack: 1*I -1*N' \
-gltLabel 3 Group_PYFN -gltCode 3 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y FeedBack: 1*N' \
-gltLabel 4 Group_PYFI -gltCode 4 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y FeedBack: 1*I' \
-gltLabel 5 Group_PNFN -gltCode 5 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*N FeedBack: 1*N' \
-gltLabel 6 Group_PNFI -gltCode 6 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*N FeedBack: 1*I' \
-dataTable \
Subj BSVARS PartInt FeedBack InputFile \
sub-002 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-002 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-002 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-002 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-003 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-003 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-003 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-003 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-004 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-004 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-004 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-004 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-005 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-005 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-005 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-005 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-006 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-006 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-006 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-006 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-007 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-007 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-007 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-007 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-008 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-008 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-008 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-008 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-009 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-009 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-009 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-009 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-010 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-010 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-010 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-010 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-011 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-011 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-011 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-011 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-012 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-012 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-012 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-012 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-013 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-013 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-013 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-013 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-014 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-014 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-014 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-014 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-015 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-015 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-015 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-015 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-017 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-017 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-017 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-017 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-018 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-018 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-018 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-018 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-019 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-019 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-019 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-019 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-020 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-020 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-020 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-020 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-021 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-021 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-021 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-021 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-022 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-022 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-022 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-022 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-023 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-023 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-023 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-023 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-024 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-024 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-024 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-024 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-026 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-026 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-026 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-026 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-027 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-027 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-027 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-027 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-030 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-030 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-030 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-030 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-032 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-032 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-032 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-032 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-033 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-033 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-033 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-033 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-034 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-034 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-034 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-034 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-035 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-035 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-035 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-035 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-036 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-036 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-036 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-036 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-037 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-037 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-037 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-037 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-038 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-038 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-038 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-038 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-039 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-039 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-039 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-039 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-040 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-040 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-040 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-040 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-041 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-041 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-041 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-041 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-042 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-042 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-042 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-042 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-043 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-043 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-043 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-043 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-044 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-044 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-044 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-044 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-045 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-045 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-045 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-045 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-046 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-046 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-046 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-046 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-047 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-047 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-047 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-047 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-048 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-048 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-048 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-048 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-049 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-049 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-049 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-049 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-050 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-050 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-050 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-050 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-051 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-051 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-051 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-051 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-052 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-052 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-052 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-052 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-053 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-053 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-053 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-053 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-054 Sleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-054 Sleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-054 Sleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-054 Sleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-055 NoSleep Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-055 NoSleep Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-055 NoSleep N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-055 NoSleep N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[7]' 
