local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local _ = require(l_Parent_0.UI.Components.Tabs.types);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local v6 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v7 = require(l_Parent_0.Styling.supportsStyleSheets);
local v8 = require(l_Parent_0.Styling.joinTags);
local v9 = require(l_Parent_0.Wrappers.withControl);
local v10 = require(l_Parent_0.Wrappers.withForwardRef);
local l_assign_0 = require(l_Parent_0.Parent.Dash).assign;
local l_UI_0 = l_Parent_0.UI;
local v13 = require(l_UI_0.Components.Pane);
local v14 = require(l_UI_0.Components.Tooltip);
local v15 = require(l_UI_0.Components.Image);
local v16 = require(l_UI_0.Components.TextLabel);
local v17 = v1.PureComponent:extend("SimpleTab");
local v18 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkTabsForwardRef);
local v19 = game:DefineFastFlag("SimpleTabNoAbsoluteSize", false);
v17.init = function(v20) --[[ Line: 34 ]] --[[ Name: init ]]
    v20.onPress = function() --[[ Line: 35 ]]
        -- upvalues: v20 (copy)
        local l_props_0 = v20.props;
        if not l_props_0.Disabled then
            l_props_0.OnTabSelected(l_props_0.Tab);
        end;
    end;
end;
v17.render = function(v22) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy), v13 (copy), l_assign_0 (copy), v6 (copy), v8 (copy), v18 (copy), v15 (copy), v16 (copy), v19 (copy), v14 (copy)
    local l_props_1 = v22.props;
    local v24 = if v7 then l_props_1.Style or {} else v22.props.Stylizer;
    local l_Icon_0 = l_props_1.Tab.Icon;
    local l_Label_0 = l_props_1.Tab.Label;
    local l_Tooltip_0 = l_props_1.Tab.Tooltip;
    local l_Selected_0 = l_props_1.Selected;
    local l_Color_0 = v24.Color;
    local l_BottomLineColor_0 = v24.BottomLineColor;
    local v31 = 0;
    local v32 = 0;
    if not v7 then
        v32 = if l_props_1.AbsoluteSize then l_props_1.AbsoluteSize.X else nil;
        if l_Selected_0 then
            v31 = v24.BorderSize;
            if v32 and v24.BorderSize then
                v32 = v32 - v24.BorderSize * 2;
            end;
        end;
    end;
    local v33 = v1.createElement(v13, l_assign_0({
        LayoutOrder = l_props_1.Index, 
        OnPress = v22.onPress
    }, l_props_1.WrapperProps, if v7 then {
        [v6.Tag] = v8("Component-SimpleTab", l_props_1[v6.Tag] or "X-Fit")
    } else {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Style = "Box"
    }, {
        [v1.Ref] = if v18() then l_props_1.ForwardRef else nil
    }), {
        Row = v1.createElement(v13, if v7 then {
            [v6.Tag] = v8("Contents X-RowS X-Middle", l_Selected_0 and "TabSelected Muted" or "Secondary")
        } else {
            Spacing = v24.Spacing, 
            Padding = v24.Padding, 
            Layout = Enum.FillDirection.Horizontal, 
            BackgroundColor = v24.BackgroundColor, 
            BorderColor3 = v24.BorderColor, 
            BorderMode = Enum.BorderMode.Inset, 
            BorderSizePixel = v24.BorderSize, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.fromOffset(0, 32)
        }, {
            Icon = l_Icon_0 and v1.createElement(v15, if v7 then {
                Image = l_Icon_0, 
                LayoutOrder = 1, 
                [v6.Tag] = "Icon16"
            } else {
                Image = l_Icon_0, 
                ImageColor3 = l_Color_0, 
                Size = UDim2.fromOffset(16, 16), 
                LayoutOrder = 1
            }), 
            Label = l_Label_0 and v1.createElement(v16, if v7 then {
                LayoutOrder = 2, 
                Font = v24.Font, 
                Text = l_Label_0, 
                [v6.Tag] = v8("X-Fit", l_props_1.Disabled and "Disabled" or nil)
            } else {
                TextColor = l_Color_0, 
                Font = v24.Font, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_Label_0, 
                LayoutOrder = 2
            })
        }), 
        TopLine = l_Selected_0 and v1.createElement(v13, if v7 then {
            ZIndex = 2, 
            [v6.Tag] = "TopLine"
        } else {
            Position = UDim2.fromOffset(v24.BorderSize, 0), 
            Size = if v19 then UDim2.new(1, 0, 0, v24.TopLineHeight) else UDim2.new(0, v32, 0, v24.TopLineHeight), 
            BackgroundColor = v24.TopLineColor, 
            ZIndex = 2
        }), 
        BottomLine = v1.createElement(v13, if v7 then {
            ZIndex = 1, 
            [v6.Tag] = v8("BottomLine", l_Selected_0 and "TabSelected" or nil)
        } else {
            Size = UDim2.new(1, 0, 0, v24.BorderSize), 
            Position = UDim2.new(0, v31, 0, 32), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor = l_BottomLineColor_0, 
            ZIndex = 1
        })
    });
    if l_Tooltip_0 then
        return v1.createElement(v14, {
            Text = l_Tooltip_0, 
            Child = v33
        });
    else
        return v33;
    end;
end;
if not v7 then
    v17 = l_withContext_0({
        Stylizer = v3.Stylizer
    })(v17);
end;
if v18() then
    v17 = v10(v17);
end;
if v7 then
    return v17;
elseif v19 then
    return v9(v17);
else
    return v5(v9(v17));
end;