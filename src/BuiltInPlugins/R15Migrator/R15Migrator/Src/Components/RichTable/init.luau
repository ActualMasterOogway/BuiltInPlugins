local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_Table_0 = v1.UI.Table;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v6 = require(l_Components_0.RichTable.Cells.TextHeaderCell);
local v7 = require(l_Components_0.RichTable.Cells.TextCell);
local function v10(v8) --[[ Line: 16 ]] --[[ Name: RichTableHeaderCell ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy)
    local v9 = v8.Columns[v8.ColumnIndex];
    if v9 and v9.HeaderCellComponent then
        return v2.createElement(v9.HeaderCellComponent, v3.join(v8, v9.HeaderCellComponentProps));
    else
        return v2.createElement(v6, v8);
    end;
end;
local function v13(v11) --[[ Line: 24 ]] --[[ Name: RichTableCell ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy)
    local v12 = v11.Columns[v11.ColumnIndex];
    if v12 and v12.CellComponent then
        return v2.createElement(v12.CellComponent, v3.join(v11, v12.CellComponentProps));
    else
        return v2.createElement(v7, v11);
    end;
end;
local function _(v14, v15) --[[ Line: 32 ]] --[[ Name: injectProps ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v16) --[[ Line: 33 ]]
        -- upvalues: v2 (ref), v14 (copy), v3 (ref), v15 (copy)
        return v2.createElement(v14, v3.join(v16, v15));
    end;
end;
return function(v18) --[[ Line: 38 ]] --[[ Name: RichTable ]]
    -- upvalues: v2 (copy), l_Table_0 (copy), v3 (copy), v10 (copy), v13 (copy)
    local l_createElement_0 = v2.createElement;
    local l_l_Table_0_0 = l_Table_0;
    local l_join_0 = v3.join;
    local l_v18_0 = v18;
    local v23 = {
        LayoutOrder = v18.LayoutOrder, 
        Columns = v18.Columns, 
        Rows = v18.Rows
    };
    local l_v10_0 = v10;
    local v25 = {
        Columns = v18.Columns
    };
    v23.HeaderCellComponent = function(v26) --[[ Line: 33 ]]
        -- upvalues: v2 (ref), l_v10_0 (copy), v3 (ref), v25 (copy)
        return v2.createElement(l_v10_0, v3.join(v26, v25));
    end;
    v23.CellComponent = v13;
    v23.Scroll = true;
    return l_createElement_0(l_l_Table_0_0, l_join_0(l_v18_0, v23));
end;