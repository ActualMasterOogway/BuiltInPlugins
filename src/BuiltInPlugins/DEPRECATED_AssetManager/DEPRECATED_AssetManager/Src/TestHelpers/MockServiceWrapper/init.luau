local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v4 = require(l_Parent_0.Src.TestHelpers.MockPlugin);
local v5 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = v1.Component:extend("MockServiceWrapper");
v8.getMockGlobals = function(v9) --[[ Line: 19 ]] --[[ Name: getMockGlobals ]]
    -- upvalues: l_Localization_0 (copy), v4 (copy), v2 (copy), v6 (copy), l_Parent_0 (copy)
    if not v9 then
        v9 = {};
    end;
    local v10 = v9.localization or l_Localization_0.mock();
    local v11 = v9.focusGui or Instance.new("ScreenGui");
    local v12 = v9.plugin or v4.new();
    local v13 = v9.mouse or v12:GetMouse();
    local l_storeState_0 = v9.storeState;
    local v15 = v2.Store.new(v6, l_storeState_0, {
        v2.thunkMiddleware
    });
    local v16 = v9.theme or require(l_Parent_0.Src.Resources.Theme)(true);
    return {
        focusGui = v11, 
        plugin = v12, 
        localization = v10, 
        theme = v16, 
        mouse = v13, 
        store = v15
    };
end;
v8.render = function(v17) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v1 (copy), v5 (copy)
    local v18 = v8.getMockGlobals(v17.props);
    return v1.createElement(v5, v18, v17.props[v1.Children]);
end;
return v8;