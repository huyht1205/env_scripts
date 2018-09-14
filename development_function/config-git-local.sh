#!/bin/bash

SCRIPT_DIR=$(dirname $(realpath ${0}))
GIT_CONF_DIR=${SCRIPT_DIR}/git
RUNNING_DIR=$(realpath ${PWD})
DEV_DIR=${RUNNING_DIR}/dev
GIT_CONF_LIST=(
    prepare-commit-msg git/hooks .git/hooks
)
GIT_CONF_SCRIPTS_LIST=(
    git_local_config.sh git/config
)


if [[ ! -e ${RUNNING_DIR}/.git ]]; then
    echo "ERROR: ${RUNNING_DIR} is not git repo"
    exit -1
fi

if [[ ! -e ${DEV_DIR} ]]; then
    mkdir -p ${DEV_DIR}
fi

cp -r ${GIT_CONF_DIR} ${DEV_DIR}/

for ((i=0; i < ${#GIT_CONF_LIST[@]}; i=i+3)); do
    _CONF=${GIT_CONF_LIST[i]}
    _SUBDIR=${GIT_CONF_LIST[i+1]}
    _DESTDIR=${GIT_CONF_LIST[i+2]}
    ln -sf ${DEV_DIR}/${_SUBDIR}/${_CONF} -t ${RUNNING_DIR}/${_DESTDIR}
done

for ((i=0; i < ${#GIT_CONF_SCRIPTS_LIST[@]}; i=i+2)); do
    _SCRIPT=${GIT_CONF_SCRIPTS_LIST[i]}
    _SUBDIR=${GIT_CONF_SCRIPTS_LIST[i+1]}
    bash ${DEV_DIR}/${_SUBDIR}/${_SCRIPT}
done
