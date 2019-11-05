#!/bin/bash

#SBATCH --time=01:00:00   # walltime
#SBATCH --ntasks=2   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4gb   # memory per CPU core
#SBATCH -J "TS6"   # job name

# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE




# Written by Nathan Muncy on 11/4/19



### Set variables
parDir=~/compute/SleepBrain_BIDS
workDir=${parDir}/derivatives
roiDir=${parDir}/Analyses/roiAnalysis
grpDir=${parDir}/Analyses/grpAnalysis
refFile=${workDir}/sub-002/YNIN_stats_REML+tlrc

tempDir=~/bin/Templates/vold2_mni    				# Location of template/priors
jlfDir=${tempDir}/priors_JLF						# Priors dir


mkdir -p $roiDir


# JLF ROIs
jlfFlag=1											# 1=on
roiList=(0018 0054)									# JLF label number
roiName=(LAmyg RAmyg)								# prefix string for ROI
roiLen=${#roiList[@]}


# Coordinate seeds
coordFlag=1											# 1=on
coordList=("-16 4 -7" "-11 -27 8")					# array of desired coordinates
coordName=(L_VS_Amyg L_Thal)						# prefix strings for seeds
seedSize=5      									# Desired size (mm) of radius
coordLen=${#coordList[@]}


# Determine exclude list
arrRem=(`cat ${grpDir}/info_rmSubj_YNIN.txt`)		# list of people who moved too much, output of Task_step3



### Functions
MatchString (){
	local e match="$1"
	shift
	for e; do [[ "$e" == "$match" ]] && return 0; done
	return 1
}



### Pull JLF Betas
if [ $jlfFlag == 1 ]; then

	cd $roiDir
	c=0; while [ $c -lt ${#roiList[@]} ]; do

		name=${roiName[$c]}
		ROI=JLF_${name}+tlrc

		print=${roiDir}/Betas_${ROI}.txt
		> $print


		# make JLF mask
		if [ ! -f ${ROI}.HEAD ]; then

			c3d ${jlfDir}/label_${roiList[$c]}.txt -thresh 0.3 1 1 0 -o tmp_thresh_${name}.nii.gz
		    3dfractionize -template $refFile -input tmp_thresh_${name}.nii.gz-prefix tmp_res_${name}
		    3dcalc -a tmp_res_${name}+tlrc -prefix $ROI -expr "step(a)" && rm tmp*
		fi


		# pull betas for JLF mask from e/subj. exclude noisy participants
		for i in ${workDir}/sub*; do

			subj=${i##*\/}
			MatchString "$subj" "${arrRem[@]}"
			if [ $? == 1 ]; then

				file=YNIN_stats_REML+tlrc
				stats=`3dROIstats -mask $ROI "${file}[1,3,5,7]"
				echo "$subj $stats" >> $print
			fi
		done
		let c+=1
	done
fi



### Pull Coord Betas
if [ $coordFlag == 1 ]; then

	cd $roiDir
	c=0; while [ $c -lt ${#coordList[@]} ]; do

		seedName=Seed_${coordName[$c]}
		print=${roiDir}/Betas_${seedName}.txt
		> $print

		# make seed mask
		if [ ! -f ${seedName}+tlrc.HEAD ]; then
			echo ${coordList[$c]} > ${seedName}.txt
			3dUndump -prefix $seedName -master $refFile -srad $seedSize -xyz ${seedName}.txt
		fi

		# pull betas for e/seed mask
		for i in ${workDir}/sub*; do

			subj=${i##*\/}
			MatchString "$subj" "${arrRem[@]}"
			if [ $? == 1 ]; then

				file=YNIN_stats_REML+tlrc
				stats=`3dROIstats -mask ${seedName}+tlrc "${file}[1,3,5,7]"
				echo "$subj $stats" >> $print
			fi
		done
		let c+=1
	done
fi
