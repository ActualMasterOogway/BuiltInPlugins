local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v3 = require(l_Parent_0.Styling.supportsStyleSheets);
local v4 = require(l_Parent_0.Styling.joinTags);
local v5 = require(script.Parent.styles);
local l_v5_Attribute_0 = v5:GetAttribute("ArrowSize");
local l_v5_Attribute_1 = v5:GetAttribute("CellPadding");
local l_v5_Attribute_2 = v5:GetAttribute("Indent");
local v9 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkModernTreeTable();
local v10 = game:DefineFastFlag("DevFrameworkTreeTableShimmer", false);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_UI_0 = l_Parent_0.UI;
local v13 = require(l_UI_0.Components.IconButton);
local v14 = require(l_UI_0.Components.Image);
local v15 = require(l_UI_0.Components.Pane);
local v16 = require(l_UI_0.Components.PropertyCell);
local v17 = require(l_UI_0.Components.Shimmer);
local v18 = require(l_UI_0.Components.Tooltip);
local v19 = require(l_UI_0.Components.TextLabel);
local v20 = require(l_UI_0.Components.DEPRECATED_TextInput);
local v21 = require(l_Parent_0.Util.StyleModifier);
local l_TweenService_0 = game:GetService("TweenService");
local v23 = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
local v24 = v1.PureComponent:extend("TreeTableCell");
v24.init = function(v25) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v3 (copy), l_v5_Attribute_1 (copy), l_v5_Attribute_2 (copy), v20 (copy), v19 (copy), l_join_0 (copy), v9 (copy), v2 (copy), v16 (copy)
    v25.state = {
        textOverflows = false
    };
    v25.onToggle = function() --[[ Line: 45 ]]
        -- upvalues: v25 (copy)
        v25.props.CellProps.OnToggle(v25.props.Row);
    end;
    v25.textRef = v1.createRef();
    v25.toggleRef = v1.createRef();
    v25.fetchCellContentsWidthIfOverflow = function() --[[ Line: 52 ]]
        -- upvalues: v25 (copy), v3 (ref), l_v5_Attribute_1 (ref), l_v5_Attribute_2 (ref)
        if v25.state.textOverflows then
            local l_CellStyle_0 = v25.props.CellProps.CellStyle;
            local v27 = if v3 then l_v5_Attribute_1 + l_v5_Attribute_2 else l_CellStyle_0.CellPadding.Left + l_CellStyle_0.Indent;
            return v25.textRef.current.AbsoluteSize.X + v27;
        else
            return 0;
        end;
    end;
    v25.onAbsoluteSizeChanged = function() --[[ Line: 63 ]]
        -- upvalues: v25 (copy)
        if v25.textRef:getValue() then
            v25:setState({
                textOverflows = not v25.textRef:getValue().TextFits
            });
        end;
        local l_props_0 = v25.props;
        if v25.textRef.current and l_props_0.SetCellContentsWidth then
            l_props_0.SetCellContentsWidth(l_props_0.ColumnIndex, l_props_0.RowIndex, v25.fetchCellContentsWidthIfOverflow());
        end;
    end;
    v25.onTextInputFocusLost = function(v29, v30) --[[ Line: 74 ]]
        -- upvalues: v25 (copy)
        local l_props_1 = v25.props;
        local l_OnFocusLost_0 = l_props_1.CellProps.OnFocusLost;
        if l_OnFocusLost_0 then
            l_OnFocusLost_0(v29, v30, l_props_1.Row, l_props_1.ColumnIndex);
        end;
    end;
    v25.onPressed = function(...) --[[ Line: 81 ]]
        -- upvalues: v25 (copy)
        local l_props_2 = v25.props;
        if l_props_2.CellProps.OnCellPressed then
            l_props_2.CellProps.OnCellPressed(l_props_2.Row.item.Path, l_props_2.ColumnIndex, ...);
        end;
    end;
    v25.onDoubleClick = function(...) --[[ Line: 87 ]]
        -- upvalues: v25 (copy)
        local l_props_3 = v25.props;
        if l_props_3.CellProps.OnCellDoubleClick then
            l_props_3.CellProps.OnCellDoubleClick(l_props_3.Row.item.Path, l_props_3.ColumnIndex, ...);
        end;
    end;
    v25.getTextElement = function(v35, v36, v37) --[[ Line: 94 ]]
        -- upvalues: v1 (ref), v20 (ref), v25 (copy), v19 (ref), l_join_0 (ref), v3 (ref), v9 (ref), v2 (ref)
        local l_TextInputCols_0 = v35.CellProps.TextInputCols;
        local l_Row_0 = v35.Row;
        if l_TextInputCols_0 and l_TextInputCols_0[v35.ColumnIndex] and l_Row_0.depth == 0 then
            return v1.createElement(v20, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                OnFocusLost = v25.onTextInputFocusLost, 
                Size = v37, 
                Text = v36, 
                [v1.Ref] = v25.textRef
            });
        else
            return v36 and v1.createElement(v19, l_join_0({
                LayoutOrder = 3, 
                Size = v37, 
                Text = v36, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v1.Ref] = v25.textRef
            }, if v3 and v9 then {
                [v2.Tag] = "Component-TreeTableCellText"
            } else nil)) or nil;
        end;
    end;
    v25.getTextFromProps = function(v40) --[[ Line: 131 ]]
        local v41 = v40.Columns[v40.ColumnIndex];
        local v42 = v41.Key or v41.Name;
        return v40.Row.item[v42];
    end;
    v25.getPropertyCell = function(v43) --[[ Line: 137 ]]
        -- upvalues: v25 (copy), l_join_0 (ref), v1 (ref), v16 (ref)
        local l_CellProps_0 = v25.props.CellProps;
        local v45 = l_join_0(l_CellProps_0.Renderers, v43.Renderers);
        return v1.createElement(v16, {
            ErrorMessage = v43.ErrorMessage, 
            GetAutocompleteItems = l_CellProps_0.GetAutocompleteItems, 
            Item = v43.Item, 
            LayoutOrder = 3, 
            OnChanged = v25.onChanged, 
            OnClick = v43.OnClick, 
            OnDoubleClick = v43.OnDoubleClick, 
            OnPressed = v43.OnPressed, 
            Renderers = v45, 
            Schema = v43.Schema, 
            Selected = v43.Selected, 
            Size = v43.Size, 
            StyleModifier = v43.StyleModifier, 
            Value = v43.Value
        });
    end;
    v25.onChanged = function(v46) --[[ Line: 158 ]]
        -- upvalues: v25 (copy)
        if v25.props.CellProps.OnCellEdited then
            v25.props.CellProps.OnCellEdited(v46, v25.props.Row.item.Path, v25.props.ColumnIndex);
        end;
    end;
    v25.defaultGetItemId = function(v47) --[[ Line: 164 ]]
        return v47;
    end;
    v25.getItemId = v25.props.CellProps and v25.props.CellProps.GetItemId or v25.defaultGetItemId;
