local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Box_0 = l_UI_0.Box;
local l_Components_0 = l_Parent_0.Src.Components;
local v10 = require(l_Components_0.InputPane);
local v11 = require(l_Components_0.RepopulatableHistory);
local v12 = v1.PureComponent:extend("EventEmulator");
v12.render = function(v13) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Container_0 (copy), l_Box_0 (copy), v10 (copy), v11 (copy)
    local l_Vertical_0 = v13.props.Stylizer.Layout.Vertical;
    return v1.createElement(l_Container_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Background = l_Box_0
    }, {
        Layout = v1.createElement("UIListLayout", l_Vertical_0), 
        InputPane = v1.createElement(v10), 
        History = v1.createElement(v11)
    });
end;
v12 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12);
return v2.connect(function(v15, _) --[[ Line: 39 ]]
    return {
        ActiveView = v15.Status.ActiveView
    };
end)(v12);