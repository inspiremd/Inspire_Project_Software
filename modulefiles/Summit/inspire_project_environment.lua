-- -*- lua -*-

help(
[[
This module loads the environment for the INSPIRE project"
]])



-- Here we define the top level of the INSPIRE software stack
local tmp_world_work = os.getenv("WORLDWORK")
local my_inspire_project_top_level = pathJoin(tmp_world_work,"stf006","arnoldt","Inspire_Project")
local my_inspire_project_bin = pathJoin(tmp_world_work,"stf006","arnoldt","Inspire_Project","bin")
local my_machine = "Summit"

-- We now define the dependent modules. 
local gcc_module = "gcc/8.1.1"
local cuda_module = "cuda/9.2.148"
local swig_module = my_machine .. "/swig/3.0.5"
local cmake_module = my_machine .. "/cmake/3.13.3"
local python_module = "python/3.7.0-anaconda3-5.3.0"
local boost_module = "boost/1.66.0"
local autodocvina_module = "autodocvina/1.1.2"

-- Load modules and set environmental variables. In general no edits 
-- should be needed below this comment. 

-- Export environmental variables. 
--
-- Critical note!
-- It is critial to export this variable before the dependent modules are loaded.
-- The environmental variable "INSPIRE_PROJECT_TOP_LEVEL" is needed by 
-- the other inspire modules to set proper paths to various packages, binaries, etc.
setenv("INSPIRE_PROJECT_TOP_LEVEL", my_inspire_project_top_level)

-- We set the environmental variable INSPIRE_TARGET_MACHINE to indicate 
-- which machine we are building for. This is done so as to prepare
-- for future mmachins such as Frontier.
setenv("INSPIRE_TARGET_MACHINE", my_machine)

-- Modify paths to Inspire project bin directory.
prepend_path("PATH",my_inspire_project_bin,":")

-- Load the modules
load(gcc_module)
load(cuda_module)
load(python_module)
load(boost_module)
load(swig_module)
load(cmake_module)
load(autodocvina_module)

-- Here we print the environmnetal that were set:
LmodMessage("The following environmental variables are set: \n\n")
LmodMessage("INSPIRE_PROJECT_TOP_LEVEL: ", os.getenv("INSPIRE_PROJECT_TOP_LEVEL"),'\n')
LmodMessage("INSPIRE_TARGET_MACHINE: ", os.getenv("INSPIRE_TARGET_MACHINE"),'\n')
LmodMessage("\n\n")

-- Here we print a summary of what was loaded
LmodMessage('The following is a summary of the modules that were loaded: \n\n')
if isloaded(gcc_module) then
    LmodMessage('GCC version: ', gcc_module, '\n')
end

if isloaded(cuda_module) then
    LmodMessage('CUDA version: ', cuda_module, '\n')
end

if isloaded(swig_module) then
    LmodMessage('Swig version: ', swig_module, '\n')
end

if isloaded(python_module) then
    LmodMessage('Python version: ', python_module, '\n')
end

if isloaded(cmake_module) then
    LmodMessage('CMAKE version: ', cmake_module, '\n')
end

if isloaded(autovinadoc_module) then
    LmodMessage('AutoDock Vina version: ', autodocvina_module, '\n')
end
