-- -*- lua -*-

help(
[[
This module loads the AmberTools18 software environment.
]])


-- Here we define AMBERHOME environmental variable.
local amber18_root_directory ="/gpfs/alpine/proj-shared/bip178/Inspire_Project_Software/sw/Summit/" 
local amberhome = pathJoin(amber18_root_directory,"amber18","cpu")
setenv("AMBERHOME",amberhome)

-- Here we add the bin path for Amber.
local amberhomebin = pathJoin(amber18_root_directory,"amber18","cpu","bin")
prepend_path("PATH",amberhomebin,":")

-- Here we add the lib directory to LD_LIBRARY_PATH
local amberhomelib = pathJoin(amber18_root_directory,"amber18","cpu","lib64")
prepend_path("LD_LIBRART_PATH",amberhomelib,":")

-- Here we add the include directory to C_INCLUDE_PATH and CPLUS_INCLUDE_PATH.
local amberhomeinc = pathJoin(amber18_root_directory,"amber18","cpu","include")
prepend_path("C_INCLUDE_PATH",amberhomeinc,":")
prepend_path("CPLUS_INCLUDE_PATH",amberhomeinc,":")

LmodMessage("The following environmental variables are set: \n\n")
LmodMessage("AMBERHOME: ", os.getenv("AMBERHOME"),'\n')
