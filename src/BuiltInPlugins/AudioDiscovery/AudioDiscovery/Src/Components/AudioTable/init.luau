local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TableRow_0 = l_UI_0.TableRow;
local l_Dash_0 = v2.Dash;
local l_map_0 = l_Dash_0.map;
local l_collect_0 = l_Dash_0.collect;
local l_reduce_0 = l_Dash_0.reduce;
local l_some_0 = l_Dash_0.some;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SplitPane_0 = l_UI_0.SplitPane;
local v15 = require(script.TableHeaderCell);
local v16 = v1.PureComponent:extend("AudioTable");
local v17 = UDim.new(0, 50);
v16.init = function(v18) --[[ Line: 68 ]] --[[ Name: init ]]
    v18:calculateRowIndices(v18.props.Rows);
    v18.onHoverRow = function(v19) --[[ Line: 70 ]]
        -- upvalues: v18 (copy)
        if v18.props.OnHoverRow then
            v18.props.OnHoverRow(v19.Row, v19.RowIndex);
        end;
    end;
    v18.onHoverRowEnd = function(v20) --[[ Line: 75 ]]
        -- upvalues: v18 (copy)
        if v18.props.OnHoverRowEnd then
            v18.props.OnHoverRowEnd(v20.Row, v20.RowIndex);
        end;
    end;
    v18.onSelectRow = function(v21) --[[ Line: 81 ]]
        -- upvalues: v18 (copy)
        if v18.props.OnSelectRow then
            v18.props.OnSelectRow(v21.Row, v21.RowIndex);
        end;
    end;
    v18.onDoubleClick = function(v22) --[[ Line: 87 ]]
        -- upvalues: v18 (copy)
        if v18.props.OnDoubleClick then
            v18.props.OnDoubleClick(v22.Row, v22.RowIndex);
        end;
    end;
    v18.onRightClickRow = function(v23) --[[ Line: 93 ]]
        -- upvalues: v18 (copy)
        if v18.props.OnRightClickRow then
            v18.props.OnRightClickRow(v23);
        end;
    end;
    v18:_flushRenderRow();
    v18.getDefaultRowKey = function(v24) --[[ Line: 99 ]]
        -- upvalues: v18 (copy)
        return "Row " .. (v18.rowToIndex[v24] or tostring(v24));
    end;
    v18.onSizeChange = function(v25) --[[ Line: 102 ]]
        -- upvalues: v18 (copy)
        local l_props_0 = v18.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v28 = l_props_0.Footer and l_Stylizer_0.FooterHeight or 0;
        local v29 = v25.AbsoluteSize.Y - (l_Stylizer_0.HeaderHeight + v28) - 5;
        v18.props.OnSizeChange(v29);
    end;
end;
v16._flushRenderRow = function(v30) --[[ Line: 113 ]] --[[ Name: _flushRenderRow ]]
    -- upvalues: l_TableRow_0 (copy), v1 (copy)
    v30.onRenderRow = function(v31) --[[ Line: 114 ]]
        -- upvalues: v30 (copy), l_TableRow_0 (ref), v1 (ref)
        local v32 = v30.rowToIndex[v31];
        local l_props_1 = v30.props;
        local v34 = v30.props.RowComponent or l_TableRow_0;
        return v1.createElement(v34, {
            CellProps = v30.props.CellProps, 
            CellComponent = v30.props.CellComponent, 
            Columns = v30.props.Columns, 
            Rows = v30.props.Rows, 
            Row = v31, 
            RowIndex = v32, 
            Selected = v32 == l_props_1.SelectedRow, 
            OnHover = v30.props.OnHoverRow and v30.onHoverRow, 
            OnHoverEnd = v30.props.OnHoverRowEnd and v30.onHoverRowEnd, 
            OnPress = v30.props.OnSelectRow and v30.onSelectRow, 
            OnDoubleClick = v30.props.OnDoubleClick and v30.onDoubleClick, 
            OnRightClick = v30.onRightClickRow
        });
    end;
