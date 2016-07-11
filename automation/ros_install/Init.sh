#!/bin/bash
rosinstall_generator ros_comm --rosdistro indigo --deps --wet-only --tar > ros_comm-wet.rosinstall
wstool init -j8 src ros_comm-wet.rosinstall
