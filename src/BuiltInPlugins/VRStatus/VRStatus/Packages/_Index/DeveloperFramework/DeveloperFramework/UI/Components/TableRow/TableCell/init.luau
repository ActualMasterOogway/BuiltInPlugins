local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_UI_0 = l_Parent_0.UI;
local v3 = require(l_UI_0.Components.Pane);
local v4 = require(l_UI_0.Components.Tooltip);
local v5 = require(l_UI_0.Components.TextLabel);
return function(v6) --[[ Line: 12 ]] --[[ Name: TableCell ]]
    -- upvalues: v1 (copy), v3 (copy), v5 (copy), v4 (copy)
    local l_Value_0 = v6.Value;
    local l_Style_0 = v6.Style;
    local v9 = v6.Width or UDim.new(1 / #v6.Columns, 0);
    local v10 = if v6.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v11 = nil;
    v11 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then ("%.3f"):format(l_Value_0) else tostring(l_Value_0);
    local v12 = v6.Tooltip or v11;
    local v13 = false;
    if v12 ~= nil then
        v13 = v12 ~= "";
    end;
    return v1.createElement(v3, {
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
        Text = v1.createElement(v5, {
            Text = v11, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Tooltip = v13 and v1.createElement(v4, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = v12, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;