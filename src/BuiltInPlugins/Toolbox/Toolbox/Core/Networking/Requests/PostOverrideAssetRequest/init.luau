local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v3 = require(l_Parent_0.Core.Util.getUserId);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.SetCurrentScreen);
local v7 = require(l_Actions_0.UploadResult);
local v8 = require(l_Actions_0.SetAssetId);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.SerializeInstances);
local _ = require(l_Parent_0.Core.Types.AssetUploadAPIPublishInfo);
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixDoublePublish);
return function(v14, v15, v16, v17) --[[ Line: 24 ]]
    -- upvalues: v13 (copy), v6 (copy), v2 (copy), v12 (copy), v8 (copy), v7 (copy), v1 (copy), v5 (copy), v10 (copy), v3 (copy)
    return function(v18, v19) --[[ Line: 25 ]]
        -- upvalues: v13 (ref), v6 (ref), v2 (ref), v12 (ref), v8 (ref), v7 (ref), v1 (ref), v5 (ref), v10 (ref), v17 (copy), v3 (ref), v16 (copy), v15 (copy), v14 (copy)
        if v13() then
            v18:dispatch(v6(v2.SCREENS.UPLOADING_ASSET));
        end;
        local function v22(v20) --[[ Line: 29 ]] --[[ Name: onSuccess ]]
            -- upvalues: v12 (ref), v13 (ref), v18 (copy), v6 (ref), v2 (ref), v8 (ref), v7 (ref)
            local v21 = if v12() then v20.AssetId else v20.responseBody;
            if not v13() then
                v18:dispatch(v6(v2.SCREENS.UPLOADING_ASSET));
            end;
            v18:dispatch(v8(v21));
            v18:dispatch(v7(true));
        end;
        local function v24(v23) --[[ Line: 40 ]] --[[ Name: onSerializeFail ]]
            -- upvalues: v1 (ref), v18 (copy), v6 (ref), v2 (ref), v5 (ref), v7 (ref)
            if v1.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v18:dispatch(v6(v2.SCREENS.UPLOAD_ASSET_RESULT));
            v18:dispatch(v5((tostring(v23))));
            v18:dispatch(v7(false));
        end;
        local function v26(v25) --[[ Line: 50 ]] --[[ Name: onFail ]]
            -- upvalues: v1 (ref), v18 (copy), v6 (ref), v2 (ref), v5 (ref), v12 (ref), v7 (ref)
            if v1.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v18:dispatch(v6(v2.SCREENS.UPLOAD_ASSET_RESULT));
            v18:dispatch(v5(if v12() then v25 else v25.responseBody));
            v18:dispatch(v7(false));
        end;
        return v10(v17, v19.StudioAssetService):andThen(function(v27) --[[ Line: 62 ]]
            -- upvalues: v12 (ref), v3 (ref), v16 (ref), v15 (ref), v22 (copy), v26 (copy), v14 (ref)
            if v12() then
                local l_PublishService_0 = game:GetService("PublishService");
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                    -- upvalues: v3 (ref), v16 (ref), v15 (ref), l_PublishService_0 (copy), v27 (copy)
                    local v29 = v3();
                    local l_User_0 = Enum.AssetCreatorType.User;
                    if v16 == Enum.AssetType.Model.Name then
                        local v31 = {
                            AssetType = v16, 
                            AssetName = "", 
                            Description = "", 
                            AssetId = v15, 
                            CreatorId = v29, 
                            CreatorType = l_User_0, 
                            ContentType = "model/x-rbxm", 
                            Token = "", 
                            AdditionalParameters = {
                                PublishAsPackage = false
                            }
                        };
                        return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsyncWithAddParam(v27, v31);
                    else
                        return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(v27, l_User_0, v29, v16, v15, "", "", "", "model/x-rbxm", 0);
                    end;
                end);
                if l_status_0 then
                    v22(l_result_0);
                    return;
                else
                    v26(l_result_0);
                    return;
                end;
            else
                return v14:postOverrideAsset(v15, v16, v27):andThen(v22, v26);
            end;
        end, v24);
    end;
end;