#! /usr/bin/env bash

#-----------------------------------------------------
# This file sets the environment                     -
# for building the core INSPIRE sofware stack on     -
# Summit:                                            -
#   CMake 3.13.3                                     -
#   OpenMM                                           -
#   Swig                                             -
#   AutoDoc Vina                                     -
#                                                    -
# We use CMake 3.11.3 building CMake 3.13.3.         -
# We use CMake 3.13.3 for building OpenMM.           -
#                                                    -
# Do not source this file for setting the INSPIRE    -
# production environment.                            -
#                                                    -
#-----------------------------------------------------
export INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL=/gpfs/alpine/proj-shared/bip178/Inspire_Project_Software
export INSPIRE_TARGET_MACHINE="Summit"


#-----------------------------------------------------
# These modules are supplied by the Summit           -
# programming environment.                           -
#                                                    -
#-----------------------------------------------------
export SUMMIT_GCC_MODULE="gcc/8.1.1"
export SUMMIT_CUDA_MODULE="cuda/9.2.148"
export SUMMIT_PYTHON_MODULE="python/3.7.0-anaconda3-5.3.0"
export SUMMIT_BOOST_MODULE="boost/1.66.0"

#-----------------------------------------------------
# This module is provided by the Inspire project.    -
# The Summit native programming environment does     -
# not supply this version of cmake.                  -
#                                                    -
#-----------------------------------------------------
export INSPIRE_CMAKE_MODULE="cmake/3.13.3"

#-----------------------------------------------------
# Set the programming environment.                   -
#                                                    -
#-----------------------------------------------------
module load ${SUMMIT_GCC_MODULE}
module load ${SUMMIT_CUDA_MODULE}
module load ${SUMMIT_PYTHON_MODULE}
module load ${SUMMIT_BOOST_MODULE}

module use modulefiles/${INSPIRE_TARGET_MACHINE}/core_modules
module load ${INSPIRE_CMAKE_MODULE}

