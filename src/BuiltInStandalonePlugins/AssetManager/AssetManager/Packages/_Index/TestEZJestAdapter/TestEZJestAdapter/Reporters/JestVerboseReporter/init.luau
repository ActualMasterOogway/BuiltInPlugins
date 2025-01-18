local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_VerboseReporter_0 = require(l_Parent_1.JestReporters).VerboseReporter;
return require(l_Parent_0.JestReporterAdapter).createReporter(l_VerboseReporter_0.new({
    rootDir = "", 
    useStderr = false
}));