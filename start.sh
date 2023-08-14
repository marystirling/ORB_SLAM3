#!/bin/bash

# Check to see if artument provided
if [ $# -eq 0 ]; then
	echo "Usage: $0 <string from start_commands.txt>"
	exit 1
fi

user_input="$1"

# execute command based on corresponding argument
case "$user_input" in
	"hc_colon_t1")
		echo "Executing HighCam colon trajectory 1"
		./endoslam/Cameras/HighCam/Colon4/Traj1/hc_colon_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/HighCam/Colon4/Traj1/timestamp.txt hc_colon_t1
		;;
	"hc_colon_split_t1")
		echo "Executing HighCam colon trajectory 1 with split"
		./endoslam/Cameras/HighCam/Colon4/Split_Traj1/hc_colon_split_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/Split_t1/Frames ./endoslam/Cameras/HighCam/Colon4/Split_Traj1/timestamp.txt hc_colon_split_t1
		;;
	"hc_colon_t2")
		echo "Executing HighCam colon trajectory 2"
		./endoslam/Cameras/HighCam/Colon4/Traj2/hc_colon_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/HighCam/Colon4/Traj2/timestamp.txt hc_colon_t2
		;;
	"hc_colon_t3")
		echo "Executing HighCam colon trajectory 3"
		./endoslam/Cameras/HighCam/Colon4/Traj3/hc_colon_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/HighCam/Colon4/Traj3/timestamp.txt hc_colon_t3
		;;
	"hc_colon_t4")
		echo "Executing HighCam colon trajectory 4"
		./endoslam/Cameras/HighCam/Colon4/Traj4/hc_colon_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/HighCam/Colon4/Traj4/timestamp.txt hc_colon_t4
		;;
	"hc_colon_t5")
		echo "Executing HighCam colon trajectory 5"
		./endoslam/Cameras/HighCam/Colon4/Traj5/hc_colon_t5 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Colon-IV/TumorfreeTrajectory_5/Frames ./endoslam/Cameras/HighCam/Colon4/Traj5/timestamp.txt hc_colon_t5
		;;
	"hc_si_t1")
		echo "Executing HighCam small intestine trajectory 1"
		./endoslam/Cameras/HighCam/SmallIntestine/Traj1/hc_si_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Small\ Intestine/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/HighCam/SmallIntestine/Traj1/timestamp.txt hc_si_1
		;;
	"hc_si_t2")
		echo "Executing HighCam small intestine trajectory 2"
		./endoslam/Cameras/HighCam/SmallIntestine/Traj2/hc_si_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Small\ Intestine/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/HighCam/SmallIntestine/Traj2/timestamp.txt hc_si_t2
		;;
	"hc_si_t3")
		echo "Executing HighCam small intestine trajectory 3"
		./endoslam/Cameras/HighCam/SmallIntestine/Traj3/hc_si_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Small\ Intestine/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/HighCam/SmallIntestine/Traj3/timestamp.txt hc_si_t3
		;;
	"hc_si_t4")
		echo "Executing HighCam small intestine trajectory 4"
		./endoslam/Cameras/HighCam/SmallIntestine/Traj4/hc_si_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Small\ Intestine/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/HighCam/SmallIntestine/Traj4/timestamp.txt hc_si_t4
		;;
	"hc_si_t5")
		echo "Executing HighCam small intestine trajectory 5"
		./endoslam/Cameras/HighCam/SmallIntestine/Traj5/hc_si_t5 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Small\ Intestine/TumorfreeTrajectory_5/Frames ./endoslam/Cameras/HighCam/SmallIntestine/Traj5/timestamp.txt hc_si_t5
		;;
	"hc_stom1_t1")
		echo "Executing HighCam stomach I trajectory 1"
		./endoslam/Cameras/HighCam/Stomach1/Traj1/hc_stom1_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-I/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/HighCam/Stomach1/Traj1/timestamp.txt hc_stom1_t1
		;;
	"hc_stom1_t2")
		echo "Executing HighCam stomach I trajectory 2"
		./endoslam/Cameras/HighCam/Stomach1/Traj2/hc_stom1_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-I/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/HighCam/Stomach1/Traj2/timestamp.txt hc_stom1_t2
		;;
	"hc_stom1_t3")
		echo "Executing HighCam stomach I trajectory 3"
		./endoslam/Cameras/HighCam/Stomach1/Traj3/hc_stom1_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-I/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/HighCam/Stomach1/Traj3/timestamp.txt hc_stom1_t3
		;;
	"hc_stom1_t4")
		echo "Executing HighCam stomach I trajectory 4"
		./endoslam/Cameras/HighCam/Stomach1/Traj4/hc_stom1_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-I/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/HighCam/Stomach1/Traj4/timestamp.txt hc_stom1_t3
		;;
	"hc_stom2_t1")
		echo "Executing HighCam stomach II trajectory 1"
		./endoslam/Cameras/HighCam/Stomach2/Traj1/hc_stom2_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-II/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/HighCam/Stomach2/Traj1/timestamp.txt hc_stom2_t1
		;;
	"hc_stom2_t2")
		echo "Executing HighCam stomach II trajectory 2"
		./endoslam/Cameras/HighCam/Stomach2/Traj2/hc_stom2_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-II/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/HighCam/Stomach2/Traj2/timestamp.txt hc_stom2_t2
		;;
	"hc_stom2_t3")
		echo "Executing HighCam stomach II trajectory 3"
		./endoslam/Cameras/HighCam/Stomach2/Traj3/hc_stom2_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-II/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/HighCam/Stomach2/Traj3/timestamp.txt hc_stom2_t3
		;;
	"hc_stom2_t4")
		echo "Executing HighCam stomach II trajectory 4"
		./endoslam/Cameras/HighCam/Stomach2/Traj4/hc_stom2_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-II/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/HighCam/Stomach2/Traj4/timestamp.txt hc_stom2_t3
		;;
	"hc_stom3_t1")
		echo "Executing HighCam stomach III trajectory 1"
		./endoslam/Cameras/HighCam/Stomach3/Traj1/hc_stom3_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-III/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/HighCam/Stomach3/Traj1/timestamp.txt hc_stom3_t1
		;;
	"hc_stom3_t2")
		echo "Executing HighCam stomach III trajectory 2"
		./endoslam/Cameras/HighCam/Stomach3/Traj2/hc_stom3_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-III/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/HighCam/Stomach3/Traj2/timestamp.txt hc_stom3_t2
		;;
	"hc_stom3_t3")
		echo "Executing HighCam stomach III trajectory 3"
		./endoslam/Cameras/HighCam/Stomach3/Traj3/hc_stom3_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-III/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/HighCam/Stomach3/Traj3/timestamp.txt hc_stom3_t3
		;;
	"hc_stom3_t4")
		echo "Executing HighCam stomach III trajectory 4"
		./endoslam/Cameras/HighCam/Stomach3/Traj4/hc_stom3_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/HighCam/highcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/HighCam/Stomach-III/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/HighCam/Stomach3/Traj4/timestamp.txt hc_stom3_t3
		;; ######## end high cam
	#### start low cam
	"lc_colon_t1")
		echo "Executing LowCam colon trajectory 1"
		./endoslam/Cameras/LowCam/Colon4/Traj1/lc_colon_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Colon-IV/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/LowCam/Colon4/Traj1/timestamp.txt lc_colon_t1
		;;
	"lc_colon_t2")
		echo "Executing LowCam colon trajectory 2"
		./endoslam/Cameras/LowCam/Colon4/Traj2/lc_colon_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Colon-IV/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/LowCam/Colon4/Traj2/timestamp.txt lc_colon_t2
		;;
	"lc_colon_t3")
		echo "Executing LowCam colon trajectory 3"
		./endoslam/Cameras/LowCam/Colon4/Traj3/lc_colon_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Colon-IV/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/LowCam/Colon4/Traj3/timestamp.txt lc_colon_t3
		;;
	"lc_colon_t4")
		echo "Executing LowCam colon trajectory 4"
		./endoslam/Cameras/LowCam/Colon4/Traj4/lc_colon_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Colon-IV/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/LowCam/Colon4/Traj4/timestamp.txt lc_colon_t4
		;;
	"lc_colon_t5")
		echo "Executing LowCam colon trajectory 5"
		./endoslam/Cameras/LowCam/Colon4/Traj5/lc_colon_t5 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Colon-IV/TumorfreeTrajectory_5/Frames ./endoslam/Cameras/LowCam/Colon4/Traj5/timestamp.txt lc_colon_t5
		;;
	"lc_si_t1")
		echo "Executing LowCam small intestine trajectory 1"
		./endoslam/Cameras/LowCam/SmallIntestine/Traj1/lc_si_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Small\ Intestine/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/LowCam/SmallIntestine/Traj1/timestamp.txt lc_si_1
		;;
	"lc_si_t2")
		echo "Executing LowCam small intestine trajectory 2"
		./endoslam/Cameras/LowCam/SmallIntestine/Traj2/lc_si_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Small\ Intestine/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/LowCam/SmallIntestine/Traj2/timestamp.txt lc_si_t2
		;;
	"lc_si_t3")
		echo "Executing LowCam intestine trajectory 3"
		./endoslam/Cameras/LowCam/SmallIntestine/Traj3/lc_si_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Small\ Intestine/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/LowCam/SmallIntestine/Traj3/timestamp.txt lc_si_t3
		;;
	"lc_si_t4")
		echo "Executing LowCam small intestine trajectory 4"
		./endoslam/Cameras/LowCam/SmallIntestine/Traj4/lc_si_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Small\ Intestine/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/LowCam/SmallIntestine/Traj4/timestamp.txt lc_si_t4
		;;
	"lc_si_t5")
		echo "Executing LowCam small intestine trajectory 5"
		./endoslam/Cameras/LowCam/SmallIntestine/Traj5/lc_si_t5 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Small\ Intestine/TumorfreeTrajectory_5/Frames ./endoslam/Cameras/LowCam/SmallIntestine/Traj5/timestamp.txt lc_si_t5
		;;
	"lc_stom1_t1")
		echo "Executing LowCam stomach I trajectory 1"
		./endoslam/Cameras/LowCam/Stomach1/Traj1/lc_stom1_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-I/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/LowCam/Stomach1/Traj1/timestamp.txt lc_stom1_t1
		;;
	"lc_stom1_t2")
		echo "Executing LowCam stomach I trajectory 2"
		./endoslam/Cameras/LowCam/Stomach1/Traj2/lc_stom1_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-I/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/LowCam/Stomach1/Traj2/timestamp.txt lc_stom1_t2
		;;
	"lc_stom1_t3")
		echo "Executing LowCam stomach I trajectory 3"
		./endoslam/Cameras/LowCam/Stomach1/Traj3/lc_stom1_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-I/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/LowCam/Stomach1/Traj3/timestamp.txt lc_stom1_t3
		;;
	"lc_stom1_t4")
		echo "Executing LowCam stomach I trajectory 4"
		./endoslam/Cameras/LowCam/Stomach1/Traj4/lc_stom1_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-I/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/LowCam/Stomach1/Traj4/timestamp.txt lc_stom1_t3
		;;
	"lc_stom2_t1")
		echo "Executing LowCam stomach II trajectory 1"
		./endoslam/Cameras/LowCam/Stomach2/Traj1/lc_stom2_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-II/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/LowCam/Stomach2/Traj1/timestamp.txt lc_stom2_t1
		;;
	"lc_stom2_t2")
		echo "Executing LowCam stomach II trajectory 2"
		./endoslam/Cameras/LowCam/Stomach2/Traj2/lc_stom2_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-II/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/LowCam/Stomach2/Traj2/timestamp.txt lc_stom2_t2
		;;
	"lc_stom2_t3")
		echo "Executing LowCam stomach II trajectory 3"
		./endoslam/Cameras/LowCam/Stomach2/Traj3/lc_stom2_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-II/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/LowCam/Stomach2/Traj3/timestamp.txt lc_stom2_t3
		;;
	"lc_stom2_t4")
		echo "Executing LowCam stomach II trajectory 4"
		./endoslam/Cameras/LowCam/Stomach2/Traj4/lc_stom2_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-II/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/LowCam/Stomach2/Traj4/timestamp.txt lc_stom2_t3
		;;
	"lc_stom3_t1")
		echo "Executing LowCam stomach III trajectory 1"
		./endoslam/Cameras/LowCam/Stomach3/Traj1/lc_stom3_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-III/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/LowCam/Stomach3/Traj1/timestamp.txt lc_stom3_t1
		;;
	"lc_stom3_t2")
		echo "Executing LowCam stomach III trajectory 2"
		./endoslam/Cameras/LowCam/Stomach3/Traj2/lc_stom3_t2 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-III/TumorfreeTrajectory_2/Frames ./endoslam/Cameras/LowCam/Stomach3/Traj2/timestamp.txt lc_stom3_t2
		;;
	"lc_stom3_t3")
		echo "Executing LowCam stomach III trajectory 3"
		./endoslam/Cameras/LowCam/Stomach3/Traj3/lc_stom3_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-III/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/LowCam/Stomach3/Traj3/timestamp.txt lc_stom3_t3
		;;
	"lc_stom3_t4")
		echo "Executing LowCam stomach III trajectory 4"
		./endoslam/Cameras/LowCam/Stomach3/Traj4/lc_stom3_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/LowCam/lowcam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/LowCam/Stomach-III/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/LowCam/Stomach3/Traj4/timestamp.txt lc_stom3_t3
		;; ############## end low cam
	# starting miro cam
	"mc_colon_t1")
		echo "Executing MiroCam colon trajectory 1"
		./endoslam/Cameras/MiroCam/Colon3/Traj1/mc_colon3_t1 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorfreeTrajectory_1/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj1/timestamp.txt mc_colon_t1
		;; 
	"mc_colon_t3")
		echo "Executing MiroCam colon trajectory 3"
		./endoslam/Cameras/MiroCam/Colon3/Traj3/mc_colon3_t3 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorfreeTrajectory_3/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj3/timestamp.txt mc_colon_t3
		;; 
	"mc_colon_t4")
		echo "Executing MiroCam colon trajectory 4"
		./endoslam/Cameras/MiroCam/Colon3/Traj4/mc_colon3_t4 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorfreeTrajectory_4/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj4/timestamp.txt mc_colon_t4
		;; 
	"mc_colon_t5")
		echo "Executing MiroCam colon trajectory 5"
		./endoslam/Cameras/MiroCam/Colon3/Traj5/mc_colon3_t5 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorfreeTrajectory_5/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj5/timestamp.txt mc_colon_t5
		;; 
	"mc_colon_t6")
		echo "Executing MiroCam colon trajectory 6"
		./endoslam/Cameras/MiroCam/Colon3/Traj6/mc_colon3_t6 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorousTrajectory_6/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj6/timestamp.txt mc_colon_t6
		;;
	"mc_colon_t7")
		echo "Executing MiroCam colon trajectory 7"
		./endoslam/Cameras/MiroCam/Colon3/Traj7/mc_colon3_t7 ./Vocabulary/ORBvoc.txt ./endoslam/Cameras/MiroCam/mirocam.yaml ../../../mnt/hgfs/Documents/endoslam/Cameras/MiroCam/Colon-III\(L-shaped\)/TumorousTrajectory_7/Frames ./endoslam/Cameras/MiroCam/Colon3/Traj7/timestamp.txt mc_colon_t7
		;; ######## end miro cam
	#### starting unity cam
	"uc_colon")
		echo "Executing UnityCam colon"
		./endoslam/UnityCam/Colon/uc_colon ./Vocabulary/ORBvoc.txt ./endoslam/UnityCam/unitycam.yaml ../../../mnt/hgfs/Documents/endoslam/UnityCam/Colon/Frames ./endoslam/UnityCam/Colon/timestamp.txt uc_colon
		;;
	"uc_si")
		echo "Executing UnityCam small intestine"
		./endoslam/UnityCam/SmallIntestine/uc_si ./Vocabulary/ORBvoc.txt ./endoslam/UnityCam/unitycam.yaml ../../../mnt/hgfs/Documents/endoslam/UnityCam/Small\ Intestine/Frames ./endoslam/UnityCam/SmallIntestine/timestamp.txt uc_si
		;;
	
	"uc_stom")
		echo "Executing UnityCam stomach"
		./endoslam/UnityCam/Stomach/uc_stom ./Vocabulary/ORBvoc.txt ./endoslam/UnityCam/unitycam.yaml ../../../mnt/hgfs/Documents/endoslam/UnityCam/Stomach/Frames ./endoslam/UnityCam/Stomach/timestamp.txt uc_stom
		;;
	*)
		echo "Unknown command"
		;;
esac
