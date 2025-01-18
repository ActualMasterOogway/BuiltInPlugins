local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v1.withContext;
local v3 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v3.join;
local l_omit_0 = v3.omit;
local l_Util_0 = l_Parent_0.Util;
local v7 = require(l_Util_0.prioritize);
local v8 = require(l_Parent_0.Parent.Roact);
local v9 = require(script.ListRow);
local v10 = require(script.Parent.Grid);
local l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkMaterialPickerImprovedScroll;
local v12 = {
    "InitialCanvasPosition", 
    "GetRowProps", 
    "Rows", 
    "RowGroupHeader", 
    "RowGroups", 
    "RowHeight", 
    "RowComponent", 
    "Stylizer", 
    "SpecialRows"
};
local v13 = v8.PureComponent:extend("List");
v13.init = function(v14) --[[ Line: 71 ]] --[[ Name: init ]]
    v14._getRowProps = function(v15, v16, v17, v18) --[[ Line: 72 ]]
        -- upvalues: v14 (copy)
        return v14:getDefaultRowProps(v15, v16, v17, v18);
    end;
end;
v13._getRowHeight = function(v19) --[[ Line: 77 ]] --[[ Name: _getRowHeight ]]
    -- upvalues: v7 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v7(l_props_0.RowHeight, l_Stylizer_0.RowHeight);
end;
v13.getDefaultRowProps = function(v22, v23, v24, v25, v26) --[[ Line: 83 ]] --[[ Name: getDefaultRowProps ]]
    return {
        Key = v24, 
        Position = v25, 
        Row = v23, 
        Size = v26, 
        Style = v22.props.Stylizer
    };
end;
v13.render = function(v27) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_omit_0 (copy), v12 (copy), v8 (copy), v10 (copy), l_join_0 (copy), l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 (copy), v9 (copy)
    local l_props_1 = v27.props;
    local v29 = l_props_1.GetRowProps or v27._getRowProps;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local v31 = v27:_getRowHeight();
    local l_Rows_0 = l_props_1.Rows;
    local v33 = UDim2.new(1, 0, 0, v31);
    local v34 = l_omit_0(l_props_1, v12);
    return v8.createElement(v10, l_join_0({
        AutomaticSize = l_props_1.AutomaticSize, 
        InitialCanvasPosition = if l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0() then l_props_1.InitialCanvasPosition else nil, 
        GetCellProps = v29, 
        CellSize = v33, 
        CellComponent = l_props_1.RowComponent or v9, 
        CellGroups = l_props_1.RowGroups, 
        CellGroupHeader = l_props_1.RowGroupHeader, 
        Cells = l_Rows_0, 
        ScrollingDirection = l_props_1.ScrollingDirection, 
        SpecialCells = l_props_1.SpecialRows
    }, l_Stylizer_1.ScrollingFrame, v34));
end;
return (l_withContext_0({
    Stylizer = v1.Stylizer
})(v13));