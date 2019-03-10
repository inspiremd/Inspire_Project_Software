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
# OpenMM CMakeLists.txt file                         -
#                                                    -
#-----------------------------------------------------
export PROJECT_TOP_LEVEL_CMAKE=${PROJECT_TOP_LEVEL}/sources/openmm
echo "PROJECT_TOP_LEVEL_CMAKE: ${PROJECT_TOP_LEVEL_CMAKE}"

#-----------------------------------------------------
# Define the install location of OpenMM.             -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX=${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}/sw/${INSPIRE_TARGET_MACHINE}/OpenMM

#-----------------------------------------------------
# Define the path to my python executable.           -
#                                                    -
#-----------------------------------------------------
MY_PYTHON_EXECUTABLE=$(which python3)

#-----------------------------------------------------
# Define the cmake build directory.                  -
#                                                    -
#-----------------------------------------------------
my_cmake_build_directory=${PROJECT_TOP_LEVEL}/openmm_cmake_build_directory

if [ -d ${my_cmake_build_directory} ];then
    rm -rf ${my_cmake_build_directory}
fi
mkdir -p ${my_cmake_build_directory}


cd ${my_cmake_build_directory}
cmake ${PROJECT_TOP_LEVEL_CMAKE} \
      -DOPENMM_BUILD_CUDA_LIB=ON \
      -DOPENNMM_CUDA_COMPILER=$(which nvcc) \
      -DCMAKE_INSTALL_PREFIX=${MY_INSTALL_PREFIX} \
      -DPYTHON_EXECUTABLE=${MY_PYTHON_EXECUTABLE} \
      -DCMAKE_C_COMPILER=mpicc \
      -DCMAKE_CXX_COMPILER=mpiCC

make -j 24
make install