end;
v16.willUpdate = function(v35, v36) --[[ Line: 137 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_some_0 (copy)
    local l_props_2 = v35.props;
    if l_props_2.Rows ~= v36.Rows then
        v35:calculateRowIndices(v36.Rows);
    end;
    if l_props_2.Columns ~= v36.Columns then
        local v38 = #l_props_2.Columns ~= #v36.Columns;
        local v41 = l_some_0(l_props_2.Columns, function(v39, v40) --[[ Line: 144 ]]
            -- upvalues: v36 (copy)
            return v36.Columns[v40].Width ~= v39.Width;
        end);
        if v38 or v41 then
            v35:_flushRenderRow();
        end;
    end;
end;
v16.calculateRowIndices = function(v42, v43) --[[ Line: 154 ]] --[[ Name: calculateRowIndices ]]
    -- upvalues: l_collect_0 (copy)
    v42.rowToIndex = l_collect_0(v43, function(v44, v45) --[[ Line: 155 ]]
        return v45, v44;
    end);
end;
v16.renderResizableHeadings = function(v46) --[[ Line: 160 ]] --[[ Name: renderResizableHeadings ]]
    -- upvalues: l_map_0 (copy), v17 (copy), v1 (copy), l_SplitPane_0 (copy), v15 (copy)
    local l_props_3 = v46.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local v50 = l_map_0(l_props_3.Columns, function(v49) --[[ Line: 163 ]]
        -- upvalues: l_props_3 (copy)
        return v49.Width or UDim.new(1 / #l_props_3.Columns, 0);
    end);
    local v52 = l_map_0(l_props_3.Columns, function(v51) --[[ Line: 166 ]]
        -- upvalues: v17 (ref)
        return v51.MinWidth or v17;
    end);
    return v1.createElement(l_SplitPane_0, {
        UseScale = l_props_3.UseScale, 
        ClampSize = l_props_3.ClampSize, 
        Sizes = v50, 
        MinSizes = v52, 
        OnSizesChange = l_props_3.OnColumnSizesChange
    }, l_map_0(l_props_3.Columns, function(v53, v54) --[[ Line: 178 ]]
        -- upvalues: l_props_3 (copy), v1 (ref), v15 (ref), l_Stylizer_1 (copy), v46 (copy)
        local v55 = l_props_3.SortIndex == v54 and l_props_3.SortOrder or nil;
        return v1.createElement(v15, {
            Name = v53.Name, 
            Order = v55, 
            Width = UDim.new(1, 0), 
            ColumnIndex = v54, 
            Style = l_Stylizer_1, 
            OnPress = v46.props.OnSortChange and function() --[[ Line: 187 ]]
                -- upvalues: v55 (copy), v46 (ref), v54 (copy)
                local v56 = if v55 == Enum.SortDirection.Descending then Enum.SortDirection.Ascending else Enum.SortDirection.Descending;
                v46.props.OnSortChange(v54, v56);
            end or nil
        });
    end));
end;
v16.renderFixedHeadings = function(v57) --[[ Line: 200 ]] --[[ Name: renderFixedHeadings ]]
    -- upvalues: l_map_0 (copy), v1 (copy), v15 (copy)
    local l_props_4 = v57.props;
    local l_Stylizer_2 = l_props_4.Stylizer;
    return l_map_0(l_props_4.Columns, function(v60, v61) --[[ Line: 203 ]]
        -- upvalues: l_props_4 (copy), v1 (ref), v15 (ref), l_Stylizer_2 (copy), v57 (copy)
        local v62 = v60.Width or UDim.new(1 / #l_props_4.Columns, 0);
        local v63 = l_props_4.SortIndex == v61 and l_props_4.SortOrder or nil;
        return v1.createElement(v15, {
            Name = v60.Name, 
            Order = v63, 
            Width = v62, 
            ColumnIndex = v61, 
            Style = l_Stylizer_2, 
            OnPress = v57.props.OnSortChange and function() --[[ Line: 213 ]]
                -- upvalues: v63 (copy), v57 (ref), v61 (copy)
                local v64 = v63 == Enum.SortDirection.Descending and Enum.SortDirection.Ascending or Enum.SortDirection.Descending;
                v57.props.OnSortChange(v61, v64);
            end or nil
        });
    end);
end;
v16.renderHeadings = function(v65) --[[ Line: 224 ]] --[[ Name: renderHeadings ]]
    if v65.props.OnColumnSizesChange then
        return v65:renderResizableHeadings();
    else
        return v65:renderFixedHeadings();
    end;
end;
v16.renderScroll = function(v66) --[[ Line: 233 ]] --[[ Name: renderScroll ]]
    -- upvalues: v1 (copy), l_ScrollingFrame_0 (copy), l_Pane_0 (copy)
    return v1.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.fromOffset(0, 0)
    }, {
        Group = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Children = v66:renderRows()
        })
    });
