#! /usr/bin/env bash

#-----------------------------------------------------
# Check the prequisite environment variables are     -
# set.                                               -
#-----------------------------------------------------
if [ -z ${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL} ]; then
    echo "The environment variable INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL needs to be set. Exiting installation of cmake."
    exit 1
fi

if [ -z ${INSPIRE_TARGET_MACHINE} ]; then
    echo "The environment variable INSPIRE_TARGET_MACHINE needs to be set. Exiting installation of cmake."
    exit 1
fi

#-----------------------------------------------------
# Define the project top level directory.            -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL=${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}

#-----------------------------------------------------
# Define the directory path to the top level         -
# CMakeLists.txt file                                -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL_CMAKE=${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}/sources/cmake/cmake-3.13.3

#-----------------------------------------------------
# Define the install location of CMake.              -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX=${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}/sw/${INSPIRE_TARGET_MACHINE}/cmake

#-----------------------------------------------------
# Define the path to my python executable.           -
#                                                    -
#-----------------------------------------------------
MY_PYTHON_EXECUTABLE=$(which python3)

#-----------------------------------------------------
# Empty the cmake build directory.                   -
#                                                    -
#-----------------------------------------------------
build_dir=${PROJECT_TOP_LEVEL}/cmake_cmake_build_dir
if [ -d ${build_dir} ];then
    rm -rf ${build_dir}/*
else
    mkdir ${build_dir}
fi

#-----------------------------------------------------
# Change to the build directory and build cmake.     -
#                                                    -
#-----------------------------------------------------
cd ${build_dir}

cmake ${PROJECT_TOP_LEVEL_CMAKE} \
    -DCMAKE_INSTALL_PREFIX=${MY_INSTALL_PREFIX} \
    -DCMAKE_BUILD_TYPE=Release

if [ $? -eq 0 ];then
    make -j 8
fi

if [ $? -eq 0 ];then
    make install
fi
