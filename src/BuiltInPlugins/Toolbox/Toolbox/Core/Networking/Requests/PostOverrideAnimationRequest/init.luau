local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.SetCurrentScreen);
local v7 = require(l_Actions_0.UploadResult);
local v8 = require(l_Actions_0.SetAssetId);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.SerializeInstances);
local function _(v11, v12) --[[ Line: 19 ]] --[[ Name: fireAnimationUploadSuccessEvent ]]
    -- upvalues: l_RobloxPluginGuiService_0 (copy)
    local l_AnimationClipEditor_0 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor");
    local v14 = l_AnimationClipEditor_0 and l_AnimationClipEditor_0:FindFirstChild("animationUploadSuccess");
    if v14 then
        v14:Fire(v11, v12);
    end;
end;
return function(v16, v17, v18) --[[ Line: 30 ]]
    -- upvalues: v8 (copy), v6 (copy), v3 (copy), v7 (copy), l_RobloxPluginGuiService_0 (copy), v2 (copy), v5 (copy), v10 (copy)
    return function(v19, v20) --[[ Line: 31 ]]
        -- upvalues: v8 (ref), v6 (ref), v3 (ref), v7 (ref), v17 (copy), l_RobloxPluginGuiService_0 (ref), v2 (ref), v5 (ref), v10 (ref), v18 (copy), v16 (copy)
        local function v26(v21) --[[ Line: 32 ]] --[[ Name: onSuccess ]]
            -- upvalues: v19 (copy), v8 (ref), v6 (ref), v3 (ref), v7 (ref), v17 (ref), l_RobloxPluginGuiService_0 (ref)
            v19:dispatch(v8(v21.assetId));
            v19:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
            v19:dispatch(v7(true));
            local l_deleteLocal_0 = v19:getState().deleteLocal;
            local l_v17_0 = v17;
            local l_AnimationClipEditor_1 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor");
            local v25 = l_AnimationClipEditor_1 and l_AnimationClipEditor_1:FindFirstChild("animationUploadSuccess");
            if v25 then
                v25:Fire(l_v17_0, l_deleteLocal_0);
            end;
        end;
        local function v28(v27) --[[ Line: 40 ]] --[[ Name: onSerializeFail ]]
            -- upvalues: v2 (ref), v19 (copy), v6 (ref), v3 (ref), v5 (ref), v7 (ref)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v19:dispatch(v6(v3.SCREENS.UPLOAD_ASSET_RESULT));
            v19:dispatch(v5((tostring(v27))));
            v19:dispatch(v7(false));
        end;
        local function v30(v29) --[[ Line: 50 ]] --[[ Name: onFail ]]
            -- upvalues: v2 (ref), v19 (copy), v6 (ref), v3 (ref), v5 (ref), v7 (ref)
            if v2.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v19:dispatch(v6(v3.SCREENS.UPLOAD_ASSET_RESULT));
            v19:dispatch(v5(v29));
            v19:dispatch(v7(false));
        end;
        return v10(v18, v20.StudioAssetService):andThen(function(v31) --[[ Line: 60 ]]
            -- upvalues: v16 (ref), v17 (ref), v26 (copy), v30 (copy)
            return v16:postOverrideAnimation(v17, v31):andThen(v26, v30);
        end, v28);
    end;
end;