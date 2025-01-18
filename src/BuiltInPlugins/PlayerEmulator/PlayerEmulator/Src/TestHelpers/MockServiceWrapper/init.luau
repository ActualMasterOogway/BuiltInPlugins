local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.createMainReducer);
local v4 = require(l_Parent_0.Packages.Http);
local v5 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v6 = require(l_Parent_0.Src.Resources.MakeTheme);
local v7 = require(l_Parent_0.Packages.Framework);
local l_MockPlugin_0 = v7.TestHelpers.Instances.MockPlugin;
local l_ContextServices_0 = v7.ContextServices;
local v10 = v1.Component:extend("MockServiceWrapper");
local function _() --[[ Line: 22 ]] --[[ Name: mockFocus ]]
    return Instance.new("ScreenGui");
end;
v10.render = function(v12) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_MockPlugin_0 (copy), v2 (copy), v3 (copy), v4 (copy), v6 (copy), v5 (copy), v1 (copy)
    local v13 = v12.props.localization or l_ContextServices_0.Localization.mock();
    local v14 = v12.props.plugin or l_MockPlugin_0.new();
    local v15 = v12.props.focusGui or Instance.new("ScreenGui");
    local l_storeState_0 = v12.props.storeState;
    local v17 = v2.Store.new(v3(), l_storeState_0, {
        v2.thunkMiddleware
    });
    local v18 = v4.Networking.mock();
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v14), 
        l_ContextServices_0.Focus.new(v15), 
        v6(), 
        v13, 
        l_ContextServices_0.Store.new(v17), 
        v5.new(v18), 
        l_ContextServices_0.Mouse.new(v14:GetMouse())
    }, v12.props[v1.Children]);
end;
return v10;