local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DebugFlags);
local v2 = nil;
require(script.Parent.defineLuaFlags);
if v1.RunningUnderCLI() or v1.RunTests() then
    require(script.Parent.commonInit)();
    v2 = require(l_Parent_0.Packages.Framework);
    local v3 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v3.TestBootstrap;
    local l_TeamCityReporter_0 = v3.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v3.Reporters.TextReporter;
    local v7 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    local l_Src_0 = l_Parent_0.Src;
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    l_TestBootstrap_0:run({
        l_Src_0
    }, v7);
    print("----------------------------------");
    if v1.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v2.TestHelpers.runFrameworkTests(v3, v7);
        print("----------------------------------");
    end;
end;
if v1.RunningUnderCLI() then
    pcall(function() --[[ Line: 41 ]]
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;