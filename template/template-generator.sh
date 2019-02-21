#!/bin/bash

function Template_bash()
{
	if [[ -z ${1} ]]; then
		echo "Usage: ${0} <script name>"
		return -1
	fi

    _BASH_TEMPLATE_PATH=${TEMPLATE_PATH}/bash
    cp ${_BASH_TEMPLATE_PATH}/Bash_script.template ${1}
}

function Template_cmake()
{
    _OUTPUT=${PWD}/CMakeLists.txt
    _TYPE=${1}

	if [[ -z ${_TYPE} ]]; then
		echo "Usage: ${0} <lib|bin>"
		return -1
	fi

    _CMAKE_TEMPLATE_PATH=${TEMPLATE_PATH}/cmake
    cp ${_CMAKE_TEMPLATE_PATH}/CMakeLists_core.template ${_OUTPUT}
    cat ${_CMAKE_TEMPLATE_PATH}/CMakeLists_${_TYPE}.template >> ${_OUTPUT}
    cp ${_CMAKE_TEMPLATE_PATH}/build.sh ${PWD}
}

function Template_zephyr()
{
    _TEMPLATE_PATH=${TEMPLATE_PATH}/zephyr

    cp -r ${_TEMPLATE_PATH}/* ${PWD}
}
