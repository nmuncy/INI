#!/bin/bash


####### HI there back

### --- Notes
#
# 1) this script will construct T1, T2, EPI data and organize output
#		according to BIDS formatting
#
# 2) written so you can just update $subjList and rerun the whole script



###??? change these variables/arrays
parDir=~/compute
rawDir=${parDir}/SleepBrain_raw_BIDS						# location of raw data
workDir=${parDir}/SleepBrain_BIDS							# desired working directory

subjList=(011 018)											# list of subjects
session=SleepBrain											# scanning session - for raw data organization (ses-STT)
task=task-sb												# name of task, for epi data naming

epiDirs=(Chatroom2)											# epi dicom directory name/prefix
t1Dir=t1													# t1 ditto



### set up BIDS parent dirs
for i in derivatives sourcedata stimuli; do
	if [ ! -d ${workDir}/$i ]; then
		mkdir -p ${workDir}/$i
	fi
done



for i in ${subjList[@]}; do

	### set up BIDS data dirs
	anatDir=${workDir}/rawdata/sub-${i}/anat
	funcDir=${workDir}/rawdata/sub-${i}/func
	derivDir=${workDir}/derivatives/sub-${i}

	if [ ! -d $anatDir ]; then
		mkdir -p $anatDir $funcDir $derivDir
	fi


	### construct data
	dataDir=${rawDir}/sub-${i}/ses-${session}/dicom

	# t1 data
	if [ ! -f ${anatDir}/sub-${i}_T1w.nii.gz ]; then
		dcm2niix -b y -ba y -z y -o $anatDir -f sub-${i}_T1w ${dataDir}/${t1Dir}*/
	fi


	# epi
	for j in ${!epiDirs[@]}; do
		pos=$(($j+1))
		if [ ! -f ${funcDir}/sub-${i}_${task}_run-${pos}_bold.nii.gz ]; then
			dcm2niix -b y -ba y -z y -o $funcDir -f sub-${i}_${task}_run-${pos}_bold ${dataDir}/${epiDirs[$j]}*/
		fi
	done
done
