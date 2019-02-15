-- -*- lua -*-

whatis([[Name : yodl]])
whatis([[Version : 4.02.01 ]])

local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_TOP_LEVEL")
local basepath = pathJoin(my_inspire_project_top_level,"sw","yodl")

setenv("OLCF_YODL_ROOT",basepath )
