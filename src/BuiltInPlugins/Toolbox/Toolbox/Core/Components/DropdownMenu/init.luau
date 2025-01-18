local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v7 = require(l_Util_0.Images);
local l_ShowOnTop_0 = v3.UI.ShowOnTop;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v12 = require(l_Components_0.RoundButton);
local v13 = require(l_Components_0.DropdownItemsList);
local v14 = v2.PureComponent:extend("DropdownMenu");
v14.init = function(v15, _) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v5 (copy)
    v15.state = {
        isShowingDropdown = false, 
        showDropDownButtonHovered = false
    };
    v15.currentSelectionRef = v2.createRef();
    v15.baseFrameRef = v2.createRef();
    v15.openDropdown = function() --[[ Line: 64 ]]
        -- upvalues: v15 (copy)
        if v15.props.Disabled then
            return;
        else
            v15:setState(function(_, _) --[[ Line: 68 ]]
                -- upvalues: v15 (ref)
                v15.props.Modal.onDropdownToggled(true);
                return {
                    isShowingDropdown = true
                };
            end);
            return;
        end;
    end;
    v15.showDropDownButtonEntered = function() --[[ Line: 78 ]]
        -- upvalues: v15 (copy)
        if v15.props.Disabled then
            return;
        else
            v15:setState({
                showDropDownButtonHovered = true
            });
            return;
        end;
    end;
    v15.showDropDownButtonLeft = function() --[[ Line: 87 ]]
        -- upvalues: v15 (copy)
        if v15.props.Disabled then
            return;
        else
            v15:setState({
                showDropDownButtonHovered = false
            });
            return;
        end;
    end;
    v15.closeDropdown = function() --[[ Line: 96 ]]
        -- upvalues: v15 (copy)
        v15.props.Modal.onDropdownToggled(false);
        v15:setState({
            isShowingDropdown = false
        });
    end;
    v15.focusLost = function(_, v20) --[[ Line: 105 ]]
        -- upvalues: v15 (copy)
        if v20.UserInputType == Enum.UserInputType.Focus then
            v15.closeDropdown();
        end;
    end;
    v15.refresh = function(_) --[[ Line: 111 ]]
        -- upvalues: v15 (copy), v5 (ref)
        if v15.currentSelectionRef.current then
            local l_current_0 = v15.currentSelectionRef.current;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
            local v25 = l_AbsoluteSize_0.X or v5.DROPDOWN_WIDTH;
            local v26 = l_AbsolutePosition_0.y + l_AbsoluteSize_0.y + 2;
            local l_x_0 = l_AbsolutePosition_0.x;
            if v15.state.dropDownWidth ~= v25 or v15.state.dropDownTop ~= v26 or v15.state.dropDownLeft ~= l_x_0 then
                v15:setState({
                    dropDownWidth = v25, 
                    dropDownTop = v26, 
                    dropDownLeft = l_x_0
                });
            end;
        end;
    end;
    v15.onItemClicked = function(v28, v29) --[[ Line: 134 ]]
        -- upvalues: v15 (copy)
        if v15.props.onItemClicked then
            v15.props.onItemClicked(v28, v29);
        end;
        v15.closeDropdown();
    end;
end;
local function _(v30) --[[ Line: 142 ]] --[[ Name: isItemSelectable ]]
    local v31 = true;
    if v30.selectable ~= nil then
        v31 = v30.selectable;
    end;
    return v31;
end;
local function v37(v33) --[[ Line: 146 ]] --[[ Name: findFirstSelectableItemIndex ]]
    for v34, v35 in ipairs(v33) do
        local v36 = true;
        if v35.selectable ~= nil then
            v36 = v35.selectable;
        end;
        if v36 then
            return v34;
        end;
    end;
    warn("No selectable items found in DropdownMenu");
    return 1;
end;
v14.didMount = function(v38) --[[ Line: 156 ]] --[[ Name: didMount ]]
    v38.refresh();
