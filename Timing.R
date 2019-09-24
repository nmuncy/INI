



# Written by Nathan Muncy on 2/25/19


### Usage
#
# Use this script by:
# a) Placing the script in the directory with the raw data (e.g. 002_Timing_files.txt)
# b) Navigating to the directory in terminal
# c) Typing the following in terminal: Rscript Timing.R desired_data.txt
#     e.g. Rscript Timing.R 002_Timing_files.txt
#
# This script will output several timing files:
#   002_TF_Stim_plus_Blk.txt  = time/duration of participant previous response + jitter time
#   002_TF_Blk.txt            = time/duration of Jitter time
#   002_TF_Fbk_all.txt        = time/duration of all peer responses (NOT & INT)
#   002_TF_Stim.txt           = time/duration of participant previous response
#   002_TF_GFbk.txt           = time/duration of rating screen
#   002_TF_Fbk_not.txt        = time/duration of feedback not interested
#   002_TF_Fbk_int.txt        = time/duration of feedback interested




### For testing
# workDir <- "~/Desktop/Kelsey/"
# data_raw <- read.delim(paste0(workDir,"002_Timing_files.txt"))
# h.string <- as.character("002_Timing_files.txt")

# workDir <- "~/Desktop/"
# data_raw <- read.delim(paste0(workDir,"003_CR_Run2-003-1.txt"))
# h.string <- as.character("003_CR_Run2-003-1.txt")

# args <- "003_CR_Run2-003-1.txt"




### Step1: Receive arguments from terminal, clean data
#
# Read in a txt file, and also set subj to be the first part of the
# file name (002_something.txt -> subj=002).
#
# Then, remove all empty rows and fix row names

args <- commandArgs(TRUE)
data_raw <- read.delim(args[1])
h.string <- as.character(args[1])


### Patchy patch for file oddities
if(dim(data_raw)[2] == 1){
  # data_raw <- read.delim(paste0(workDir,"003_CR_Run2-003-1.txt"), sep = " ")
  data_raw <- read.delim(args[1], sep = " ")
  data <- cbind(rep("hold",dim(data_raw)[1]),data_raw)
}else{
  data <- data_raw[!apply(is.na(data_raw) | data_raw == "", 1, all),]
}

subj <- gsub("_.*","",h.string)
row.names(data) <- 1:dim(data)[1]




### Step2: Create indices
#
# This will determine the location of certain strings in the dataframe.
# Multiple matches of grep (e.g. ind.hold) are cleaned up by
# removing every other line (ind.delete)

# onset times
ind.StimOnsetTime <- grep("Stm.OnsetTime:", data[,2])
ind.BlkOnseTime <- grep("Blk.OnsetTime:", data[,2])
ind.GiveFeedBack <- grep("GetFbk.OnsetTime:", data[,2])
ind.FixOT <- grep("Fix.OnsetTime:", data[,2])

ind.hold <- grep("Fbk.OnsetTime:", data[,2])
ind.delete <- seq(0,length(ind.hold),2)
ind.FBOnsetTime <- ind.hold[-ind.delete]

# durations
ind.SOT.dur <- grep("Stm.Duration:", data[,2])
ind.Blk.dur <- grep("BlkDur:", data[,2])
ind.FR.dur <- grep("Fix.Duration:", data[,2])

ind.FB.hold <- grep("Fbk.Duration:", data[,2])
ind.FB.dur <- ind.FB.hold[-ind.delete]

# peer/participant resonse
ind.PR <- grep("Ans:", data[,2])
ind.YN <- grep("yn:", data[,2])



### Step 3: Generate varables
#
# This will set a variable to hold the desired data at the position 
# in the indices from the previous step

h.SOT.s <- as.numeric(as.character(data[ind.StimOnsetTime,3]))
h.BOT.s <- as.numeric(as.character(data[ind.BlkOnseTime,3]))
h.FOT.s <- as.numeric(as.character(data[ind.FBOnsetTime,3]))
h.GOT.s <- as.numeric(as.character(data[ind.GiveFeedBack,3]))
h.FRT.s <- as.numeric(as.character(data[ind.FixOT,3]))

h.SOT.d <- as.numeric(as.character(data[ind.SOT.dur,3]))
h.BLK.d <- as.numeric(as.character(data[ind.Blk.dur,3]))
h.FBK.d <- as.numeric(as.character(data[ind.FB.dur,3]))
h.FRT.d <- as.numeric(as.character(data[ind.FR.dur,3]))

