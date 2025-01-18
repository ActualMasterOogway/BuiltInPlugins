local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SetAssetConfigData);
local v6 = require(l_Actions_0.SetCurrentScreen);
local v7 = require(l_Actions_0.SetAssetName);
local v8 = require(l_Actions_0.AddChange);
local v9 = require(l_Actions_0.ClearChange);
local v10 = require(l_Actions_0.UploadResult);
local v11 = require(l_Parent_0.Src.Util.Constants);
local v12 = {
    assetConfigData = {}, 
    versionHistory = nil, 
    changed = {}, 
    assetId = nil, 
    assetName = nil, 
    instances = nil, 
    clonedInstance = nil, 
    assetTypeEnum = nil, 
    screenConfigs = {}, 
    isCatalogItemCreator = false, 
    currentScreen = v11.SCREENS.CONFIGURE_ASSET, 
    totalResults = 0, 
    resultsArray = {}, 
    filteredResultsArray = {}
};
return v3.createReducer(v12, {
    [v6.name] = function(v13, v14) --[[ Line: 44 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v13, {
            currentScreen = v14.currentScreen
        });
    end, 
    [v5.name] = function(v15, v16) --[[ Line: 50 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v15, {
            assetConfigData = v16.assetConfigData
        });
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 56 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v17, {
            assetName = v18.assetName
        });
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 62 ]]
        -- upvalues: v2 (copy)
        local l_setting_0 = v20.setting;
        local l_value_0 = v20.value;
        return v2.Dictionary.join(v19, {
            changed = v2.Dictionary.join(v19.changed or {}, {
                [l_setting_0] = l_value_0
            })
        });
    end, 
    [v9.name] = function(v23, v24) --[[ Line: 72 ]]
        -- upvalues: v2 (copy)
        local l_setting_1 = v24.setting;
        return v2.Dictionary.join(v23, {
            changed = v2.Dictionary.join(v23.changed or {}, {
                [l_setting_1] = v2.None
            })
        });
    end, 
    [v10.name] = function(v26, v27) --[[ Line: 82 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v26, {
            uploadSucceeded = v27.uploadSucceeded
        });
    end
});