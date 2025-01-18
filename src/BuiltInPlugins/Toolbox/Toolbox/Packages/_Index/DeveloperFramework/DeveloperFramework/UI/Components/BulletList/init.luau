local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck.t);
local v5 = require(l_Parent_0.Util.Typecheck);
local l_map_0 = require(l_Parent_0.Parent.Dash).map;
local l_UI_0 = l_Parent_0.UI;
local v8 = require(l_UI_0.Components.Pane);
local v9 = require(l_UI_0.Components.Image);
local v10 = require(l_UI_0.Components.TextLabel);
local v11 = v1.PureComponent:extend("BulletList");
v5.wrap(v11, script);
v11.calculateItemOffset = function(v12) --[[ Line: 42 ]] --[[ Name: calculateItemOffset ]]
    -- upvalues: v4 (copy)
    local l_Stylizer_0 = v12.props.Stylizer;
    local l_ItemOffset_0 = l_Stylizer_0.ItemOffset;
    local l_MarkerSize_0 = l_Stylizer_0.MarkerSize;
    assert(v4.numberMin(0)(l_MarkerSize_0), "MarkerSize style must be a number >= 0");
    assert(v4.number(l_ItemOffset_0), "ItemOffset style must be a number");
    return l_MarkerSize_0 + l_ItemOffset_0;
end;
v11.render = function(v16) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_map_0 (copy), v1 (copy), v10 (copy), v8 (copy), v9 (copy)
    local l_props_0 = v16.props;
    local l_TextWrapped_0 = l_props_0.TextWrapped;
    local l_TextTruncate_0 = l_props_0.TextTruncate;
    local l_Items_0 = l_props_0.Items;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Font_0 = l_Stylizer_1.Font;
    local l_ItemIndentation_0 = l_Stylizer_1.ItemIndentation;
    local l_MarkerImage_0 = l_Stylizer_1.MarkerImage;
    local l_MarkerSize_1 = l_Stylizer_1.MarkerSize;
    local l_TextColor_0 = l_Stylizer_1.TextColor;
    local l_TextSize_0 = l_Stylizer_1.TextSize;
    local l_LineHeight_0 = l_Stylizer_1.LineHeight;
    local l_Padding_0 = l_Stylizer_1.Padding;
    local v30 = v16:calculateItemOffset();
    local v31 = UDim2.new(1, -v30, 0, 0);
    assert(v4.numberMin(0)(l_MarkerSize_1), "MarkerSize style must be a number >= 0");
    assert(v4.numberMin(0)(l_TextSize_0), "TextSize style must be a number >= 0");
    local v39 = l_map_0(l_Items_0, function(v32, v33) --[[ Line: 77 ]]
        -- upvalues: l_ItemIndentation_0 (copy), l_MarkerImage_0 (copy), v1 (ref), v10 (ref), l_Font_0 (copy), v31 (copy), l_TextColor_0 (copy), l_TextSize_0 (copy), l_TextTruncate_0 (copy), l_TextWrapped_0 (copy), l_Stylizer_1 (copy), v8 (ref), l_Padding_0 (copy), l_MarkerSize_1 (copy), l_LineHeight_0 (copy), v9 (ref)
        local v34 = nil;
        local l_l_ItemIndentation_0_0 = l_ItemIndentation_0;
        local l_l_MarkerImage_0_0 = l_MarkerImage_0;
        if type(v32) == "string" then
            v34 = v1.createElement(v10, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = l_Font_0, 
                LayoutOrder = 2, 
                Size = v31, 
                Text = v32, 
                TextColor = l_TextColor_0, 
                TextSize = l_TextSize_0, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = l_TextWrapped_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        elseif typeof(v32) == "table" and v32.Text then
            local v37 = l_Stylizer_1[string.format("&%s", v32.Style)];
            assert(v37, string.format("BulletList Style '%s' was not found", v32.Style));
            local v38 = UDim2.new(1, -v37.ItemOffset, 0, 0);
            l_l_ItemIndentation_0_0 = v37.ItemIndentation or l_l_ItemIndentation_0_0;
            l_l_MarkerImage_0_0 = v37.MarkerStyle or l_l_MarkerImage_0_0;
            v34 = v1.createElement(v10, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = l_Font_0, 
                LayoutOrder = 2, 
                Size = v38, 
                Text = v32.Text, 
                TextColor = l_TextColor_0, 
                TextWrapped = l_TextWrapped_0, 
                TextSize = l_TextSize_0, 
                TextTruncate = l_TextTruncate_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        else
            v34 = v1.createElement(v8, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2, 
                Size = v31
            }, {
                ContentElement = v32
            });
        end;
        return v1.createElement(v8, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v33, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Padding_0, 
            Padding = {
                Left = l_l_ItemIndentation_0_0
            }
        }, {
            Marker = v1.createElement(v8, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(l_MarkerSize_1, l_LineHeight_0)
            }, {
                Image = v1.createElement(v9, {
                    Image = l_l_MarkerImage_0_0, 
                    ImageColor3 = l_TextColor_0, 
                    LayoutOrder = 1, 
                    Position = UDim2.fromScale(0, 0.5), 
                    Size = UDim2.fromOffset(l_MarkerSize_1, l_MarkerSize_1)
                })
            }), 
            Content = v34
        });
    end);
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_XY_0 = Enum.AutomaticSize.XY;
    if l_Size_0 and (l_Size_0.X.Scale > 0 or l_Size_0.X.Offset > 0) then
        l_XY_0 = Enum.AutomaticSize.Y;
    end;
    return v1.createElement(v8, {
        AutomaticSize = l_XY_0, 
        BackgroundTransparency = 1, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, v39);
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v11));