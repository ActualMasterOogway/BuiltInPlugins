local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Separator_0 = l_UI_0.Separator;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v13 = v1.PureComponent:extend("DropdownField");
local _ = function(v14) --[[ Line: 19 ]] --[[ Name: areAllFieldsChecked ]]
    for _, v16 in pairs(v14) do
        if not v16 then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v18) --[[ Line: 28 ]] --[[ Name: areAnyFieldsChecked ]]
    for _, v20 in pairs(v18) do
        if v20 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v22) --[[ Line: 37 ]] --[[ Name: getAllFieldsCheckbox ]]
    -- upvalues: l_Checkbox_0 (copy)
    local v23 = false;
    local v24 = false;
    local v25;
    for _, v27 in pairs(v22) do
        if not v27 then
            v25 = false;
            v23 = true;
        end;
        if v23 then
            break;
        end;
    end;
    if not v23 then
        v25 = true;
    end;
    v23 = false;
    if v25 then
        return true;
    else
        for _, v29 in pairs(v22) do
            if v29 then
                v25 = true;
                v24 = true;
            end;
            if v24 then
                break;
            end;
        end;
        if not v24 then
            v25 = false;
        end;
        v24 = false;
        if v25 then
            return l_Checkbox_0.Indeterminate;
        else
            return false;
        end;
    end;
end;
v13.init = function(v31) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v1 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_Separator_0 (copy), l_Tooltip_0 (copy)
    v31.state = {
        isOpen = false
    };
    v31.onDropdownClick = function(v32) --[[ Line: 52 ]]
        -- upvalues: v31 (copy), v3 (ref)
        local l_props_0 = v31.props;
        local v34 = {};
        local v35 = v3.Dictionary.join(l_props_0.KeyStates, {
            [v32] = not l_props_0.KeyStates[v32]
        });
        for v36, v37 in ipairs(v31.props.KeyTexts) do
            if v36 ~= 1 and v35[v36] then
                table.insert(v34, v37);
            end;
        end;
        l_props_0.ClickCallback(v34);
    end;
    v31.onAllDropdownClick = function(_) --[[ Line: 66 ]]
        -- upvalues: v31 (copy)
        local v39 = false;
        local l_props_1 = v31.props;
        local l_KeyStates_0 = l_props_1.KeyStates;
        local v42;
        for _, v44 in pairs(l_KeyStates_0) do
            if not v44 then
                v42 = false;
                v39 = true;
            end;
            if v39 then
                break;
            end;
        end;
        if not v39 then
            v42 = true;
        end;
        v39 = false;
        local v45 = not v42;
        v42 = {};
        if v45 then
            for v46, v47 in ipairs(v31.props.KeyTexts) do
                if v46 ~= 1 then
                    table.insert(v42, v47);
                end;
            end;
        end;
        l_props_1.ClickCallback(v42);
    end;
    v31.onRenderItem = function(_, v49, _) --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v1 (ref), l_Pane_0 (ref), l_Checkbox_0 (ref), l_Separator_0 (ref), l_Tooltip_0 (ref)
        local v51 = false;
        local v52 = false;
        local v53 = false;
        local l_props_2 = v31.props;
        local l_Localization_0 = l_props_2.Localization;
        local l_Style_0 = l_props_2.Style;
        local l_createElement_0 = v1.createElement;
        local l_l_Pane_0_0 = l_Pane_0;
        local v59 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v49, 
            Stylizer = l_Style_0, 
            BackgroundColor = l_Style_0.MainBackground, 
            BorderColor = l_Style_0.BorderColor
        };
        local v60 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_Checkbox_0_0 = l_Checkbox_0;
        local v63 = {
            LayoutOrder = 1, 
            Key = v49
        };
        local v64;
        if v49 == 1 then
            local l_KeyStates_1 = l_props_2.KeyStates;
            local v66;
            for _, v68 in pairs(l_KeyStates_1) do
                if not v68 then
                    v66 = false;
                    v52 = true;
                end;
                if v52 then
                    break;
                end;
            end;
            if not v52 then
                v66 = true;
            end;
            v52 = false;
            if v66 then
                v64 = true;
            else
                for _, v70 in pairs(l_KeyStates_1) do
                    if v70 then
                        v66 = true;
                        v53 = true;
                    end;
                    if v53 then
                        break;
                    end;
                end;
                if not v53 then
                    v66 = false;
                end;
                v53 = false;
                v64 = if v66 then l_Checkbox_0.Indeterminate else false;
            end;
            v51 = v64;
        end;
        if not v51 then
            v64 = l_props_2.KeyStates[v49];
        end;
        v51 = false;
        v63.Checked = v64;
        v63.OnClick = v49 == 1 and v31.onAllDropdownClick or v31.onDropdownClick;
        v63.Text = l_Localization_0:getText(l_props_2.Widget, v31.props.KeyTexts[v49]);
        v63.Stylizer = l_Style_0;
        v60.CheckboxView = l_createElement_1(l_l_Checkbox_0_0, v63);
        l_createElement_1 = false;
        if v49 == 1 then
            l_createElement_1 = v1.createElement(l_Separator_0, {
                LayoutOrder = 2, 
                Position = UDim2.new(0.5, 0, 1, 0), 
                DominantAxis = Enum.DominantAxis.Width, 
                Style = l_Style_0.Separator, 
                Stylizer = l_Style_0
            });
        end;
        v60.SeparatorView = l_createElement_1;
        v60.Tooltip = v31.props.Tooltips and v31.props.Tooltips[v49] and v1.createElement(l_Tooltip_0, {
            Text = v31.props.Tooltips[v49]
        });
        return l_createElement_0(l_l_Pane_0_0, v59, v60);
    end;
    v31.openMenu = function() --[[ Line: 113 ]]
        -- upvalues: v31 (copy)
        v31:setState(function(_) --[[ Line: 114 ]]
            return {
                isOpen = true
            };
        end);
    end;
    v31.closeMenu = function() --[[ Line: 121 ]]
        -- upvalues: v31 (copy)
        v31:setState(function(_) --[[ Line: 122 ]]
            return {
                isOpen = false
            };
        end);
    end;
