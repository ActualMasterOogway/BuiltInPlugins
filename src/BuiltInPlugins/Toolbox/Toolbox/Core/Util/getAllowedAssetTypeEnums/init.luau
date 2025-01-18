local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.AssetConfigConstants);
return function(v2) --[[ Line: 5 ]] --[[ Name: getAllowedAssetTypeEnums ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    if v2 then
        for _, v5 in ipairs(v1.ASSET_TYPE_INFO) do
            if v5.isCatalog and v5.isUploadable and v2[v5.type.Name] ~= nil then
                v3[#v3 + 1] = v5.type;
            end;
        end;
    end;
    return v3;
end;