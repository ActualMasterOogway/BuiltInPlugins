local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local v8 = require(l_Parent_0.Parent.Dash);
local l_copy_0 = v8.copy;
local l_findIndex_0 = v8.findIndex;
local l_mapOne_0 = v8.mapOne;
local l_sort_0 = table.sort;
local v13 = require(l_Parent_0.UI.Components.Table);
local v14 = require(script.TreeTableCell);
local v15 = v1.PureComponent:extend("TreeTable");
l_Typecheck_0.wrap(v15, script);
v15.EditTree = require(script.EditTree);
v15.init = function(v16) --[[ Line: 88 ]] --[[ Name: init ]]
    v16.defaultGetItemId = function(v17) --[[ Line: 89 ]]
        return v17;
    end;
    v16.getItemId = v16.props.GetItemId or v16.defaultGetItemId;
    v16.onToggle = function(v18) --[[ Line: 93 ]]
        -- upvalues: v16 (copy)
        local v19 = v16.getItemId(v18.item);
        local v20 = {
            [v19] = not v16.props.Expansion[v19]
        };
        v16.props.OnExpansionChange(v20);
    end;
    v16.onSelectRow = function(v21) --[[ Line: 100 ]]
        -- upvalues: v16 (copy)
        if not v16.props.OnSelectionChange then
            return;
        else
            local v22 = {
                [v16.getItemId(v21.item)] = true
            };
            v16.props.OnSelectionChange(v22);
            return;
        end;
    end;
    v16.onRightClickRow = function(v23, v24) --[[ Line: 111 ]]
        -- upvalues: v16 (copy)
        if not v16.props.RightClick then
            return;
        else
            v16.props.RightClick(v23, v24);
            return;
        end;
    end;
    v16.state = {
        rows = {}, 
        cellProps = v16:getCellProps()
    };
end;
v15.getCellProps = function(v25) --[[ Line: 124 ]] --[[ Name: getCellProps ]]
    local l_props_0 = v25.props;
    return {
        CellStyle = l_props_0.Stylizer, 
        DisableTooltip = l_props_0.DisableTooltip, 
        Expansion = l_props_0.Expansion, 
        GetAutocompleteItems = l_props_0.GetCellAutocomplete, 
        GetItemId = v25.getItemId, 
        OnCellAction = l_props_0.OnCellAction, 
        OnCellDoubleClick = l_props_0.OnCellDoubleClick, 
        OnCellEdited = l_props_0.OnCellEdited, 
        OnCellPressed = l_props_0.OnCellPressed, 
        OnFocusLost = l_props_0.OnFocusLost, 
        OnToggle = v25.onToggle, 
        Renderers = l_props_0.Renderers, 
        TextInputCols = l_props_0.TextInputCols
    };
end;
v15.didMount = function(v27) --[[ Line: 143 ]] --[[ Name: didMount ]]
    v27:calculateItems();
end;
v15.willUpdate = function(v28, v29) --[[ Line: 147 ]] --[[ Name: willUpdate ]]
    if v29.GetItemId ~= v28.props.GetItemId then
        v28.getItemId = v29.GetItemId or v28.defaultGetItemId;
    end;
end;
v15.didUpdate = function(v30, v31) --[[ Line: 153 ]] --[[ Name: didUpdate ]]
    v30:calculateItems(v31);
end;
v15.calculateItems = function(v32, v33) --[[ Line: 157 ]] --[[ Name: calculateItems ]]
    -- upvalues: l_mapOne_0 (copy), l_findIndex_0 (copy), v1 (copy)
    local l_props_1 = v32.props;
    local v35 = not v33 or l_props_1.SortChildren ~= v33.SortChildren or l_props_1.RootItems ~= v33.RootItems or l_props_1.GetChildren ~= v33.GetChildren or l_props_1.Expansion ~= v33.Expansion or l_props_1.HighlightedRows and l_props_1.HighlightedRows ~= v33.HighlightedRows;
    local v36 = not v33 or l_props_1.Selection ~= v33.Selection;
    if not v35 and not v36 then
        return;
    else
        v32:setState(function(v37) --[[ Line: 171 ]]
            -- upvalues: v35 (copy), l_props_1 (copy), v32 (copy), l_mapOne_0 (ref), l_findIndex_0 (ref), v1 (ref)
            local v38 = {};
            if v35 then
                local v39 = {};
                for _, v41 in ipairs(l_props_1.RootItems) do
                    v32:contributeRow(v41, 0, v39);
                end;
                v38.rows = v39;
                v38.cellProps = v32:getCellProps();
            end;
            local v42 = v38.rows or v37.rows;
            local v45 = l_props_1.Selection and l_mapOne_0(l_props_1.Selection, function(_, v44) --[[ Line: 182 ]]
                return v44;
            end) or nil;
            if v45 then
                v38.selectedRow = l_findIndex_0(v42, function(v46) --[[ Line: 186 ]]
                    -- upvalues: v32 (ref), v45 (copy)
                    return v32.getItemId(v46.item) == v45;
                end);
                return v38;
            else
                v38.selectedRow = v1.None;
                return v38;
            end;
        end);
        return;
    end;
