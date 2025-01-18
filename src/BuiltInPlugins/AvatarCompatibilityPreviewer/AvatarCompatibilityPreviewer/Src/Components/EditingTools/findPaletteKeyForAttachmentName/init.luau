local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
return function(v3) --[[ Line: 7 ]] --[[ Name: findPaletteKeyForAttachmentName ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    for _, v6 in v1.allItems do
        if v6.attachment == v3 then
            table.insert(v4, v6.id);
        end;
    end;
    if #v4 == 0 then
        return nil;
    else
        for _, v8 in v2 do
            for _, v10 in v8 do
                for _, v12 in v10.Items do
                    if typeof(v12) == "number" and table.find(v4, v12) ~= nil then
                        return v10.Key;
                    end;
                end;
            end;
        end;
        return nil;
    end;
end;