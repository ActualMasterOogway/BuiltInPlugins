local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Image_0 = l_UI_0.Image;
local l_Util_0 = v2.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_prioritize_0 = l_Util_0.prioritize;
local v13 = v1.PureComponent:extend("DropdownMenuButton");
l_Typecheck_0.wrap(v13, script);
v13.init = function(v14) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_Button_0 (copy), l_Image_0 (copy)
    v14.state = {
        isOpen = false, 
        icon = nil, 
        tooltip = ""
    };
    v14.openMenu = function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            isOpen = true
        });
    end;
    v14.closeMenu = function() --[[ Line: 47 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            isOpen = false
        });
    end;
    v14.onRenderItem = function(v15, v16, v17) --[[ Line: 53 ]]
        -- upvalues: v14 (copy), v1 (ref), l_Button_0 (ref), l_Image_0 (ref)
        local l_props_0 = v14.props;
        local _ = l_props_0.Icons;
        local l_ButtonSize_0 = l_props_0.ButtonSize;
        return v1.createElement(l_Button_0, {
            Size = UDim2.new(1, 0, 0, l_ButtonSize_0), 
            LayoutOrder = v16, 
            OnClick = v17, 
            Tooltip = v15.tooltip
        }, {
            Image = v1.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                Style = {
                    Image = v15.icon
                }
            })
        });
    end;
    v14.onItemActivated = function(v21, v22) --[[ Line: 76 ]]
        -- upvalues: v14 (copy), v1 (ref)
        if v14.props.IsIconList then
            local v23 = v14.props.Items[v22];
            v14:setState({
                icon = if v23 then v23.icon else v1.None, 
                tooltip = if v23 then v23.tooltip else ""
            });
        end;
        v14.props.OnItemActivated(v21, v22);
    end;
end;
v13.didUpdate = function(v24, v25) --[[ Line: 88 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    if v25.Items ~= v24.props.Items and v24.props.IsIconList then
        local v26 = v24.props.Items[1];
        v24:setState({
            icon = if v26 then v26.icon else v1.None, 
            tooltip = if v26 then v26.tooltip else ""
        });
    end;
end;
v13.render = function(v27) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v1 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_DropdownMenu_0 (copy)
    local l_props_1 = v27.props;
    local l_state_0 = v27.state;
    local l_IsIconList_0 = l_props_1.IsIconList;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Items_0 = l_props_1.Items;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v34 = l_prioritize_0(l_props_1.Icon, l_state_0.icon, l_Stylizer_0.Icon);
    local l_ButtonSize_1 = l_props_1.ButtonSize;
    local l_tooltip_0 = l_state_0.tooltip;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.fromOffset(l_ButtonSize_1, l_ButtonSize_1), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        MenuButton = v1.createElement(l_Button_0, {
            Style = "Round", 
            Size = UDim2.fromScale(1, 1), 
            OnClick = v27.openMenu, 
            Tooltip = l_tooltip_0
        }, {
            Settings = v1.createElement(l_Image_0, {
                Image = v34
            })
        }), 
        Dropdown = v1.createElement(l_DropdownMenu_0, {
            Hide = not v27.state.isOpen, 
            Items = l_Items_0, 
            OnItemActivated = v27.onItemActivated, 
            OnFocusLost = v27.closeMenu, 
            OnRenderItem = if l_IsIconList_0 then v27.onRenderItem else nil, 
            Width = if l_IsIconList_0 then l_ButtonSize_1 else nil
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));