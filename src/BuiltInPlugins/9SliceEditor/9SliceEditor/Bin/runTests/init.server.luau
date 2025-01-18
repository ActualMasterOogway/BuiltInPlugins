local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineFlags);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return game:GetService("StudioService"):HasInternalPermission();
end);
if not l_status_0 or not l_result_0 then
    return;
else
    require(script.Parent.commonInit)();
    local v3 = require(l_Parent_0.Src.Util.DebugFlags);
    local v4 = nil;
    if v3.RunningUnderCLI() or v3.RunTests() then
        local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
        local l_TestBootstrap_0 = v5.TestBootstrap;
        local l_TeamCityReporter_0 = v5.Reporters.TeamCityReporter;
        local l_TextReporter_0 = v5.Reporters.TextReporter;
        v4 = require(l_Parent_0.Packages.Framework);
        local v9 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
        local l_Src_0 = l_Parent_0.Src;
        print("----- All " .. l_Parent_0.Name .. " Tests ------");
        local v11 = tick();
        l_TestBootstrap_0:run({
            l_Src_0
        }, v9);
        print(string.format("Completed in %.3f s", tick() - v11));
        print("----------------------------------");
        if v3.RunDeveloperFrameworkTests() then
            print("");
            print("----- All DeveloperFramework Tests ------");
            v4.TestHelpers.runFrameworkTests(v5, v9);
            print("----------------------------------");
        end;
    end;
    if v3.RunningUnderCLI() then
        pcall(function() --[[ Line: 45 ]]
            game:GetService("ProcessService"):ExitAsync(0);
        end);
    end;
    return;
end;