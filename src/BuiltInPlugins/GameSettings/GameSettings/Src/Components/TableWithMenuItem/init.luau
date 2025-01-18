local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_FitTextLabel_0 = v3.Util.FitFrame.FitTextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextService_0 = game:GetService("TextService");
local v12 = v1.PureComponent:extend("TableWithMenuItem");
local function v22(v13, v14, v15) --[[ Line: 40 ]] --[[ Name: createRowLabelsWithIcon ]]
    -- upvalues: v1 (copy), v2 (copy), l_Tooltip_0 (copy)
    local v16 = {};
    local v17 = 1 / (#v14 + 1);
    for v18 = 0, #v14 do
        local v19 = v14[v18];
        local v20 = nil;
        if v18 == 0 then
            local v21 = v1.createElement("Frame", {
                Size = UDim2.new(0, v13.table.icon.height, 0, v13.table.icon.height), 
                BackgroundTransparency = 1
            }, {
                Icon = v15
            });
            v20 = v1.createElement("Frame", {
                LayoutOrder = v18, 
                Size = UDim2.new(v17, 0, 0, v13.table.icon.height), 
                BackgroundTransparency = 1
            }, {
                Icon = v21
            });
        else
            v20 = if v18 ~= #v14 then v1.createElement("TextLabel", v2.Dictionary.join(v13.fontStyle.Smaller, {
                Size = UDim2.new(v17, 0, 0, v13.table.item.height), 
                LayoutOrder = v18, 
                Text = v19, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), {
                Tooltip = v1.createElement(l_Tooltip_0, {
                    Text = v19, 
                    Enabled = true
                })
            }) else v1.createElement("TextLabel", v2.Dictionary.join(v13.fontStyle.Smaller, {
                Size = UDim2.new(v17, -v13.table.menu.buttonSize, 0, v13.table.item.height), 
                LayoutOrder = v18, 
                Text = v19, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), {
                Tooltip = v1.createElement(l_Tooltip_0, {
                    Text = v19, 
                    Enabled = true
                })
            });
        end;
        v16[v18] = v20;
    end;
    return v16;
end;
local function v29(v23, v24) --[[ Line: 106 ]] --[[ Name: createRowLabels ]]
    -- upvalues: v1 (copy), v2 (copy), l_Tooltip_0 (copy)
    local v25 = {};
    for v26 = 1, #v24 do
        local v27 = v24[v26];
        local _ = nil;
        v25[v26] = if v26 ~= #v24 then v1.createElement("TextLabel", v2.Dictionary.join(v23.fontStyle.Smaller, {
            Size = UDim2.new(1 / #v24, 0, 0, v23.table.item.height), 
            LayoutOrder = v26, 
            Text = v27, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v27, 
                Enabled = true
            })
        }) else v1.createElement("TextLabel", v2.Dictionary.join(v23.fontStyle.Smaller, {
            Size = UDim2.new(1 / #v24, -v23.table.menu.buttonSize, 0, v23.table.item.height), 
            LayoutOrder = v26, 
            Text = v27, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v27, 
                Enabled = true
            })
        });
    end;
    return v25;
