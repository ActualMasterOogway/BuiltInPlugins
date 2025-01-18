local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.PaginatedTable);
local l_slice_0 = require(l_Parent_0.Parent.Dash).slice;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local l_UI_0 = l_Parent_0.UI;
local v7 = require(l_UI_0.Components.Pane);
local v8 = require(l_UI_0.Components.Tooltip);
local v9 = require(l_UI_0.Components.TextLabel);
local v10 = v1.PureComponent:extend("ControlledTable");
local v11 = {};
for v12 = 1, 23 do
    l_insert_0(v11, {
        Name = "Row " .. v12, 
        Count = math.floor(math.random() * 100), 
        Size = math.floor(math.random() * 100) * 10 .. "px"
    });
end;
local v13 = {};
for v14 = 1, 23 do
    local v15 = "Row " .. v14;
    if v14 % 4 == 0 then
        v15 = "This cell/row will have a larger row height because it has more characters";
    end;
    l_insert_0(v13, {
        Name = v15, 
        Count = math.floor(math.random() * 100), 
        Size = math.floor(math.random() * 100) * 10 .. "px"
    });
end;
local function v24(v16) --[[ Line: 39 ]] --[[ Name: WrappedTableCell ]]
    -- upvalues: v1 (copy), v7 (copy), v9 (copy), v8 (copy)
    local l_Value_0 = v16.Value;
    local l_Style_0 = v16.Style;
    local v19 = v16.Width or UDim.new(1 / #v16.Columns, 0);
    local v20 = if v16.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
    local v21 = nil;
    v21 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then ("%.3f"):format(l_Value_0) else tostring(l_Value_0);
    local v22 = v16.Tooltip or v21;
    local v23 = false;
    if v22 ~= nil then
        v23 = v22 ~= "";
    end;
    return v1.createElement(v7, {
        LayoutOrder = v16.ColumnIndex, 
        Padding = {
            Top = 1, 
            Bottom = 1, 
            Left = 5, 
            Right = 5
        }, 
        Style = "Box", 
        BackgroundColor3 = v20, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(v19.Scale, v19.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Text = v1.createElement(v9, {
            Text = v21, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Tooltip = v23 and v1.createElement(v8, {
            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
            Text = v22, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
v10.init = function(v25) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: l_sort_0 (copy), v11 (copy)
    v25.state = {
        sortIndex = nil, 
        sortOrder = nil, 
        pageIndex = 1, 
        pageSize = 5, 
        rows = v25:getPageRows(1, 5, v25.props.UseGetRowHeight), 
        selectedRow = nil, 
        responsive = v25.props.UseGetRowHeight
    };
    v25.onSortChange = function(v26, v27) --[[ Line: 92 ]]
        -- upvalues: l_sort_0 (ref), v11 (ref), v25 (copy)
        local v28 = {
            "Name", 
            "Count", 
            "Size"
        };
        l_sort_0(v11, function(v29, v30) --[[ Line: 94 ]]
            -- upvalues: v28 (copy), v26 (copy), v27 (copy)
            local v31 = v28[v26];
            if v27 == Enum.SortDirection.Descending then
                return v29[v31] < v30[v31];
            else
                return v29[v31] > v30[v31];
            end;
        end);
        v25:setState({
            sortIndex = v26, 
            sortOrder = v27, 
            rows = v25:getPageRows(v25.state.pageIndex, v25.state.pageSize, v25.state.responsive)
        });
    end;
    v25.onPageChange = function(v32) --[[ Line: 108 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            pageIndex = v32, 
            rows = v25:getPageRows(v32, v25.state.pageSize, v25.state.responsive)
        });
    end;
    v25.onPageSizeChange = function(v33) --[[ Line: 114 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            pageSize = v33, 
            rows = v25:getPageRows(v25.state.pageIndex, v33, v25.state.responsive)
        });
    end;
    v25.onSelectRow = function(_, v35) --[[ Line: 120 ]]
        -- upvalues: v25 (copy)
        v25:setState({
            selectedRow = v35 + (v25.state.pageIndex - 1) * v25.state.pageSize
        });
    end;
    v25.getRowHeight = function(v36, v37) --[[ Line: 126 ]]
        local v38 = math.ceil(string.len(v36.Name) / 20) - 1;
        if v38 > 0 then
            return v37 + v38 * 20;
        else
            return v37;
        end;
    end;
end;
v10.getPageRows = function(_, v40, v41, v42) --[[ Line: 135 ]] --[[ Name: getPageRows ]]
    -- upvalues: l_slice_0 (copy), v13 (copy), v11 (copy)
    local v43 = (v40 - 1) * v41 + 1;
    if v42 then
        return (l_slice_0(v13, v43, v43 + v41 - 1));
    else
        return (l_slice_0(v11, v43, v43 + v41 - 1));
    end;
end;
v10.render = function(v44) --[[ Line: 142 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v13 (copy), v24 (copy), v11 (copy)
    local l_state_0 = v44.state;
    local l_props_0 = v44.props;
    local v47 = nil;
    if l_state_0.selectedRow then
        v47 = l_state_0.selectedRow - (v44.state.pageIndex - 1) * v44.state.pageSize;
    end;
    if l_props_0.UseGetRowHeight then
        v44:setState({
            responsive = true
        });
        return v1.createElement(v2, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            SortIndex = l_state_0.sortIndex, 
            SortOrder = l_state_0.sortOrder, 
            PageIndex = l_state_0.pageIndex, 
            PageSize = l_state_0.pageSize, 
            PageCount = math.ceil(#v13 / l_state_0.pageSize), 
            OnPageChange = v44.onPageChange, 
            OnSortChange = v44.onSortChange, 
            SelectedRow = v47, 
            OnSelectRow = v44.onSelectRow, 
            Columns = {
                {
                    Name = "Name"
                }, 
                {
                    Name = "Count"
                }, 
                {
                    Name = "Size"
                }
            }, 
            Rows = l_state_0.rows, 
            GetRowHeight = v44.getRowHeight, 
            CellComponent = v24
        });
    else
        return v1.createElement(v2, {
            Size = UDim2.new(1, 0, 0, 200), 
            SortIndex = l_state_0.sortIndex, 
            SortOrder = l_state_0.sortOrder, 
            PageIndex = l_state_0.pageIndex, 
            PageSize = l_state_0.pageSize, 
            PageCount = math.ceil(#v11 / l_state_0.pageSize), 
            OnPageSizeChange = v44.onPageSizeChange, 
            OnPageChange = v44.onPageChange, 
            OnSortChange = v44.onSortChange, 
            SelectedRow = v47, 
            OnSelectRow = v44.onSelectRow, 
            Columns = {
                {
                    Name = "Name"
                }, 
                {
                    Name = "Count"
                }, 
                {
                    Name = "Size"
                }
            }, 
            Rows = l_state_0.rows
        });
    end;
end;
return {
    stories = {
        {
            name = "Pagination", 
            story = v1.createElement(v10)
        }, 
        {
            name = "Pagination with GetRowHeight", 
            story = v1.createElement(v10, {
                UseGetRowHeight = true
            })
        }
    }
};