h.PR <- as.character(data[ind.PR,3])
h.YN <- as.character(data[ind.YN,3])

# determine start/end time
h.Start <- h.SOT.s[1]
if(data[dim(data)[1],1]=="hold"){
  hold.end <- grep("Goodbye.OnsetTime:",data[,2])
  h.End <- as.numeric(as.character(data[hold.end,3]))
}else{
  hold.end <- grep("Goodbye.OnsetTime:",data[,1])
  h.End <- as.numeric(as.character(data[hold.end,2]))
}




### Step 4: Solve for Get.Feedback and the Random Fixation (I hate whoever designed the study)
#
# This will determine the time between GetFBK.OnsetTime and the next Stim.OnsetTime
# accounting for whether or not a random fixation (Fix.OnsetTime) occurs.
# The various types of peer responses will also be recorded.
#
# TF3R.hold   = peer response per trial
# TF4R.hold   = participant response per trial
# h.GOT1.d    = Stim.OnsetTime - GetFbk.OnsetTime
# h.GOT2.d    = Fix.Duration
# h.GOTall.d  = h.GOT1.d + h.GOT2.d

TF4R.hold <- TF3R.hold <- h.GOT1.d <- NA
h.GOT2.d <- rep(0,60)
c60 <- c35 <- 0
for(i in 1:length(h.PR)){
  PR.h <- h.PR[i]
  if(nchar(PR.h)>1){
    c60<-c60+1
    if(c60 < 60){
      hold <- h.SOT.s[c60+1]-h.GOT.s[c60]
      h.GOT1.d <- c(h.GOT1.d, hold)
    }else{
      hold <- h.End-h.GOT.s[c60]
      h.GOT1.d <- c(h.GOT1.d, hold)
    }
    TF3R.hold <- c(TF3R.hold,PR.h)
    TF4R.hold <- c(TF4R.hold,h.YN[i])
  }else{
    c35<-c35+1
    hold <- h.FRT.d[c35]
    h.GOT2.d[c60] <- hold
  }
}
h.GOT1.d <- h.GOT1.d[-1]
TF3R.hold <- TF3R.hold[-1]
TF4R.hold <- TF4R.hold[-1]
h.GOTall.d <- h.GOT1.d+h.GOT2.d

# Fill YN response
for(i in 1:length(TF4R.hold)){
  if(nchar(TF4R.hold[i])==0){
    TF4R.hold[i] <- "YES"
  }
}




### Step 5: Figure out timing for each desired length of time
#
# Variables that store info in the xx:yyy format, where xx = start of event
# and yyy = duration of event
#
# *.Start.s = start time of event, rounded to nearest 0.1 seconds
# *.dur.s = duration of event, rounded to nearest 0.1 seconds
#
# SOT   = Stim.OnsetTime
# BOT   = Blk.OnsetTime
# FOT   = Fbk.OnsetTime
# GOT   = GetFbk.OnsetTime
# 
# TF1 = Stim.Duration + Blk.Duration (TF1=FOT-SOT  <- how I actually calculated TF1 - to account for computer lag)   
# TF2 = Blk.Duration (TF2=FOT-BOT <- how I actually calculated TF2)
# TF3 = Fbk.Duration (TF3=GOT-FOT <- how I atually calculated TF3)
# TF3a = not interested
# TF3b = interested

## Update 3/20
# TF4a = Y/N * Int/N, in SOT
# TF4b = Y/N * Int/N, in FOT

TF1.hold <- TF2.hold <- TF3.hold <- TF3a.hold <- TF3b.hold <- SOT.hold <- GOT.hold <- NA
for(h in c("a","b")){
  for(j in 1:4){
    assign(paste0("TF4",h,j,".hold"),NA)
  }
}

