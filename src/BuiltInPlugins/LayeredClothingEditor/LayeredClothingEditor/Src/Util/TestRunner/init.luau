local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModule_0 = l_Parent_0.Packages.LuaMeshEditingModule;
local v5 = require(l_LuaMeshEditingModule_0.Tools.PointTool);
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local l_Signals_0 = v3.Contexts.Signals;
local l_PreviewContext_0 = v3.Contexts.PreviewContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_AssetServiceWrapper_0 = v3.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v3.Contexts.StudioServiceWrapper;
local l_MannequinContext_0 = v3.Contexts.MannequinContext;
local v13 = require(l_Parent_0.Src.Resources.PluginTheme);
local v14 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v14.ContextServices;
local l_TestHelpers_0 = v14.TestHelpers;
local l_Http_0 = v14.Http;
local l_provideMockContext_0 = l_TestHelpers_0.provideMockContext;
local l_MockPlugin_0 = l_TestHelpers_0.Instances.MockPlugin;
local v20 = require(l_Parent_0.Src.Util.Constants);
local v21 = require(l_Parent_0.Src.Util.TestHelper);
local v22 = require(l_Parent_0.Src.Util.makePluginActions);
local v23 = require(l_Parent_0.Src.Util.makeMockNetworkLayer);
local v24 = require(l_Parent_0.Src.Reducers.MainReducer);
local v25 = require(l_Parent_0.Src.Components.LayeredClothingEditor);
local v26 = {};
local function v47(v27, v28, v29) --[[ Line: 36 ]] --[[ Name: run ]]
    -- upvalues: l_MockPlugin_0 (copy), v2 (copy), v24 (copy), l_Signals_0 (copy), v20 (copy), l_EditingItemContext_0 (copy), l_AssetServiceWrapper_0 (copy), l_StudioServiceWrapper_0 (copy), l_MannequinContext_0 (copy), v13 (copy), l_ContextServices_0 (copy), v3 (copy), v5 (copy), l_LuaMeshEditingModuleContext_0 (copy), l_PreviewContext_0 (copy), l_provideMockContext_0 (copy), l_Http_0 (copy), v23 (copy), v22 (copy), v1 (copy), v21 (copy)
    local v30 = l_MockPlugin_0.new();
    local v31 = {
        v2.thunkMiddleware
    };
    local v32 = v2.Store.new(v24, nil, v31);
    local v33 = l_Signals_0.new(v20.SIGNAL_KEYS);
    local v34 = l_EditingItemContext_0.new();
    local v35 = l_AssetServiceWrapper_0.mock();
    local v36 = l_StudioServiceWrapper_0.mock();
    local v37 = l_MannequinContext_0.mock();
    local v38 = v13.mock();
    local v39 = l_ContextServices_0.Localization.mock({
        libraries = {
            [v3.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v3.Resources.SourceStrings, 
                translationResourceTable = v3.Resources.LocalizedStrings
            }
        }
    });
    local v40 = v5.new();
    v40:setFalloff(v20.DEFAULT_FALLOFF);
    local v41 = l_LuaMeshEditingModuleContext_0.new({
        [v20.TOOL_MODE.Point] = v40
    });
    local v42 = l_PreviewContext_0.new();
    local v43 = l_provideMockContext_0({
        v38, 
        l_ContextServices_0.Analytics.mock(), 
        v39, 
        l_ContextServices_0.Store.new(v32), 
        l_ContextServices_0.API.new({
            networking = l_Http_0.Networking.mock({
                onRequest = v23
            })
        }), 
        l_ContextServices_0.Plugin.new(v30), 
        l_ContextServices_0.Mouse.new(v30:GetMouse()), 
        l_ContextServices_0.PluginActions.new(v30, v22(v30, v39)), 
        l_ContextServices_0.Focus.new(v28), 
        v33, 
        v34, 
        v42, 
        v41, 
        v35, 
        v36, 
        v37
    }, v27);
    local v44 = v1.mount(v43, v28);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 88 ]]
        -- upvalues: v29 (copy), v28 (copy), v32 (copy), v34 (copy), v30 (copy)
        if v29 then
            v29(v28, v32, v34, v30);
        end;
    end);
    v1.unmount(v44);
    v28:Destroy();
    v32:destruct();
    v21.cleanTempInstances();
    if not l_status_0 then
        error(l_result_0);
    end;
end;
v26.runTestMinimal = function(v48) --[[ Line: 104 ]] --[[ Name: runTestMinimal ]]
    -- upvalues: v21 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 105 ]]
        -- upvalues: v48 (copy)
        if v48 then
            v48();
        end;
    end);
    v21.cleanTempInstances();
    if not l_status_1 then
        error(l_result_1);
    end;
end;
v26.runComponentTest = function(v51, v52) --[[ Line: 118 ]] --[[ Name: runComponentTest ]]
    -- upvalues: v47 (copy)
    v47({
        test = v51
    }, Instance.new("ScreenGui"), v52);
end;
local function _() --[[ Line: 122 ]] --[[ Name: makeContainer ]]
    local v53 = Instance.new("ScreenGui", game.CoreGui);
    v53.Name = "PluginMockGui";
    v53.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    return v53;
end;
v26.runRhodiumTest = function(v55) --[[ Line: 129 ]] --[[ Name: runRhodiumTest ]]
    -- upvalues: v47 (copy), v1 (copy), v25 (copy)
    local l_v47_0 = v47;
    local v57 = {
        LayeredClothingEditor = v1.createElement(v25)
    };
    local v58 = Instance.new("ScreenGui", game.CoreGui);
    v58.Name = "PluginMockGui";
    v58.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_v47_0(v57, v58, v55);
end;
return v26;