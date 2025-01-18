local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.assetUriToId);
local function _(v2, v3) --[[ Line: 7 ]] --[[ Name: tryAddToSet ]]
    if v3 ~= nil then
        v2[v3] = true;
    end;
end;
return function(v5) --[[ Line: 13 ]] --[[ Name: findUnderlyingMeshAssetIds ]]
    -- upvalues: v1 (copy)
    local v6 = {};
    local l_v5_Descendants_0 = v5:GetDescendants();
    table.insert(l_v5_Descendants_0, v5);
    for _, v9 in l_v5_Descendants_0 do
        if v9:IsA("MeshPart") then
            local v10 = v1(v9.MeshId);
            if v10 ~= nil then
                v6[v10] = true;
            end;
        elseif v9:IsA("WrapTarget") then
            local v11 = v1(v9.CageMeshId);
            if v11 ~= nil then
                v6[v11] = true;
            end;
        end;
    end;
    local v12 = {};
    for v13 in v6 do
        table.insert(v12, v13);
    end;
    return v12;
end;