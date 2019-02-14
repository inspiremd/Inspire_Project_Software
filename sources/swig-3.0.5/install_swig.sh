#! /usr/bin/env bash

#-----------------------------------------------------
# Define the project's top level.                    -
#                                                    -
#-----------------------------------------------------
TOP_LEVEL=$(pwd)


#-----------------------------------------------------
# Define the installation directory.                 -
#                                                    -
#-----------------------------------------------------
MY_PREFIX=${HOME}/sw/summit/swig/

#-----------------------------------------------------
# Run the build command.                             -
#                                                    -
#-----------------------------------------------------
./configure --prefix=${MY_PREFIX}
make
make install