for(i in 1:length(h.SOT.s)){

  SOT.Start.s <- round(((h.SOT.s[i]-h.Start)/1000),1)+8
  BOT.Start.s <- round(((h.BOT.s[i]-h.Start)/1000),1)+8
  FOT.Start.s <- round(((h.FOT.s[i]-h.Start)/1000),1)+8
  GOT.Start.s <- round(((h.GOT.s[i]-h.Start)/1000),1)+8
  
  TF1.dur.s <- round((FOT.Start.s-SOT.Start.s),1)
  TF2.dur.s <- round((FOT.Start.s-BOT.Start.s),1)
  TF3.dur.s <- round((GOT.Start.s-FOT.Start.s),1)
  
  SOT.dur.s <- h.SOT.d[i]/1000
  GOT.dur.s <- round((h.GOT1.d[i]/1000),1)
  
  TF1.hold <- c(TF1.hold,paste0(SOT.Start.s,":",TF1.dur.s))
  TF2.hold <- c(TF2.hold,paste0(BOT.Start.s,":",TF2.dur.s))
  TF3.hold <- c(TF3.hold,paste0(FOT.Start.s,":",TF3.dur.s))
  SOT.hold <- c(SOT.hold,paste0(SOT.Start.s,":",SOT.dur.s))
  GOT.hold <- c(GOT.hold,paste0(GOT.Start.s,":",GOT.dur.s))
  
  if(TF3R.hold[i] == "NOT"){
    TF3a.hold <- c(TF3a.hold,paste0(FOT.Start.s,":",TF3.dur.s))
  }else{
    TF3b.hold <- c(TF3b.hold,paste0(FOT.Start.s,":",TF3.dur.s))
  }
  
  if(TF4R.hold[i] == "YES"){
    if(TF3R.hold[i] == "INTERESTED"){
      TF4a1.hold <- c(TF4a1.hold,paste0(SOT.Start.s,":",SOT.dur.s))
      TF4b1.hold <- c(TF4b1.hold,paste0(FOT.Start.s,":",TF3.dur.s))
    }else{
      TF4a2.hold <- c(TF4a2.hold,paste0(SOT.Start.s,":",SOT.dur.s))
      TF4b2.hold <- c(TF4b2.hold,paste0(FOT.Start.s,":",TF3.dur.s))
    }
  }else{
    if(TF3R.hold[i] == "INTERESTED"){
      TF4a3.hold <- c(TF4a3.hold,paste0(SOT.Start.s,":",SOT.dur.s))
      TF4b3.hold <- c(TF4b3.hold,paste0(FOT.Start.s,":",TF3.dur.s))
    }else{
      TF4a4.hold <- c(TF4a4.hold,paste0(SOT.Start.s,":",SOT.dur.s))
      TF4b4.hold <- c(TF4b4.hold,paste0(FOT.Start.s,":",TF3.dur.s))
    }
  }
}

for(j in c("TF1","TF2","TF3","TF3a","TF3b","SOT","GOT")){
  assign(paste0(j,".hold"),get(paste0(j,".hold"))[-1])
}

for(h in c("a","b")){
  for(j in 1:4){
    assign(paste0("TF4",h,j,".hold"),get(paste0("TF4",h,j,".hold"))[-1])
  }
}




### Step 6: Write Timing Files to current working directory

writeLines(TF1.hold, paste0(subj,"_TF_Stim_plus_Blk.txt"), sep = "\t")
writeLines(TF2.hold, paste0(subj,"_TF_Blk.txt"), sep = "\t")
writeLines(TF3.hold, paste0(subj,"_TF_Fbk_all.txt"), sep = "\t")
writeLines(SOT.hold, paste0(subj,"_TF_Stim.txt"), sep = "\t")
writeLines(GOT.hold, paste0(subj,"_TF_GFbk.txt"), sep = "\t")
writeLines(TF3a.hold, paste0(subj,"_TF_Fbk_not.txt"), sep = "\t")
writeLines(TF3b.hold, paste0(subj,"_TF_Fbk_int.txt"), sep = "\t")

writeLines(TF4a1.hold, paste0(subj,"_TF_SOT_YI.txt"), sep = "\t")
writeLines(TF4a2.hold, paste0(subj,"_TF_SOT_YN.txt"), sep = "\t")
writeLines(TF4a3.hold, paste0(subj,"_TF_SOT_NI.txt"), sep = "\t")
writeLines(TF4a4.hold, paste0(subj,"_TF_SOT_NN.txt"), sep = "\t")

writeLines(TF4b1.hold, paste0(subj,"_TF_FOT_YI.txt"), sep = "\t")
writeLines(TF4b2.hold, paste0(subj,"_TF_FOT_YN.txt"), sep = "\t")
writeLines(TF4b3.hold, paste0(subj,"_TF_FOT_NI.txt"), sep = "\t")
writeLines(TF4b4.hold, paste0(subj,"_TF_FOT_NN.txt"), sep = "\t")





