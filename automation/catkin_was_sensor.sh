#!/bin/bash
mkdir ./catkin_ws/src
cd ./catkin_ws/src
catkin_init_workspace
catkin_create_pkg was_sensor std_msgs sensor_msgs roscpp rospy
