local l_ImprovePluginSpeed_ManageCollaborators_0 = game:GetFastFlag("ImprovePluginSpeed_ManageCollaborators");
local l_Parent_0 = script.Parent.Parent;
if not l_ImprovePluginSpeed_ManageCollaborators_0 then
    require(script.Parent.commonInit)();
end;
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local v3 = nil;
if not l_ImprovePluginSpeed_ManageCollaborators_0 then
    v3 = require(l_Parent_0.Packages.Framework);
end;
if v2.RunningUnderCLI() or v2.RunTests() then
    if l_ImprovePluginSpeed_ManageCollaborators_0 then
        require(script.Parent.commonInit)();
        v3 = require(l_Parent_0.Packages.Framework);
    end;
    local v4 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TestBootstrap_0 = v4.TestBootstrap;
    local l_TeamCityReporter_0 = v4.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v4.Reporters.TextReporter;
    local v8 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    local l_Src_0 = l_Parent_0.Src;
    local v10 = {
        showTimingInfo = false, 
        testNamePattern = nil, 
        extraEnvironment = {}
    };
    print("----- All " .. l_Parent_0.Name .. " Tests ------");
    l_TestBootstrap_0:run({
        l_Src_0
    }, v8, v10);
    print("----------------------------------");
    if v2.RunDeveloperFrameworkTests() then
        print("");
        print("----- All DeveloperFramework Tests ------");
        v3.TestHelpers.runFrameworkTests(v4, v8);
        print("----------------------------------");
    end;
end;
if v2.RunningUnderCLI() then
    pcall(function() --[[ Line: 56 ]]
        game:GetService("ProcessService"):ExitAsync(0);
    end);
end;