end;
v24.didMount = function(v48) --[[ Line: 169 ]] --[[ Name: didMount ]]
    local l_props_4 = v48.props;
    local v50 = v48.getItemId(l_props_4.Row.item);
    local v51 = l_props_4.CellProps.Expansion[v50];
    if v48.toggleRef.current and v51 then
        v48.toggleRef.current.Rotation = 90;
    end;
end;
v24.willUpdate = function(v52, v53) --[[ Line: 178 ]] --[[ Name: willUpdate ]]
    if v53.CellProps ~= v52.props.CellProps or v53.CellProps and v52.props.CellProps and v53.CellProps.GetItemId ~= v52.props.CellProps.GetItemId then
        v52.getItemId = v53 and v53.CellProps and v53.CellProps.GetItemId or v52.defaultGetItemId;
    end;
end;
v24.didUpdate = function(v54, v55) --[[ Line: 191 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_TweenService_0 (copy), v23 (copy)
    local l_props_5 = v54.props;
    if (v55.RowIndex ~= l_props_5.RowIndex or v54.getTextFromProps(v55) ~= v54.getTextFromProps(l_props_5)) and l_props_5.SetCellContentsWidth then
        l_props_5.SetCellContentsWidth(l_props_5.ColumnIndex, l_props_5.RowIndex, v54.fetchCellContentsWidthIfOverflow());
    end;
    local v57 = v54.getItemId(l_props_5.Row.item);
    local v58 = l_props_5.CellProps.Expansion[v57];
    if v54.toggleTween then
        v54.toggleTween:Pause();
    end;
    if v54.toggleRef.current then
        local v59 = v58 and 90 or 0;
        if v55.Row.item == l_props_5.Row.item then
            v54.toggleTween = l_TweenService_0:Create(v54.toggleRef.current, v23, {
                Rotation = v59
            });
            v54.toggleTween:Play();
            return;
        else
            v54.toggleRef.current.Rotation = v59;
        end;
    end;
end;
v24.render = function(v60) --[[ Line: 218 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v3 (copy), l_join_0 (copy), v21 (copy), l_v5_Attribute_0 (copy), l_v5_Attribute_2 (copy), l_v5_Attribute_1 (copy), v1 (copy), v13 (copy), v2 (copy), v4 (copy), v15 (copy), v18 (copy), v14 (copy), v17 (copy)
    local l_props_6 = v60.props;
    local v62 = l_props_6.Columns[l_props_6.ColumnIndex];
    local v63 = v62.Key or v62.Name;
    local v64 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    local l_Row_1 = l_props_6.Row;
    local l_CellProps_1 = l_props_6.CellProps;
    local v67 = l_Row_1.item[v63];
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = false;
    if typeof(v67) == "table" then
        v68 = tostring(v67.Value);
        v69 = v67.LeftIcon;
        v70 = if v10 then v67.Shimmer else nil;
        if v67.Schema then
            v71 = true;
        end;
    else
        v68 = tostring(v67);
    end;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    if typeof(v67) == "table" then
        v72 = l_props_6.Tooltip or v67.ErrorMessage or v68;
        v74 = v72 == v67.ErrorMessage;
    else
        v72 = l_props_6.Tooltip or v68;
    end;
    local v75 = false;
    if v72 ~= nil then
        v75 = false;
        if v72 ~= "" then
            v75 = (not not v60.state.textOverflows or v74) and not l_CellProps_1.DisableTooltip;
        end;
    end;
    v73 = v75;
    v75 = if v3 then nil else l_join_0(l_props_6.Style, l_CellProps_1.CellStyle);
    local v76 = if v3 then nil else if l_props_6.Emphasis then v75.BackgroundOdd else v75.BackgroundEven;
    if not v3 and l_props_6.HighlightCell and v75[v21.Hover] then
        v76 = l_props_6.RowIndex % 2 == 1 and v75[v21.Hover].BackgroundOdd or v75[v21.Hover].BackgroundEven;
    end;
    local v77 = if v3 then l_v5_Attribute_0 else v75.Arrow.Size;
    local v78 = l_Row_1.depth * if v3 then l_v5_Attribute_2 else v75.Indent;
    local v79 = l_props_6.ColumnIndex == 1;
    local v80 = if v3 then nil else if v71 then v75.SchemaCellPadding else v75.CellPadding;
    local v81 = if v3 then nil else v79 and {
        Top = v80.Top, 
        Left = v75.CellPadding.Left + v78, 
        Right = v80.Right, 
        Bottom = v80.Bottom
    } or v80;
    local l_hasChildren_0 = l_Row_1.hasChildren;
    local v83 = 0;
    local v84 = nil;
    if typeof(v67) == "table" and v67.Actions then
        v83 = v83 + if v3 then l_v5_Attribute_1 else v75.CellSpacing;
        v84 = {};
        for v85, v86 in ipairs(v67.Actions) do
            v84["Action " .. v85] = v1.createElement(v13, if v3 then {
                Cursor = "PointingHand", 
                LayoutOrder = v85, 
                LeftIcon = v86.Icon.Image, 
                OnClick = function() --[[ Line: 293 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_CellProps_1 (copy), v86 (copy), l_Row_1 (copy), l_props_6 (copy)
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v86.Id, l_Row_1.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v86.Icon.Size, 
                TooltipText = v86.Tooltip, 
                IconTag = "Icon16 Primary", 
                [v2.Tag] = v4("Compact", v86[v2.Tag])
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v85, 
                LeftIcon = v86.Icon.Image, 
                OnClick = function() --[[ Line: 307 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_CellProps_1 (copy), v86 (copy), l_Row_1 (copy), l_props_6 (copy)
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v86.Id, l_Row_1.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v86.Icon.Size, 
                Style = "Compact", 
                TooltipText = v86.Tooltip
            });
            v83 = v83 + 32;
        end;
    end;
    local v87 = 0;
    if v69 then
        v87 = v87 + ((if v3 then l_v5_Attribute_1 else v75.CellSpacing) + v69.Size.X.Offset);
    end;
    if v79 then
        v87 = v87 + ((if v3 then l_v5_Attribute_1 else v75.CellSpacing) + v77);
    end;
    local v88 = UDim2.new(1, -v87, 1, 0);
    local v89 = if v3 then v4("Component-TreeTableCell", l_props_6.StyleModifier == v21.Selected and "Selected" or l_props_6.Emphasis and "Secondary" or "Row", l_props_6[v2.Tag]) else nil;
    local v90 = v84 and (l_props_6.StyleModifier == v21.Hover or l_props_6.StyleModifier == v21.Selected);
    return v1.createElement(v15, if v3 then {
        ClipsDescendants = true, 
        Size = UDim2.new(v64.Scale, v64.Offset, 1, 0), 
        [v1.Change.AbsoluteSize] = v60.onAbsoluteSizeChanged, 
        [v2.Tag] = v89
    } else {
        Style = "Box", 
        BackgroundColor3 = v76, 
        BorderSizePixel = 1, 
        BorderColor3 = v75.Border, 
        Size = UDim2.new(v64.Scale, v64.Offset, 1, 0), 
        [v1.Change.AbsoluteSize] = v60.onAbsoluteSizeChanged, 
        ClipsDescendants = true
    }, {
        Tooltip = v73 and v1.createElement(v18, {
            MaxWidth = if v75 then v75.Tooltip.MaxWidth else nil, 
            Text = v72, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Left = v1.createElement(v15, if v3 then {
            LayoutOrder = l_props_6.ColumnIndex, 
            Size = UDim2.new(1, if v90 then -v83 - v78 else -v78, 1, 0), 
            Position = UDim2.new(0, v78, 0, 0), 
            [v2.Tag] = "Left X-RowM X-Middle"
        } else {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = l_props_6.ColumnIndex, 
            Padding = v81, 
            Spacing = v75.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Size = UDim2.new(1, if v90 then -v83 else 0, 1, 0)
        }, {
            Toggle = if v79 then v1.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v1.createElement("ImageButton", if v3 then {
                    [v2.Tag] = v4("Arrow", not l_hasChildren_0 and "Invisible" or nil), 
                    [v1.Ref] = v60.toggleRef, 
                    [v1.Event.Activated] = v60.onToggle
                } else {
                    Size = UDim2.fromOffset(v77, v77), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = not l_hasChildren_0 and 1 or nil, 
                    Image = v75.Arrow.Image, 
                    ImageColor3 = v75.Arrow.Color, 
                    ImageRectSize = Vector2.new(v77, v77), 
                    ImageRectOffset = v75.Arrow.CollapsedOffset, 
                    [v1.Ref] = v60.toggleRef, 
                    [v1.Event.Activated] = v60.onToggle
                })
            }) else nil, 
            LeftIcon = if v69 then v1.createElement(v14, l_join_0({
                LayoutOrder = 2
            }, v69)) else nil, 
            Shimmer = if v10 and v70 then v1.createElement(v17, v70) else nil, 
            Text = if v71 then v60.getPropertyCell({
                ErrorMessage = v67.ErrorMessage, 
                OnClick = v67.OnClick, 
                OnDoubleClick = v60.onDoubleClick, 
                OnPressed = v60.onPressed, 
                Renderers = v67.Renderers, 
                Schema = v67.Schema, 
                Selected = v67.Selected, 
                Size = v88, 
                Value = v67.Value
            }) else v60.getTextElement(l_props_6, v68, v88)
        }), 
        Right = if v90 then v1.createElement(v15, if v3 then {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -l_v5_Attribute_1, 0.5, 0), 
            [v2.Tag] = "X-RowM X-Fit X-Middle"
        } else {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            Position = UDim2.new(1, -v75.CellSpacing, 0.5, 0), 
            Spacing = v75.CellSpacing
        }, v84) else nil
    });
end;
return v24;