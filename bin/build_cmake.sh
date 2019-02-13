#! /usr/bin/env bash


#-----------------------------------------------------
# Define the top level for this project.             -
#                                                    -
#-----------------------------------------------------
export TOP_LEVEL=$(pwd)

#-----------------------------------------------------
# Define the location to the top level cmake file.   -
#                                                    -
#-----------------------------------------------------
export CMAKE_TOP_LEVEL=${TOP_LEVEL}/cmake-3.13.3

#-----------------------------------------------------
# Define the location to install cmake.              -
#                                                    -
#-----------------------------------------------------
my_install_dir=${INSPIRE_PROJECT_TOP_LEVEL}/sw/summit/cmake-3.13.3

#-----------------------------------------------------
# Emtpy the cmake build directory.                   -
#                                                    -
#-----------------------------------------------------
build_dir=${TOP_LEVEL}/build_dir
if [ -d ${build_dir}  ];then
    rm -rf ${build_dir}/*
fi

#-----------------------------------------------------
# Change to the build directory and build cmake.     -
#                                                    -
#-----------------------------------------------------
cd ${build_dir}

cmake ${CMAKE_TOP_LEVEL} \
    -DCMAKE_INSTALL_PREFIX=${my_install_dir} \
    -DCMAKE_BUILD_TYPE=Release

if [ $? -eq 0 ];then
    make
fi

if [ $? -eq 0 ];then
    make install
fi
