#! /usr/bin/env bash

#-----------------------------------------------------
# This file sets key environment variables.          -
#                                                    -
# Source this file before loading any Inspire        -
# project modules.                                   -
#-----------------------------------------------------
export INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL=/gpfs/alpine/proj-shared/bip178/Inspire_Project_Software
export INSPIRE_TARGET_MACHINE="Summit"

module use ${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}/${INSPIRE_TARGET_MACHINE}
