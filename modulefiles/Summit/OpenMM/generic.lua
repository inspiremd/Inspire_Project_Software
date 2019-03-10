whatis([[ Version : A high performance toolkit for molecular simulation. Use it as a library, or as an application. 
         We include extensive language bindings for Python, C, C++, and even Fortran. The code is open source 
         and actively maintained on Github, licensed under MIT and LGPL. Part of the Omnia suite of tools for 
         predictive biomolecular simulation.]])

whatis([[Short description : A high performance toolkit for molecular simulation.]])

local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL")
local my_target_machine = os.getenv("INSPIRE_TARGET_MACHINE")
local basepath = pathJoin(my_inspire_project_top_level,"sw",my_target_machine,"OpenMM")

setenv("OLCF_OPENMM_ROOT", basepath)
prepend_path("PATH", pathJoin(basepath,"bin"), ":")
prepend_path("LD_LIBRARY_PATH", pathJoin(basepath,"lib"), ":" )
