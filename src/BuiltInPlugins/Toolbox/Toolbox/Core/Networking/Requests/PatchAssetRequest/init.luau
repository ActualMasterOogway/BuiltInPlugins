local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetCurrentScreen);
local v6 = require(l_Actions_0.UploadResult);
local v7 = require(l_Parent_0.Core.Networking.Requests.TrySaveSalesThumbnailAssetMediaRequest);
return function(v8) --[[ Line: 31 ]]
    -- upvalues: v5 (copy), v2 (copy), v7 (copy), v1 (copy), v4 (copy), v6 (copy)
    return function(v9) --[[ Line: 32 ]]
        -- upvalues: v5 (ref), v2 (ref), v7 (ref), v8 (copy), v1 (ref), v4 (ref), v6 (ref)
        v9:dispatch(v5(v2.SCREENS.UPLOADING_ASSET));
        local function v11(_) --[[ Line: 35 ]] --[[ Name: onPatchSuccess ]]
            -- upvalues: v9 (copy), v7 (ref), v8 (ref)
            v9:dispatch(v7(v8));
        end;
        local function v13(v12) --[[ Line: 39 ]] --[[ Name: onPatchFail ]]
            -- upvalues: v1 (ref), v9 (copy), v4 (ref), v6 (ref)
            if v1.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v9:dispatch(v4(v12));
            v9:dispatch(v6(false));
        end;
        return v8.networkInterface:patchAsset(v8.assetId, v8.name, v8.description, v8.genres, v8.commentOn, v8.copyOn, v8.locale, v8.localName, v8.localDescription, v8.isConvertMarketplaceModelsToPackageEnabled):andThen(v11, v13);
    end;
end;