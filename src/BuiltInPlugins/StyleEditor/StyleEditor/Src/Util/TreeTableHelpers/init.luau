local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_mapOne_0 = v1.mapOne;
local l_map_0 = v1.map;
local _ = require(l_Parent_0.Src.Types);
local v12 = {
    createItemId = function(...) --[[ Line: 17 ]] --[[ Name: createItemId ]]
        -- upvalues: l_map_0 (copy)
        local v6 = l_map_0({
            ...
        }, function(v5) --[[ Line: 20 ]]
            if typeof(v5) == "Instance" then
                return (("Instance[%*]"):format((v5:GetDebugId())));
            else
                return (tostring(v5));
            end;
        end);
        return table.concat(v6, "/");
    end, 
    getRowChildren = function(v7) --[[ Line: 31 ]] --[[ Name: getRowChildren ]]
        return v7.Children or {};
    end, 
    getTableRowId = function(v8) --[[ Line: 35 ]] --[[ Name: getTableRowId ]]
        return v8.Id;
    end, 
    getOneSelectedItem = function(v9) --[[ Line: 39 ]] --[[ Name: getOneSelectedItem ]]
        -- upvalues: l_mapOne_0 (copy)
        return l_mapOne_0(v9, function(v10, v11) --[[ Line: 40 ]]
            if v10 == true then
                return v11;
            else
                return nil;
            end;
        end);
    end
};
v12.updateItems = function(v13, v14, v15, v16) --[[ Line: 51 ]] --[[ Name: updateItems ]]
    -- upvalues: v12 (copy)
    if not v14 or not v15 or not v16 then
        return;
    else
        v13:migrateItemState(v14, v15, v16);
        local l_Children_0 = v15.Children;
        local l_Children_1 = v16.Children;
        if not l_Children_0 or not l_Children_1 then
            return;
        else
            for _, v20 in l_Children_0 do
                for _, v22 in l_Children_1 do
                    local v23 = v22.Instance == v20.Instance;
                    local v24 = v20.Name.Value == v22.Name.Value;
                    if v23 and (v22.Instance ~= nil or v24) then
                        v12.updateItems(v13, v14, v20, v22);
                        break;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
return v12;