local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v4 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local v7 = require(l_Parent_0.Src.Networking.NetworkInterfaceMock);
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = v1.Component:extend("MockServiceWrapper");
v9.render = function(v10) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: l_Localization_0 (copy), v2 (copy), v6 (copy), v5 (copy), v7 (copy), v1 (copy), v4 (copy)
    local v11 = v10.props.localization or l_Localization_0.mock();
    local l_storeState_0 = v10.props.storeState;
    local v13 = v2.Store.new(v6, l_storeState_0, {
        v2.thunkMiddleware
    });
    local v14 = v10.props.theme or v5(true);
    local v15 = v10.props.networkInterface or v7.new();
    local v16 = v10.props.plugin or {};
    local v17 = v10.props.focusGui or {};
    local v18 = v10.props[v1.Children];
    return v1.createElement(v4, {
        localization = v11, 
        plugin = v16, 
        focusGui = v17, 
        networkInterface = v15, 
        store = v13, 
        theme = v14
    }, v18);
end;
return v9;