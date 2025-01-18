local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_Localization_0 = require(l_Parent_0.Packages.Framework).ContextServices.Localization;
local v4 = require(l_Parent_0.Src.Reducers.MainReducer);
local v5 = require(l_Parent_0.Src.TestHelpers.MockDraftsService);
local v6 = require(l_Parent_0.Src.TestHelpers.MockPlugin);
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local v8 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v9 = v1.Component:extend("MockServiceWrapper");
v9.render = function(v10) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_Localization_0 (copy), v6 (copy), v2 (copy), v4 (copy), v7 (copy), v1 (copy), v8 (copy)
    local v11 = v10.props.draftsService or v5.new(v5.TestCases.DEFAULT);
    local v12 = v10.props.localization or l_Localization_0.mock();
    local v13 = v10.props.plugin or v6.new();
    local l_storeState_0 = v10.props.storeState;
    local v15 = v2.Store.new(v4, l_storeState_0, {
        v2.thunkMiddleware
    });
    local v16 = v10.props.theme or v7(true);
    return v1.createElement(v8, {
        draftsService = v11, 
        localization = v12, 
        plugin = v13, 
        store = v15, 
        theme = v16
    }, v10.props[v1.Children]);
end;
return v9;