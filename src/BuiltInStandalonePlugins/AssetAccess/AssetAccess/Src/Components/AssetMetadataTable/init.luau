local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_PaginatedTable_0 = v1.UI.PaginatedTable;
local l_Localization_0 = v1.ContextServices.Localization;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6) --[[ Line: 25 ]] --[[ Name: AssetMetadataTable ]]
    -- upvalues: l_Localization_0 (copy), v2 (copy), l_PaginatedTable_0 (copy)
    local v7 = l_Localization_0.use();
    local v8 = v2.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v7 (copy)
        return {
            {
                Name = v7:getText("AssetMetadataTable", "ColumnName"), 
                Key = "name"
            }, 
            {
                Name = v7:getText("AssetMetadataTable", "ColumnOwner"), 
                Key = "owner"
            }, 
            {
                Name = v7:getText("AssetMetadataTable", "ColumnId"), 
                Key = "id"
            }, 
            {
                Name = v7:getText("AssetMetadataTable", "ColumnType"), 
                Key = "type"
            }
        };
    end, {
        v7.locale
    });
    local v15 = v2.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v6 (copy), v7 (copy)
        local v9 = {};
        for v10, v11 in v6.AssetModels do
            if v11.state == "Loading" then
                local v12 = v7:getText("AssetMetadataTable", "PlaceholderLoading");
                table.insert(v9, {
                    name = v12, 
                    owner = v12, 
                    id = v10, 
                    type = v12
                });
            elseif v11.state == "Failed" then
                local v13 = v7:getText("AssetMetadataTable", "PlaceholderFailed");
                table.insert(v9, {
                    name = v13, 
                    owner = v13, 
                    id = v10, 
                    type = v13
                });
            elseif v11.state == "Loaded" then
                if v11.metadata.visibility == "Private" then
                    local v14 = v7:getText("AssetMetadataTable", "PlaceholderPrivate");
                    table.insert(v9, {
                        name = v14, 
                        owner = v14, 
                        id = v10, 
                        type = v14
                    });
                elseif v11.metadata.visibility == "Public" then
                    table.insert(v9, {
                        name = v11.metadata.name, 
                        owner = v11.metadata.owner, 
                        id = v10, 
                        type = v11.metadata.type.Name
                    });
                end;
            end;
        end;
        return v9;
    end, {
        v7.locale, 
        v6.AssetModels
    });
    local v16, v17 = v2.useState(1);
    local v18, v19 = v2.useState({
        index = 3, 
        order = Enum.SortDirection.Descending
    });
    local v26 = v2.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v15 (copy), v8 (copy), v18 (copy)
        local v20 = table.clone(v15);
        table.sort(v20, function(v21, v22) --[[ Line: 106 ]]
            -- upvalues: v8 (ref), v18 (ref)
            local l_Key_0 = v8[v18.index].Key;
            local v24 = v21[l_Key_0];
            local v25 = v22[l_Key_0];
            assert(typeof(v24) == typeof(v25), "valueA and valueB should have the same type");
            if typeof(v24) == "string" then
                v24 = string.upper(v24);
                v25 = string.upper(v25);
            end;
            if v18.order == Enum.SortDirection.Ascending then
                return v25 < v24;
            else
                return v24 < v25;
            end;
        end);
        return v20;
    end, {
        v8, 
        v15, 
        v18
    });
    local v29 = v2.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: v26 (copy), v16 (copy)
        local v27 = table.move(v26, (v16 - 1) * 8 + 1, v16 * 8, 1, {});
        if #v27 % 8 ~= 0 or #v27 == 0 then
            for _ = 1, 8 - #v27 % 8 do
                table.insert(v27, {});
            end;
        end;
        return v27;
    end, {
        v26, 
        v16
    });
    return v2.createElement(l_PaginatedTable_0, {
        Rows = v29, 
        Columns = v8, 
        PageIndex = v16, 
        PageCount = math.max((#v15 + 8 - 1) // 8, 1), 
        PageSize = 8, 
        SortIndex = v18.index, 
        SortOrder = v18.order, 
        OnPageChange = v17, 
        OnSortChange = function(v30, v31) --[[ Line: 152 ]] --[[ Name: OnSortChange ]]
            -- upvalues: v19 (copy)
            v19({
                index = v30, 
                order = v31
            });
        end, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
end;