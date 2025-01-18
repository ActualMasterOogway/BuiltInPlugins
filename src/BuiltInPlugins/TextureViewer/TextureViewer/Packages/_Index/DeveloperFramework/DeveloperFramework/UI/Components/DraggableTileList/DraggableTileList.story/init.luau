local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.DraggableTileList);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = v1.PureComponent:extend("DraggableTiles");
local v6 = v1.PureComponent:extend("CustomTileBox");
v6.render = function(v7) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy)
    local l_props_0 = v7.props;
    local l_Tile_0 = l_props_0.Tile;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement(v2, {
        Style = "BorderBox", 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size
    }, {
        Text = v1.createElement(v4, {
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 2, 
            Text = l_Tile_0.Text, 
            TextXAlignment = l_Style_0.TextXAlignment or Enum.TextXAlignment.Center
        })
    });
end;
v5.init = function(v11) --[[ Line: 34 ]] --[[ Name: init ]]
    v11.boxes = {};
end;
local function _(v12, v13) --[[ Line: 38 ]] --[[ Name: createBox ]]
    return {
        Text = v12, 
        LayoutOrder = v13
    };
end;
v5.render = function(v15) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v6 (copy)
    if not next(v15.boxes) then
        v15.boxes = {
            [1] = {
                Text = "Box 1", 
                LayoutOrder = 1
            }, 
            [2] = {
                Text = "Box 2", 
                LayoutOrder = 2
            }, 
            [3] = {
                Text = "Box 3", 
                LayoutOrder = 3
            }
        };
    end;
    return v1.createElement(v3, {
        Size = UDim2.fromOffset(100, 300), 
        Capacity = 3, 
        TileList = v15.boxes, 
        TileComponent = v6, 
        PaneStyle = "BorderBox"
    });
end;
return v5;