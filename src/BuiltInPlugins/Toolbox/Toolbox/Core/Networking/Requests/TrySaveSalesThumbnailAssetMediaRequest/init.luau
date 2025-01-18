local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Util_0.AssetConfigConstants);
local _ = require(l_Util_0.AssetConfigUtil);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v6 = require(l_Actions_0.SetCurrentScreen);
local v7 = require(l_Actions_0.UploadResult);
local v8 = require(l_Parent_0.Core.Networking.Requests.UpdateAssetMediaDataRequest);
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Framework);
local l_includes_0 = require(l_Packages_0.Dash).includes;
return function(v12) --[[ Line: 30 ]]
    -- upvalues: l_includes_0 (copy), v6 (copy), v3 (copy), v7 (copy), v8 (copy)
    return function(v13) --[[ Line: 31 ]]
        -- upvalues: l_includes_0 (ref), v6 (ref), v3 (ref), v7 (ref), v12 (copy), v8 (ref)
        local v14 = true;
        local v15 = {
            thumbnail = false, 
            assetMedia = false
        };
        local _ = v13:getState().allowedAssetTypesForRelease;
        local function _(v17) --[[ Line: 41 ]]
            -- upvalues: v15 (copy), l_includes_0 (ref), v13 (copy), v6 (ref), v3 (ref), v7 (ref), v14 (ref)
            if v17 ~= nil then
                v15[v17] = true;
            end;
            if not l_includes_0(v15, false) then
                v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v13:dispatch(v7(v14));
            end;
        end;
        local function v19() --[[ Line: 53 ]]
            -- upvalues: v15 (copy), l_includes_0 (ref), v13 (copy), v6 (ref), v3 (ref), v7 (ref), v14 (ref)
            v15.thumbnail = true;
            if not l_includes_0(v15, false) then
                v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v13:dispatch(v7(v14));
            end;
        end;
        local function v21(v20) --[[ Line: 57 ]]
            -- upvalues: v14 (ref), v15 (copy), l_includes_0 (ref), v13 (copy), v6 (ref), v3 (ref), v7 (ref)
            if v20 ~= nil then
                v14 = v20.OverallSuccess;
            end;
            v15.assetMedia = true;
            if not l_includes_0(v15, false) then
                v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v13:dispatch(v7(v14));
            end;
        end;
        if v12.iconFile then
            v12.networkInterface:uploadAssetThumbnail(v12.assetId, v12.iconFile):andThen(v19, v19);
        else
            v15.thumbnail = true;
            if not l_includes_0(v15, false) then
                v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v13:dispatch(v7(v14));
            end;
        end;
        if v12.assetMediaUpdateData then
            v13:dispatch(v8(v12.networkInterface, v12.assetId, v12.assetMediaUpdateData, v12.assetTypeEnum)):andThen(v21);
        else
            v15.assetMedia = true;
            if not l_includes_0(v15, false) then
                v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v13:dispatch(v7(v14));
            end;
        end;
        if not l_includes_0(v15, false) then
            v13:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
            v13:dispatch(v7(v14));
        end;
    end;
end;