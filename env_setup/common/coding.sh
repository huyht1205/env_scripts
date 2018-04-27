#!/bin/bash

function Refactor_rename()
{
    _OLD_NAME=${1}
    _NEW_NAME=${2}
    _SED_OPTS="-i --follow-symlinks"

    _FILE_LIST=(
        $(find . -name "*.cpp")
        $(find . -name "*.h")
    )

    for _f in ${_FILE_LIST[@]}; do
        sed ${_SED_OPTS} 's/'"${_OLD_NAME}"'/'"${_NEW_NAME}"'/g' ${_f}
    done
}