end;
v16.renderRows = function(v67) --[[ Line: 249 ]] --[[ Name: renderRows ]]
    -- upvalues: l_map_0 (copy), v1 (copy), l_Pane_0 (copy)
    local l_props_5 = v67.props;
    local v71 = l_map_0(l_props_5.Rows, function(v69, v70) --[[ Line: 251 ]]
        -- upvalues: v1 (ref), l_Pane_0 (ref), v67 (copy)
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v70, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Row = v67.onRenderRow(v69)
        });
    end);
    return v1.createFragment(v71);
end;
v16.render = function(v72) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_reduce_0 (copy), l_ScrollingFrame_0 (copy)
    local l_props_6 = v72.props;
    local l_Stylizer_3 = l_props_6.Stylizer;
    local v75 = v72:renderHeadings();
    local l_ShowFooter_0 = l_props_6.ShowFooter;
    local l_ShowHeader_0 = l_props_6.ShowHeader;
    if l_ShowHeader_0 == nil then
        l_ShowHeader_0 = true;
    end;
    if l_ShowFooter_0 == nil then
        l_ShowFooter_0 = l_props_6.Footer ~= nil;
    end;
    local v78 = l_ShowHeader_0 and l_Stylizer_3.HeaderHeight or 0;
    local v79 = l_ShowFooter_0 and l_Stylizer_3.FooterHeight or 0;
    local v80 = l_props_6.Scroll and v72:renderScroll() or v72:renderRows();
    local v81 = l_ShowHeader_0 and v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, -8, 0, v78), 
        Style = "SubtleBox", 
        BorderColor3 = l_Stylizer_3.Border, 
        BorderSizePixel = 1
    }, v75);
    local v82 = l_props_6.OnColumnSizesChange and not l_props_6.UseScale and not l_props_6.ClampSize;
    local v83 = 0;
    local v84 = UDim2.new(1, 0, 1, -(v78 + v79));
    if v82 then
        v83 = l_reduce_0(l_props_6.Columns, function(v85, v86) --[[ Line: 293 ]]
            return v85 + if v86.Width then v86.Width.Offset else 0;
        end, 0);
        if v83 > 0 then
            v84 = UDim2.new(0, v83, 1, -(v78 + v79));
        end;
    end;
    local v87 = v1.createElement(l_Pane_0, {
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = 2, 
        LayoutOrder = 2, 
        Size = v84, 
        [v1.Event.MouseLeave] = l_props_6.OnMouseLeave
    }, {
        Child = v80
    });
    local v88 = nil;
    v88 = if v82 then v1.createElement(l_ScrollingFrame_0, {
        CanvasSize = UDim2.fromOffset(v83, 0), 
        ScrollingDirection = Enum.ScrollingDirection.X
    }, {
        Child = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Header = v81, 
            List = v87
        })
    }) else v1.createFragment({
        Header = v81, 
        List = v87
    });
    return v1.createElement(l_Pane_0, {
        Size = l_props_6.Size, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Style = "BorderBox", 
        Padding = 1, 
        [v1.Change.AbsoluteSize] = l_props_6.OnSizeChange and v72.onSizeChange or nil
    }, {
        Top = v88, 
        Footer = l_ShowFooter_0 and v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Style = "SubtleBox", 
            BorderColor3 = l_Stylizer_3.Border, 
            BorderSizePixel = 1, 
            Size = UDim2.new(1, 0, 0, v79)
        }, {
            Content = l_props_6.Footer
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16));