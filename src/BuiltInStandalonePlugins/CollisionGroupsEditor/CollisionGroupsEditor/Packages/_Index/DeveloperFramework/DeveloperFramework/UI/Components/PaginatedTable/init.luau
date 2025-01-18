local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.Typecheck);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.UI.Components.PageNavigation);
local v6 = require(l_Parent_0.UI.Components.Pane);
local v7 = require(l_Parent_0.UI.Components.Table);
local v8 = game:DefineFastFlag("DevFrameworkCumulativeRowHeight", false);
local v9 = v1.PureComponent:extend("PaginatedTable");
v2.wrap(v9, script);
v9.init = function(v10) --[[ Line: 50 ]] --[[ Name: init ]]
    v10.onSizeChange = function(v11) --[[ Line: 51 ]]
        -- upvalues: v10 (copy)
        if v10.props.OnSizeChange then
            v10.props.OnSizeChange(v11);
        end;
        local v12 = math.floor(v11 / v10.props.Stylizer.RowHeight);
        if v10.props.OnPageSizeChange then
            v10.props.OnPageSizeChange((math.max(1, v12)));
        end;
    end;
end;
v9.render = function(v13) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v5 (copy), v8 (copy), v7 (copy)
    local l_props_0 = v13.props;
    local v15 = l_props_0.PageCount or 1;
    local v16 = l_props_0.PageIndex or 1;
    local v17 = true;
    if v15 <= 1 then
        v17 = l_props_0.Footer ~= nil;
    end;
    local v18 = v15 > 1 and v1.createElement(v6, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.fromScale(1, 0), 
        AnchorPoint = Vector2.new(1, 0)
    }, {
        Child = v1.createElement(v5, {
            PageIndex = v16, 
            PageCount = v15, 
            OnPageChange = l_props_0.OnPageChange
        })
    }) or nil;
    local v19 = {
        Footer = l_props_0.Footer, 
        PageNavigation = v18
    };
    if v8 then
        return v1.createElement(v7, {
            Rows = l_props_0.Rows, 
            Columns = l_props_0.Columns, 
            Size = l_props_0.Size, 
            Position = l_props_0.Position, 
            SelectedRow = l_props_0.SelectedRow, 
            SortIndex = l_props_0.SortIndex, 
            SortOrder = l_props_0.SortOrder, 
            Footer = v17 and v1.createFragment(v19) or nil, 
            ShowFooter = v17, 
            ShowHeader = l_props_0.ShowHeader, 
            OnHoverRow = l_props_0.OnHoverRow, 
            OnMouseLeave = l_props_0.OnMouseLeave, 
            OnSelectRow = l_props_0.OnSelectRow, 
            OnSizeChange = v13.onSizeChange, 
            OnSortChange = l_props_0.OnSortChange, 
            RowComponent = l_props_0.RowComponent, 
            CellComponent = l_props_0.CellComponent, 
            RowHeight = l_props_0.RowHeight, 
            CellProps = l_props_0.CellProps, 
            GetRowHeight = l_props_0.GetRowHeight, 
            AutomaticSize = l_props_0.AutomaticSize
        });
    else
        return v1.createElement(v7, {
            Rows = l_props_0.Rows, 
            Columns = l_props_0.Columns, 
            Size = l_props_0.Size, 
            SelectedRow = l_props_0.SelectedRow, 
            SortIndex = l_props_0.SortIndex, 
            SortOrder = l_props_0.SortOrder, 
            Footer = v17 and v1.createFragment(v19) or nil, 
            ShowFooter = v17, 
            ShowHeader = l_props_0.ShowHeader, 
            OnHoverRow = l_props_0.OnHoverRow, 
            OnMouseLeave = l_props_0.OnMouseLeave, 
            OnSelectRow = l_props_0.OnSelectRow, 
            OnSizeChange = v13.onSizeChange, 
            OnSortChange = l_props_0.OnSortChange, 
            RowComponent = l_props_0.RowComponent, 
            CellComponent = l_props_0.CellComponent
        });
    end;
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v9));