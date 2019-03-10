-- -*- lua -*-

whatis([[Name : cmake]])
whatis([[Version : 3.13.3]])
whatis([[Short description : A cross-platform, open-source build system. CMake is a family of tools designed to build, test and package software.]])

help([[A cross-platform, open-source build system. CMake is a family of tools
designed to build, test and package software.]])

local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL")
local my_target_machine = os.getenv("INSPIRE_TARGET_MACHINE")
local basepath = pathJoin(my_inspire_project_top_level,"sw",my_target_machine,"cmake")

setenv("OLCF_CMAKE_ROOT", basepath)
prepend_path("PATH", pathJoin(basepath,"bin"), ":")
prepend_path("ACLOCAL_PATH", pathJoin(basepath,"share","aclocal"), ":")
prepend_path("CMAKE_PREFIX_PATH", basepath, ":")

