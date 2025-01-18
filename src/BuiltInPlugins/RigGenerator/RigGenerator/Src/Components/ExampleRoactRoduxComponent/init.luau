local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Pane_0 = v3.UI.Pane;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.ExampleAction);
local l_Reducers_0 = l_Parent_0.Src.Reducers;
local _ = require(l_Reducers_0.ExampleReducer);
local v14 = v1.PureComponent:extend("ExampleRoactRoduxComponent");
v14.render = function(_) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy)
    return v1.createElement(l_Pane_0);
end;
v14 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14);
return v2.connect(function(v16, _) --[[ Line: 63 ]]
    return {
        DefaultStateObject = v16.DefaultStateObject
    };
end, function(v18) --[[ Line: 67 ]]
    -- upvalues: v11 (copy)
    return {
        dispatchExampleAction = function(v19) --[[ Line: 69 ]] --[[ Name: dispatchExampleAction ]]
            -- upvalues: v18 (copy), v11 (ref)
            v18(v11(v19));
        end
    };
end)(v14);