local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_SummaryReporter_0 = require(l_Parent_1.JestReporters).SummaryReporter;
return require(l_Parent_0.JestReporterAdapter).createReporter(l_SummaryReporter_0.new({
    rootDir = "", 
    useStderr = false
}));