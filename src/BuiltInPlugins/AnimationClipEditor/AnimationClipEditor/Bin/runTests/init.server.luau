require(script.Parent.defineLuaFlags);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local function _() --[[ Line: 6 ]] --[[ Name: getReporter ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v2 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_TeamCityReporter_0 = v2.Reporters.TeamCityReporter;
    local l_TextReporter_0 = v2.Reporters.TextReporter;
    return _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
end;
local function v12() --[[ Line: 14 ]] --[[ Name: runTests ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v6 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_Src_0 = l_script_FirstAncestor_0.Src;
    local l_TestBootstrap_0 = v6.TestBootstrap;
    local v9 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_TeamCityReporter_1 = v9.Reporters.TeamCityReporter;
    local l_TextReporter_1 = v9.Reporters.TextReporter;
    l_TestBootstrap_0:run({
        l_Src_0
    }, _G.TEAMCITY and l_TeamCityReporter_1 or l_TextReporter_1);
end;
local function v24() --[[ Line: 24 ]] --[[ Name: runRhodiumTests ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v13 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local v14 = require(l_script_FirstAncestor_0.RhodiumTests.TestHelpers);
    local l_RhodiumTests_0 = l_script_FirstAncestor_0.RhodiumTests;
    local l_TestBootstrap_1 = v13.TestBootstrap;
    local v17 = require(l_script_FirstAncestor_0.Src.test.RigCreator);
    local l_Dummy_0 = workspace:FindFirstChild("Dummy");
    while l_Dummy_0 ~= nil do
        l_Dummy_0:Destroy();
        l_Dummy_0 = workspace:FindFirstChild("Dummy");
    end;
    local v19 = v17.BuildAnthroRig("AnthroNormal");
    v19.Name = "Dummy";
    v19.HumanoidRootPart.Anchored = true;
    local v20 = require(l_script_FirstAncestor_0.Packages.Dev.TestEZ);
    local l_TeamCityReporter_2 = v20.Reporters.TeamCityReporter;
    local l_TextReporter_2 = v20.Reporters.TextReporter;
    local v23 = _G.TEAMCITY and l_TeamCityReporter_2 or l_TextReporter_2;
    v14.init(plugin);
    l_TestBootstrap_1:run({
        l_RhodiumTests_0
    }, v23, false, true);
    v19:Destroy();
end;
local v25 = v1.RunTests();
local v26 = v1.RunRhodiumTests();
if v25 then
    print("----- All " .. script.Parent.Parent.Name .. " Tests ------");
    v12();
    print("----------------------------------");
end;
if v26 then
    print("----- All " .. script.Parent.Parent.Name .. " Rhodium Tests ------");
    v24();
    print("----------------------------------");
    if v1.RunningUnderCLI() then
        game:GetService("ProcessService"):ExitAsync(0);
    end;
end;