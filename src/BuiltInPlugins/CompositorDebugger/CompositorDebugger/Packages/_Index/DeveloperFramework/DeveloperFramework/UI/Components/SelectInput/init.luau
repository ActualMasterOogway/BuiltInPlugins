local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = v7.getFFlagDevFrameworkDropdownMenuHeight();
local v9 = v7.getFFlagDevFrameworkModernStartPageStyle();
local v10 = v7.getFFlagDevFrameworkViewTypeSelectorIcons();
local l_UI_0 = l_Parent_0.UI;
local v12 = require(l_UI_0.Components.Container);
local v13 = require(l_UI_0.Components.DropdownMenu);
local v14 = require(l_UI_0.Components.Image);
local v15 = require(l_UI_0.Components.Pane);
local v16 = require(l_UI_0.Components.RoundBox);
local v17 = require(l_UI_0.Components.TextLabel);
local v18 = require(l_Parent_0.Styling.hasTag);
local v19 = require(l_Parent_0.Styling.joinTags);
local v20 = require(l_Parent_0.Util);
local l_prioritize_0 = v20.prioritize;
local v22 = require(l_Parent_0.Util.StyleModifier);
local v23 = require(l_Parent_0.Util.Typecheck);
local v24 = game:DefineFastFlag("DevFrameworkSelectInputTextTruncate", false);
local v25 = require(script.styles);
local v26 = v1.PureComponent:extend("SelectInput");
v23.wrap(v26, script);
local l_isInputMainPress_0 = v20.isInputMainPress;
v26.defaultProps = {
    Enabled = true, 
    ShowSelection = true
};
local v28 = nil;
if not v6 then
    v28 = function(v29, v30, v31) --[[ Line: 96 ]]
        -- upvalues: v22 (copy), v1 (copy)
        if v29 then
            return v22.Hover;
        elseif v30 then
            return v22.Error;
        else
            return v31 or v1.None;
        end;
    end;
