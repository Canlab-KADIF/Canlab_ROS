#! /bin/bash

PASSWD=1

ROS_DIR=/opt/ros/noetic
ROS_WS_DIR=/home/canlab/ros_ws

if [ `whoami` == "root" ]; then
	./set_max_freq.sh
else
	echo ${PASSWD} | sudo -S ./set_max_freq.sh
fi

if [ -d ${ROS_DIR} ]; then
	source ${ROS_DIR}/setup.bash
else
	echo "Abort!"
	echo "ROS not found"
	exit 1
fi


if [ -d ${ROS_WS_DIR} ]; then
	cd ${ROS_WS_DIR}
	source ${ROS_WS_DIR}/install/setup.bash
else
	echo "Abort!"
	echo "No such directory"
	exit 1
fi

if [ -d ${ROS_WS_DIR} ]; then
	cd ${ROS_WS_DIR}
	roslaunch clapp clapp_all.launch
	
	if [ $? -eq 1 ]; then
		echo "App launch failed"
		exit 1
	fi
else
	echo "Abort!"
	echo "No app"
	exit 1
fi
