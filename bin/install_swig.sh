#! /usr/bin/env bash

#-----------------------------------------------------
# Define the project top level directory.            -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL=${INSPIRE_PROJECT_TOP_LEVEL}

#-----------------------------------------------------
# Define the directory path to the top level         -
# swig directory.                                    -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL_SWIG=${INSPIRE_PROJECT_TOP_LEVEL}/sources/swig-3.0.5

#-----------------------------------------------------
# Define the install location of swig.               -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX=${INSPIRE_PROJECT_TOP_LEVEL}/sw/${INSPIRE_TARGET_MACHINE}/swig
if [ -d ${MY_INSTALL_PREFIX} ];then
    rm -rf ${MY_INSTALL_PREFIX}/*
else
    mkdir ${MY_INSTALL_PREFIX}
fi

#-----------------------------------------------------
# Define the path to my python executable.           -
#                                                    -
#-----------------------------------------------------
MY_PYTHON_EXECUTABLE=$(which python3)

#-----------------------------------------------------
# Change to the top level swig directory.      .     -
#                                                    -
#-----------------------------------------------------
cd ${PROJECT_TOP_LEVEL_SWIG}

./configure CC=mpicc \
            CXX=mpiCC \
            --prefix=${MY_INSTALL_PREFIX} \
            --with-python3=${MY_PYTHON_EXECUTABLE}


if [ $? -eq 0 ]; then
    make
fi

if [ $? -eq 0 ]; then
    make install
fi