end;
v26.init = function(v32) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v6 (copy), v28 (ref), l_isInputMainPress_0 (copy)
    v32.state = {
        isOpen = false, 
        hoveredItemIndex = v8 and 1 or nil, 
        isHovered = false
    };
    local function _(v33) --[[ Line: 114 ]] --[[ Name: setHovered ]]
        -- upvalues: v32 (copy), v6 (ref), v28 (ref)
        v32:setState({
            isHovered = v33, 
            StyleModifier = if v6 then nil else v28(v33, v32.props.ErrorText ~= nil)
        });
    end;
    if not v6 then
        v32.mouseEnter = function() --[[ Line: 124 ]]
            -- upvalues: v32 (copy), v6 (ref), v28 (ref)
            v32:setState({
                isHovered = true, 
                StyleModifier = if v6 then nil else v28(true, v32.props.ErrorText ~= nil)
            });
        end;
        v32.mouseLeave = function() --[[ Line: 128 ]]
            -- upvalues: v32 (copy), v6 (ref), v28 (ref)
            v32:setState({
                isHovered = false, 
                StyleModifier = if v6 then nil else v28(false, v32.props.ErrorText ~= nil)
            });
        end;
    end;
    v32.onInputBegan = function(_, v36) --[[ Line: 133 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v32 (copy), v8 (ref)
        if l_isInputMainPress_0(v36) and v32.props.Enabled == true then
            v32:setState({
                isOpen = true
            });
        end;
        if v8 and v36.UserInputType == Enum.UserInputType.Keyboard and v32.state.isOpen and v32.props.Enabled then
            local l_props_0 = v32.props;
            local l_hoveredItemIndex_0 = v32.state.hoveredItemIndex;
            if v36.KeyCode == Enum.KeyCode.Down then
                v32.onHoveredItemChanged((math.min(#l_props_0.Items, l_hoveredItemIndex_0 + 1)));
                return;
            elseif v36.KeyCode == Enum.KeyCode.Up then
                v32.onHoveredItemChanged((math.max(1, l_hoveredItemIndex_0 - 1)));
                return;
            elseif v36.KeyCode == Enum.KeyCode.Return then
                l_props_0.OnItemActivated(l_props_0.Items[l_hoveredItemIndex_0]);
                v32.focusLost();
            end;
        end;
    end;
    if v8 then
        v32.onHoveredItemChanged = function(v39) --[[ Line: 161 ]]
            -- upvalues: v32 (copy)
            v32:setState({
                hoveredItemIndex = v39
            });
        end;
    end;
    v32.focusLost = function() --[[ Line: 168 ]]
        -- upvalues: v32 (copy)
        if v32.props.Enabled == true then
            v32:setState({
                isOpen = false
            });
        end;
    end;
end;
if not v6 then
    v26.getDerivedStateFromProps = function(v40, v41) --[[ Line: 178 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: v28 (ref)
        local v42 = v28(v41.isHovered, v40.ErrorText ~= nil, v40.StyleModifier);
        if v42 == v41.styleModifier then
            return nil;
        else
            return {
                StyleModifier = v42
            };
        end;
    end;
end;
v26.render = function(v43) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v9 (copy), v18 (copy), v5 (copy), l_prioritize_0 (copy), v25 (copy), v10 (copy), v1 (copy), v14 (copy), v17 (copy), v24 (copy), v19 (copy), v13 (copy), v8 (copy), v12 (copy), v16 (copy), v15 (copy), l_join_0 (copy)
    local l_props_1 = v43.props;
    local l_state_0 = v43.state;
    local v46 = if v6 then l_props_1.Style or {} else l_props_1.Stylizer;
    local l_Items_0 = l_props_1.Items;
    local l_Icons_0 = l_props_1.Icons;
    local l_TextWrapped_0 = l_props_1.TextWrapped;
    local l_TextTruncate_0 = l_props_1.TextTruncate;
    local v51 = v9 and l_props_1.Variant == "modern";
    local l_isOpen_0 = l_state_0.isOpen;
    local v53 = if v6 then l_props_1.ErrorText ~= nil or v18(l_props_1[v5.Tag], "Error") else l_props_1.ErrorText ~= nil;
    local v54 = if v6 then l_props_1.Size else l_prioritize_0(l_props_1.Size, v46.Size, UDim2.new(1, 0, 1, 0));
    if l_props_1.Width then
        v54 = if v6 then if v54 then UDim2.new(0, l_props_1.Width, v54.Y.Scale, v54.Y.Offset) else UDim2.fromOffset(l_props_1.Width, v25:GetAttribute("Height")) else UDim2.new(0, l_props_1.Width, v54.Y.Scale, v54.Y.Offset);
    end;
    local l_SelectedIndex_0 = l_props_1.SelectedIndex;
    if l_props_1.SelectedId ~= nil then
        for v56, v57 in ipairs(l_Items_0) do
            if typeof(v57) == "table" and v57.Id == l_props_1.SelectedId then
                l_SelectedIndex_0 = v56;
                break;
            end;
        end;
    end;
    local l_HideIcon_0 = l_props_1.HideIcon;
    local v59 = nil;
    if not l_HideIcon_0 and l_Icons_0 then
        v59 = if l_SelectedIndex_0 and l_Icons_0[l_SelectedIndex_0] ~= "" then l_Icons_0[l_SelectedIndex_0] else nil;
    end;
    local v60 = if not not v59 or v10 and v6 and v18(l_props_1[v5.Tag], "HasIcon") then v1.createElement(if v6 then v14 else "ImageLabel", if v6 then {
        Image = v59, 
        [v5.Tag] = "Icon16 Primary"
    } else {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, v46.IconOffset, 0.5, 0), 
        Size = v46.IconSize, 
        Image = v59, 
        ImageColor3 = v46.ArrowColor, 
        BackgroundTransparency = 1
    }) else nil;
    local l_HideText_0 = l_props_1.HideText;
    local l_BackgroundStyle_0 = v46.BackgroundStyle;
    local v63 = nil;
    if not l_HideText_0 then
        local v64 = if l_SelectedIndex_0 then l_Items_0[l_SelectedIndex_0] else nil;
        v63 = if v64 then if type(v64) == "table" then v64.Label else v64 else l_props_1.PlaceholderText;
    end;
    local v65 = if v6 then v25:GetAttribute("ArrowOffset") else v46.ArrowOffset + v46.ArrowSize.X.Offset;
    local v66 = if v59 then if v6 then v25:GetAttribute("IconOffset") else v46.IconOffset + v46.IconSize.X.Offset else 0;
    local v67 = if v6 then v25:GetAttribute("Padding") or 0 else v46.Padding;
    local v68 = UDim2.new(1, -(v66 + v65 + v67), 1, -2);
    local v69 = UDim2.fromOffset(v67 + v66, 0);
    local v70 = if v63 then v1.createElement(v17, if v6 then {
        Text = v63, 
        TextWrapped = l_TextWrapped_0, 
        TextTruncate = if v24 then l_TextTruncate_0 else nil, 
        [v5.Tag] = v19("Left", v51 and "Muted" or "")
    } else {
        Position = v69, 
        Size = v68, 
        Text = v63, 
        TextColor = not l_SelectedIndex_0 and v46.PlaceholderTextColor or nil, 
        TextTruncate = l_TextTruncate_0, 
        TextWrapped = l_TextWrapped_0, 
        TextXAlignment = Enum.TextXAlignment.Left
    }) else nil;
    local v71 = v1.createElement(if v6 then v14 else "ImageLabel", if v6 then {
        Image = l_props_1.ExpandIcon, 
        [v5.Tag] = "ArrowIcon Primary"
    } else {
        AnchorPoint = Vector2.new(1, 0.5), 
        Size = v46.ArrowSize, 
        Position = UDim2.new(1, -v46.ArrowOffset, 0.5, 0), 
        Image = l_props_1.ExpandIcon or v46.ArrowImage, 
        ImageColor3 = v46.ArrowColor, 
        BackgroundTransparency = 1
    });
    local v72 = v1.createElement(v13, {
        Width = l_props_1.Width, 
        UseAutoWidth = l_props_1.UseAutoWidth, 
        Hide = not l_isOpen_0, 
        HoveredItemIndex = if v8 then l_state_0.hoveredItemIndex else nil, 
        Icons = l_Icons_0, 
        Items = l_Items_0, 
        MaxHeight = if v8 then l_props_1.MenuHeight else nil, 
        OnHoveredItemChanged = if v8 then v43.onHoveredItemChanged else nil, 
        OnFocusLost = v43.focusLost, 
        OnItemActivated = l_props_1.OnItemActivated, 
        OnRenderItem = l_props_1.OnRenderItem, 
        OnMouseEnter = l_props_1.OnMouseEnter, 
        OnMouseLeave = l_props_1.OnMouseLeave, 
        Style = v51 and "Modern" or v46.DropdownMenu, 
        TextWrapped = l_TextWrapped_0, 
        Variant = v51 and "modern" or nil
    });
    local v73 = {
        BackgroundTransparency = if v6 then nil else 1, 
        Size = if v6 then nil else UDim2.fromScale(1, 1), 
        [v1.Event.InputBegan] = v43.onInputBegan, 
        [v1.Event.MouseEnter] = v43.mouseEnter, 
        [v1.Event.MouseLeave] = v43.mouseLeave
    };
    local v74 = nil;
    if l_props_1.ShowSelection then
        v73.Text = "";
        v73.AutoButtonColor = false;
        if v6 then
            v73[v5.Tag] = v19(v59 and "HasIcon" or nil, not l_SelectedIndex_0 and "Placeholder" or nil, v51 and "Component-SelectInput-Selection Row" or "X-Input Row", l_props_1[v5.Tag]);
            v74 = {
                SelectedItemIcon = v60, 
                SelectedItemText = v70, 
                SelectArrow = v71, 
                Menu = v72
            };
        else
            v74 = {
                Input = v1.createElement(v12, {
                    Background = v16, 
                    BackgroundStyle = l_BackgroundStyle_0, 
                    BackgroundStyleModifier = v43.state.StyleModifier
                }, {
                    SelectedItemIcon = v60, 
                    SelectedItemText = v70, 
                    SelectArrow = v71
                }), 
                Menu = v72
            };
        end;
    else
        v74 = {
            Menu = v72
        };
        v73.Image = if v6 then l_props_1.ExpandIcon else l_props_1.ExpandIcon or v46.ArrowImage;
    end;
    local v75 = l_props_1.ShowSelection and "TextButton" or "ImageButton";
    local v76 = {
        SelectInput = v1.createElement(v75, v73, v74)
    };
    local v77 = if v6 then v25:GetAttribute("ErrorHeight") else v46.ErrorTextStyle.TextSize;
    if l_props_1.ErrorText ~= nil then
        if v6 then
            v76.ErrorText = v1.createElement(v17, {
                LayoutOrder = 2, 
                Text = l_props_1.ErrorText, 
                [v5.Tag] = "Wrap Error X-Fit"
            });
        else
            v76 = {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Contents = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, -v77)
                }, v76), 
                ErrorText = v1.createElement(v17, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    Style = v46.ErrorTextStyle, 
                    Text = l_props_1.ErrorText, 
                    TextWrapped = true
                })
            };
            v54 = v54 + UDim2.fromOffset(0, v77);
        end;
    end;
    return v1.createElement(if v6 then v15 else "Frame", l_join_0({
        AnchorPoint = l_props_1.AnchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Position = l_props_1.Position, 
        Size = v54
    }, if v6 then {
        [v5.Tag] = v19("Component-SelectInput X-ColumnM", v53 and "HasError" or nil, v51 and "modern" or nil)
    } else nil), v76);
end;
return (l_withContext_0({
    Focus = v2.Focus, 
    Stylizer = if v6 then nil else v2.Stylizer
})(v26));