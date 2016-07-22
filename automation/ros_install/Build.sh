#!/bin/bash
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/workspace/ros/arm_ros_catkin_ws/rostoolchain.cmake
