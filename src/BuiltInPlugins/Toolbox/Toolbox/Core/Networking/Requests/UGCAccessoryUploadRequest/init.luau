local l_PublishService_0 = game:GetService("PublishService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Core.Actions.SetAssetId);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v6 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.DebugFlags);
local v9 = require(l_Util_0.getUserId);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
return function(v15, v16, _, v18, v19, v20, v21, v22, v23) --[[ Line: 22 ]]
    -- upvalues: v10 (copy), v5 (copy), l_UGCValidationService_0 (copy), v9 (copy), l_Promise_0 (copy), l_PublishService_0 (copy), v3 (copy), v12 (copy), v11 (copy), v8 (copy), v4 (copy), v6 (copy)
    return function(v24, _) --[[ Line: 33 ]]
        -- upvalues: v20 (copy), v16 (ref), v10 (ref), v18 (ref), v5 (ref), l_UGCValidationService_0 (ref), v22 (copy), v9 (ref), l_Promise_0 (ref), l_PublishService_0 (ref), v19 (copy), v23 (copy), v3 (ref), v12 (ref), v15 (copy), v21 (copy), v11 (ref), v8 (ref), v4 (ref), v6 (ref)
        local l_v20_0 = v20;
        v16 = if v16 then string.sub(v16, 1, v10.NAME_CHARACTER_LIMIT) else "";
        v18 = if v18 then string.sub(v18, 1, v10.DESCRIPTION_CHARACTER_LIMIT) else "";
        v24:dispatch(v5(v10.SCREENS.UPLOADING_ASSET));
        local v27 = l_v20_0[1];
        if v27 then
            local l_Handle_0 = v27:FindFirstChild("Handle");
            if l_Handle_0 and l_Handle_0:IsA("MeshPart") then
                l_UGCValidationService_0:ResetCollisionFidelity(l_Handle_0);
            end;
        end;
        local v29 = nil;
        local v30 = nil;
        if v22 ~= nil then
            v29 = Enum.AssetCreatorType.Group;
            v30 = v22;
        else
            v29 = Enum.AssetCreatorType.User;
            v30 = v9();
        end;
        return l_Promise_0.new(function(v31, v32) --[[ Line: 63 ]]
            -- upvalues: l_PublishService_0 (ref), l_v20_0 (copy), v29 (ref), v30 (ref), v19 (ref), v16 (ref), v18 (ref), v23 (ref)
            task.spawn(function() --[[ Line: 64 ]]
                -- upvalues: l_PublishService_0 (ref), l_v20_0 (ref), v29 (ref), v30 (ref), v19 (ref), v16 (ref), v18 (ref), v23 (ref), v31 (copy), v32 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                    -- upvalues: l_PublishService_0 (ref), l_v20_0 (ref), v29 (ref), v30 (ref), v19 (ref), v16 (ref), v18 (ref), v23 (ref)
                    return l_PublishService_0:CreateAssetAndWaitForAssetId(l_v20_0, "", v29, v30, v19.Name, v16, v18, v23);
                end);
                if l_status_0 and l_result_0 ~= nil and l_result_0 ~= 0 then
                    v31(l_result_0);
                    return;
                else
                    v32(l_result_0);
                    return;
                end;
            end);
        end):andThen(function(v35) --[[ Line: 84 ]]
            -- upvalues: v24 (copy), v3 (ref), v12 (ref), v15 (ref), v21 (ref), v11 (ref), v19 (ref)
            v24:dispatch(v3(v35));
            v24:dispatch(v12(v15, v35, {}, v21));
            v11.incrementUploadAssetSuccess(v19);
        end):catch(function(v36) --[[ Line: 89 ]]
            -- upvalues: v8 (ref), v24 (copy), v4 (ref), v6 (ref), v11 (ref), v19 (ref)
            if v8.shouldDebugWarnings() then
                warn("Lua toolbox: Could not upload catalog item");
            end;
            v24:dispatch(v4(v36));
            v24:dispatch(v6(false));
            v11.incrementUploadAssetFailure(v19);
        end);
    end;
end;