end;
v15.contributeRow = function(v47, v48, v49, v50) --[[ Line: 196 ]] --[[ Name: contributeRow ]]
    -- upvalues: l_copy_0 (copy), l_sort_0 (copy)
    local l_props_2 = v47.props;
    local v52 = v47.getItemId(v48);
    local v53 = l_copy_0(l_props_2.GetChildren(v48));
    table.insert(v50, {
        index = #v50 + 1, 
        depth = v49, 
        item = v48, 
        hasChildren = v53 and #v53 > 0
    });
    if l_props_2.Expansion[v52] then
        if l_props_2.SortChildren then
            l_sort_0(v53, l_props_2.SortChildren);
        end;
        for _, v55 in ipairs(v53) do
            v47:contributeRow(v55, v49 + 1, v50);
        end;
    end;
    return v50;
end;
v15.render = function(v56) --[[ Line: 218 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v6 (copy), v5 (copy), v7 (copy), v1 (copy), v13 (copy)
    local l_props_3 = v56.props;
    local l_state_0 = v56.state;
    local v59 = l_props_3.CellComponent or v14;
    local v60 = {
        AnchorPoint = l_props_3.AnchorPoint, 
        AutomaticSize = l_props_3.AutomaticSize, 
        CellProps = l_state_0.cellProps, 
        Rows = l_state_0.rows, 
        Columns = l_props_3.Columns, 
        SelectedRow = l_state_0.selectedRow, 
        SortIndex = l_props_3.SortIndex, 
        SortOrder = l_props_3.SortOrder, 
        Scroll = l_props_3.Scroll, 
        ScrollProps = l_props_3.ScrollProps, 
        Footer = l_props_3.Footer, 
        LayoutOrder = l_props_3.LayoutOrder, 
        Position = l_props_3.Position, 
        Size = l_props_3.Size, 
        ShowFooter = l_props_3.ShowFooter, 
        ShowHeader = l_props_3.ShowHeader, 
        ClampSize = l_props_3.ClampSize, 
        UseScale = l_props_3.UseScale, 
        UseDeficit = l_props_3.UseDeficit, 
        OnHoverRow = l_props_3.OnHoverRow, 
        OnMouseLeave = l_props_3.OnMouseLeave, 
        OnSelectRow = v56.onSelectRow, 
        OnDoubleClick = l_props_3.OnDoubleClick, 
        OnRightClickRow = v56.onRightClickRow, 
        OnSizeChange = l_props_3.OnSizeChange, 
        OnSortChange = l_props_3.OnSortChange, 
        OnColumnSizesChange = l_props_3.OnColumnSizesChange, 
        OnLoadRange = l_props_3.OnLoadRange, 
        RowComponent = l_props_3.RowComponent, 
        CellComponent = v59, 
        FullSpan = l_props_3.FullSpan, 
        FullSpanEmphasis = l_props_3.FullSpanEmphasis, 
        HighlightedRows = l_props_3.HighlightedRows, 
        ScrollFocusIndex = l_props_3.ScrollFocusIndex, 
        Padding = l_props_3.Padding, 
        ColumnHeaderHeight = l_props_3.ColumnHeaderHeight, 
        RowHeight = l_props_3.RowHeight, 
        ExpandOnDoubleClick = l_props_3.ExpandOnDoubleClick, 
        Variant = l_props_3.Variant
    };
    if v6 then
        v60[v5.Tag] = v7("Component-TreeTable", l_props_3[v5.Tag], l_props_3.Variant);
    end;
    return v1.createElement(v13, v60);
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v15));