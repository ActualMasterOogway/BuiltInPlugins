local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
require(script.Parent.commonInit)();
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v2 = nil;
if v1.RunningUnderCLI() or v1.RunTests() then
    v2 = require(l_script_FirstAncestor_0.Packages.Framework);
    local v3 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v3.TestBootstrap;
    local l_TeamCityReporter_0 = v3.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v3.Reporters.TextReporter;
    local v7 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    local l_Src_0 = l_script_FirstAncestor_0.Src;
    local v9 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_script_FirstAncestor_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v7, v9);
    print("----------------------------------");
    if v1.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v2.TestHelpers.runFrameworkTests(v3, v7);
        print("----------------------------------");
    end;
end;
if v1.RunningUnderCLI() then
    pcall(function() --[[ Line: 44 ]]
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;