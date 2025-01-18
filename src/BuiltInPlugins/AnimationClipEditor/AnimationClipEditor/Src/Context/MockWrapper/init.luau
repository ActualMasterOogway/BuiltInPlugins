local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_ServiceWrapper_0 = v3.TestHelpers.ServiceWrapper;
local l_MockPlugin_0 = v3.TestHelpers.Instances.MockPlugin;
local v7 = require(l_script_FirstAncestor_0.Src.Context.MainProvider);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local v9 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local v11 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Util.CalloutController);
local v14 = v1.Component:extend("MockWrapper");
v14.getMockGlobals = function(v15) --[[ Line: 24 ]] --[[ Name: getMockGlobals ]]
    -- upvalues: l_Localization_0 (copy), l_MockPlugin_0 (copy), v2 (copy), v9 (copy), v8 (copy), l_ContextServices_0 (copy), v11 (copy), v12 (copy), v13 (copy), l_ServiceWrapper_0 (copy)
    if not v15 then
        v15 = {};
    end;
    local v16 = v15.localization or l_Localization_0.mock();
    local v17 = v15.focusGui or Instance.new("ScreenGui");
    v17.Name = "FocusGuiMock";
    if v15.Container then
        v17.Parent = v15.Container;
    end;
    local v18 = v15.plugin or l_MockPlugin_0.new();
    local v19 = v15.mouse or v18:GetMouse();
    local l_storeState_0 = v15.storeState;
    local v21 = v2.Store.new(v9, l_storeState_0, {
        v2.thunkMiddleware
    });
    local v22 = v15.theme or v8(true);
    local v23 = l_ContextServices_0.PluginActions.new(v18, {
        {
            id = "rerunLastStory", 
            text = "MOCK"
        }
    });
    local v24 = v11.new(v12.SIGNAL_KEYS);
    local v25 = l_ContextServices_0.Analytics.mock();
    local v26 = v13.new(l_ServiceWrapper_0.new("CalloutService", true):asService());
    return {
        focusGui = v17, 
        plugin = v18, 
        localization = v16, 
        theme = v22, 
        mouse = v19, 
        store = v21, 
        analytics = v25, 
        pluginActions = v23, 
        signals = v24, 
        calloutController = v26
    };
end;
v14.render = function(v27) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v1 (copy), v7 (copy)
    local v28 = v14.getMockGlobals(v27.props);
    return v1.createElement(v7, v28, v27.props[v1.Children]);
end;
return v14;