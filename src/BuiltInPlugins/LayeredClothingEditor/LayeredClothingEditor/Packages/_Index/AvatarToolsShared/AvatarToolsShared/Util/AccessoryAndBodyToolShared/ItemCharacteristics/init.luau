local _ = script.Parent.Parent.Parent;
local v2 = {
    isItemEmpty = function(v1) --[[ Line: 5 ]] --[[ Name: isItemEmpty ]]
        return not v1;
    end
};
v2.getOuterCage = function(v3) --[[ Line: 9 ]] --[[ Name: getOuterCage ]]
    -- upvalues: v2 (copy)
    return not v2.isItemEmpty(v3) and (v3:FindFirstChildWhichIsA("WrapTarget", true) or v3:FindFirstChildWhichIsA("WrapLayer", true)) or nil;
end;
v2.getInnerCage = function(v4) --[[ Line: 15 ]] --[[ Name: getInnerCage ]]
    -- upvalues: v2 (copy)
    return not v2.isItemEmpty(v4) and v4:FindFirstChildWhichIsA("WrapLayer", true) or nil;
end;
v2.hasOuterCage = function(v5) --[[ Line: 19 ]] --[[ Name: hasOuterCage ]]
    -- upvalues: v2 (copy)
    if v2.getOuterCage(v5) then
        return true;
    else
        return false;
    end;
end;
v2.hasInnerCage = function(v6) --[[ Line: 23 ]] --[[ Name: hasInnerCage ]]
    -- upvalues: v2 (copy)
    if v2.getInnerCage(v6) then
        return true;
    else
        return false;
    end;
end;
v2.hasInvalidCage = function(v7) --[[ Line: 28 ]] --[[ Name: hasInvalidCage ]]
    -- upvalues: v2 (copy)
    local v8 = v2.getOuterCage(v7);
    local v9 = v2.getInnerCage(v7);
    assert(not v9 or v8);
    if not v8 and not v9 then
        return false;
    elseif v8 and not v9 then
        return v8.CageMeshId == "";
    elseif v8 and v9 then
        local v10 = true;
        if v8.CageMeshId ~= "" then
            v10 = v9.ReferenceMeshId == "";
        end;
        return v10;
    else
        return;
    end;
end;
local function _(v11) --[[ Line: 48 ]] --[[ Name: isInWorkspace ]]
    -- upvalues: v2 (copy)
    return not v2.isItemEmpty(v11) and v11:FindFirstAncestorOfClass("Workspace") ~= nil;
end;
v2.hasCages = function(v13) --[[ Line: 52 ]] --[[ Name: hasCages ]]
    -- upvalues: v2 (copy)
    return v2.hasInnerCage(v13), (v2.hasOuterCage(v13));
end;
v2.missingOuterCage = function(v14) --[[ Line: 58 ]] --[[ Name: missingOuterCage ]]
    -- upvalues: v2 (copy)
    return not v2.hasOuterCage(v14);
end;
v2.missingInnerCage = function(v15) --[[ Line: 62 ]] --[[ Name: missingInnerCage ]]
    -- upvalues: v2 (copy)
    return not v2.isAvatar(v15) and not v2.hasOuterCage(v15);
end;
v2.hasFullCages = function(v16) --[[ Line: 66 ]] --[[ Name: hasFullCages ]]
    -- upvalues: v2 (copy)
    return not v2.missingInnerCage(v16) and not v2.missingOuterCage(v16);
end;
v2.hasAnyCage = function(v17) --[[ Line: 70 ]] --[[ Name: hasAnyCage ]]
    -- upvalues: v2 (copy)
    local v18, v19 = v2.hasCages(v17);
    return not v2.hasInvalidCage(v17) and (v18 or v19);
end;
v2.getAvatarFromMeshPart = function(v20) --[[ Line: 75 ]] --[[ Name: getAvatarFromMeshPart ]]
    -- upvalues: v2 (copy)
    if v2.isAvatar(v20.Parent) and v20:FindFirstChildWhichIsA("WrapTarget") then
        return v20.Parent;
    else
        return v20;
    end;
end;
v2.isAvatar = function(v21) --[[ Line: 82 ]] --[[ Name: isAvatar ]]
    -- upvalues: v2 (copy)
    if v2.isItemEmpty(v21) then
        return false;
    elseif not v21:IsA("Model") then
        return false;
    else
        local l_Humanoid_0 = v21:FindFirstChild("Humanoid");
        if not l_Humanoid_0 then
            return false;
        else
            for _, v24 in v21:GetChildren() do
                if v24:IsA("MeshPart") and l_Humanoid_0:GetLimb(v24) ~= Enum.Limb.Unknown then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v2.isClothes = function(v25) --[[ Line: 107 ]] --[[ Name: isClothes ]]
    -- upvalues: v2 (copy)
    if v2.isItemEmpty(v25) then
        return false;
    elseif v2.isLegacyAccessory(v25) then
        return true;
    else
        return v25:IsA("MeshPart") and v25:FindFirstChildOfClass("WrapTarget") == nil;
    end;
