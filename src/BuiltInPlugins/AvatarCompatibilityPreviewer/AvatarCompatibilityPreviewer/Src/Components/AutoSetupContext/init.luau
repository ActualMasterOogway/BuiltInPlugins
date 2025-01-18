local l_Players_0 = game:GetService("Players");
local l_PublishService_0 = game:GetService("PublishService");
local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarAutosetupUseSurfaceAppearance);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAvatarPreviewerMockAutoSetup);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local function v15(v11) --[[ Line: 20 ]] --[[ Name: performAutoSetupDebugAsync ]]
    -- upvalues: v10 (copy), l_Players_0 (copy), v5 (copy)
    if v10() then
        v11({
            progressPercentage = 1, 
            progressName = "Initializing", 
            completionStart = 0, 
            completionEnd = 0.2, 
            jobStatus = "Created", 
            jobId = "abcd"
        });
        task.wait(5);
        v11({
            progressPercentage = 1, 
            progressName = "NotProcessing", 
            completionStart = 0.2, 
            completionEnd = 0.95, 
            jobStatus = "Processing", 
            jobId = "abcd"
        });
        task.wait(12);
        v11({
            progressPercentage = 1, 
            progressName = "Finalizing", 
            completionStart = 0.95, 
            completionEnd = 1, 
            jobStatus = "Finalizing", 
            jobId = "abcd"
        });
        task.wait(3);
    else
        for v12 = 30, 1, -1 do
            v11(v12);
            task.wait(1);
        end;
    end;
    local l_l_Players_0_HumanoidModelFromUserId_0 = l_Players_0:CreateHumanoidModelFromUserId(24941);
    while true do
        local l_Accessory_0 = l_l_Players_0_HumanoidModelFromUserId_0:FindFirstChildWhichIsA("Accessory");
        if l_Accessory_0 ~= nil then
            assert(l_Accessory_0 ~= nil, v5.LUAU_ANALYZE_ERROR);
            l_Accessory_0:Destroy();
        else
            break;
        end;
    end;
    return l_l_Players_0_HumanoidModelFromUserId_0;
end;
local function v19(v16, v17) --[[ Line: 71 ]] --[[ Name: copySurfaceAppearanceToPart ]]
    local l_SurfaceAppearance_0 = v17:FindFirstChildWhichIsA("SurfaceAppearance");
    if l_SurfaceAppearance_0 == nil then
        v16:Clone().Parent = v17;
        return;
    else
        if l_SurfaceAppearance_0.ColorMap == "" then
            l_SurfaceAppearance_0.ColorMap = v16.ColorMap;
        end;
        if l_SurfaceAppearance_0.NormalMap == "" then
            l_SurfaceAppearance_0.NormalMap = v16.NormalMap;
        end;
        if l_SurfaceAppearance_0.MetalnessMap == "" then
            l_SurfaceAppearance_0.MetalnessMap = v16.MetalnessMap;
        end;
        if l_SurfaceAppearance_0.RoughnessMap == "" then
            l_SurfaceAppearance_0.RoughnessMap = v16.RoughnessMap;
        end;
        return;
    end;
end;
local function v24(v20, v21) --[[ Line: 91 ]] --[[ Name: copyAllSurfaceAppearanceMaps ]]
    -- upvalues: v19 (copy)
    for _, v23 in v21:GetDescendants() do
        if v23:IsA("MeshPart") then
            v19(v20, v23);
        end;
    end;
end;
local v44 = {
    uploadModelAsync = function(v25) --[[ Line: 99 ]] --[[ Name: uploadModelAsync ]]
        -- upvalues: v9 (copy), l_StudioService_0 (copy), l_PublishService_0 (copy)
        if v9() then
            return "rbxasset://mock";
        else
            local l_StudioAssetService_0 = game:GetService("StudioAssetService");
            local v27 = v25:Clone();
            if not v27 then
                error("Failed to clone body");
            end;
            local v28 = CFrame.new(v27:GetBoundingBox().Position);
            local v29 = {};
            for _, v31 in v27:GetDescendants() do
                if v31:IsA("BasePart") then
                    v29[v31] = v28:ToObjectSpace(v31.CFrame);
                end;
            end;
            for v32, v33 in v29 do
                v32.CFrame = v33;
            end;
            local v34 = l_StudioAssetService_0:SerializeInstances({
                v27
            });
            local v35 = {
                AssetType = "Model", 
                AssetName = "Auto-setup character model", 
                Description = "Auto-setup character model", 
                AssetId = 0, 
                CreatorId = l_StudioService_0:GetUserId(), 
                CreatorType = Enum.AssetCreatorType.User, 
                ContentType = "model/x-rbxm", 
                Token = "", 
                AdditionalParameters = {
                    PublishAsPackage = false
                }
            };
            return (("rbxassetid://%*"):format(l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsyncWithAddParam(v34, v35).AssetId));
        end;
    end, 
    startAutoSetupAsync = function(v36, v37) --[[ Line: 152 ]] --[[ Name: startAutoSetupAsync ]]
        -- upvalues: v8 (copy), v9 (copy), v15 (copy)
        assert(v8(), "FFlag::AvatarPreviewerUseAnyModel is not enabled");
        if v9() then
            return (v15(v37));
        else
            return game:GetService("StudioAssetService"):AutoSetupAvatarAsync(v36, v37);
        end;
    end, 
    DEPRECATED_startAutoSetupAsync = function(v38, v39) --[[ Line: 169 ]] --[[ Name: DEPRECATED_startAutoSetupAsync ]]
        -- upvalues: v8 (copy), v9 (copy), v15 (copy), v7 (copy), v24 (copy)
        assert(v38:IsA("MeshPart"), "Expected MeshPart");
        assert(not v8(), "FFlag::AvatarPreviewerUseAnyModel is enabled");
        if v9() then
            return (v15(v39));
        else
            local l_StudioAssetService_1 = game:GetService("StudioAssetService");
            if v7() then
                local l_SurfaceAppearance_1 = v38:FindFirstChildWhichIsA("SurfaceAppearance");
                local v42 = if l_SurfaceAppearance_1 and l_SurfaceAppearance_1.ColorMap ~= "" then l_SurfaceAppearance_1.ColorMap else v38.TextureID;
                local v43 = l_StudioAssetService_1:RequestAvatarAutosetupAsync(v38.MeshId, v42, v39);
                if l_SurfaceAppearance_1 ~= nil then
                    v24(l_SurfaceAppearance_1, v43);
                end;
                return v43;
            else
                return l_StudioAssetService_1:RequestAvatarAutosetupAsync(v38.MeshId, v38.TextureID, v39);
            end;
        end;
    end, 
    autoSetupClickedSignal = nil
};
return (v4.createContext(v44));