local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_supportsStyleSheets_0 = v1.Styling.supportsStyleSheets;
local l_joinTags_0 = v1.Styling.joinTags;
local v6 = require(script.Parent.styles);
local l_v6_Attribute_0 = v6:GetAttribute("ArrowSize");
local l_v6_Attribute_1 = v6:GetAttribute("CellPadding");
local l_v6_Attribute_2 = v6:GetAttribute("Indent");
local l_SharedFlags_0 = v1.SharedFlags;
local v11 = l_SharedFlags_0.getFFlagDevFrameworkTreeTableCellPadding();
local v12 = l_SharedFlags_0.getFFlagDevFrameworkFixTreeTableHoverScroll();
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_TweenService_0 = game:GetService("TweenService");
local v24 = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
local v25 = Color3.new(0.2, 0.2, 0.5);
local v26 = v2.PureComponent:extend("TreeTableCell");
v26.init = function(v27) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_supportsStyleSheets_0 (copy), l_v6_Attribute_1 (copy), l_v6_Attribute_2 (copy), l_DEPRECATED_TextInput_0 (copy), l_TextLabel_0 (copy), l_join_0 (copy), l_PropertyCell_0 (copy)
    v27.state = {
        textOverflows = false
    };
    v27.onToggle = function() --[[ Line: 56 ]]
        -- upvalues: v27 (copy)
        v27.props.CellProps.OnToggle(v27.props.Row);
    end;
    v27.textRef = v2.createRef();
    v27.toggleRef = v2.createRef();
    v27.fetchCellContentsWidthIfOverflow = function() --[[ Line: 63 ]]
        -- upvalues: v27 (copy), l_supportsStyleSheets_0 (ref), l_v6_Attribute_1 (ref), l_v6_Attribute_2 (ref)
        if v27.state.textOverflows then
            local l_CellStyle_0 = v27.props.CellProps.CellStyle;
            local v29 = if l_supportsStyleSheets_0 then l_v6_Attribute_1 + l_v6_Attribute_2 else l_CellStyle_0.CellPadding.Left + l_CellStyle_0.Indent;
            return v27.textRef.current.AbsoluteSize.X + v29;
        else
            return 0;
        end;
    end;
    v27.onAbsoluteSizeChanged = function() --[[ Line: 74 ]]
        -- upvalues: v27 (copy)
        if v27.textRef:getValue() then
            v27:setState({
                textOverflows = not v27.textRef:getValue().TextFits
            });
        end;
        local l_props_0 = v27.props;
        if v27.textRef.current and l_props_0.SetCellContentsWidth then
            l_props_0.SetCellContentsWidth(l_props_0.ColumnIndex, l_props_0.RowIndex, v27.fetchCellContentsWidthIfOverflow());
        end;
    end;
    v27.onTextInputFocusLost = function(v31, v32) --[[ Line: 85 ]]
        -- upvalues: v27 (copy)
        local l_props_1 = v27.props;
        local l_OnFocusLost_0 = l_props_1.CellProps.OnFocusLost;
        if l_OnFocusLost_0 then
            l_OnFocusLost_0(v31, v32, l_props_1.Row, l_props_1.ColumnIndex);
        end;
    end;
    v27.onPressed = function(...) --[[ Line: 92 ]]
        -- upvalues: v27 (copy)
        local l_props_2 = v27.props;
        if l_props_2.CellProps.OnCellPressed then
            l_props_2.CellProps.OnCellPressed(l_props_2.Row.item.Path, l_props_2.ColumnIndex, ...);
        end;
    end;
    v27.onDoubleClick = function(...) --[[ Line: 98 ]]
        -- upvalues: v27 (copy)
        local l_props_3 = v27.props;
        if l_props_3.CellProps.OnCellDoubleClick then
            l_props_3.CellProps.OnCellDoubleClick(l_props_3.Row.item.Path, l_props_3.ColumnIndex, ...);
        end;
    end;
    v27.getTextElement = function(v37, v38, v39) --[[ Line: 105 ]]
        -- upvalues: v2 (ref), l_DEPRECATED_TextInput_0 (ref), v27 (copy), l_TextLabel_0 (ref)
        local l_TextInputCols_0 = v37.CellProps.TextInputCols;
        local l_Row_0 = v37.Row;
        if l_TextInputCols_0 and l_TextInputCols_0[v37.ColumnIndex] and l_Row_0.depth == 0 then
            return v2.createElement(l_DEPRECATED_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                OnFocusLost = v27.onTextInputFocusLost, 
                Size = v39, 
                Text = v38, 
                [v2.Ref] = v27.textRef
            });
        else
            return v38 and v2.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Size = v39, 
                Text = v38, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v2.Ref] = v27.textRef
            }) or nil;
        end;
    end;
    v27.getTextFromProps = function(v42) --[[ Line: 134 ]]
        local v43 = v42.Columns[v42.ColumnIndex];
        local v44 = v43.Key or v43.Name;
        return v42.Row.item[v44];
    end;
    v27.getPropertyCell = function(v45) --[[ Line: 141 ]]
        -- upvalues: v27 (copy), l_join_0 (ref), v2 (ref), l_PropertyCell_0 (ref)
        local l_CellProps_0 = v27.props.CellProps;
        local v47 = l_join_0(l_CellProps_0.Renderers, v45.Renderers);
        return v2.createElement(l_PropertyCell_0, {
            ErrorMessage = v45.ErrorMessage, 
            GetAutocompleteItems = l_CellProps_0.GetAutocompleteItems, 
            Item = v45.Item, 
            LayoutOrder = 3, 
            OnMenuAction = function(v48) --[[ Line: 149 ]] --[[ Name: OnMenuAction ]]
                -- upvalues: v27 (ref)
                return function() --[[ Line: 150 ]]
                    -- upvalues: v27 (ref), v48 (copy)
                    v27.props.CellProps.OnCellAction(v48, v27.props.Row.item.Path, v27.props.ColumnIndex);
                end;
            end, 
            OnChanged = v27.onChanged, 
            OnClick = v45.OnClick, 
            OnDoubleClick = v45.OnDoubleClick, 
            OnPressed = v45.OnPressed, 
            Renderers = v47, 
            Schema = v45.Schema, 
            Selected = v45.Selected, 
            Size = v45.Size, 
            StyleModifier = v45.StyleModifier, 
            Value = v45.Value, 
            Disabled = v27.props.Row.item._disabled
        });
    end;
    v27.onChanged = function(v49) --[[ Line: 168 ]]
        -- upvalues: v27 (copy)
        if v27.props.CellProps.OnCellEdited then
            v27.props.CellProps.OnCellEdited(v49, v27.props.Row.item.Path, v27.props.ColumnIndex);
        end;
    end;
    v27.defaultGetItemId = function(v50) --[[ Line: 174 ]]
        return v50;
    end;
    v27.getItemId = v27.props.CellProps and v27.props.CellProps.GetItemId or v27.defaultGetItemId;
