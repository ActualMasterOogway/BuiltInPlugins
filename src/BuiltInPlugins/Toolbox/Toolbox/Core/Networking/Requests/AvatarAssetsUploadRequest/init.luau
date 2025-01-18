local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_CMSUploadAccessoryMeshPartFormat2_0 = game:GetFastFlag("CMSUploadAccessoryMeshPartFormat2");
local l_AssetConfigLayeredClothingBoxCollisions_0 = game:GetFastFlag("AssetConfigLayeredClothingBoxCollisions");
local l_ToolboxAccessoryNameFix_0 = game:GetFastFlag("ToolboxAccessoryNameFix");
local v5 = require(l_Parent_0.Core.Actions.SetAssetId);
local v6 = require(l_Parent_0.Core.Actions.NetworkError);
local v7 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v8 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.getUserId);
local v12 = require(l_Util_0.AssetConfigConstants);
local v13 = require(l_Util_0.SerializeInstances);
local v14 = require(l_Util_0.Analytics.Analytics);
local v15 = require(l_Util_0.createMultipartFormDataBody);
local v16 = require(l_Util_0.isLayeredClothing);
local v17 = require(l_Util_0.fixMeshPartAccessory);
local v18 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
local v19 = require(l_Parent_0.Core.Networking.Requests.UploadCatalogItemMeshPartFormatRequest);
local _ = function(v20, _, v22, v23) --[[ Line: 28 ]] --[[ Name: createConfigDataTable ]]
    -- upvalues: v11 (copy)
    return {
        name = v20, 
        description = v22, 
        creatorType = v23 ~= nil and "Group" or "User", 
        creatorTargetId = v23 ~= nil and v23 or v11()
    };
end;
local function _(v25) --[[ Line: 37 ]] --[[ Name: sanitizeName ]]
    if string.match(v25, "Accessory %(.+%)$") then
        return v25;
    else
        return (("Accessory (%*)"):format(v25));
    end;
end;
return function(v27, v28, v29, v30, v31, v32, v33, v34) --[[ Line: 45 ]]
    -- upvalues: v12 (copy), v7 (copy), l_HttpService_0 (copy), v5 (copy), l_CMSUploadAccessoryMeshPartFormat2_0 (copy), v19 (copy), v18 (copy), v14 (copy), v6 (copy), v8 (copy), v10 (copy), l_AssetConfigLayeredClothingBoxCollisions_0 (copy), v16 (copy), v17 (copy), l_ToolboxAccessoryNameFix_0 (copy), v13 (copy), v11 (copy), v15 (copy)
    return function(v35, v36) --[[ Line: 55 ]]
        -- upvalues: v32 (copy), v28 (ref), v12 (ref), v30 (ref), v7 (ref), l_HttpService_0 (ref), v5 (ref), l_CMSUploadAccessoryMeshPartFormat2_0 (ref), v19 (ref), v27 (copy), v31 (copy), v33 (copy), v18 (ref), v14 (ref), v6 (ref), v8 (ref), v10 (ref), l_AssetConfigLayeredClothingBoxCollisions_0 (ref), v16 (ref), v17 (ref), l_ToolboxAccessoryNameFix_0 (ref), v13 (ref), v34 (copy), v11 (ref), v15 (ref), v29 (copy)
        local l_v32_0 = v32;
        v28 = string.sub(v28 or "", 1, v12.NAME_CHARACTER_LIMIT);
        v30 = string.sub(v30 or "", 1, v12.DESCRIPTION_CHARACTER_LIMIT);
        v35:dispatch(v7(v12.SCREENS.UPLOADING_ASSET));
        local function v41(v38) --[[ Line: 63 ]]
            -- upvalues: l_HttpService_0 (ref), v35 (copy), v5 (ref), l_CMSUploadAccessoryMeshPartFormat2_0 (ref), v19 (ref), v27 (ref), v31 (ref), v28 (ref), v30 (ref), l_v32_0 (copy), v33 (ref), v18 (ref), v14 (ref), v6 (ref), v8 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: l_HttpService_0 (ref), v38 (copy)
                return l_HttpService_0:JSONDecode(v38.Body);
            end);
            if l_status_0 and l_result_0.assetId then
                v35:dispatch(v5(l_result_0.assetId));
                if l_CMSUploadAccessoryMeshPartFormat2_0 then
                    v35:dispatch(v19(v27, l_result_0.assetId, v31, v28, v30, l_v32_0, v33));
                else
                    v35:dispatch(v18(v27, l_result_0.assetId, {}, v33));
                end;
                v14.incrementUploadAssetSuccess(v31);
                return;
            else
                warn("Unexpected AvatarAssetsUploadRequest response body:", v38.Body);
                v35:dispatch(v6("Unknown Error"));
                v35:dispatch(v8(false));
                return;
            end;
        end;
        local function v43(v42) --[[ Line: 95 ]] --[[ Name: onSerializeFail ]]
            -- upvalues: v10 (ref), v35 (copy), v6 (ref), v8 (ref), v14 (ref), v31 (ref)
            if v10.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v35:dispatch(v6((tostring(v42))));
            v35:dispatch(v8(false));
            v14.incrementUploadAssetFailure(v31);
        end;
        local function v45(v44) --[[ Line: 106 ]]
            -- upvalues: v10 (ref), v35 (copy), v6 (ref), v8 (ref), v14 (ref), v31 (ref)
            if v10.shouldDebugWarnings() then
                warn("Lua toolbox: Could not upload catalog item");
            end;
            v35:dispatch(v6(v44.Body));
            v35:dispatch(v8(false));
            v14.incrementUploadAssetFailure(v31);
        end;
        if l_AssetConfigLayeredClothingBoxCollisions_0 then
            local v46 = l_v32_0[1];
            if v16(v46) then
                v17(v46);
            end;
            if l_ToolboxAccessoryNameFix_0 then
                local l_Name_0 = v46.Name;
                v46.Name = if string.match(l_Name_0, "Accessory %(.+%)$") then l_Name_0 else ("Accessory (%*)"):format(l_Name_0);
            end;
        end;
        return v13(l_v32_0, v36.StudioAssetService):andThen(function(v48) --[[ Line: 126 ]]
            -- upvalues: v28 (ref), v31 (ref), v30 (ref), v34 (ref), v11 (ref), v27 (ref), v15 (ref), v29 (ref), v12 (ref), v41 (copy), v45 (copy)
            local l_v28_0 = v28;
            local l_v31_0 = v31;
            local l_v30_0 = v30;
            local l_v34_0 = v34;
            local v53 = {
                name = l_v28_0, 
                description = l_v30_0, 
                creatorType = l_v34_0 ~= nil and "Group" or "User", 
                creatorTargetId = l_v34_0 ~= nil and l_v34_0 or v11()
            };
            l_v28_0 = v27:jsonEncode(v53);
            l_v31_0 = v15({
                {
                    type = "application/json", 
                    disposition = {
                        name = "config", 
                        filename = "config.json"
                    }, 
                    value = l_v28_0
                }, 
                {
                    type = "application/octet-stream", 
                    disposition = {
                        name = v28, 
                        filename = v28 .. "." .. v29
                    }, 
                    value = v48
                }
            });
            return v27:avatarAssetsUpload(v31, l_v31_0, v12.MULTIPART_FORM_BOUNDARY):andThen(v41, v45);
        end, v43);
    end;
end;