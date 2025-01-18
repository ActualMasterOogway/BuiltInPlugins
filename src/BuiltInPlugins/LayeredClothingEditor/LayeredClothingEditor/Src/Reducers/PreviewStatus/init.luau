local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_PreviewConstants_0 = v3.Util.AccessoryAndBodyToolShared.PreviewConstants;
local l_GetFFlagAFTSelectHandleOnly_0 = v3.Flags.GetFFlagAFTSelectHandleOnly;
return v1.createReducer({
    categoryFilter = "", 
    searchFilter = "", 
    docked = true, 
    selectedTab = l_PreviewConstants_0.TABS_KEYS.None, 
    selectedAssets = {}, 
    userAddedAssets = {}, 
    workspacePreviewSelectionEnabled = true
}, {
    SetCategoryFilter = function(v6, v7) --[[ Line: 20 ]] --[[ Name: SetCategoryFilter ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            categoryFilter = v7.categoryFilter
        });
    end, 
    SetSearchFilter = function(v8, v9) --[[ Line: 26 ]] --[[ Name: SetSearchFilter ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            searchFilter = v9.searchFilter
        });
    end, 
    SetDocked = function(v10, v11) --[[ Line: 32 ]] --[[ Name: SetDocked ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            docked = v11.docked
        });
    end, 
    SetUserAddedAssets = function(v12, v13) --[[ Line: 38 ]] --[[ Name: SetUserAddedAssets ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            userAddedAssets = v13.userAddedAssets
        });
    end, 
    SelectPreviewTab = function(v14, v15) --[[ Line: 44 ]] --[[ Name: SelectPreviewTab ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            selectedTab = v15.selectedTab
        });
    end, 
    SetPreviewAssetsSelected = function(v16, v17) --[[ Line: 49 ]] --[[ Name: SetPreviewAssetsSelected ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            selectedAssets = v17.selectedAssets
        });
    end, 
    SetWorkspacePreviewSelectionEnabled = l_GetFFlagAFTSelectHandleOnly_0() and function(v18, v19) --[[ Line: 55 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v18, {
            workspacePreviewSelectionEnabled = v19.workspacePreviewSelectionEnabled
        });
    end or nil
});