end;
v26.didMount = function(v51) --[[ Line: 179 ]] --[[ Name: didMount ]]
    local l_props_4 = v51.props;
    local v53 = v51.getItemId(l_props_4.Row.item);
    local v54 = l_props_4.CellProps.Expansion[v53];
    if v51.toggleRef.current and v54 then
        v51.toggleRef.current.Rotation = 90;
    end;
end;
v26.willUpdate = function(v55, v56) --[[ Line: 188 ]] --[[ Name: willUpdate ]]
    if v56.CellProps ~= v55.props.CellProps or v56.CellProps and v55.props.CellProps and v56.CellProps.GetItemId ~= v55.props.CellProps.GetItemId then
        v55.getItemId = v56 and v56.CellProps and v56.CellProps.GetItemId or v55.defaultGetItemId;
    end;
end;
v26.didUpdate = function(v57, v58) --[[ Line: 201 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_TweenService_0 (copy), v24 (copy)
    local l_props_5 = v57.props;
    if (v58.RowIndex ~= l_props_5.RowIndex or v57.getTextFromProps(v58) ~= v57.getTextFromProps(l_props_5)) and l_props_5.SetCellContentsWidth then
        l_props_5.SetCellContentsWidth(l_props_5.ColumnIndex, l_props_5.RowIndex, v57.fetchCellContentsWidthIfOverflow());
    end;
    local v60 = v57.getItemId(l_props_5.Row.item);
    local v61 = l_props_5.CellProps.Expansion[v60];
    if v57.toggleTween then
        v57.toggleTween:Pause();
    end;
    if v57.toggleRef.current then
        local v62 = v61 and 90 or 0;
        if v58.Row.item == l_props_5.Row.item then
            v57.toggleTween = l_TweenService_0:Create(v57.toggleRef.current, v24, {
                Rotation = v62
            });
            v57.toggleTween:Play();
            return;
        else
            v57.toggleRef.current.Rotation = v62;
        end;
    end;
end;
v26.render = function(v63) --[[ Line: 228 ]] --[[ Name: render ]]
    -- upvalues: l_supportsStyleSheets_0 (copy), l_join_0 (copy), l_StyleModifier_0 (copy), v25 (copy), l_v6_Attribute_0 (copy), l_v6_Attribute_2 (copy), v11 (copy), l_v6_Attribute_1 (copy), v2 (copy), l_IconButton_0 (copy), v3 (copy), l_joinTags_0 (copy), l_Pane_0 (copy), l_Tooltip_0 (copy), v12 (copy), l_Image_0 (copy)
    local l_props_6 = v63.props;
    local v65 = l_props_6.Columns[l_props_6.ColumnIndex];
    local v66 = v65.Key or v65.Name;
    local v67 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    local l_Row_1 = l_props_6.Row;
    local l_CellProps_1 = l_props_6.CellProps;
    local v70 = l_Row_1.item[v66];
    local v71 = nil;
    local v72 = nil;
    local v73 = false;
    if typeof(v70) == "table" then
        v71 = tostring(v70.Value);
        v72 = v70.LeftIcon;
        if v70.Schema then
            v73 = true;
        end;
    else
        v71 = if v70 ~= nil then tostring(v70) else "";
    end;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    if typeof(v70) == "table" then
        v74 = l_props_6.Tooltip or v70.ErrorMessage or v71;
        v76 = v74 == v70.ErrorMessage;
    else
        v74 = l_props_6.Tooltip or v71;
    end;
    local v77 = false;
    if v74 ~= nil then
        v77 = false;
        if v74 ~= "" then
            v77 = (not not v63.state.textOverflows or v76) and not l_CellProps_1.DisableTooltip;
        end;
    end;
    v75 = v77;
    v77 = if l_supportsStyleSheets_0 then nil else l_join_0(l_props_6.Style, l_CellProps_1.CellStyle);
    local v78 = if l_supportsStyleSheets_0 then nil else if l_Row_1.depth == 1 then v77.BackgroundEven else v77.BackgroundOdd;
    if not l_supportsStyleSheets_0 and l_props_6.HighlightCell and v77[l_StyleModifier_0.Hover] then
        v78 = if l_Row_1.depth == 1 then v77[l_StyleModifier_0.Hover].BackgroundEven else v77[l_StyleModifier_0.Hover].BackgroundOdd;
    end;
    if l_Row_1.item.select and l_Row_1.item.select.Value or l_Row_1.item.Path.parent and l_Row_1.item.Path.parent.select and l_Row_1.item.Path.parent.select.Value then
        v78 = v25;
    end;
    local v79 = if l_supportsStyleSheets_0 then l_v6_Attribute_0 else v77.Arrow.Size;
    local v80 = l_Row_1.depth * if l_supportsStyleSheets_0 then l_v6_Attribute_2 else v77.Indent;
    local v81 = l_props_6.ColumnIndex == 2;
    local v82 = if l_supportsStyleSheets_0 then nil else if v73 then v77.SchemaCellPadding else v77.CellPadding;
    local v83 = if l_supportsStyleSheets_0 then nil else v81 and {
        Top = v82.Top, 
        Left = v77.CellPadding.Left + v80, 
        Right = v82.Right, 
        Bottom = v82.Bottom
    } or v82;
    local v84 = if v11 then l_Row_1.hasChildren else v81 and l_Row_1.hasChildren;
    local v85 = 0;
    local v86 = nil;
    if typeof(v70) == "table" and v70.Actions then
        v85 = v85 + if l_supportsStyleSheets_0 then l_v6_Attribute_1 else v77.CellSpacing;
        v86 = {};
        for v87, v88 in ipairs(v70.Actions) do
            v86["Action " .. v87] = v2.createElement(l_IconButton_0, if l_supportsStyleSheets_0 then {
                Cursor = "PointingHand", 
                LayoutOrder = v87, 
                LeftIcon = v88.Icon.Image, 
                OnClick = function() --[[ Line: 313 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_CellProps_1 (copy), v88 (copy), l_Row_1 (copy), l_props_6 (copy)
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v88.Id, l_Row_1.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v88.Icon.Size, 
                TooltipText = v88.Tooltip, 
                IconTag = "Icon16 Primary", 
                [v3.Tag] = l_joinTags_0("Compact", v88[v3.Tag])
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v87, 
                LeftIcon = v88.Icon.Image, 
                OnClick = function() --[[ Line: 327 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_CellProps_1 (copy), v88 (copy), l_Row_1 (copy), l_props_6 (copy)
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v88.Id, l_Row_1.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v88.Icon.Size, 
                Style = "Compact", 
                TooltipText = v88.Tooltip
            });
            v85 = v85 + 32;
        end;
    end;
    local v89 = 0;
    if v72 then
        v89 = v89 + ((if l_supportsStyleSheets_0 then l_v6_Attribute_1 else v77.CellSpacing) + v72.Size.X.Offset);
    end;
    local v90 = if v11 then v81 else v84;
    if v90 then
        v89 = v89 + ((if l_supportsStyleSheets_0 then l_v6_Attribute_1 else v77.CellSpacing) + v79);
    end;
    local v91 = UDim2.new(1, -v89, 1, 0);
    local v92 = if l_supportsStyleSheets_0 then l_joinTags_0("Component-TreeTableCell", l_props_6.StyleModifier == l_StyleModifier_0.Selected and "Selected" or l_props_6.Emphasis and "Secondary" or "Row", l_props_6[v3.Tag]) else nil;
    local v93 = v86 and (l_props_6.StyleModifier == l_StyleModifier_0.Hover or l_props_6.StyleModifier == l_StyleModifier_0.Selected);
    return v2.createElement(l_Pane_0, if l_supportsStyleSheets_0 then {
        ClipsDescendants = true, 
        Size = UDim2.new(v67.Scale, v67.Offset, 1, 0), 
        [v2.Change.AbsoluteSize] = v63.onAbsoluteSizeChanged, 
        [v3.Tag] = v92
    } else {
        Style = "Box", 
        BackgroundColor3 = v78, 
        BorderSizePixel = 1, 
        BorderColor3 = v77.Border, 
        Size = UDim2.new(v67.Scale, v67.Offset, 1, 0), 
        [v2.Change.AbsoluteSize] = v63.onAbsoluteSizeChanged, 
        ClipsDescendants = true
    }, {
        Tooltip = v75 and v2.createElement(l_Tooltip_0, {
            MaxWidth = if v77 then v77.Tooltip.MaxWidth else nil, 
            Text = v74, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Left = v2.createElement(l_Pane_0, if l_supportsStyleSheets_0 then {
            LayoutOrder = l_props_6.ColumnIndex, 
            Size = if v12 then UDim2.new(1, if v93 then -v85 - v80 else -v80, 1, 0) else UDim2.new(1, -v85 - v80, 1, 0), 
            Position = UDim2.new(0, v80, 0, 0), 
            [v3.Tag] = "Left X-RowM X-Middle"
        } else {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = l_props_6.ColumnIndex, 
            Padding = v83, 
            Spacing = v77.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Size = if v12 then UDim2.new(1, if v93 then -v85 else 0, 1, 0) else UDim2.new(1, -v85, 1, 0)
        }, {
            Toggle = if v90 then v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v2.createElement("ImageButton", if l_supportsStyleSheets_0 then {
                    [v3.Tag] = if v11 then l_joinTags_0("Arrow", not v84 and "Invisible" or nil) else "Arrow", 
                    [v2.Ref] = v63.toggleRef, 
                    [v2.Event.Activated] = v63.onToggle
                } else {
                    Size = UDim2.fromOffset(v79, v79), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = if not v11 or v84 then nil else 1, 
                    Image = v77.Arrow.Image, 
                    ImageColor3 = v77.Arrow.Color, 
                    ImageRectSize = Vector2.new(v79, v79), 
                    ImageRectOffset = v77.Arrow.CollapsedOffset, 
                    [v2.Ref] = v63.toggleRef, 
                    [v2.Event.Activated] = v63.onToggle
                })
            }) else nil, 
            LeftIcon = v72 and v2.createElement(l_Image_0, l_join_0({
                LayoutOrder = 2
            }, v72)) or nil, 
            Text = if v73 then v63.getPropertyCell({
                ErrorMessage = v70.ErrorMessage, 
                OnClick = v70.OnClick, 
                OnDoubleClick = v63.onDoubleClick, 
                OnPressed = v63.onPressed, 
                Renderers = v70.Renderers, 
                Schema = v70.Schema, 
                Selected = v70.Selected, 
                Size = v91, 
                Value = v70.Value
            }) else v63.getTextElement(l_props_6, v71, v91)
        }), 
        Right = if v93 then v2.createElement(l_Pane_0, if l_supportsStyleSheets_0 then {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -l_v6_Attribute_1, 0.5, 0), 
            [v3.Tag] = "X-RowM X-Fit X-Middle"
        } else {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            Position = UDim2.new(1, -v77.CellSpacing, 0.5, 0), 
            Spacing = v77.CellSpacing
        }, v86) else nil
    });
end;
return v26;