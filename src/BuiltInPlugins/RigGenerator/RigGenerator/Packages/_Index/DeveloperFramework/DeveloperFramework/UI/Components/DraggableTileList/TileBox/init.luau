local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_UI_0 = l_Parent_0.UI;
local v3 = require(l_UI_0.Components.Image);
local v4 = require(l_UI_0.Components.Pane);
local v5 = require(l_UI_0.Components.TextLabel);
local v6 = v1.PureComponent:extend("TileBox");
v6.render = function(v7) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v7.props;
    local l_Tile_0 = l_props_0.Tile;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement(v4, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, {
        Icon = if l_Tile_0.icon then v1.createElement(v3, l_Tile_0.icon) else nil, 
        Text = v1.createElement(v5, {
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 2, 
            Text = l_Tile_0.Text, 
            TextXAlignment = l_Style_0.TextXAlignment or Enum.TextXAlignment.Center
        })
    });
end;
return v6;