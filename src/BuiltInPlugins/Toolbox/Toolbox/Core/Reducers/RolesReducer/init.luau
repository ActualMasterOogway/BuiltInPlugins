local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.SetAllowedAssetTypes);
local v6 = require(l_Actions_0.SetAllowedBundleTypes);
return v3.createReducer({
    allowedAssetTypesForRelease = {}, 
    allowedAssetTypesForUpload = {}, 
    allowedAssetTypesForFree = {}, 
    allowedBundleTypeSettings = {}
}, {
    [v5.name] = function(v7, v8) --[[ Line: 17 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            allowedAssetTypesForRelease = v8.allowedAssetTypesForRelease, 
            allowedAssetTypesForUpload = v8.allowedAssetTypesForUpload, 
            allowedAssetTypesForFree = v8.allowedAssetTypesForFree
        });
    end, 
    [v6.name] = function(v9, v10) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            allowedBundleTypeSettings = v10.allowedBundleTypeSettings
        });
    end
});