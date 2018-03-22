#!/bin/bash

PACKAGE=${1}

bitbake -c cleansstate ${PACKAGE}
bitbake ${PACKAGE}
