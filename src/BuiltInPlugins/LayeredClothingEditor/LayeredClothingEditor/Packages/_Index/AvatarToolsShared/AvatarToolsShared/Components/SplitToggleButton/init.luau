local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v10 = v1.PureComponent:extend("SplitToggleButton");
v10.init = function(v11, _) --[[ Line: 18 ]] --[[ Name: init ]]
    v11.state = {
        HoveringLeft = false, 
        HoveringRight = false
    };
    v11.mouseEnterLeft = function() --[[ Line: 24 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            HoveringLeft = true
        });
    end;
    v11.mouseLeaveLeft = function() --[[ Line: 30 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            HoveringLeft = false
        });
    end;
    v11.mouseEnterRight = function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            HoveringRight = true
        });
    end;
    v11.mouseLeaveRight = function() --[[ Line: 42 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            HoveringRight = false
        });
    end;
end;
v10.renderSide = function(v13, v14) --[[ Line: 49 ]] --[[ Name: renderSide ]]
    -- upvalues: v1 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_ButtonSize_0 = l_props_0.ButtonSize;
    local l_Icon_0 = v14.Icon;
    local l_LayoutOrder_0 = v14.LayoutOrder;
    local l_OnClick_0 = v14.OnClick;
    local l_OnMouseEnter_0 = v14.OnMouseEnter;
    local l_OnMouseLeave_0 = v14.OnMouseLeave;
    local l_TooltipText_0 = v14.TooltipText;
    local l_Hovered_0 = v14.Hovered;
    local l_Selected_0 = v14.Selected;
    local l_BackgroundImage_0 = v14.BackgroundImage;
    local l_BorderImage_0 = v14.BorderImage;
    local l_SliceCenter_0 = l_Stylizer_0.SliceCenter;
    local l_BorderColor_0 = l_Stylizer_0.BorderColor;
    local l_Color_0 = l_Stylizer_0.Color;
    if l_Selected_0 then
        l_Color_0 = l_Stylizer_0.PressedColor;
    elseif l_Hovered_0 then
        l_Color_0 = l_Stylizer_0.HoverColor;
    end;
    return v1.createElement("TextButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(l_ButtonSize_0, l_ButtonSize_0), 
        Text = "", 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Event.Activated] = if not disabled then l_OnClick_0 else nil, 
        [v1.Event.MouseEnter] = l_OnMouseEnter_0, 
        [v1.Event.MouseLeave] = l_OnMouseLeave_0
    }, {
        Container = v1.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Color_0, 
            Image = l_BackgroundImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = l_SliceCenter_0
        }, {
            Border = v1.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_BorderColor_0, 
                Image = l_BorderImage_0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = l_SliceCenter_0
            }, {
                Icon = v1.createElement(l_Image_0, {
                    Image = l_Icon_0
                })
            })
        }), 
        Tooltip = l_TooltipText_0 and v1.createElement(l_Tooltip_0, {
            Text = l_TooltipText_0
        })
    });
end;
v10.render = function(v31) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy)
    local l_props_1 = v31.props;
    local l_state_0 = v31.state;
    local l_HoveringLeft_0 = l_state_0.HoveringLeft;
    local l_HoveringRight_0 = l_state_0.HoveringRight;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_ButtonSize_1 = l_props_1.ButtonSize;
    local l_LayoutOrder_1 = l_props_1.LayoutOrder;
    local l_LeftIcon_0 = l_props_1.LeftIcon;
    local l_RightIcon_0 = l_props_1.RightIcon;
    local l_LeftTooltipText_0 = l_props_1.LeftTooltipText;
    local l_RightTooltipText_0 = l_props_1.RightTooltipText;
    local l_OnLeftSideClick_0 = l_props_1.OnLeftSideClick;
    local l_OnRightSideClick_0 = l_props_1.OnRightSideClick;
    local l_IsOn_0 = l_props_1.IsOn;
    local v46 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        AutomaticSize = l_props_1.AutomaticSize, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_1, 
        Size = UDim2.fromOffset(l_ButtonSize_1 * 2, l_ButtonSize_1)
    }, {
        LeftButton = v31:renderSide({
            Icon = l_LeftIcon_0, 
            Hovered = l_HoveringLeft_0, 
            Selected = not l_IsOn_0, 
            LayoutOrder = v46:getNextOrder(), 
            BackgroundImage = l_Stylizer_1.BackgroundImageLeft, 
            BorderImage = l_Stylizer_1.BorderImageLeft, 
            TooltipText = l_LeftTooltipText_0, 
            OnClick = l_OnLeftSideClick_0, 
            OnMouseEnter = v31.mouseEnterLeft, 
            OnMouseLeave = v31.mouseLeaveLeft
        }), 
        RightButton = v31:renderSide({
            Icon = l_RightIcon_0, 
            Hovered = l_HoveringRight_0, 
            Selected = l_IsOn_0, 
            LayoutOrder = v46:getNextOrder(), 
            BackgroundImage = l_Stylizer_1.BackgroundImageRight, 
            BorderImage = l_Stylizer_1.BorderImageRight, 
            TooltipText = l_RightTooltipText_0, 
            OnClick = l_OnRightSideClick_0, 
            OnMouseEnter = v31.mouseEnterRight, 
            OnMouseLeave = v31.mouseLeaveRight
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));