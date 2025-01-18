local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(v7) --[[ Line: 13 ]] --[[ Name: TextCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Tooltip_0 (copy)
    local l_Value_0 = v7.Value;
    local l_Style_0 = v7.Style;
    local v10 = v7.Width or UDim.new(1 / #v7.Columns, 0);
    local v11 = if v7.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v12 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then string.format("%.3f", l_Value_0) else tostring(l_Value_0);
    local v13 = v7.Tooltip or v12;
    local v14 = false;
    if v13 ~= nil then
        v14 = v13 ~= "";
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v7.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v11, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v10.Scale, v10.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Text = v2.createElement(l_TextLabel_0, {
            Text = v12, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Tooltip = v14 and v2.createElement(l_Tooltip_0, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = v13, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;