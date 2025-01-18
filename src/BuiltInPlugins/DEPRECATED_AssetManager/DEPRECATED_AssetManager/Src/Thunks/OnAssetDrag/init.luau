local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Promise);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 5 ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy), v1 (ref)
        if v3.ClassName == "Folder" then
            warn("Cannot drag a folder");
            return;
        else
            local l_id_0 = v3.id;
            local l_name_0 = v3.name;
            local l_assetType_0 = v3.assetType;
            local v9 = l_assetType_0 == Enum.AssetType.Package;
            if v9 then
                l_assetType_0 = Enum.AssetType.Model;
            end;
            v2:beginDragInsert(l_id_0, l_name_0, l_assetType_0, v9):andThen(function(_, _) --[[ Line: 22 ]]
                -- upvalues: v4 (ref), v5 (copy)
                v4:report("dragInsert");
                local l_searchTerm_0 = v5:getState().AssetManagerReducer.searchTerm;
                if utf8.len(l_searchTerm_0) ~= 0 then
                    v4:report("insertAfterSearch");
                end;
            end):catch(function(v13) --[[ Line: 31 ]]
                warn(v13);
            end):finally(function(v14) --[[ Line: 34 ]]
                -- upvalues: v1 (ref), v4 (ref)
                if v14 == v1.Status.Cancelled then
                    v4:report("cancelDragInsert");
                end;
            end);
            return;
        end;
    end;
end;