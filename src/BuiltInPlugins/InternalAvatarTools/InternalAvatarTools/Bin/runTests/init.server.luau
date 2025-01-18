local l_Parent_0 = script.Parent.Parent;
require(script.Parent.commonInit)();
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
if v1.RunningUnderCLI() or v1.RunTests() then
    local v2 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v2.TestBootstrap;
    local l_TeamCityReporter_0 = v2.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v2.Reporters.TextReporter;
    local v6 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    local l_Src_0 = l_Parent_0.Src;
    local v8 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v6, v8);
    print("----------------------------------");
end;
if v1.RunningUnderCLI() then
    pcall(function() --[[ Line: 31 ]]
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;