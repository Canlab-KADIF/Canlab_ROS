#! /bin/bash

PASSWD=1

if [ `whoami` == "root" ]; then
	killall -2 clpe_ros
	killall -2 nodelet
	killall -2 socketcan_bridg
	if [[ `pgrep -l rosbag | awk '{print $2}'` == "rosbag" ]]; then
		killall -2 rosbag	
	fi
	if [[ `pgrep -l roslaunch | awk '{print $2}'` == 'roslaunch' ]]; then
		killall -2 roslaunch	
	fi
else
	echo ${PASSWD} | sudo -S killall -2 clpe_ros
	echo ${PASSWD} | sudo -S killall -2 nodelet
	echo ${PASSWD} | sudo -S killall -2 socketcan_bridg
	if [[ `pgrep -l rosbag | awk '{print $2}'` == "rosbag" ]]; then
		echo ${PASSWD} | sudo -S killall -2 rosbag	
	fi
	if [[ `pgrep -l roslaunch | awk '{print $2}'` == 'roslaunch' ]]; then
		echo ${PASSWD} | sudo -S killall -2 roslaunch	
	fi
fi

echo ' '
