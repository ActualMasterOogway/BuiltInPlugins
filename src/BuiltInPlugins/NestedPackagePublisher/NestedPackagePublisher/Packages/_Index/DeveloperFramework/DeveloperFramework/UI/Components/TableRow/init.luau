local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.prioritize);
local v5 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkModernTreeTable();
local v6 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkTableUseKeyProp)();
local v7 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v8 = require(l_Parent_0.Styling.supportsStyleSheets);
local v9 = require(script.TableCell);
local v10 = require(l_Parent_0.Wrappers.withControl);
local v11 = require(l_Parent_0.Parent.Dash);
local l_assign_0 = v11.assign;
local l_map_0 = v11.map;
local l_UI_0 = l_Parent_0.UI;
local v15 = require(l_UI_0.Components.Pane);
local v16 = v1.PureComponent:extend("TableRow");
v16.init = function(v17) --[[ Line: 52 ]] --[[ Name: init ]]
    v17.onRightClickRow = function(v18) --[[ Line: 53 ]]
        -- upvalues: v17 (copy)
        if v17.props.OnRightClick then
            v17.props.OnRightClick(v17.props.Row, v18);
        end;
    end;
end;
v16.render = function(v19) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v5 (copy), v1 (copy), l_map_0 (copy), v6 (copy), v4 (copy), v8 (copy), v15 (copy), l_assign_0 (copy), v7 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Row_0 = l_props_0.Row;
    local l_RowIndex_0 = l_props_0.RowIndex;
    local v24 = l_props_0.CellComponent or v9;
    local l_Columns_0 = l_props_0.Columns;
    local v26 = nil;
    local v27 = l_props_0.FullSpan and l_Row_0.depth and l_Row_0.depth == 0;
    local l_Key_0 = l_Columns_0[1].Key;
    if l_Row_0.item and typeof(l_Row_0.item[l_Key_0]) == "table" and l_Row_0.item[l_Key_0].FullSpan then
        v27 = true;
    end;
    local v29 = if l_props_0.FullSpanEmphasis then v27 else if v5 and l_props_0.Variant == "modern" then l_RowIndex_0 % 2 == 0 else l_RowIndex_0 % 2 == 1;
    local l_HighlightRow_0 = l_props_0.HighlightRow;
    if v27 then
        local v31 = l_Row_0[l_Key_0] or "";
        v26 = {
            v1.createElement(v24, {
                CellProps = l_props_0.CellProps, 
                Columns = l_Columns_0, 
                ColumnIndex = 1, 
                Emphasis = v29, 
                HighlightCell = l_HighlightRow_0, 
                OnEdited = l_props_0.OnEdited, 
                Row = l_Row_0, 
                RowIndex = l_RowIndex_0, 
                Style = l_Stylizer_0, 
                StyleModifier = l_props_0.StyleModifier, 
                Tooltip = l_Row_0[l_Columns_0[1].TooltipKey], 
                Width = UDim.new(1, 0), 
                Value = v31
            })
        };
    else
        v26 = l_map_0(l_Columns_0, function(v32, v33) --[[ Line: 103 ]]
            -- upvalues: l_Row_0 (copy), v1 (ref), v24 (copy), v6 (ref), l_props_0 (copy), l_Columns_0 (copy), v29 (copy), l_HighlightRow_0 (copy), l_Stylizer_0 (copy), l_RowIndex_0 (copy)
            local v34 = v32.Key or v32.Name;
            local v35 = l_Row_0[v34] or "";
            local v36 = l_Row_0[v32.TooltipKey];
            return v1.createElement(v24, {
                key = if v6 then v34 else nil, 
                CellProps = l_props_0.CellProps, 
                Columns = l_Columns_0, 
                ColumnIndex = v33, 
                Emphasis = v29, 
                HighlightCell = l_HighlightRow_0, 
                Style = l_Stylizer_0, 
                OnEdited = l_props_0.OnEdited, 
                Row = l_Row_0, 
                RowIndex = l_RowIndex_0, 
                SetCellContentsWidth = l_props_0.SetCellContentsWidth, 
                StyleModifier = l_props_0.StyleModifier, 
                Tooltip = v36, 
                Value = v35, 
                Width = v32.Width
            });
        end);
    end;
    local v37 = v4(l_props_0.RowHeight, l_Stylizer_0.RowHeight);
    if v5 and v8 then
        local v38 = v1.createElement(v15, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal
        }, v26);
        return v1.createElement(v15, l_assign_0({
            OnRightClick = v19.onRightClickRow, 
            Size = l_props_0.Size or UDim2.new(1, 0, 0, v37), 
            Position = l_props_0.Position, 
            [v7.Tag] = "Component-TableRow"
        }, l_props_0.WrapperProps), if v6 then v38 else {
            v38
        });
    else
        return v1.createElement(v15, l_assign_0({
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            OnRightClick = v19.onRightClickRow, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size or UDim2.new(1, 0, 0, v37), 
            Style = "Box"
        }, l_props_0.WrapperProps), v26);
    end;
end;
return v10((l_withContext_0({
    Stylizer = v2.Stylizer
})(v16)));