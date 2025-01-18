local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(v6) --[[ Line: 12 ]] --[[ Name: OriginalAssetCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_Value_0 = v6.Value;
    local l_Style_0 = v6.Style;
    local v9 = v6.Width or UDim.new(1 / #v6.Columns, 0);
    local v10 = if v6.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v6.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v10, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v9.Scale, v9.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Text = v2.createElement(l_TextLabel_0, {
            Text = tostring(l_Value_0), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Arrow = v2.createElement(l_TextLabel_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -5, 0.5, 0), 
            Size = UDim2.new(0, 10, 0, 10), 
            Style = "Bold", 
            Text = "\226\134\146"
        })
    });
end;