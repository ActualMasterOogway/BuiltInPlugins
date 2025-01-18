local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Element_0 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium).Element;
local v6 = require(l_script_FirstAncestor_0.RhodiumTests.Test);
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateRootInstance);
local v10 = {
    plugin = nil
};
v10.init = function(v11) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: l_Workspace_0 (copy), v10 (copy)
    assert(l_Workspace_0:FindFirstChild("Dummy"), "Rhodium Testing requires a 'Dummy' rig in Workspace.");
    v10.plugin = v11;
    v10.delay();
end;
v10.loadAnimation = function(v12, v13) --[[ Line: 26 ]] --[[ Name: loadAnimation ]]
    -- upvalues: l_Analytics_0 (copy), l_Localization_0 (copy), v7 (copy), v9 (copy), l_Workspace_0 (copy), v8 (copy)
    local v14 = l_Analytics_0.mock();
    local v15 = l_Localization_0.mock();
    v7.clearCache();
    v12:dispatch(v9(l_Workspace_0.Dummy, v14, v15));
    v12:dispatch(v8(v13, v14));
end;
v10.delay = function(v16) --[[ Line: 35 ]] --[[ Name: delay ]]
    wait(v16 or 0.1);
end;
v10.clickInstance = function(v17) --[[ Line: 39 ]] --[[ Name: clickInstance ]]
    -- upvalues: l_Element_0 (copy), v10 (copy)
    l_Element_0.new(v17):click();
    v10.delay();
end;
v10.runTest = function(v18) --[[ Line: 45 ]] --[[ Name: runTest ]]
    -- upvalues: v6 (copy), v10 (copy)
    local v19 = v6.new(v10.plugin);
    local v20, v21 = v19:run(v18);
    v19:destroy();
    if not v20 then
        error(v21);
    end;
end;
return v10;