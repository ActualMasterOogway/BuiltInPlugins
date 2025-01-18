local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimations);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimation);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v5 = require(l_Thunks_0.UpdateScriptSuggestion);
local v6 = require(l_Thunks_0.ReplaceAnimation);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v8 = require(l_AnimationConversion_0.serializeInstances);
local v9 = require(l_AnimationConversion_0.AnimationConversionManager);
local v10 = require(l_AnimationConversion_0.constants);
local l_AssetType_0 = v10.AssetType;
local l_AnimationStatus_0 = v10.AnimationStatus;
local v13 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PublishService_0 = game:GetService("PublishService");
local l_StudioService_0 = game:GetService("StudioService");
local function v27(v17, v18, v19, v20, v21) --[[ Line: 26 ]] --[[ Name: setAnimationStatus ]]
    -- upvalues: l_deepCopy_0 (copy), v3 (copy), v2 (copy)
    local v22 = v17:getState();
    local v23 = l_deepCopy_0(v22.AnimationConversion.animations);
    local v24 = 0;
    for v25, _ in v18 do
        if v23[v25] then
            v23[v25].status = v19;
            v23[v25].errCode = v21;
            v23[v25].converted = v20;
            v24 = v24 + 1;
        end;
    end;
    if v24 == 1 then
        v17:dispatch(v3(next(v18), v23[next(v18)]));
        return;
    else
        v17:dispatch(v2(v23));
        return;
    end;
end;
local function v47(v28, v29, v30, v31, _) --[[ Line: 47 ]] --[[ Name: uploadAnimation ]]
    -- upvalues: l_MarketplaceService_0 (copy), v27 (copy), l_AnimationStatus_0 (copy), v8 (copy), l_StudioService_0 (copy), l_PublishService_0 (copy), v9 (copy), v13 (copy), v5 (copy)
    local l_id_0 = v29.id;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
        -- upvalues: l_MarketplaceService_0 (ref), l_id_0 (copy)
        return l_MarketplaceService_0:GetProductInfo(l_id_0);
    end);
    if not l_status_0 then
        v27(v31, {
            [l_id_0] = true
        }, l_AnimationStatus_0.FailedToGetProductInfo);
        return false;
    else
        local v36 = l_result_0.Name .. " R15";
        local l_Description_0 = l_result_0.Description;
        local v38 = nil;
        if l_result_0.Creator.CreatorType == Enum.CreatorType.Group.Name then
            v38 = l_result_0.Creator.CreatorTargetId;
        end;
        local v39 = {};
        table.insert(v39, v28);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 68 ]]
            -- upvalues: v8 (ref), v39 (copy)
            return v8(v39);
        end);
        if not l_status_1 then
            v27(v31, {
                [l_id_0] = true
            }, l_AnimationStatus_0.FailedSerialization);
            return false;
        else
            local v42 = if v38 then Enum.AssetCreatorType.Group else Enum.AssetCreatorType.User;
            local v43 = if v38 then v38 else l_StudioService_0:GetUserId();
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 78 ]]
                -- upvalues: l_PublishService_0 (ref), l_result_1 (copy), v42 (copy), v43 (copy), v36 (copy), l_Description_0 (copy)
                return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_1, v42, v43, "Animation", 0, v36, l_Description_0, "", "model/x-rbxm", 0);
            end);
            if not l_status_2 then
                v27(v31, {
                    [l_id_0] = true
                }, l_AnimationStatus_0.FailedWithError, nil, l_result_2);
                return false;
            else
                local l_AssetId_0 = l_result_2.AssetId;
                v9.addCacheEntry(l_id_0, l_AssetId_0);
                v13.setTargetAssetId(tonumber(l_id_0), (tonumber(l_AssetId_0)));
                v27(v31, {
                    [l_id_0] = true
                }, nil, l_AssetId_0);
                v31:dispatch(v5(l_id_0, v9.getAnimationId(l_AssetId_0), v30));
                return true;
            end;
        end;
    end;
end;
return function(v48, v49) --[[ Line: 115 ]]
    -- upvalues: v9 (copy), l_AssetType_0 (copy), l_AnimationStatus_0 (copy), v27 (copy), v47 (copy), v6 (copy)
    return function(v50) --[[ Line: 116 ]]
        -- upvalues: v9 (ref), l_AssetType_0 (ref), l_AnimationStatus_0 (ref), v27 (ref), v47 (ref), v48 (copy), v49 (copy), v6 (ref)
        local v51 = v50:getState();
        local v52 = {};
        local v53 = {};
        for v54 in v51.AnimationConversion.selection do
            local v55 = v9.getAnimationAssetInfo(v54);
            if not v55:IsA(l_AssetType_0.RobloxAsset) or v51.AnimationConversion.animations[v54].converted then
                table.insert(v53, v55);
            else
                local l_status_3 = v51.AnimationConversion.animations[v54].status;
                if l_status_3 ~= l_AnimationStatus_0.Uploading and l_status_3 ~= l_AnimationStatus_0.Done and v9.getConvertedKeyframeSequence(v55) then
                    v52[v54] = v55;
                end;
            end;
        end;
        v27(v50, v52, l_AnimationStatus_0.Uploading);
        for _, v58 in v52 do
            local v59 = v9.getConvertedKeyframeSequence(v58);
            if v47(v59:Clone(), v58, v48, v50, v49) then
                table.insert(v53, v58);
            end;
        end;
        v50:dispatch(v6(v53, v48, v49));
        v49:getHandler("onAnimationsConverted")(v51.AnimationConversion.animations, v51.AnimationConversion.selection);
    end;
end;