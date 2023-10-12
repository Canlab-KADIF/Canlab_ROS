#!/bin/bash

cat <<EOF
************************************
*                                  *
*  CREATE NEW FOLDER NAME	    *
*                                  *
************************************
EOF

read name

BAG_DIR=~/$name

if [ -d ${BAG_DIR} ]; then
	echo "ALREADY EXIST FOLDER"
else
	`mkdir ${BAG_DIR}`
	echo "CREATE FOLDER"
fi

cat <<EOF
************************************
*                                  *
*  SET DURATION TIME      	    *
*                                  *
************************************
EOF

read duration

cat <<EOF
************************************
*                                  *
*  IF YOU WANT EXIT Rosbag         *
*  Enter Ctrl + C		    *
*                                  *
************************************
EOF

`rosbag record -o ~/$name/  --split --duration $duration --max-splits 3 -a`
