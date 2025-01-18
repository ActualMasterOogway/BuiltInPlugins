local l_ImprovePluginSpeed_LayeredClothingEditor_0 = game:GetFastFlag("ImprovePluginSpeed_LayeredClothingEditor");
local l_Parent_0 = script.Parent.Parent;
local v2 = nil;
local v3 = nil;
if not l_ImprovePluginSpeed_LayeredClothingEditor_0 then
    v2 = require(l_Parent_0.Packages.AvatarToolsShared);
    v3 = l_Parent_0.Packages.LuaMeshEditingModule;
end;
local v4 = require(l_Parent_0.Src.Util.DebugFlags);
local function _() --[[ Line: 13 ]] --[[ Name: runAvatarToolsSharedTests ]]
    -- upvalues: l_Parent_0 (copy), v2 (ref)
    local v5 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TextReporter_0 = v5.Reporters.TextReporter;
    local l_TeamCityReporter_0 = v5.Reporters.TeamCityReporter;
    local v8 = _G.TEAMCITY and l_TeamCityReporter_0 or l_TextReporter_0;
    v2.Util.runAvatarToolsSharedTests(v5, v8);
end;
local function _() --[[ Line: 23 ]] --[[ Name: runLuaMeshEditingModuleTests ]]
    -- upvalues: l_Parent_0 (copy), v3 (ref)
    local v10 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_TextReporter_1 = v10.Reporters.TextReporter;
    local l_TeamCityReporter_1 = v10.Reporters.TeamCityReporter;
    local v13 = _G.TEAMCITY and l_TeamCityReporter_1 or l_TextReporter_1;
    require(v3.Util.runLuaMeshEditingModuleTests)(v10, v13);
end;
local function _() --[[ Line: 34 ]] --[[ Name: runTests ]]
    -- upvalues: l_Parent_0 (copy)
    local v15 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_Src_0 = l_Parent_0.Src;
    v15.TestBootstrap:run({
        l_Src_0
    }, v15.Reporters.TextReporter);
end;
local function v20() --[[ Line: 44 ]] --[[ Name: runRhodiumTests ]]
    -- upvalues: l_Parent_0 (copy)
    local v18 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_RhodiumTests_0 = l_Parent_0.RhodiumTests;
    v18.TestBootstrap:run({
        l_RhodiumTests_0
    }, v18.Reporters.TextReporter, false, true);
end;
local v21 = v4.RunTests();
local v22 = v4.RunRhodiumTests();
if v21 then
    if l_ImprovePluginSpeed_LayeredClothingEditor_0 then
        v2 = require(l_Parent_0.Packages.AvatarToolsShared);
        v3 = l_Parent_0.Packages.LuaMeshEditingModule;
    end;
    print("----- All " .. script.Parent.Parent.Name .. " Tests ------");
    require(script.Parent.defineLuaFlags);
    local v23 = require(l_Parent_0.Packages.Dev.TestEZ);
    local l_Src_1 = l_Parent_0.Src;
    v23.TestBootstrap:run({
        l_Src_1
    }, v23.Reporters.TextReporter);
    print("----------------------------------");
    print("----- All AvatarToolsShared Tests ------");
    v23 = require(l_Parent_0.Packages.Dev.TestEZ);
    l_Src_1 = v23.Reporters.TextReporter;
    local l_TeamCityReporter_2 = v23.Reporters.TeamCityReporter;
    local v26 = _G.TEAMCITY and l_TeamCityReporter_2 or l_Src_1;
    v2.Util.runAvatarToolsSharedTests(v23, v26);
    print("----------------------------------");
    print("----- All LuaMeshEditingModule Tests ------");
    v23 = require(l_Parent_0.Packages.Dev.TestEZ);
    l_Src_1 = v23.Reporters.TextReporter;
    l_TeamCityReporter_2 = v23.Reporters.TeamCityReporter;
    v26 = _G.TEAMCITY and l_TeamCityReporter_2 or l_Src_1;
    require(v3.Util.runLuaMeshEditingModuleTests)(v23, v26);
    print("----------------------------------");
end;
if v22 then
    print("----- All " .. script.Parent.Parent.Name .. " Rhodium Tests ------");
    v20();
    print("----------------------------------");
end;
if v21 or v22 then
    game:GetService("ProcessService"):ExitAsync(0);
end;