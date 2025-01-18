local v0 = {
    valueToEnum = {}
};
local function v5(v1) --[[ Line: 9 ]] --[[ Name: cacheEnum ]]
    -- upvalues: v0 (copy)
    if not v0.valueToEnum[v1] then
        local v2 = {};
        for _, v4 in pairs(v1:GetEnumItems()) do
            v2[v4.Value] = v4;
        end;
        v0.valueToEnum[v1] = v2;
    end;
end;
v5(Enum.AssetType);
v0.convertValueToEnum = function(v6, v7) --[[ Line: 20 ]] --[[ Name: convertValueToEnum ]]
    -- upvalues: v5 (copy), v0 (copy)
    v5(v7);
    return v0.valueToEnum[v7][v6];
end;
v0.convertAssetTypeValueToEnum = function(v8) --[[ Line: 25 ]] --[[ Name: convertAssetTypeValueToEnum ]]
    -- upvalues: v0 (copy)
    return v0.convertValueToEnum(v8, Enum.AssetType);
end;
return v0;