end;
v14.render = function(v39) --[[ Line: 160 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v37 (copy), v2 (copy), v12 (copy), v7 (copy), l_ShowOnTop_0 (copy), v13 (copy)
    local l_props_0 = v39.props;
    local l_state_0 = v39.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_menuKey_0 = l_props_0.menuKey;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local v46 = l_props_0.LayoutOrder or 0;
    local v47 = l_props_0.items or {};
    local v48 = #v47;
    local v49 = math.min(l_props_0.visibleDropDownCount or 5, v48);
    local v50 = l_props_0.rowHeight or 24;
    local v51 = l_props_0.selectedDropDownIndex or 1;
    local v52 = l_props_0.fontSize or v5.FONT_SIZE_MEDIUM;
    local l_setDropdownHeight_0 = l_props_0.setDropdownHeight;
    if #v47 < v51 then
        v51 = 0;
    end;
    local v54 = false;
    if v51 > 0 then
        v54 = false;
        if v51 <= #v47 then
            v54 = v47[v51];
            if v54 then
                local v55 = v47[v51];
                local v56 = true;
                if v55.selectable ~= nil then
                    v56 = v55.selectable;
                end;
                v54 = not v56;
            end;
        end;
    end;
    if v54 then
        v51 = v37(v47);
    end;
    local v57 = false;
    if v51 > 0 then
        v57 = v51 <= #v47;
    end;
    local v58 = l_props_0.Localization:getText("Dropdown", "ChooseOne");
    if v57 and v47[v51] and v47[v51].name then
        v58 = v47[v51].name;
    end;
    local v59 = v5.DROPDOWN_SELECTED_BAR + v5.DROPDOWN_TEXT_INSET;
    local v60 = v5.DROPDOWN_ICON_SIZE * v52 / v5.FONT_SIZE_MEDIUM;
    local l_DROPDOWN_ICON_FROM_RIGHT_0 = v5.DROPDOWN_ICON_FROM_RIGHT;
    local l_currentSelection_0 = l_Stylizer_0.dropdownMenu.currentSelection;
    local l_showDropDownButtonHovered_0 = l_state_0.showDropDownButtonHovered;
    local l_isShowingDropdown_0 = l_state_0.isShowingDropdown;
    local v65 = l_isShowingDropdown_0 or l_showDropDownButtonHovered_0;
    local v66 = v65 and l_currentSelection_0.borderSelectedColor or l_currentSelection_0.borderColor;
    local v67 = if l_props_0.Disabled then l_currentSelection_0.backgroundDisabledColor else if v65 then l_currentSelection_0.backgroundSelectedColor else l_currentSelection_0.backgroundColor;
    local v68 = v65 and l_currentSelection_0.textSelectedColor or l_currentSelection_0.textColor;
    local l_dropdownIconColor_0 = l_currentSelection_0.dropdownIconColor;
    local v70 = UDim2.new(1, 0, 1, 0);
    return v2.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v39.baseFrameRef, 
        LayoutOrder = v46
    }, {
        CurrentSelection = v2.createElement(v12, {
            Size = v70, 
            BackgroundColor3 = v67, 
            BorderColor3 = v66, 
            [v2.Ref] = v39.currentSelectionRef, 
            [v2.Event.Activated] = v39.openDropdown, 
            [v2.Event.MouseEnter] = v39.showDropDownButtonEntered, 
            [v2.Event.MouseLeave] = v39.showDropDownButtonLeft, 
            [v2.Event.InputEnded] = v39.focusLost, 
            [v2.Change.AbsolutePosition] = v39.refresh, 
            [v2.Change.AbsoluteSize] = v39.refresh
        }, {
            CurrentSelectionLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, v59, 0, 0), 
                Size = UDim2.new(1, -(v59 + v60 + l_DROPDOWN_ICON_FROM_RIGHT_0), 1, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = v68, 
                Text = v58, 
                Font = v5.FONT, 
                TextSize = v52, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ClipsDescendants = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            DropDownIcon = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, v60, 0, v60), 
                Position = UDim2.new(1, -l_DROPDOWN_ICON_FROM_RIGHT_0, 0.5, 0), 
                Image = v7.ARROW_DOWN_ICON, 
                Rotation = l_isShowingDropdown_0 and 180 or 0, 
                ImageColor3 = l_dropdownIconColor_0, 
                BackgroundTransparency = 1
            })
        }), 
        DropdownItemsWrapper = l_isShowingDropdown_0 and v2.createElement(l_ShowOnTop_0, {
            Priority = 2
        }, {
            DropdownItemsList = v2.createElement(v13, {
                listKey = l_menuKey_0, 
                items = v47, 
                visibleDropDownCount = v49, 
                rowHeight = v50, 
                fontSize = v52, 
                onItemClicked = v39.onItemClicked, 
                closeDropdown = v39.closeDropdown, 
                setDropdownHeight = l_setDropdownHeight_0, 
                dropDownWidth = l_state_0.dropDownWidth, 
                top = l_state_0.dropDownTop, 
                left = l_state_0.dropDownLeft
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Modal = v6
})(v14));