-- -*- lua -*-

whatis([[Name : icmake]])
whatis([[Version : generic]])
whatis([[Short description : A cross-platform, open-source build system.]])


local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_TOP_LEVEL")
local basepath = pathJoin(my_inspire_project_top_level,"sw","summit","icmake")

setenv("OLCF_ICMAKE_ROOT", basepath)
prepend_path("PATH", pathJoin(basepath,"usr","lib"), ":")
prepend_path("PATH", pathJoin(basepath,"usr","bin"), ":")
prepend_path("MANPATH", pathJoin(basepath,"usr","share","man"), ":")

