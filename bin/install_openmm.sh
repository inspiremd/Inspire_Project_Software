#! /usr/bin/env bash

#-----------------------------------------------------
# Define the project top level directory.            -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL=$(pwd)

#-----------------------------------------------------
# Define the directory path to the top level         -
# OpenMM CMakeLists.txt file                         -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL_CMAKE=${PROJECT_TOP_LEVEL}/openmm

#-----------------------------------------------------
# Define the install location of OpenMM.             -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX=/ccs/home/arnoldt/sw/summit/OpenMM

#-----------------------------------------------------
# Define the path to my python executable.           -
#                                                    -
#-----------------------------------------------------
MY_PYTHON_EXECUTABLE=/sw/summit/python/3.7/anaconda3/5.3.0/bin/python3.7

#-----------------------------------------------------
# Define the cmake build directory.                  -
#                                                    -
#-----------------------------------------------------
my_cmake_build_directory=${PROJECT_TOP_LEVEL}/cmake_build_directory

if [ -d ${my_cmake_build_directory} ];then
    rm -rf ${my_cmake_build_directory}
fi
mkdir -p ${my_cmake_build_directory}


cd ${my_cmake_build_directory}
cmake ${PROJECT_TOP_LEVEL_CMAKE} \
      -DOPENMM_BUILD_CUDA_LIB=ON \
      -DOPENNMM_CUDA_COMPILER=/sw/summit/cuda/9.2.148/bin/nvcc \
      -DCMAKE_INSTALL_PREFIX=${MY_INSTALL_PREFIX} \
      -DPYTHON_EXECUTABLE=${MY_PYTHON_EXECUTABLE} \
      -DCMAKE_C_COMPILER=mpicc \
      -DCMAKE_CXX_COMPILER=mpiCC

make -j 24
make install



