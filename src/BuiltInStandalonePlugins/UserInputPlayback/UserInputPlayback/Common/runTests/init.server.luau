local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    return game:GetService("StudioService"):HasInternalPermission();
end);
if l_status_0 and not l_result_0 then
    return;
else
    local v3 = require(l_Parent_0.Src.Util.DebugFlags);
    local v4 = nil;
    if v3.RunningUnderCLI() or v3.RunTests() then
        require(script.Parent.commonInit)();
        v4 = require(l_Parent_0.Packages.Framework);
        local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
        local l_TestBootstrap_0 = v5.TestBootstrap;
        local l_TeamCityReporter_0 = v5.Reporters.TeamCityReporter;
        local l_TextReporter_0 = v5.Reporters.TextReporter;
        local v9 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
        local l_Src_0 = l_Parent_0.Src;
        local v11 = {
            showTimingInfo = false, 
            testNamePattern = nil, 
            extraEnvironment = {}
        };
        print("----- All " .. l_Parent_0.Name .. " Tests ------");
        require(script.Parent.defineLuaFlags);
        l_TestBootstrap_0:run({
            l_Src_0
        }, v9, v11);
        print("----------------------------------");
        if v3.RunDeveloperFrameworkTests() then
            print("");
            print("----- All DeveloperFramework Tests ------");
            v4.TestHelpers.runFrameworkTests(v5, v9);
            print("----------------------------------");
        end;
    end;
    if v3.RunningUnderCLI() then
        pcall(function() --[[ Line: 55 ]]
            game:GetService("ProcessService"):ExitAsync(0);
        end);
    end;
    return;
end;