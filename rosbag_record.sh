#!/bin/bash

cat <<EOF
************************************
*                                  *
*  CREATE SAVE BAG FOLDER NAME     *
*                                  *
************************************
EOF

read name

BAG_DIR=/home/$USER/$name/

if [ -d ${BAG_DIR} ]; then
	echo "ALREADY EXIST FOLDER"
else
	`mkdir ${BAG_DIR}`
	echo "CREATE FOLDER"
fi

cat <<EOF
************************************
*                                  *
*  SET DURATION TIME (s/m/h)       *
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

`rosbag record -o ${BAG_DIR}/ --split --duration $duration --max-splits 3 -a`
