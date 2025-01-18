local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Checkbox_0 = l_UI_0.Checkbox;
return function(v7) --[[ Line: 13 ]] --[[ Name: CheckboxHeaderCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_Tooltip_0 (copy)
    return v2.createElement(l_Pane_0, {
        Padding = {
            Top = 8, 
            Bottom = 8, 
            Left = 4, 
            Right = 4
        }, 
        LayoutOrder = v7.ColumnIndex, 
        BorderColor3 = v7.Style.Border, 
        BorderSizePixel = 1, 
        Style = "SubtleBox", 
        Size = UDim2.new(v7.Width.Scale, v7.Width.Offset, 1, 0)
    }, {
        Checkbox = v2.createElement(l_Checkbox_0, {
            Checked = v7.Checked, 
            OnClick = function() --[[ Line: 29 ]] --[[ Name: OnClick ]]
                -- upvalues: v7 (copy)
                v7.OnClick(v7.ColumnIndex);
            end
        }), 
        Tooltip = v7.Tooltip and v2.createElement(l_Tooltip_0, {
            Text = v7.Tooltip
        })
    });
end;