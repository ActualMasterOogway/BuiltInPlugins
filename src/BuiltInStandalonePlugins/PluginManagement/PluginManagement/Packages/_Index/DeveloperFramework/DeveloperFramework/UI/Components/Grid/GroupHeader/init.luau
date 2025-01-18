local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Components_0 = l_Parent_0.UI.Components;
local v3 = require(l_Components_0.Image);
local v4 = require(l_Components_0.Pane);
local v5 = require(l_Components_0.TextLabel);
local l_Util_0 = l_Parent_0.Util;
local v7 = require(l_Util_0.LayoutOrderIterator);
local v8 = require(l_Util_0.StyleModifier);
local v9 = v1.PureComponent:extend("GroupHeader");
v9.render = function(v10) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), v1 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_props_0 = v10.props;
    local l_Style_0 = l_props_0.Style;
    local v13 = if l_props_0.IsCollapsed then nil else v8.Selected;
    local v14 = v7.new();
    return v1.createElement(v4, {
        BackgroundColor = l_Style_0.BackgroundColor, 
        BorderColor = l_Style_0.BorderColor, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_Style_0.Padding, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        Spacing = l_Style_0.Spacing, 
        Style = l_Style_0.Style, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        Arrow = if l_props_0.Collapsible then v1.createElement(v4, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v14:getNextOrder(), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            OnClick = function() --[[ Line: 63 ]] --[[ Name: OnClick ]]
                -- upvalues: l_props_0 (copy)
                if l_props_0.OnExpandCollapseClicked then
                    l_props_0.OnExpandCollapseClicked();
                end;
            end, 
            Size = l_Style_0.ArrowButtonSize
        }, {
            Image = v1.createElement(v3, {
                Style = l_Style_0.Arrow, 
                StyleModifier = v13
            })
        }) else nil, 
        Text = v1.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v14:getNextOrder(), 
            Size = UDim2.fromScale(0, 1), 
            Text = l_props_0.Text, 
            TextColor = l_Style_0.TextColor, 
            TextSize = l_Style_0.TextSize, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v9;