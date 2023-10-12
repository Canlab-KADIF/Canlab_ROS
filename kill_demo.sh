#! /bin/bash

PASSWD=1

if [ `whoami` == "root" ]; then
	killall -2 roslaunch
	killall -2 nodelet
	killall -2 socketcan_bridg
else
	echo ${PASSWD} | sudo -S killall -2 roslaunch
	echo ${PASSWD} | sudo -S killall -2 nodelet
	echo ${PASSWD} | sudo -S killall -2 socketcan_bridg
fi

echo ' '
