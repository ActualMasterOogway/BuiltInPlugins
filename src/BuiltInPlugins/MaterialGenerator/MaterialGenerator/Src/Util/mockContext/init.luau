local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_ContextStack_0 = v5.ContextStack;
local l_ContextServices_0 = v2.ContextServices;
local l_TestHelpers_0 = v2.TestHelpers;
local l_StudioServices_0 = v3.Context.StudioServices;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v12 = require(l_Components_0.GenerationProvider);
local v13 = require(l_Components_0.GeneratedMaterialsProvider);
local v14 = require(l_Components_0.PluginSettingsProvider);
local v15 = require(l_Components_0.PreviewProvider);
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.MaterialPreviewController);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v18 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v19 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local v20 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v19(true), 
    l_StudioServices_0.mock()
};
if not v17() then
    local v21 = l_ContextServices_0.Store.new(v6.Store.new(v18, nil, {
        v6.thunkMiddleware
    }, nil));
    table.insert(v20, v21);
    table.insert(v20, v16.new(v21, true));
end;
return function(v22, v23) --[[ Line: 46 ]]
    -- upvalues: v17 (copy), v1 (copy), v4 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), l_TestHelpers_0 (copy), v20 (copy), l_ContextStack_0 (copy)
    assert(type(v22) == "table", "Expected story to be a table");
    if v17() then
        local v24 = v1.append({
            v4.createElement(v12), 
            v4.createElement(v13), 
            v4.createElement(v14), 
            v4.createElement(v15, {
                enabled = true
            })
        }, v23 or {});
        return l_TestHelpers_0.provideMockContext(v20, {
            ContextStack = v4.createElement(l_ContextStack_0, {
                providers = v24
            }, v22)
        });
    else
        return l_TestHelpers_0.provideMockContext(v20, v22);
    end;
end;