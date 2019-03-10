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

my_build_directory="./build_cmake_autodocvina_summit"
if [ -d ${my_build_directory} ];then
    rm -rf ${my_build_directory}
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
export PROJECT_TOP_LEVEL_CMAKE=${PROJECT_TOP_LEVEL}/sources/autodock_vina
echo "PROJECT_TOP_LEVEL_CMAKE: ${PROJECT_TOP_LEVEL_CMAKE}"

#-----------------------------------------------------
# Define the install location of AutoDock_Vina.      -
#                                                    -
#-----------------------------------------------------
export MY_INSTALL_PREFIX="${INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL}/sw/${INSPIRE_TARGET_MACHINE}/AutoDockVina"
export AUTODOCVINA_BOOST_ROOT=${OLCF_BOOST_ROOT}
export AUTODOCVINA_INSTALLATION_PREFIX=${MY_INSTALL_PREFIX}
export CC=mpicc
export CXX=mpiCC

#-----------------------------------------------------
# Define the cmake build directory.                  -
#                                                    -
#-----------------------------------------------------
my_cmake_build_directory=${PROJECT_TOP_LEVEL}/autodockvina_cmake_build_directory

if [ -d ${my_cmake_build_directory} ];then
    rm -rf ${my_cmake_build_directory}
fi
mkdir -p ${my_cmake_build_directory}


cd ${my_cmake_build_directory}
cmake ${PROJECT_TOP_LEVEL_CMAKE} \
      -DCMAKE_C_COMPILER=${CC} \
      -DCMAKE_CXX_COMPILER=${CXX}

make
make install

