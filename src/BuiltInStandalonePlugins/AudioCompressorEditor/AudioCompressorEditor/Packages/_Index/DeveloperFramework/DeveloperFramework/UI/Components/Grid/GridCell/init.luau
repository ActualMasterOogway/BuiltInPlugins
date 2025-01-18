local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Components_0 = l_Parent_0.UI.Components;
local v3 = require(l_Components_0.Image);
local v4 = require(l_Components_0.Pane);
local v5 = require(l_Components_0.TextLabel);
local v6 = v1.PureComponent:extend("GridCell");
v6.render = function(v7) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v7.props;
    local l_Cell_0 = l_props_0.Cell;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement(v4, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_Style_0.GridCell.Padding, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        Spacing = l_Style_0.GridCell.Spacing
    }, {
        Icon = if l_Cell_0.icon then v1.createElement(v3, l_Cell_0.icon) else nil, 
        Text = v1.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Text = l_Cell_0.text
        })
    });
end;
return v6;