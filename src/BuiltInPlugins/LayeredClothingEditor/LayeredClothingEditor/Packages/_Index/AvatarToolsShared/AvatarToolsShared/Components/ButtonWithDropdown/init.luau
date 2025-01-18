local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Separator_0 = l_UI_0.Separator;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v15 = v1.PureComponent:extend("ButtonWithDropdown");
l_Typecheck_0.wrap(v15, script);
v15.init = function(v16, _) --[[ Line: 46 ]] --[[ Name: init ]]
    v16.state = {
        hoveringMain = false, 
        hoveringArrow = false, 
        isOpen = false
    };
    v16.selectItem = function(v18, v19) --[[ Line: 53 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            isOpen = false
        });
        v16.props.OnSelectItem(v18, v19);
    end;
    v16.openMenu = function() --[[ Line: 60 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            isOpen = true
        });
    end;
    v16.closeMenu = function() --[[ Line: 66 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            isOpen = false
        });
    end;
    v16.mouseEnterMainButton = function() --[[ Line: 72 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            hoveringMain = true
        });
    end;
    v16.mouseLeaveMainButton = function() --[[ Line: 78 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            hoveringMain = false
        });
    end;
    v16.mouseEnterArrowButton = function() --[[ Line: 84 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            hoveringArrow = true
        });
    end;
    v16.mouseLeaveArrowButton = function() --[[ Line: 90 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            hoveringArrow = false
        });
    end;
end;
v15.renderMainButton = function(v20, v21, v22) --[[ Line: 97 ]] --[[ Name: renderMainButton ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Tooltip_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy)
    local l_props_0 = v20.props;
    local l_hoveringMain_0 = v20.state.hoveringMain;
    local l_ButtonWidth_0 = l_props_0.ButtonWidth;
    local l_Height_0 = l_props_0.Height;
    local l_ButtonIcon_0 = l_props_0.ButtonIcon;
    local l_TooltipText_0 = l_props_0.TooltipText;
    local l_OnClick_0 = l_props_0.OnClick;
    local _ = l_props_0.Items;
    local l_ButtonText_0 = l_props_0.ButtonText;
    local l_IconSize_0 = l_props_0.IconSize;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TextSize_0 = l_Stylizer_0.TextSize;
    local l_ButtonSpacing_0 = l_Stylizer_0.ButtonSpacing;
    local v36 = if v22 then l_Stylizer_0.BackgroundImageFull else l_Stylizer_0.BackgroundImageLeft;
    local v37 = if v22 then l_Stylizer_0.SliceCenterFull else l_Stylizer_0.SliceCenter;
    local l_Color_0 = l_Stylizer_0.Color;
    if l_hoveringMain_0 then
        l_Color_0 = l_Stylizer_0.HoverColor;
    end;
    local v39 = l_LayoutOrderIterator_0.new();
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(l_ButtonWidth_0, l_Height_0), 
        ImageColor3 = l_Color_0, 
        Image = v36, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v37, 
        LayoutOrder = v21, 
        [v1.Event.Activated] = l_OnClick_0, 
        [v1.Event.MouseEnter] = v20.mouseEnterMainButton, 
        [v1.Event.MouseLeave] = v20.mouseLeaveMainButton
    }, {
        Tooltip = l_TooltipText_0 and v1.createElement(l_Tooltip_0, {
            Text = l_TooltipText_0
        }), 
        Container = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_ButtonSpacing_0
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                Text = l_ButtonText_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextSize = l_TextSize_0, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Style = "Bold", 
                LayoutOrder = v39:getNextOrder()
            }), 
            Icon = if l_ButtonIcon_0 then v1.createElement(l_Image_0, {
                Image = l_ButtonIcon_0, 
                Size = UDim2.fromOffset(l_IconSize_0, l_IconSize_0), 
                LayoutOrder = v39:getNextOrder()
            }) else nil
        })
    });
end;
v15.renderDropdownArrow = function(v40, v41) --[[ Line: 167 ]] --[[ Name: renderDropdownArrow ]]
    -- upvalues: v1 (copy), l_Image_0 (copy)
    local l_props_1 = v40.props;
    local l_hoveringArrow_0 = v40.state.hoveringArrow;
    local l_ArrowWidth_0 = l_props_1.ArrowWidth;
    local l_Height_1 = l_props_1.Height;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_ArrowIcon_0 = l_Stylizer_1.ArrowIcon;
    local l_ArrowSize_0 = l_Stylizer_1.ArrowSize;
    local l_BackgroundImageRight_0 = l_Stylizer_1.BackgroundImageRight;
    local l_SliceCenter_0 = l_Stylizer_1.SliceCenter;
    local l_Color_1 = l_Stylizer_1.Color;
    if l_hoveringArrow_0 then
        l_Color_1 = l_Stylizer_1.HoverColor;
    end;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(l_ArrowWidth_0, l_Height_1), 
        ImageColor3 = l_Color_1, 
        Image = l_BackgroundImageRight_0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_SliceCenter_0, 
        LayoutOrder = v41, 
        [v1.Event.Activated] = v40.openMenu, 
        [v1.Event.MouseEnter] = v40.mouseEnterArrowButton, 
        [v1.Event.MouseLeave] = v40.mouseLeaveArrowButton
    }, {
        Icon = v1.createElement(l_Image_0, {
            Image = l_ArrowIcon_0, 
            Size = UDim2.fromOffset(l_ArrowSize_0, l_ArrowSize_0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;
v15.render = function(v52) --[[ Line: 207 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_Separator_0 (copy), l_DropdownMenu_0 (copy)
    local l_props_2 = v52.props;
    local l_isOpen_0 = v52.state.isOpen;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Items_1 = l_props_2.Items;
    local l_ItemHeight_0 = l_props_2.ItemHeight;
    local l_ArrowWidth_1 = l_props_2.ArrowWidth;
    local l_ButtonWidth_1 = l_props_2.ButtonWidth;
    local l_Height_2 = l_props_2.Height;
    local v61 = l_LayoutOrderIterator_0.new();
    local v62 = #l_Items_1 == 0;
    local l_l_ButtonWidth_1_0 = l_ButtonWidth_1;
    if not v62 then
        l_l_ButtonWidth_1_0 = l_l_ButtonWidth_1_0 + (l_ArrowWidth_1 + 1);
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromOffset(l_l_ButtonWidth_1_0, l_Height_2), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ButtonWithArrow = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1
        }, {
            MainButton = v52:renderMainButton(v61:getNextOrder(), v62), 
            Separator = if not v62 then v1.createElement(l_Separator_0, {
                DominantAxis = Enum.DominantAxis.Height, 
                LayoutOrder = v61:getNextOrder()
            }) else nil, 
            DropdownArrowButton = if not v62 then v52:renderDropdownArrow(v61:getNextOrder()) else nil
        }), 
        Menu = if not v62 then v1.createElement(l_DropdownMenu_0, {
            Hide = not l_isOpen_0, 
            Items = l_Items_1, 
            ItemHeight = l_ItemHeight_0, 
            OnItemActivated = v52.selectItem, 
            OnFocusLost = v52.closeMenu
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));