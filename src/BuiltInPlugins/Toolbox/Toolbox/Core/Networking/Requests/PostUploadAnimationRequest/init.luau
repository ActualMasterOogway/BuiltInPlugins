local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.AssetConfigConstants);
local v4 = require(l_Util_0.SerializeInstances);
local v5 = require(l_Util_0.Analytics.Analytics);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v7 = require(l_Actions_0.NetworkError);
local v8 = require(l_Actions_0.SetCurrentScreen);
local v9 = require(l_Actions_0.UploadResult);
local v10 = require(l_Actions_0.SetAssetId);
return function(v11) --[[ Line: 27 ]]
    -- upvalues: v8 (copy), v3 (copy), v10 (copy), v5 (copy), v9 (copy), v2 (copy), v7 (copy), v4 (copy)
    return function(v12, v13) --[[ Line: 28 ]]
        -- upvalues: v8 (ref), v3 (ref), v10 (ref), v5 (ref), v11 (copy), v9 (ref), v2 (ref), v7 (ref), v4 (ref)
        v12:dispatch(v8(v3.SCREENS.UPLOADING_ASSET));
        local function v15(v14) --[[ Line: 31 ]] --[[ Name: onSuccess ]]
            -- upvalues: v12 (copy), v10 (ref), v8 (ref), v3 (ref), v5 (ref), v11 (ref), v9 (ref)
            v12:dispatch(v10(v14.assetId));
            v12:dispatch(v8(v3.SCREENS.UPLOADING_ASSET));
            v5.incrementUploadAssetSuccess(v11.assetType);
            v12:dispatch(v9(true));
        end;
        local function v17(v16) --[[ Line: 38 ]] --[[ Name: onSerializeFail ]]
            -- upvalues: v2 (ref), v12 (copy), v9 (ref), v7 (ref), v5 (ref), v11 (ref)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v12:dispatch(v9(false));
            v12:dispatch(v7((tostring(v16))));
            v5.incrementUploadAssetFailure(v11.assetType);
        end;
        local function v19(v18) --[[ Line: 49 ]] --[[ Name: onFail ]]
            -- upvalues: v2 (ref), v12 (copy), v9 (ref), v7 (ref), v5 (ref), v11 (ref)
            if v2.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v12:dispatch(v9(false));
            v12:dispatch(v7(v18));
            v5.incrementUploadAssetFailure(v11.assetType);
        end;
        return v4(v11.instance, v13.StudioAssetService):andThen(function(v20) --[[ Line: 60 ]]
            -- upvalues: v11 (ref), v15 (copy), v19 (copy)
            return v11.networkInterface:postUploadAnimation(v11.assetId, v11.name, v11.description, v11.userId, v11.groupId, v20):andThen(v15, v19);
        end, v17);
    end;
end;