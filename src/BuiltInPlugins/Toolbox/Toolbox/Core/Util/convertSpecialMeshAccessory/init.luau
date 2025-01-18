local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_AssetConfigCopyHandleCFrame_0 = game:GetFastFlag("AssetConfigCopyHandleCFrame");
local function v4(v2) --[[ Line: 9 ]] --[[ Name: isLayeredClothing ]]
    if v2 and typeof(v2) == "Instance" and v2:IsA("Accessory") then
        local l_Handle_0 = v2:FindFirstChild("Handle");
        if l_Handle_0 and l_Handle_0:IsA("MeshPart") and l_Handle_0:FindFirstChildOfClass("WrapLayer") then
            return true;
        end;
    end;
    return false;
end;
return function(v5) --[[ Line: 23 ]] --[[ Name: convertSpecialMeshAccessory ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), l_AssetConfigCopyHandleCFrame_0 (copy)
    if v4(v5) then
        return v5;
    else
        local l_Accessory_0 = Instance.new("Accessory");
        l_Accessory_0.Name = v5.Name;
        l_Accessory_0.Parent = v5.Parent;
        local l_Handle_1 = v5.Handle;
        local l_SpecialMesh_0 = l_Handle_1:FindFirstChildOfClass("SpecialMesh");
        local l_MeshPart_0 = Instance.new("MeshPart");
        l_MeshPart_0.Name = "Handle";
        l_MeshPart_0.TextureID = l_SpecialMesh_0.TextureId;
        l_MeshPart_0.Parent = l_Accessory_0;
        l_UGCValidationService_0:SetMeshIdBlocking(l_MeshPart_0, l_SpecialMesh_0.MeshId);
        l_MeshPart_0.Size = l_MeshPart_0.Size * l_SpecialMesh_0.Scale;
        if l_AssetConfigCopyHandleCFrame_0 then
            l_MeshPart_0.CFrame = l_Handle_1.CFrame;
        end;
        for _, v11 in pairs(l_Handle_1:GetChildren()) do
            if not v11:IsA("SpecialMesh") then
                v11:Clone().Parent = l_MeshPart_0;
            end;
        end;
        local l_ThumbnailConfiguration_0 = v5:FindFirstChild("ThumbnailConfiguration");
        if l_ThumbnailConfiguration_0 and l_ThumbnailConfiguration_0:IsA("Configuration") then
            local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
            local l_ThumbnailCameraValue_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue");
            if l_ThumbnailCameraTarget_0 and l_ThumbnailCameraTarget_0:IsA("ObjectValue") and l_ThumbnailCameraValue_0 and l_ThumbnailCameraValue_0:IsA("CFrameValue") then
                local v15 = l_ThumbnailConfiguration_0:Clone();
                v15.ThumbnailCameraTarget.Value = l_MeshPart_0;
                v15.Parent = l_Accessory_0;
            end;
        end;
        return l_Accessory_0;
    end;
end;