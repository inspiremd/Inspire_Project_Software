#! /usr/bin/env bash

#-----------------------------------------------------
# Define the project top level directory.            -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL=${INSPIRE_PROJECT_TOP_LEVEL}

#-----------------------------------------------------
# Define the directory path to the top level         -
# CMakeLists.txt file                                -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL_ICMAKE=${INSPIRE_PROJECT_TOP_LEVEL}/sources/icmake/icmake

#-----------------------------------------------------
# Define the install location of icMake.             -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX=${INSPIRE_PROJECT_TOP_LEVEL}/sw/${INSPIRE_TARGET_MACHINE}/icmake

#-----------------------------------------------------
# Change to the build directory and build cmake.     -
#                                                    -
#-----------------------------------------------------
cd ${PROJECT_TOP_LEVEL_ICMAKE}

./icm_prepare /
./icm_bootstrap [strip] x
./icm_install all ${MY_INSTALL_PREFIX}
rm -rf tmp
