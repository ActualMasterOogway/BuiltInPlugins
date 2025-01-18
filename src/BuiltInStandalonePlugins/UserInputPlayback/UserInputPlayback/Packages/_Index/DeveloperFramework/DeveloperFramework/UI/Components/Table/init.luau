local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.deepEqual);
local v3 = require(l_Parent_0.Util.prioritize);
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v5.withContext;
local v7 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v8 = require(l_Parent_0.Styling.supportsStyleSheets);
local v9 = require(l_Parent_0.Styling.joinTags);
local v10 = require(script.styles);
local l_v10_Attribute_0 = v10:GetAttribute("RowHeight");
local l_v10_Attribute_1 = v10:GetAttribute("FooterHeight");
local l_v10_Attribute_2 = v10:GetAttribute("HeaderHeight");
local l_v10_Attribute_3 = v10:GetAttribute("ScrollHeaderPadding");
local v15 = require(l_Parent_0.Parent.Dash);
local l_map_0 = v15.map;
local l_reduce_0 = v15.reduce;
local l_some_0 = v15.some;
local l_join_0 = v15.join;
local v20 = require(l_Parent_0.UI.Components.Pane);
local v21 = require(l_Parent_0.UI.Components.List);
local v22 = require(l_Parent_0.UI.Components.SplitPane);
local v23 = require(l_Parent_0.UI.Components.TableRow);
local v24 = require(script.TableHeaderCell);
local v25 = game:DefineFastFlag("DevFrameworkScrollHeaderPadding", false);
local v26 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkModernTreeTable();
local v27 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkTableUseKeyProp)();
local v28 = v1.PureComponent:extend("Table");
v4.wrap(v28, script);
local v29 = UDim.new(0, 50);
v28.init = function(v30) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v8 (copy), l_v10_Attribute_2 (copy), l_v10_Attribute_1 (copy), v29 (copy)
    v30.state = {
        HeaderOffset = 0
    };
    v30.scrollingFrameRef = v1.createRef();
    v30.onHoverRow = function(v31) --[[ Line: 108 ]]
        -- upvalues: v30 (copy)
        if v30.props.OnHoverRow then
            v30.props.OnHoverRow(v31.Row, v31.RowIndex);
        end;
    end;
    v30.onHoverRowEnd = function(v32) --[[ Line: 113 ]]
        -- upvalues: v30 (copy)
        if v30.props.OnHoverRowEnd then
            v30.props.OnHoverRowEnd(v32.Row, v32.RowIndex);
        end;
    end;
    v30.onSelectRow = function(v33) --[[ Line: 119 ]]
        -- upvalues: v30 (copy)
        if v30.props.OnSelectRow then
            v30.props.OnSelectRow(v33.Row, v33.RowIndex);
        end;
    end;
    v30.onDoubleClick = function(v34) --[[ Line: 125 ]]
        -- upvalues: v30 (copy)
        if v30.props.OnDoubleClick then
            v30.props.OnDoubleClick(v34.Row, v34.RowIndex);
        end;
    end;
    v30.onRightClickRow = function(v35, v36) --[[ Line: 131 ]]
        -- upvalues: v30 (copy)
        if v30.props.OnRightClickRow then
            v30.props.OnRightClickRow(v35, v36);
        end;
    end;
    v30:_flushRenderRow();
    v30.getDefaultRowKey = function(v37) --[[ Line: 137 ]]
        -- upvalues: v30 (copy)
        return "Row " .. (v30.rowToIndex[v37] or tostring(v37));
    end;
    v30.onSizeChange = function(v38) --[[ Line: 140 ]]
        -- upvalues: v30 (copy), v8 (ref), l_v10_Attribute_2 (ref), l_v10_Attribute_1 (ref)
        local l_props_0 = v30.props;
        local v40 = if v8 then l_props_0.Style or {} else l_props_0.Stylizer;
        local v41 = if v8 then l_v10_Attribute_2 else v40.HeaderHeight;
        local v42 = l_props_0.Footer and (if v8 then l_v10_Attribute_1 else v40.FooterHeight) or 0;
        local v43 = v38.AbsoluteSize.Y - (v41 + v42) - 5;
        local v44 = if l_props_0.Padding then l_props_0.Padding else 1;
        local v45 = v38.AbsoluteSize.X - 2 * v44;
        v30.props.OnSizeChange(v43, v45);
    end;
    v30.onResizeStart = function() --[[ Line: 154 ]]
        -- upvalues: v30 (copy)
        v30._resizing = true;
    end;
    v30.onResizeEnd = function() --[[ Line: 158 ]]
        -- upvalues: v30 (copy)
        v30._resizing = false;
    end;
    v30.onScrollUpdate = function(v46) --[[ Line: 162 ]]
        -- upvalues: v30 (copy)
        if v30:useVariableWidth() then
            local l_X_0 = v46.X;
            local l_current_0 = v30.scrollingFrameRef.current;
            if v46.X < 10 and l_current_0 and l_current_0.AbsoluteCanvasSize.X - 10 < l_current_0.AbsoluteWindowSize.X then
                l_X_0 = 0;
            end;
            v30:setState({
                HeaderOffset = l_X_0
            });
        end;
    end;
    v30.cellContentsWidth = {};
    v30.setCellContentsWidth = function(v49, v50, v51) --[[ Line: 181 ]]
        -- upvalues: v30 (copy)
        if not v30.cellContentsWidth[v49] then
            v30.cellContentsWidth[v49] = {};
        end;
        v30.cellContentsWidth[v49][v50] = v51;
    end;
    v30.onExpandColumnOnDoubleClick = function(v52, v53) --[[ Line: 188 ]]
        -- upvalues: v30 (copy), v29 (ref)
        local l_props_1 = v30.props;
        if not v30.cellContentsWidth[v52] then
            return;
        else
            local v55 = 0;
            for v56 = 1, #l_props_1.Rows do
                if v30.cellContentsWidth[v52][v56] and v55 < v30.cellContentsWidth[v52][v56] then
                    v55 = v30.cellContentsWidth[v52][v56];
                end;
            end;
            local v57 = {};
            for _, v59 in ipairs(l_props_1.Columns) do
                table.insert(v57, v59.Width);
            end;
            if v55 > 0 then
                v30.expandColumnToFitOverflow(v52, v55, v29.Offset, v53, v57);
            end;
            return;
        end;
    end;
    v30.expandColumnToFitOverflow = function(v60, v61, v62, v63, v64) --[[ Line: 221 ]]
        -- upvalues: v30 (copy)
        local v65 = {};
        local v66 = v61 / v63;
        local v67 = v62 * (#v64 - 1) + v61;
        if v63 <= v67 then
            v66 = (v63 - (#v64 - 1) * v62) / v63;
        end;
        local v68 = 1 - v66;
        local v69 = 1 - v64[v60].Scale;
        for v70 = 1, #v64 do
            if v70 == v60 then
                table.insert(v65, UDim.new(v66, 0));
            elseif v63 <= v67 then
                table.insert(v65, UDim.new(v62 / v63, 0));
            else
                local v71 = v64[v70].Scale / v69 * v68;
                table.insert(v65, UDim.new(v71, 0));
            end;
        end;
        v30.props.OnColumnSizesChange(v65);
    end;
end;
v28._flushRenderRow = function(v72) --[[ Line: 255 ]] --[[ Name: _flushRenderRow ]]
    -- upvalues: v2 (copy), v3 (copy), v8 (copy), l_v10_Attribute_0 (copy), v27 (copy)
    v72._getRowProps = function(v73, v74, v75) --[[ Line: 256 ]]
        -- upvalues: v72 (copy), v2 (ref), v3 (ref), v8 (ref), l_v10_Attribute_0 (ref), v27 (ref)
        local l_props_2 = v72.props;
        local l_Stylizer_0 = l_props_2.Stylizer;
        local v78 = false;
        if l_props_2.HighlightedRows then
            for _, v80 in ipairs(l_props_2.HighlightedRows) do
                if v2(v80, v73.item) then
                    v78 = true;
                end;
            end;
        end;
        local v81 = v3(l_props_2.RowHeight, if v8 then l_v10_Attribute_0 else l_Stylizer_0.RowHeight);
        local v82 = nil;
        if l_props_2.GetRowHeight then
            v82 = l_props_2.GetRowHeight(v73, v81);
        end;
        return {
            key = if v27 then tostring(v74) else nil, 
            CellProps = l_props_2.CellProps, 
            CellComponent = l_props_2.CellComponent, 
            Columns = l_props_2.Columns, 
            Rows = l_props_2.Rows, 
            Row = v73, 
            RowIndex = v74, 
            Selected = v74 == l_props_2.SelectedRow, 
            OnHover = l_props_2.OnHoverRow and v72.onHoverRow, 
            OnHoverEnd = l_props_2.OnHoverRowEnd and v72.onHoverRowEnd, 
            OnPress = l_props_2.OnSelectRow and v72.onSelectRow, 
            OnDoubleClick = l_props_2.OnDoubleClick and v72.onDoubleClick, 
            OnRightClick = v72.onRightClickRow, 
            Position = v75, 
            Size = if l_props_2.GetRowHeight then UDim2.new(1, 0, 0, v82) else UDim2.new(1, 0, 0, v81), 
            FullSpan = l_props_2.FullSpan, 
            FullSpanEmphasis = l_props_2.FullSpanEmphasis, 
            HighlightRow = v78, 
            RowHeight = if l_props_2.GetRowHeight then v82 else v81, 
            SetCellContentsWidth = if l_props_2.ExpandOnDoubleClick then v72.setCellContentsWidth else nil, 
            Variant = l_props_2.Variant
        };
    end;
end;
v28.willUpdate = function(v83, v84) --[[ Line: 299 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_some_0 (copy)
    local l_props_3 = v83.props;
    if l_props_3.Columns ~= v84.Columns then
        local v86 = #l_props_3.Columns ~= #v84.Columns;
        local v87 = false;
        if not v86 then
            v87 = l_some_0(l_props_3.Columns, function(v88, v89) --[[ Line: 305 ]]
                -- upvalues: v84 (copy)
                return v84.Columns[v89].Width ~= v88.Width;
            end);
        end;
        if v86 or v87 then
            v83:_flushRenderRow();
        end;
    end;
end;
v28.renderResizableHeadings = function(v90) --[[ Line: 317 ]] --[[ Name: renderResizableHeadings ]]
    -- upvalues: l_map_0 (copy), v29 (copy), v1 (copy), v22 (copy), v8 (copy), v24 (copy)
    local l_props_4 = v90.props;
    local l_Stylizer_1 = l_props_4.Stylizer;
    local v94 = l_map_0(l_props_4.Columns, function(v93) --[[ Line: 320 ]]
        -- upvalues: l_props_4 (copy)
        return v93.Width or UDim.new(1 / #l_props_4.Columns, 0);
    end);
    local v96 = l_map_0(l_props_4.Columns, function(v95) --[[ Line: 323 ]]
        -- upvalues: v29 (ref)
        return v95.MinWidth or v29;
    end);
    return v1.createElement(v22, {
        HideBars = true, 
        UseScale = l_props_4.UseScale, 
        UseDeficit = l_props_4.UseDeficit, 
        ClampSize = l_props_4.ClampSize, 
        Sizes = v94, 
        MinSizes = v96, 
        OnSizesChange = l_props_4.OnColumnSizesChange, 
        OnResizeStart = v90.onResizeStart, 
        OnResizeEnd = v90.onResizeEnd, 
        ExpandColumnOnDoubleClick = if l_props_4.ExpandOnDoubleClick then v90.onExpandColumnOnDoubleClick else nil, 
        PaneStyle = if v8 then nil else "SubtleBox", 
        Position = UDim2.new(0, -v90.state.HeaderOffset, 0, 0)
    }, l_map_0(l_props_4.Columns, function(v97, v98) --[[ Line: 342 ]]
        -- upvalues: l_props_4 (copy), v24 (ref), v1 (ref), v8 (ref), l_Stylizer_1 (copy), v90 (copy)
        local v99 = l_props_4.SortIndex == v98 and l_props_4.SortOrder or nil;
        local v100 = l_props_4.HeaderCellComponent or v24;
        return v1.createElement(v100, {
            Name = v97.Name, 
            Tooltip = v97.Tooltip, 
            Order = v99, 
            Width = UDim.new(1, 0), 
            ColumnIndex = v98, 
            Style = if v8 then nil else l_Stylizer_1, 
            OnPress = v90.props.OnSortChange and function() --[[ Line: 353 ]]
                -- upvalues: v90 (ref), v99 (copy), v98 (copy)
                spawn(function() --[[ Line: 354 ]] --[[ Name: sort ]]
                    -- upvalues: v90 (ref), v99 (ref), v98 (ref)
                    if v90._resizing then
                        return;
                    else
                        local v101 = if v99 == Enum.SortDirection.Descending then Enum.SortDirection.Ascending else Enum.SortDirection.Descending;
                        v90.props.OnSortChange(v98, v101);
                        return;
                    end;
                end);
            end or nil, 
            Variant = l_props_4.Variant
        });
    end));
end;
v28.renderFixedHeadings = function(v102) --[[ Line: 373 ]] --[[ Name: renderFixedHeadings ]]
    -- upvalues: l_map_0 (copy), v24 (copy), v1 (copy), v27 (copy)
    local l_props_5 = v102.props;
    local l_Stylizer_2 = l_props_5.Stylizer;
    return l_map_0(l_props_5.Columns, function(v105, v106) --[[ Line: 376 ]]
        -- upvalues: l_props_5 (copy), v24 (ref), v1 (ref), v27 (ref), l_Stylizer_2 (copy), v102 (copy)
        local v107 = v105.Width or UDim.new(1 / #l_props_5.Columns, 0);
        local v108 = l_props_5.SortIndex == v106 and l_props_5.SortOrder or nil;
        local v109 = l_props_5.HeaderCellComponent or v24;
        return v1.createElement(v109, {
            key = if v27 then v105.Key or v105.Name else nil, 
            Name = v105.Name, 
            Order = v108, 
            Width = v107, 
            ColumnIndex = v106, 
            Style = l_Stylizer_2, 
            OnPress = v102.props.OnSortChange and function() --[[ Line: 388 ]]
                -- upvalues: v108 (copy), v102 (ref), v106 (copy)
                local v110 = v108 == Enum.SortDirection.Descending and Enum.SortDirection.Ascending or Enum.SortDirection.Descending;
                v102.props.OnSortChange(v106, v110);
            end or nil, 
            Variant = l_props_5.Variant
        });
    end);
end;
v28.renderHeadings = function(v111) --[[ Line: 400 ]] --[[ Name: renderHeadings ]]
    if v111.props.OnColumnSizesChange then
        return {
            SplitPane = v111:renderResizableHeadings()
        };
    else
        return v111:renderFixedHeadings();
    end;
end;
v28.renderHeader = function(v112, v113) --[[ Line: 411 ]] --[[ Name: renderHeader ]]
    -- upvalues: v1 (copy), v20 (copy), v8 (copy), v25 (copy), l_v10_Attribute_3 (copy), v7 (copy), v9 (copy), v26 (copy)
    local l_props_6 = v112.props;
    local v115 = v112:renderHeadings();
    local l_Stylizer_3 = l_props_6.Stylizer;
    local v117 = v1.createElement(v20, if v8 then {
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, v113), 
        Padding = {
            Right = if v25 and l_props_6.Scroll then l_v10_Attribute_3 else nil
        }, 
        ZIndex = 2, 
        [v7.Tag] = v9("Main", l_props_6.OnColumnSizesChange and "" or "X-Row", l_props_6.Variant == "modern" and "X-Transparent" or "X-Border")
    } else {
        Layout = if l_props_6.OnColumnSizesChange then nil else Enum.FillDirection.Horizontal, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, v113), 
        Padding = if l_props_6.Scroll then l_Stylizer_3.ScrollHeaderPadding else nil, 
        Style = "SubtleBox", 
        BorderColor3 = l_Stylizer_3.Border, 
        BorderSizePixel = 1, 
        ZIndex = 2
    }, v115);
    if v26 and v8 and l_props_6.Variant == "modern" then
        return v1.createElement(v20, {
            Size = UDim2.new(1, 0, 0, v113)
        }, {
            BorderBottom = v1.createElement(v20, {
                Size = UDim2.new(1, 0, 0, 2), 
                Position = UDim2.new(0, 0, 0, v113 - 2), 
                ZIndex = 3, 
                [v7.Tag] = "Component-TableHeaderBorder"
            }), 
            Header = v117
        });
    else
        return v117;
    end;
end;
v28.useVariableWidth = function(v118) --[[ Line: 465 ]] --[[ Name: useVariableWidth ]]
    local l_props_7 = v118.props;
    return l_props_7.OnColumnSizesChange and not l_props_7.UseScale and not l_props_7.ClampSize;
end;
v28.getWidth = function(v120) --[[ Line: 470 ]] --[[ Name: getWidth ]]
    -- upvalues: l_reduce_0 (copy)
    local l_props_8 = v120.props;
    return l_reduce_0(l_props_8.Columns, function(v122, v123) --[[ Line: 472 ]]
        return v122 + if v123.Width then v123.Width.Offset else 0;
    end, 0);
end;
v28.renderScroll = function(v124) --[[ Line: 477 ]] --[[ Name: renderScroll ]]
    -- upvalues: v3 (copy), v8 (copy), l_v10_Attribute_0 (copy), v23 (copy), v1 (copy), v21 (copy), l_join_0 (copy)
    local l_props_9 = v124.props;
    local l_Stylizer_4 = l_props_9.Stylizer;
    local v127 = v124:getWidth();
    local v128 = v3(l_props_9.RowHeight, if v8 then l_v10_Attribute_0 else l_Stylizer_4.RowHeight);
    local v129 = {
        CanvasSize = UDim2.fromOffset(v127, v128 * #l_props_9.Rows), 
        GetRowProps = v124._getRowProps, 
        OnScrollUpdate = v124.onScrollUpdate, 
        Rows = v124.props.Rows, 
        RowHeight = v128, 
        RowComponent = l_props_9.RowComponent or v23, 
        OnLoadRange = l_props_9.OnLoadRange
    };
    return v1.createElement(v21, l_join_0(v129, l_props_9.ScrollProps));
end;
v28.renderRows = function(v130) --[[ Line: 496 ]] --[[ Name: renderRows ]]
    -- upvalues: v23 (copy), v3 (copy), v8 (copy), l_v10_Attribute_0 (copy), l_map_0 (copy), v1 (copy)
    local l_props_10 = v130.props;
    local l_Stylizer_5 = l_props_10.Stylizer;
    local v133 = l_props_10.RowComponent or v23;
    local v134 = v3(l_props_10.RowHeight, if v8 then l_v10_Attribute_0 else l_Stylizer_5.RowHeight);
    local v135 = UDim2.new(1, 0, 0, v134);
    local v136 = nil;
    local v137 = 0;
    v136 = l_map_0(l_props_10.Rows, function(v138, v139) --[[ Line: 504 ]]
        -- upvalues: l_props_10 (copy), v134 (copy), v137 (ref), v1 (ref), v133 (copy), v130 (copy), v135 (copy)
        local v140 = nil;
        local v141 = nil;
        if l_props_10.GetRowHeight then
            v140 = l_props_10.GetRowHeight(v138, v134);
            v141 = UDim2.new(1, 0, 0, v140);
            v137 = v137 + v140;
        end;
        return v1.createElement(v133, if l_props_10.GetRowHeight then v130._getRowProps(v138, v139, UDim2.new(0, 0, 0, v137 - v140), v141) else v130._getRowProps(v138, v139, UDim2.new(0, 0, 0, (v139 - 1) * v134), v135));
    end);
    return v1.createFragment(v136);
end;
v28.render = function(v142) --[[ Line: 527 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_v10_Attribute_2 (copy), l_v10_Attribute_1 (copy), v1 (copy), v20 (copy), v7 (copy), v9 (copy)
    local l_props_11 = v142.props;
    local v144 = if v8 then l_props_11.Style or {} else l_props_11.Stylizer;
    local l_ShowFooter_0 = l_props_11.ShowFooter;
    local l_ShowHeader_0 = l_props_11.ShowHeader;
    if l_ShowHeader_0 == nil then
        l_ShowHeader_0 = true;
    end;
    if l_ShowFooter_0 == nil then
        l_ShowFooter_0 = l_props_11.Footer ~= nil;
    end;
    local v147 = if l_props_11.ColumnHeaderHeight then l_props_11.ColumnHeaderHeight else l_ShowHeader_0 and (if v8 then l_v10_Attribute_2 else v144.HeaderHeight) or 0;
    local v148 = l_ShowFooter_0 and (if v8 then l_v10_Attribute_1 else v144.FooterHeight) or 0;
    local v149 = v142:useVariableWidth();
    local v150 = if l_props_11.Scroll or v149 then v142:renderScroll() else v142:renderRows();
    local v151 = if l_ShowHeader_0 then v142:renderHeader(v147) else nil;
    local l_AutomaticSize_0 = l_props_11.AutomaticSize;
    local v153 = 1;
    local v154 = 1;
    if l_AutomaticSize_0 then
        if l_AutomaticSize_0 == Enum.AutomaticSize.X or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
            v153 = 0;
        end;
        if l_AutomaticSize_0 == Enum.AutomaticSize.Y or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
            v154 = 0;
        end;
    end;
    local v155 = if l_AutomaticSize_0 then UDim2.fromScale(v153, v154) else UDim2.new(1, 0, 1, -(v147 + v148));
    local v156 = v1.createElement(v20, {
        ClipsDescendants = true, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = 2, 
        Padding = v144.ListPadding, 
        Size = v155, 
        AutomaticSize = l_props_11.AutomaticSize, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v1.Event.MouseLeave] = l_props_11.OnMouseLeave
    }, {
        Child = v150
    });
    local v157 = {
        AnchorPoint = l_props_11.AnchorPoint, 
        Size = l_props_11.Size, 
        AutomaticSize = l_props_11.AutomaticSize, 
        LayoutOrder = l_props_11.LayoutOrder, 
        Position = l_props_11.Position, 
        Layout = Enum.FillDirection.Vertical, 
        Style = if v8 then nil else "BorderBox", 
        Padding = if l_props_11.Padding then l_props_11.Padding else if v8 then nil else 1, 
        [v1.Change.AbsoluteSize] = l_props_11.OnSizeChange and v142.onSizeChange or nil
    };
    if v8 then
        v157[v7.Tag] = v9("Component-Table", l_props_11[v7.Tag] or "Input X-Corner X-Stroke");
    end;
    return v1.createElement(v20, v157, {
        Header = v151, 
        List = v156, 
        Footer = l_ShowFooter_0 and v1.createElement(v20, if v8 then {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, v148), 
            [v7.Tag] = "Main X-Border"
        } else {
            LayoutOrder = 3, 
            Style = "SubtleBox", 
            BorderColor3 = v144.Border, 
            BorderSizePixel = 1, 
            Size = UDim2.new(1, 0, 0, v148)
        }, {
            Content = l_props_11.Footer
        })
    });
end;
if not v8 then
    v28 = l_withContext_0({
        Stylizer = v5.Stylizer
    })(v28);
end;
return v28;