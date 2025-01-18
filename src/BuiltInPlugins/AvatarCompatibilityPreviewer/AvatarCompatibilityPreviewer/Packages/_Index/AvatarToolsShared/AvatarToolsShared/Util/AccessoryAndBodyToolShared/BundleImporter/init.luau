local l_InsertService_0 = game:GetService("InsertService");
local _ = script.Parent.Parent.Parent;
local l_Parent_1 = script.Parent;
local v3 = require(l_Parent_1.Constants);
local v4 = {
    LoadedModels = {}, 
    PartHeadTemplate = nil, 
    MeshPartHeadTemplate = nil
};
local function v9(v5) --[[ Line: 17 ]] --[[ Name: getAssetIdsFromBundleItems ]]
    if not v5 then
        return {};
    else
        local v6 = {};
        for _, v8 in pairs(v5) do
            if v8.Type == "Asset" and v8.Id then
                v6[v8.Name] = v8.Id;
            end;
        end;
        return v6;
    end;
end;
local function v16(v10, v11) --[[ Line: 31 ]] --[[ Name: getMeshPartVersion ]]
    -- upvalues: l_InsertService_0 (copy)
    local v12 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
        -- upvalues: v12 (ref), l_InsertService_0 (ref), v10 (copy), v11 (copy)
        v12 = l_InsertService_0:LoadAssetWithFormat(v10, v11)[1];
    end);
    if not l_status_0 then
        error(l_result_0);
    end;
    if v12 and (v12:IsA("MeshPart") or v12:IsA("Accessory") and v12:FindFirstChildWhichIsA("MeshPart")) then
        local l_Model_0 = Instance.new("Model");
        v12.Parent = l_Model_0;
        return l_Model_0;
    else
        return nil;
    end;
end;
local function v22(v17, v18) --[[ Line: 52 ]] --[[ Name: loadAssetsIntoFolder ]]
    -- upvalues: v16 (copy), l_InsertService_0 (copy)
    for v19, v20 in pairs(v17) do
        local v21 = nil;
        if string.find(string.lower(v19), "head") then
            v21 = v16(v20, "avatar_meshpart_head");
        end;
        if not v21 then
            v21 = l_InsertService_0:LoadAsset(v20);
            if v21:FindFirstChildWhichIsA("Accessory") then
                v21 = v16(v20, "avatar_meshpart_accessory") or v21;
            end;
        end;
        if v21:IsA("Model") then
            v21.Name = tostring(v20);
        end;
        v21.Parent = v18;
    end;
end;
local function v28(v23, v24) --[[ Line: 73 ]] --[[ Name: importBundle ]]
    -- upvalues: v9 (copy), v22 (copy)
    local l_Folder_0 = Instance.new("Folder");
    local v26 = nil;
    local l_v23_BundleDetailsAsync_0 = v23:GetBundleDetailsAsync(v24);
    if l_v23_BundleDetailsAsync_0 and l_v23_BundleDetailsAsync_0.Items then
        l_Folder_0.Name = tostring(v24) .. " - " .. (l_v23_BundleDetailsAsync_0.Name or "");
        v26 = v9(l_v23_BundleDetailsAsync_0.Items);
    end;
    v22(v26, l_Folder_0);
    return l_Folder_0;
end;
local function v37(v29, v30, v31, v32, v33) --[[ Line: 87 ]] --[[ Name: applyHeadTemplate ]]
    -- upvalues: v4 (copy)
    local v34 = nil;
    v34 = if v33 then v4.MeshPartHeadTemplate:clone() else v4.PartHeadTemplate:clone();
    v34.Name = "Head";
    if v32 then
        v34.Color = v29.Color;
    end;
    for _, v36 in pairs(v29:GetChildren()) do
        if v36:IsA("Decal") then
            v36.Parent = v34;
        end;
    end;
    v29:Destroy();
    v34.Parent = v30;
    v31:BuildRigFromAttachments();
    return v34;
