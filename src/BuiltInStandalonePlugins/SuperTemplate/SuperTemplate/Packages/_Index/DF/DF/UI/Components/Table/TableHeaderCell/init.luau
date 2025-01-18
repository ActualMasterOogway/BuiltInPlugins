local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Dash);
local l_assign_0 = v2.assign;
local l_join_0 = v2.join;
local l_UI_0 = l_Parent_0.UI;
local v6 = require(l_UI_0.Components.Pane);
local v7 = require(l_UI_0.Components.TextLabel);
local v8 = require(l_UI_0.Components.Image);
local v9 = require(l_UI_0.Components.Tooltip);
local v10 = require(l_Parent_0.Wrappers.withControl);
local v11 = v1.PureComponent:extend("TableHeaderCell");
local v12 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v13 = require(l_Parent_0.Styling.supportsStyleSheets);
local v14 = require(l_Parent_0.Styling.joinTags);
local v15 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkModernTreeTable();
v11.render = function(v16) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), l_assign_0 (copy), v13 (copy), v12 (copy), v15 (copy), v14 (copy), v7 (copy), v8 (copy), l_join_0 (copy), v9 (copy)
    local l_props_0 = v16.props;
    local l_Name_0 = l_props_0.Name;
    local l_Order_0 = l_props_0.Order;
    local l_Width_0 = l_props_0.Width;
    local l_ColumnIndex_0 = l_props_0.ColumnIndex;
    local l_Style_0 = l_props_0.Style;
    local v23 = l_props_0.OnPress ~= nil;
    local l_Tooltip_0 = l_props_0.Tooltip;
    local l_Variant_0 = l_props_0.Variant;
    return v1.createElement(v6, l_assign_0(if v13 then {
        LayoutOrder = l_ColumnIndex_0, 
        Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0), 
        [v12.Tag] = if v15 then v14("Main X-PadS", l_Variant_0 == "modern" and "X-Transparent" or "X-Border") else "Main X-PadS X-Border"
    } else {
        LayoutOrder = l_ColumnIndex_0, 
        BorderColor3 = l_Style_0.Border, 
        BorderSizePixel = 1, 
        Padding = l_Style_0.HeaderCellPadding, 
        Style = "SubtleBox", 
        StyleModifier = v23 and l_props_0.StyleModifier or nil, 
        Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0)
    }, l_props_0.WrapperProps), {
        Text = v1.createElement(v7, if v13 then {
            Text = l_Name_0, 
            [v12.Tag] = v14("Left Truncate", v15 and l_Variant_0 == "modern" and "BuilderSans Bold" or nil)
        } else {
            Text = l_Name_0, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Icon = l_Order_0 and v1.createElement(v8, l_join_0({
            ImageColor3 = if v13 then nil else l_Style_0.IconColor, 
            Image = "rbxasset://textures/DeveloperFramework/Table/sort_arrow.png", 
            Size = UDim2.fromOffset(6, 8), 
            Position = UDim2.new(1, -10, 0.5, -4), 
            Rotation = l_Order_0 == Enum.SortDirection.Descending and -90 or 90, 
            AnchorPoint = Vector2.new(1, 0)
        }, if v13 then {
            [v12.Tag] = "Primary"
        } else nil)), 
        Tooltip = l_Tooltip_0 and v1.createElement(v9, {
            Text = l_Tooltip_0 or l_Name_0
        })
    });
end;
return v10(v11);