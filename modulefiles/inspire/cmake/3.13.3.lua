-- -*- lua -*-

whatis([[Name : cmake]])
whatis([[Version : 3.13.3]])
whatis([[Short description : A cross-platform, open-source build system. CMake is a family of tools designed to build, test and package software.]])

help([[A cross-platform, open-source build system. CMake is a family of tools
designed to build, test and package software.]])

local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_TOP_LEVEL")
local basepath = pathJoin(my_inspire_project_top_level,"sw","summit","cmake")

setenv("OLCF_CMAKE_ROOT", basepath)
prepend_path("PATH", basepath,"bin", ":")
prepend_path("ACLOCAL_PATH", basepath,"share/aclocal/", ":")
prepend_path("CMAKE_PREFIX_PATH", basepath, ":")