end;
v12.init = function(v30) --[[ Line: 161 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v30.state = {
        showMenu = false, 
        isButtonHovered = false, 
        menuItem = nil
    };
    v30.buttonRef = v1.createRef();
    v30.onItemClicked = function(v31) --[[ Line: 169 ]]
        -- upvalues: v30 (copy)
        v30.props.OnItemClicked(v31.Key);
        v30.hideMenu();
    end;
    v30.showMenu = function() --[[ Line: 174 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            showMenu = true
        });
    end;
    v30.hideMenu = function() --[[ Line: 180 ]]
        -- upvalues: v30 (copy), v1 (ref)
        v30:setState({
            showMenu = false, 
            menuItem = v1.None
        });
    end;
    v30.onMenuItemEnter = function(v32) --[[ Line: 187 ]]
        -- upvalues: v30 (copy)
        v30:setState({
            menuItem = v32
        });
    end;
    v30.onMenuItemLeave = function(v33) --[[ Line: 193 ]]
        -- upvalues: v30 (copy), v1 (ref)
        if v30.state.menuItem == v33 then
            v30:setState({
                menuItem = v1.None
            });
        end;
    end;
end;
v12.renderMenuItem = function(v34, v35, v36, v37, v38, v39) --[[ Line: 202 ]] --[[ Name: renderMenuItem ]]
    -- upvalues: l_TextService_0 (copy), v1 (copy), l_HoverArea_0 (copy), v2 (copy)
    local l_Key_0 = v35.Key;
    local l_Text_0 = v35.Text;
    local v42 = v34.state.menuItem == l_Key_0;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Text_0, v38.fontStyle.Normal.TextSize, v38.fontStyle.Normal.Font, Vector2.new(v39, 1e999));
    local l_background_0 = v38.dropDownEntry.background;
    if v42 then
        l_background_0 = v38.dropDownEntry.hovered;
    end;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(0, v39, 0, l_l_TextService_0_TextSize_0.Y + v38.table.menu.buttonPaddingY), 
        BackgroundColor3 = l_background_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v36, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v37, 
        [v1.Event.MouseEnter] = function() --[[ Line: 226 ]]
            -- upvalues: v34 (copy), l_Key_0 (copy)
            v34.onMenuItemEnter(l_Key_0);
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 229 ]]
            -- upvalues: v34 (copy), l_Key_0 (copy)
            v34.onMenuItemLeave(l_Key_0);
        end
    }, {
        v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        }); 
        Label = v1.createElement("TextLabel", v2.Dictionary.join(v38.fontStyle.Smaller, {
            Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y), 
            Position = UDim2.new(0, v38.table.textPadding, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Text = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1
        }))
    });
end;
v12.render = function(v45) --[[ Line: 249 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v29 (copy), l_TextService_0 (copy), v1 (copy), l_FitTextLabel_0 (copy), v2 (copy), l_DropdownMenu_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v45.props;
    local l_state_0 = v45.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_RowData_0 = l_props_0.RowData;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Icon_0 = l_props_0.Icon;
    local v52 = l_Icon_0 and v22(l_Stylizer_0, l_RowData_0, l_Icon_0) or v29(l_Stylizer_0, l_RowData_0);
    local l_showMenu_0 = l_state_0.showMenu;
    local l_MenuItems_0 = l_props_0.MenuItems;
    local v55 = 0;
    for _, v57 in ipairs(l_MenuItems_0) do
        v55 = math.max(v55, l_TextService_0:GetTextSize(v57.Text, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(1e999, 1e999)).X + l_Stylizer_0.table.menu.itemPadding);
    end;
    v52[#l_RowData_0 + 1] = v1.createElement("ImageButton", {
        Size = UDim2.new(0, l_Stylizer_0.table.menu.buttonSize, 0, l_Stylizer_0.table.menu.buttonSize), 
        LayoutOrder = #l_RowData_0 + 1, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v45.buttonRef, 
        [v1.Event.Activated] = v45.showMenu
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_Stylizer_0.table.item.padding)
        }), 
        Dots = v1.createElement(l_FitTextLabel_0, v2.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "...", 
            Font = Enum.Font.SourceSansBold, 
            BackgroundTransparency = 1, 
            width = l_Stylizer_0.table.menu.buttonSize
        })), 
        Menu = v1.createElement(l_DropdownMenu_0, {
            Hide = not l_showMenu_0, 
            Items = l_MenuItems_0, 
            OnFocusLost = v45.hideMenu, 
            OnItemActivated = v45.onItemClicked, 
            OnRenderItem = function(v58, v59, v60) --[[ Line: 311 ]] --[[ Name: OnRenderItem ]]
                -- upvalues: v45 (copy), l_Stylizer_0 (copy), v55 (ref)
                return v45:renderMenuItem(v58, v59, v60, l_Stylizer_0, v55);
            end, 
            Width = v55
        }); 
        v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
    local v61 = l_Icon_0 and l_Stylizer_0.table.icon.height + 10 or l_Stylizer_0.table.item.height;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v61), 
        BackgroundColor3 = l_Stylizer_0.table.item.background, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, v2.Dictionary.join({
        RowLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.table.textPadding), 
            PaddingRight = UDim.new(0, l_Stylizer_0.table.textPadding)
        })
    }, v52));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v12));