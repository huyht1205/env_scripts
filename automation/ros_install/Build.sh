#!/bin/bash
if [[ -f ./rostoolchain.cmake ]]
then
	./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=./rostoolchain.cmake
else
	./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release
fi