end;
v13.render = function(v73) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_Checkbox_0 (copy), v1 (copy), l_Pane_0 (copy), l_IconButton_0 (copy), l_Button_0 (copy), l_DropdownMenu_0 (copy)
    local v74 = false;
    local v75 = false;
    local l_props_3 = v73.props;
    local l_Style_1 = l_props_3.Style;
    local l_Localization_1 = l_props_3.Localization;
    local v79 = not l_props_3.ShouldShowDropdownIcon and not l_props_3.HamburgerMenu;
    local v80 = "";
    if v79 then
        if l_props_3.NumDisplay == 0 then
            v80 = l_Localization_1:getText("Common", "None");
        elseif l_props_3.NumDisplay == 1 then
            for v81, v82 in pairs(l_props_3.KeyStates) do
                if v82 then
                    v80 = l_Localization_1:getText(l_props_3.Widget, v73.props.KeyTexts[v81]);
                end;
            end;
        else
            v80 = if l_props_3.NumDisplay == l_props_3.MaxDisplay then l_Localization_1:getText(l_props_3.Widget, v73.props.KeyTexts[1]) else l_Localization_1:getText(l_props_3.Widget, "DropdownFieldText", {
                NumFields = l_props_3.NumDisplay
            });
        end;
    end;
    local v83 = if v79 then l_props_3.DropdownWidth else v4.BUTTON_SIZE;
    local v84 = {};
    for v85, _ in ipairs(l_props_3.KeyTexts) do
        if v85 == 1 then
            local v87 = l_props_3.KeyTexts[v85];
            local l_KeyStates_2 = l_props_3.KeyStates;
            local v89;
            for _, v91 in pairs(l_KeyStates_2) do
                if not v91 then
                    v89 = false;
                    v74 = true;
                end;
                if v74 then
                    break;
                end;
            end;
            if not v74 then
                v89 = true;
            end;
            v74 = false;
            local v92;
            if v89 then
                v92 = true;
            else
                for _, v94 in pairs(l_KeyStates_2) do
                    if v94 then
                        v89 = true;
                        v75 = true;
                    end;
                    if v75 then
                        break;
                    end;
                end;
                if not v75 then
                    v89 = false;
                end;
                v75 = false;
                v92 = if v89 then l_Checkbox_0.Indeterminate else false;
            end;
            table.insert(v84, v87 .. tostring(v92));
        else
            table.insert(v84, l_props_3.KeyTexts[v85] .. tostring(l_props_3.KeyStates[v85]));
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(0, v83, 1, 0), 
        LayoutOrder = l_props_3.LayoutOrder
    }, {
        IconView = l_props_3.ShouldShowDropdownIcon and v1.createElement(l_IconButton_0, {
            Size = UDim2.new(0, v4.BUTTON_SIZE, 0, v4.BUTTON_SIZE), 
            LeftIcon = "rbxasset://textures/Debugger/Breakpoints/filter.png", 
            TooltipText = l_props_3.Tooltip, 
            OnClick = v73.openMenu
        }), 
        HamburgerIconView = l_props_3.HamburgerMenu and v1.createElement(l_IconButton_0, {
            Size = UDim2.new(0, v4.BUTTON_SIZE, 0, v4.BUTTON_SIZE), 
            LeftIcon = "rbxasset://textures/Debugger/Breakpoints/MoreButton.png", 
            OnClick = v73.openMenu, 
            BackgroundStyle = "Box"
        }), 
        ButtonView = v79 and v1.createElement(l_Button_0, {
            Text = v80, 
            TextSize = l_Style_1.TextSize, 
            Font = l_Style_1.Font, 
            Size = UDim2.new(1, 0, 1, 0), 
            Stylizer = l_Style_1, 
            BorderSizePixel = 0, 
            OnClick = v73.openMenu, 
            Tooltip = l_props_3.Tooltip
        }), 
        DropdownView = v1.createElement(l_DropdownMenu_0, {
            Width = l_props_3.DropdownWidth, 
            Hide = not v73.state.isOpen, 
            Items = v84, 
            OnFocusLost = v73.closeMenu, 
            OnRenderItem = v73.onRenderItem, 
            Stylizer = l_Style_1
        })
    });
end;
return v13;