-- -*- lua -*-

whatis([[Name : swig]])
whatis([[Version : 3.0.5]])


local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL")
local my_target_machine = os.getenv("INSPIRE_TARGET_MACHINE")
local basepath = pathJoin(my_inspire_project_top_level,"sw",my_target_machine,"swig")

setenv("OLCF_SWIG_ROOT", basepath)
prepend_path("PATH", pathJoin(basepath, "bin"), ":")
prepend_path("MANPATH", pathJoin(basepath,"man"), ":")

