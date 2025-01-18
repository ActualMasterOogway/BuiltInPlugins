local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_UI_0 = l_Parent_0.UI;
local v3 = require(l_UI_0.Components.Image);
local v4 = require(l_UI_0.Components.Pane);
local v5 = require(l_UI_0.Components.TextLabel);
local v6 = v1.PureComponent:extend("ListRow");
v6.render = function(v7) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v7.props;
    local l_Row_0 = l_props_0.Row;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement(v4, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        Spacing = l_Style_0.ListRow.Spacing, 
        Padding = l_Style_0.ListRow.Padding
    }, {
        Icon = if l_Row_0.icon then v1.createElement(v3, l_Row_0.icon) else nil, 
        Text = v1.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Text = l_Row_0.text
        })
    });
end;
return v6;