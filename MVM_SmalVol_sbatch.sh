#!/bin/bash

#SBATCH --time=10:00:00   # walltime
#SBATCH --ntasks=6   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=8gb   # memory per CPU core
#SBATCH -J "MVM_SV"   # job name



# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



cd /fslhome/fslcollab165/compute/SleepBrain_BIDS/Analyses/grpAnalysis


module load r/3.6


3dMVM -prefix SmalVol_PartInt_FeedBack_Calorie \
-jobs 6 \
-mask SmallVol_mask+tlrc \
-bsVars BSVARS \
-wsVars 'PartInt*FeedBack' \
-qvars Calorie \
-num_glt 6 \
-gltLabel 1 Group_PartInt -gltCode 1 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y -1*N' \
-gltLabel 2 Group_FeedBack -gltCode 2 'BSVARS: 1*Sleep -1*NoSleep FeedBack: 1*I -1*N' \
-gltLabel 3 Group_PYFN -gltCode 3 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y FeedBack: 1*N' \
-gltLabel 4 Group_PYFI -gltCode 4 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*Y FeedBack: 1*I' \
-gltLabel 5 Group_PNFN -gltCode 5 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*N FeedBack: 1*N' \
-gltLabel 6 Group_PNFI -gltCode 6 'BSVARS: 1*Sleep -1*NoSleep PartInt: 1*N FeedBack: 1*I' \
-dataTable \
Subj BSVARS Calorie PartInt FeedBack InputFile \
sub-002 NoSleep 2.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-002 NoSleep 2.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-002 NoSleep 2.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-002 NoSleep 2.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-002/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-003 NoSleep 21.5 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-003 NoSleep 21.5 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-003 NoSleep 21.5 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-003 NoSleep 21.5 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-003/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-004 Sleep -297.7 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-004 Sleep -297.7 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-004 Sleep -297.7 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-004 Sleep -297.7 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-004/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-005 NoSleep 268.5 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-005 NoSleep 268.5 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-005 NoSleep 268.5 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-005 NoSleep 268.5 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-005/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-006 NoSleep 52.1 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-006 NoSleep 52.1 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-006 NoSleep 52.1 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-006 NoSleep 52.1 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-006/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-007 Sleep -219.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-007 Sleep -219.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-007 Sleep -219.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-007 Sleep -219.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-007/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-008 NoSleep 14.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-008 NoSleep 14.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-008 NoSleep 14.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-008 NoSleep 14.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-008/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-009 NoSleep -293.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-009 NoSleep -293.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-009 NoSleep -293.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-009 NoSleep -293.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-009/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-010 Sleep 278.2 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-010 Sleep 278.2 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-010 Sleep 278.2 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-010 Sleep 278.2 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-010/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-011 Sleep 271.7 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-011 Sleep 271.7 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-011 Sleep 271.7 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-011 Sleep 271.7 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-011/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-012 Sleep 907.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-012 Sleep 907.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-012 Sleep 907.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-012 Sleep 907.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-012/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-013 NoSleep 270.1 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-013 NoSleep 270.1 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-013 NoSleep 270.1 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-013 NoSleep 270.1 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-013/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-014 NoSleep 178.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-014 NoSleep 178.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-014 NoSleep 178.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-014 NoSleep 178.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-014/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-015 Sleep 540.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-015 Sleep 540.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-015 Sleep 540.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-015 Sleep 540.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-015/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-017 Sleep 73.0 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-017 Sleep 73.0 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-017 Sleep 73.0 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-017 Sleep 73.0 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-017/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-018 NoSleep -145.7 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-018 NoSleep -145.7 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-018 NoSleep -145.7 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-018 NoSleep -145.7 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-018/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-019 NoSleep 739.9 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-019 NoSleep 739.9 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-019 NoSleep 739.9 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-019 NoSleep 739.9 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-019/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-020 Sleep -431.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-020 Sleep -431.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-020 Sleep -431.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-020 Sleep -431.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-020/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-021 NoSleep 59.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-021 NoSleep 59.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-021 NoSleep 59.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-021 NoSleep 59.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-021/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-022 Sleep -571.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-022 Sleep -571.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-022 Sleep -571.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-022 Sleep -571.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-022/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-023 Sleep 429.1 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-023 Sleep 429.1 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-023 Sleep 429.1 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-023 Sleep 429.1 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-023/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-024 Sleep -325.5 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-024 Sleep -325.5 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-024 Sleep -325.5 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-024 Sleep -325.5 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-024/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-026 Sleep 715.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-026 Sleep 715.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-026 Sleep 715.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-026 Sleep 715.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-026/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-027 NoSleep -363.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-027 NoSleep -363.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-027 NoSleep -363.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-027 NoSleep -363.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-027/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-030 NoSleep -217.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-030 NoSleep -217.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-030 NoSleep -217.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-030 NoSleep -217.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-030/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-032 NoSleep -666.7 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-032 NoSleep -666.7 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-032 NoSleep -666.7 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-032 NoSleep -666.7 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-032/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-033 Sleep 236.7 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-033 Sleep 236.7 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-033 Sleep 236.7 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-033 Sleep 236.7 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-033/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-034 NoSleep -149.2 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-034 NoSleep -149.2 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-034 NoSleep -149.2 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-034 NoSleep -149.2 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-034/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-035 Sleep -285.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-035 Sleep -285.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-035 Sleep -285.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-035 Sleep -285.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-035/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-036 NoSleep -13.3 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-036 NoSleep -13.3 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-036 NoSleep -13.3 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-036 NoSleep -13.3 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-036/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-037 NoSleep 254.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-037 NoSleep 254.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-037 NoSleep 254.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-037 NoSleep 254.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-037/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-038 Sleep 906.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-038 Sleep 906.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-038 Sleep 906.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-038 Sleep 906.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-038/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-039 Sleep -259.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-039 Sleep -259.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-039 Sleep -259.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-039 Sleep -259.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-039/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-040 NoSleep -52.1 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-040 NoSleep -52.1 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-040 NoSleep -52.1 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-040 NoSleep -52.1 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-040/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-041 Sleep -491.8 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-041 Sleep -491.8 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-041 Sleep -491.8 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-041 Sleep -491.8 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-041/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-042 NoSleep 260.5 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-042 NoSleep 260.5 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-042 NoSleep 260.5 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-042 NoSleep 260.5 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-042/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-043 Sleep -247.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-043 Sleep -247.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-043 Sleep -247.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-043 Sleep -247.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-043/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-044 Sleep 99.0 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-044 Sleep 99.0 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-044 Sleep 99.0 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-044 Sleep 99.0 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-044/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-045 NoSleep -371.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-045 NoSleep -371.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-045 NoSleep -371.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-045 NoSleep -371.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-045/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-046 NoSleep -719.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-046 NoSleep -719.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-046 NoSleep -719.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-046 NoSleep -719.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-046/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-047 Sleep -163.9 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-047 Sleep -163.9 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-047 Sleep -163.9 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-047 Sleep -163.9 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-047/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-048 Sleep -384.6 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-048 Sleep -384.6 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-048 Sleep -384.6 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-048 Sleep -384.6 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-048/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-049 NoSleep -88.3 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-049 NoSleep -88.3 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-049 NoSleep -88.3 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-049 NoSleep -88.3 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-049/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-050 Sleep 197.4 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-050 Sleep 197.4 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-050 Sleep 197.4 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-050 Sleep 197.4 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-050/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-051 NoSleep 357.1 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-051 NoSleep 357.1 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-051 NoSleep 357.1 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-051 NoSleep 357.1 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-051/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-052 Sleep -12.5 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-052 Sleep -12.5 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-052 Sleep -12.5 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-052 Sleep -12.5 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-052/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-053 NoSleep 128.2 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-053 NoSleep 128.2 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-053 NoSleep 128.2 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-053 NoSleep 128.2 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-053/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-054 Sleep -218.9 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-054 Sleep -218.9 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-054 Sleep -218.9 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-054 Sleep -218.9 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-054/'YNIN_stats_REML_blur6+tlrc[7]' \
sub-055 NoSleep -273.2 Y I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[1]' \
sub-055 NoSleep -273.2 Y N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[3]' \
sub-055 NoSleep -273.2 N I /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[5]' \
sub-055 NoSleep -273.2 N N /fslhome/fslcollab165/compute/SleepBrain_BIDS/derivatives/sub-055/'YNIN_stats_REML_blur6+tlrc[7]' 
