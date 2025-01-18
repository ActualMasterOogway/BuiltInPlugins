local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
return v1.Wrappers.withControl(function(v9) --[[ Line: 19 ]] --[[ Name: TextHeaderCell ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), v3 (copy), l_TextLabel_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    return v2.createElement(l_Pane_0, v3.join({
        LayoutOrder = v9.ColumnIndex, 
        BorderColor3 = v9.Style.Border, 
        BorderSizePixel = 1, 
        Padding = v9.Style.HeaderCellPadding, 
        Style = "SubtleBox", 
        StyleModifier = v9.OnPress ~= nil and v9.StyleModifier or nil, 
        Size = UDim2.new(v9.Width.Scale, v9.Width.Offset, 1, 0)
    }, v9.WrapperProps), {
        Text = v2.createElement(l_TextLabel_0, {
            Text = v9.Name, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Icon = v9.Order and v2.createElement(l_Image_0, {
            ImageColor3 = v9.Style.IconColor, 
            Image = "rbxasset://textures/DeveloperFramework/Table/sort_arrow.png", 
            Size = UDim2.fromOffset(6, 8), 
            Position = UDim2.new(1, -10, 0.5, -4), 
            Rotation = v9.Order == Enum.SortDirection.Descending and -90 or 90, 
            AnchorPoint = Vector2.new(1, 0)
        }), 
        Tooltip = v9.Tooltip and v2.createElement(l_Tooltip_0, {
            Text = v9.Tooltip
        })
    });
end);