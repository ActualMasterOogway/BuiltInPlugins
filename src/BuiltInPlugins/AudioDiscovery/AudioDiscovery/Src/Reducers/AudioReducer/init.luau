local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_Dash_0 = require(l_Parent_0.Packages.Framework).Dash;
local l_append_0 = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_findIndex_0 = l_Dash_0.findIndex;
local l_None_0 = l_Dash_0.None;
local l_sort_0 = table.sort;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v9 = require(l_Actions_0.SetDialog);
local v10 = require(l_Actions_0.SelectRow);
local v11 = require(l_Actions_0.Unpause);
local v12 = require(l_Actions_0.UpdateRows);
local v13 = require(l_Actions_0.UpdateLocations);
local v14 = require(l_Actions_0.SortTable);
local v15 = {
    Left = {
        "OK", 
        "Id", 
        "Name", 
        "Time", 
        "Creator"
    }, 
    Right = {
        "Instance", 
        "Path"
    }
};
local function _(v16, v17, v18) --[[ Line: 26 ]] --[[ Name: sanitize ]]
    local v19 = v17[v16];
    if v16 == "Id" then
        return (tonumber(v19));
    elseif v18 and v16 == "OK" then
        if v18[v17.Id] and #v18[v17.Id] == 0 then
            return "fixed";
        else
            return v19;
        end;
    elseif type(v19) == "userdata" then
        return (tostring(v19));
    else
        return v19;
    end;
end;
local function v38(v21, v22, v23, v24) --[[ Line: 42 ]] --[[ Name: sortRows ]]
    -- upvalues: l_join_0 (copy), l_sort_0 (copy)
    local v25 = l_join_0({}, v21);
    l_sort_0(v25, function(v26, v27) --[[ Line: 44 ]]
        -- upvalues: v23 (copy), v22 (copy), v24 (copy)
        if v23 == Enum.SortDirection.Descending then
            local l_v22_0 = v22;
            local l_v24_0 = v24;
            local v30 = v26[l_v22_0];
            local v31 = if l_v22_0 == "Id" then tonumber(v30) else if l_v24_0 and l_v22_0 == "OK" then l_v24_0[v26.Id] and #l_v24_0[v26.Id] == 0 and "fixed" or v30 else if type(v30) == "userdata" then tostring(v30) else v30;
            l_v24_0 = v22;
            v30 = v24;
            local v32 = v27[l_v24_0];
            return v31 < if l_v24_0 == "Id" then tonumber(v32) else if v30 and l_v24_0 == "OK" then v30[v27.Id] and #v30[v27.Id] == 0 and "fixed" or v32 else if type(v32) == "userdata" then tostring(v32) else v32;
        else
            local l_v22_1 = v22;
            local l_v24_1 = v24;
            local v35 = v26[l_v22_1];
            local v36 = if l_v22_1 == "Id" then tonumber(v35) else if l_v24_1 and l_v22_1 == "OK" then l_v24_1[v26.Id] and #l_v24_1[v26.Id] == 0 and "fixed" or v35 else if type(v35) == "userdata" then tostring(v35) else v35;
            l_v24_1 = v22;
            v35 = v24;
            local v37 = v27[l_v24_1];
            return (if l_v24_1 == "Id" then tonumber(v37) else if v35 and l_v24_1 == "OK" then v35[v27.Id] and #v35[v27.Id] == 0 and "fixed" or v37 else if type(v37) == "userdata" then tostring(v37) else v37) < v36;
        end;
    end);
    return v25;
end;
return v1.createReducer({
    Dialog = false, 
    Paused = true, 
    Rows = {}, 
    SelectedRow = nil, 
    Left = {
        SortIndex = 1, 
        SortOrder = Enum.SortDirection.Descending
    }, 
    Right = {}
}, {
    [v9.name] = function(v39, v40) --[[ Line: 65 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v39, {
            Dialog = v40.Open
        });
    end, 
    [v12.name] = function(v41, v42) --[[ Line: 70 ]]
        -- upvalues: v15 (copy), l_append_0 (copy), v38 (copy), l_findIndex_0 (copy), l_None_0 (copy), l_join_0 (copy)
        local v43 = v15.Left[v41.Left.SortIndex];
        local v44 = l_append_0({}, v41.Rows, v42.Rows);
        local v45 = nil;
        local v46 = v38(v44, v43, v41.Left.SortOrder, v41.Locations);
        if v41.SelectedRow then
            local l_Id_0 = v41.Rows[v41.SelectedRow].Id;
            v45 = l_findIndex_0(v46, function(v48) --[[ Line: 77 ]]
                -- upvalues: l_Id_0 (copy)
                return v48.Id == l_Id_0;
            end) or l_None_0;
        end;
        return l_join_0(v41, {
            SelectedRow = v45, 
            Rows = v46
        });
    end, 
    [v11.name] = function(v49) --[[ Line: 86 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v49, {
            Paused = false
        });
    end, 
    [v10.name] = function(v50, v51) --[[ Line: 91 ]]
        -- upvalues: v15 (copy), l_join_0 (copy), v38 (copy)
        local l_locations_0 = v50.locations;
        if v50.Right.SortIndex and v50.SelectedRow then
            local l_Id_1 = v50.Rows[v50.SelectedRow].Id;
            local v54 = v15.Right[v50.Right.SortIndex];
            l_locations_0 = l_join_0({}, v50.Locations, {
                [l_Id_1] = v38(v50.Locations[l_Id_1], v54, v50.Right.SortOrder)
            });
        end;
        return l_join_0(v50, {
            Locations = l_locations_0, 
            SelectedRow = v51.SelectedRow
        });
    end, 
    [v13.name] = function(v55, v56) --[[ Line: 105 ]]
        -- upvalues: l_join_0 (copy), v15 (copy), v38 (copy)
        local v57 = nil;
        local v58 = l_join_0({}, v55.Locations, v56.Locations);
        local v59 = v15.Left[v55.Left.SortIndex];
        v57 = v38(v55.Rows, v59, v55.Left.SortOrder, v58);
        return l_join_0(v55, {
            Rows = v57, 
            Locations = v58
        });
    end, 
    [v14.name] = function(v60, v61) --[[ Line: 115 ]]
        -- upvalues: v15 (copy), v38 (copy), l_findIndex_0 (copy), l_None_0 (copy), l_join_0 (copy)
        local v62 = v15[v61.TableName][v61.SortIndex];
        local l_SelectedRow_0 = v60.SelectedRow;
        local l_Rows_0 = v60.Rows;
        local l_Locations_0 = v60.Locations;
        local v66 = if v60.SelectedRow then v60.Rows[v60.SelectedRow].Id else nil;
        if v61.TableName == "Left" then
            l_Rows_0 = v38(v60.Rows, v62, v61.SortOrder, l_Locations_0);
            if v60.SelectedRow then
                l_SelectedRow_0 = l_findIndex_0(l_Rows_0, function(v67) --[[ Line: 124 ]]
                    -- upvalues: v66 (copy)
                    return v67.Id == v66;
                end) or l_None_0;
            end;
        end;
        if v61.TableName == "Right" and v66 then
            l_Locations_0 = l_join_0({}, v60.Locations, {
                [v66] = v38(v60.Locations[v66], v62, v61.SortOrder)
            });
        end;
        return l_join_0(v60, {
            SelectedRow = l_SelectedRow_0, 
            Rows = l_Rows_0, 
            Locations = l_Locations_0, 
            [v61.TableName] = {
                SortIndex = v61.SortIndex, 
                SortOrder = v61.SortOrder
            }
        });
    end
});