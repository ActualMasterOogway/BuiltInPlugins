local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.serializeInstances);
local l_StudioService_0 = game:GetService("StudioService");
local l_PublishService_0 = game:GetService("PublishService");
local function v16(v4, v5) --[[ Line: 7 ]] --[[ Name: uploadAnimation ]]
    -- upvalues: v1 (copy), l_StudioService_0 (copy), l_PublishService_0 (copy)
    local function _(v6) --[[ Line: 8 ]] --[[ Name: onAnimationUploaded ]]
        print("rbxassetid://" .. v6);
    end;
    local v8 = {};
    table.insert(v8, v4);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v8 (copy)
        return v1(v8);
    end);
    if not l_status_0 then
        return;
    else
        local l_User_0 = Enum.AssetCreatorType.User;
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: l_PublishService_0 (ref), l_result_0 (copy), l_User_0 (copy), l_l_StudioService_0_UserId_0 (copy), v5 (copy)
            return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_0, l_User_0, l_l_StudioService_0_UserId_0, "Animation", 0, v5, "", "", "model/x-rbxm", 0);
        end);
        if not l_status_1 then
            warn((("Upload failed. %*"):format(l_result_1)));
            return;
        else
            local l_AssetId_0 = l_result_1.AssetId;
            print("rbxassetid://" .. l_AssetId_0);
            return;
        end;
    end;
end;
return function(v17) --[[ Line: 48 ]]
    -- upvalues: v16 (copy)
    return function(v18) --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v16 (ref)
        local v19 = v18:getState();
        local v20, _ = next(v19.AnimationConversion.animations[v17].refs);
        for v22 = 1, 300 do
            v16(v20:Clone(), v20.Name .. v22);
        end;
    end;
end;