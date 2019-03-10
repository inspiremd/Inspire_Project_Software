whatis([[Version : 1.1.2]])
whatis([[Short description : AutoDock Vina is an open-source program for doing molecular docking. It was designed and implemented by Dr. Oleg Trott in the Molecular Graphics Lab at The Scripps Research Institute. ]])

local my_inspire_project_top_level = os.getenv("INSPIRE_PROJECT_SOFTWARE_TOP_LEVEL")
local my_target_machine = os.getenv("INSPIRE_TARGET_MACHINE")
local basepath = pathJoin(my_inspire_project_top_level,"sw",my_target_machine,"AutoDocKVina")

setenv("OLCF_AUTODOCKVINA_ROOT", basepath)
prepend_path("PATH", pathJoin(basepath,"bin"), ":")
prepend_path("LD_LIBRARY_PATH", pathJoin(basepath,"lib"), ":" )