end;
local function v58(v38, v39, v40) --[[ Line: 113 ]] --[[ Name: applyBundle ]]
    -- upvalues: v37 (copy)
    local l_Humanoid_0 = v38.Humanoid;
    local l_Head_0 = v38:FindFirstChild("Head");
    for _, v44 in pairs(v39:clone():GetChildren()) do
        for _, v46 in pairs(v44:GetChildren()) do
            if v46:IsA("Folder") and v46.Name == v40 then
                for _, v48 in pairs(v46:GetChildren()) do
                    local l_v38_FirstChild_0 = v38:FindFirstChild(v48.Name);
                    if l_v38_FirstChild_0 then
                        l_v38_FirstChild_0:Destroy();
                    end;
                    v48.Parent = v38;
                    l_Humanoid_0:BuildRigFromAttachments();
                end;
            elseif v46:IsA("Accessory") or v46:IsA("CharacterAppearance") or v46:IsA("Tool") then
                v46.Parent = v38;
            elseif v46:IsA("Decal") and (v46.Name == "face" or v46.Name == "Face") then
                local l_Head_1 = v38:FindFirstChild("Head");
                if l_Head_1 then
                    for _, v52 in pairs(l_Head_1:GetChildren()) do
                        if v52 and (v52.Name == "face" or v52.Name == "Face") then
                            v52:Destroy();
                        end;
                    end;
                    v46.Parent = l_Head_1;
                end;
            elseif v46:IsA("SpecialMesh") then
                local l_Head_2 = v38:FindFirstChild("Head");
                if l_Head_2 then
                    if l_Head_2:IsA("MeshPart") then
                        l_Head_2 = v37(l_Head_2, v38, l_Humanoid_0, true, false);
                    end;
                    for _, v55 in pairs(l_Head_2:GetChildren()) do
                        if v55 and v55:IsA("SpecialMesh") then
                            v55:Destroy();
                        end;
                    end;
                    v46.Parent = l_Head_2;
                end;
            elseif v46:IsA("MeshPart") and v46.Name == "Head" then
                local l_Head_3 = v38:FindFirstChild("Head");
                if l_Head_3 then
                    l_Head_3:Destroy();
                end;
                v46.Parent = v38;
                l_Humanoid_0:BuildRigFromAttachments();
            end;
        end;
    end;
    local l_Head_4 = v38:FindFirstChild("Head");
    if l_Head_4 ~= nil and l_Head_4 == l_Head_0 then
        v37(l_Head_4, v38, l_Humanoid_0, false, true);
    end;
    l_Humanoid_0:BuildRigFromAttachments();
end;
v4.getAvatarFromBundleId = function(v59, v60) --[[ Line: 174 ]] --[[ Name: getAvatarFromBundleId ]]
    -- upvalues: v4 (copy), l_InsertService_0 (copy), v3 (copy), v28 (copy), v58 (copy)
    if not v4.MeshPartHeadTemplate then
        v4.MeshPartHeadTemplate = l_InsertService_0:LoadLocalAsset(v3.MESH_PART_HEAD_TEMPLATE_PATH);
        if not v4.MeshPartHeadTemplate then
            error("Could not retrieve MeshPart Head Template model.");
            return;
        end;
    end;
    if not v4.PartHeadTemplate then
        v4.PartHeadTemplate = l_InsertService_0:LoadLocalAsset(v3.HEAD_TEMPLATE_PATH);
        if not v4.PartHeadTemplate then
            error("Could not retrieve Head Template model.");
            return;
        end;
    end;
    local v61 = nil;
    if v4.LoadedModels[v60] then
        v61 = v4.LoadedModels[v60];
    else
        v61 = l_InsertService_0:LoadLocalAsset(v3.MANNEQUIN_PATH);
        if not v61 then
            error("Could not retrieve Mannequin model.");
            return;
        else
            local v62 = v28(v59, v60);
            v58(v61, v62, "R15ArtistIntent");
            v4.LoadedModels[v60] = v61;
        end;
    end;
    return v61:clone();
end;
return v4;