end;
v2.isLayeredClothingItem = function(v26) --[[ Line: 119 ]] --[[ Name: isLayeredClothingItem ]]
    -- upvalues: v2 (copy)
    local v27 = v26.Parent and v2.isAvatar(v26.Parent);
    local v28 = v26:IsA("Model") and v2.isAvatar(v26);
    local v29 = v26:IsA("MeshPart") and v2.hasAnyCage(v26);
    return not v27 and (v28 or v29);
end;
local function v33(v30) --[[ Line: 126 ]] --[[ Name: findPartWithSpecialMesh ]]
    for _, v32 in v30:GetChildren() do
        if v32:IsA("Part") and v32:FindFirstChildWhichIsA("SpecialMesh") then
            return v32;
        end;
    end;
    return nil;
end;
v2.getLegacyAccessoryHandle = function(v34) --[[ Line: 139 ]] --[[ Name: getLegacyAccessoryHandle ]]
    -- upvalues: v33 (copy)
    if not v34 then
        return false;
    else
        local v35 = nil;
        if v34:IsA("Model") or v34:IsA("Accessory") then
            return (v33(v34));
        else
            if v34:IsA("Part") and v34:FindFirstChildWhichIsA("SpecialMesh") then
                v35 = v34;
            end;
            return v35;
        end;
    end;
end;
v2.getMeshPartAccessoryHandle = function(v36) --[[ Line: 154 ]] --[[ Name: getMeshPartAccessoryHandle ]]
    if not v36 then
        return false;
    else
        local v37 = nil;
        if v36:IsA("Model") or v36:IsA("Accessory") then
            return (v36:FindFirstChildWhichIsA("MeshPart"));
        else
            if v36:IsA("MeshPart") then
                v37 = v36;
            end;
            return v37;
        end;
    end;
end;
v2.isLegacyAccessory = function(v38) --[[ Line: 169 ]] --[[ Name: isLegacyAccessory ]]
    -- upvalues: v2 (copy)
    return v2.getLegacyAccessoryHandle(v38) ~= nil;
end;
v2.isMeshPartAccessory = function(v39) --[[ Line: 173 ]] --[[ Name: isMeshPartAccessory ]]
    -- upvalues: v2 (copy)
    return v2.getMeshPartAccessoryHandle(v39) ~= nil;
end;
v2.getHandle = function(v40) --[[ Line: 177 ]] --[[ Name: getHandle ]]
    -- upvalues: v2 (copy)
    if v40:IsA("BasePart") then
        return v40;
    else
        local v41 = v2.getLegacyAccessoryHandle(v40);
        local v42 = v2.getMeshPartAccessoryHandle(v40);
        if v41 then
            return v41;
        elseif v42 then
            return v42;
        else
            return nil;
        end;
    end;
end;
v2.isMeshPartWithSurfaceAppearance = function(v43) --[[ Line: 194 ]] --[[ Name: isMeshPartWithSurfaceAppearance ]]
    if not v43 then
        return false;
    elseif not v43:IsA("MeshPart") then
        return false;
    else
        return v43:FindFirstChildWhichIsA("SurfaceAppearance") ~= nil;
    end;
end;
v2.isPotentialLayeredClothingItem = function(v44) --[[ Line: 206 ]] --[[ Name: isPotentialLayeredClothingItem ]]
    -- upvalues: v2 (copy)
    local v45 = v44:IsA("Model") and v2.isAvatar(v44);
    return not v2.isItemEmpty(v44) and v44:FindFirstAncestorOfClass("Workspace") ~= nil and (v45 or v2.isMeshPartAccessory(v44) or v2.isLegacyAccessory(v44));
end;
v2.isFullyCagedCharacter = function(v46) --[[ Line: 217 ]] --[[ Name: isFullyCagedCharacter ]]
    -- upvalues: v2 (copy)
    return v2.isAvatar(v46);
end;
v2.isFullyCagedClothing = function(v47) --[[ Line: 221 ]] --[[ Name: isFullyCagedClothing ]]
    -- upvalues: v2 (copy)
    return v2.isClothes(v47) and v2.hasInnerCage(v47) and v2.hasOuterCage(v47);
end;
return v2;