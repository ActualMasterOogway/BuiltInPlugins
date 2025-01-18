local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Dash);
local v4 = require(l_Util_0.AssetConfigConstants);
local v5 = require(l_Parent_0.Core.Util.AssetConfigUtil);
local v6 = require(l_Parent_0.Core.Types.ConfigTypes);
local _ = require(l_Parent_0.Core.Types.AssetMediaTypes);
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local l_DisableUGCBodyUploadValidation1_0 = game:GetFastFlag("DisableUGCBodyUploadValidation1");
local v12 = {
    isValidAssetMedia = function(v11) --[[ Line: 17 ]] --[[ Name: isValidAssetMedia ]]
        -- upvalues: v4 (copy)
        if v11 == nil or v11.ThumbnailOrderToChange == nil then
            return true;
        else
            return #v11.ThumbnailOrderToChange <= v4.additionalImages.MaxThumbnails;
        end;
    end
};
v12.checkCanSave = function(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22) --[[ Line: 29 ]] --[[ Name: checkCanSave ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy), v12 (copy), l_DisableUGCBodyUploadValidation1_0 (copy)
    if v6:isOverride(v17) then
        return v13 and v13.OverrideAssetId;
    elseif v6:isPermissions(v17) then
        local v23 = v13 and next(v13) ~= nil;
        local v24 = v13.permissions and next(v13.permissions) ~= nil;
        return v23 and v24;
    else
        local v25 = v13 and next(v13) ~= nil;
        local v26 = false;
        if #v14 <= v4.NAME_CHARACTER_LIMIT then
            v26 = tostring(v14) ~= "";
        end;
        local v27 = #v15 <= v4.DESCRIPTION_CHARACTER_LIMIT;
        if v5.isCatalogAsset(v19) or v5.isUGCBundleType(v19) then
            v27 = v27 and tostring(v15) ~= "";
        end;
        local v28 = v26 and v27 and v16 and v12.isValidAssetMedia(v20) and v22;
        if v18 == v4.FLOW_TYPE.UPLOAD_FLOW then
            if v19 == nil then
                return false;
            else
                if v5.isCatalogAsset(v19) or v5.isUGCBundleType(v19) then
                    v28 = v28 and (v21 or l_DisableUGCBodyUploadValidation1_0);
                end;
                return v28;
            end;
        else
            return v28 and v25;
        end;
    end;
end;
if v9() then
    v12.isRestrictionAppealable = function(v29) --[[ Line: 80 ]] --[[ Name: isRestrictionAppealable ]]
        if v29 == "SafetyStatus" then
            return true;
        else
            return false;
        end;
    end;
    v12.getDisplayTextForRestriction = function(v30, v31) --[[ Line: 87 ]] --[[ Name: getDisplayTextForRestriction ]]
        -- upvalues: v4 (copy)
        if v31 == nil then
            return nil;
        elseif v30 == v4.RESTRICTION_TYPE.SafetyStatus then
            return v31:getText("AssetConfigCopy", "AssetMayViolateCommunityStandards");
        elseif v30 == v4.RESTRICTION_TYPE.AssetType then
            return v31:getText("AssetConfigCopy", "AssetTypeNotAvailable");
        elseif v30 == v4.RESTRICTION_TYPE.Authorization then
            return v31:getText("AssetConfigCopy", "NoPermissionToDistributeAsset");
        else
            return nil;
        end;
    end;
    v12.getRestrictionThatAppliesToAsset = function(v32) --[[ Line: 104 ]] --[[ Name: getRestrictionThatAppliesToAsset ]]
        -- upvalues: v3 (copy), v4 (copy)
        if v32 == nil or #v32 == 0 then
            return nil;
        elseif v3.includes(v32, v4.RESTRICTION_TYPE.SafetyStatus) then
            return v4.RESTRICTION_TYPE.SafetyStatus;
        elseif v3.includes(v32, v4.RESTRICTION_TYPE.AssetType) then
            return v4.RESTRICTION_TYPE.AssetType;
        elseif v3.includes(v32, v4.RESTRICTION_TYPE.Authorization) then
            return v4.RESTRICTION_TYPE.Authorization;
        else
            return nil;
        end;
    end;
end;
return v12;