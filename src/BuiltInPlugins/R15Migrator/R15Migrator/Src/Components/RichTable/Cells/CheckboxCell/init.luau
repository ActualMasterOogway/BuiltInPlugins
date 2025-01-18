local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Checkbox_0 = l_UI_0.Checkbox;
return function(v7) --[[ Line: 13 ]] --[[ Name: CheckboxCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_Tooltip_0 (copy)
    local v8 = v7.Value == true;
    local l_Style_0 = v7.Style;
    local v10 = v7.Width or UDim.new(1 / #v7.Columns, 0);
    local v11 = if v7.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local l_Tooltip_1 = v7.Tooltip;
    local v13 = false;
    if l_Tooltip_1 ~= nil then
        v13 = l_Tooltip_1 ~= "";
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v7.ColumnIndex, 
        Padding = {
            Top = 4, 
            Bottom = 4, 
            Left = 4, 
            Right = 4
        }, 
        Style = "Box", 
        BackgroundColor3 = v11, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v10.Scale, v10.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Checkbox = v2.createElement(l_Checkbox_0, {
            Checked = v8, 
            OnClick = function() --[[ Line: 43 ]] --[[ Name: OnClick ]]
                -- upvalues: v7 (copy)
                v7.OnClick(v7.ColumnIndex, v7.RowIndex);
            end
        }), 
        Tooltip = v13 and v2.createElement(l_Tooltip_0, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = l_Tooltip_1, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;