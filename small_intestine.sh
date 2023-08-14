#!/bin/bash

# This is a simple Bash script to run a command

# Replace 'your-command-here' with the actual command you want to run
your_command="./EndoSLAM/small_intestine_high ./Vocabulary/ORBvoc.txt ./EndoSLAM/HighCam/SmallIntestine/EndoSLAM.yaml ../../../mnt/hgfs/Documents/HighCam/Small\ Intestine/TumorfreeTrajectory_1/Frames ./EndoSLAM/HighCam/SmallIntestine/timestamp.txt highcam_small_intestine1"

# Run the command
$your_command
