local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.Separator);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
return v1.createElement(v2, {
    AutomaticSize = Enum.AutomaticSize.XY, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    Layout = Enum.FillDirection.Vertical, 
    Spacing = 10
}, {
    v1.createElement(v4, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Text = "Line 1"
    }), 
    v1.createElement(v3, {}), 
    v1.createElement(v4, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Text = "Line 2"
    })
});