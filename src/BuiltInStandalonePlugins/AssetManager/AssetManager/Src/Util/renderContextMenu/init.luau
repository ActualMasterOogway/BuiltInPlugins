local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_showContextMenu_0 = v1.UI.showContextMenu;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_MenuContext_0 = v4.MenuContext;
local v6 = require(l_script_FirstAncestor_0.Src.Util.insertItems);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Images);
local v8 = require(l_script_FirstAncestor_0.Src.Util.ContextMenuUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Analytics);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrAnalytics);
return {
    [l_MenuContext_0.Asset] = function(v11, v12, v13, v14) --[[ Line: 24 ]]
        -- upvalues: v2 (copy), v10 (copy), v9 (copy), v6 (copy), v8 (copy), l_showContextMenu_0 (copy)
        if v14 then
            return;
        else
            local v15 = v2.keys(v11:getSelection());
            local v16 = {
                {
                    Text = if #v15 == 1 then v13:getText("ContextMenu", "InsertAsset") else v13:getText("ContextMenu", "InsertSelection"); 
                    {
                        Text = v13:getText("ContextMenu", "InsertAtCamera"), 
                        OnItemClicked = function() --[[ Line: 41 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v10 (ref), v11 (copy), v9 (ref), v6 (ref), v12 (copy)
                            if v10() then
                                v11:setAnalyticsInsertAction(v9.Enums.InsertAction.ACTION_RIGHTCLICK);
                            end;
                            v6(v11, v12);
                        end
                    }, 
                    {
                        Text = v13:getText("ContextMenu", "InsertAtAssetPosition"), 
                        OnItemClicked = function() --[[ Line: 50 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v10 (ref), v11 (copy), v9 (ref), v6 (ref), v12 (copy)
                            if v10() then
                                v11:setAnalyticsInsertAction(v9.Enums.InsertAction.ACTION_RIGHTCLICK);
                            end;
                            v6(v11, v12, true);
                        end
                    }
                }, 
                {
                    Text = v13:getText("ContextMenu", "CopyAssetId"), 
                    OnItemClicked = function() --[[ Line: 60 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v8 (ref), v15 (copy)
                        v8.copyAssetId(v15);
                    end
                }, 
                {
                    Text = v13:getText("ContextMenu", "ViewInBrowser"), 
                    OnItemClicked = function() --[[ Line: 66 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v8 (ref), v15 (copy)
                        v8.openItemInBrowser(v15);
                    end
                }
            };
            if #v15 == 1 then
                table.insert(v16, {
                    Text = v13:getText("ContextMenu", "EditAsset"), 
                    OnItemClicked = function() --[[ Line: 74 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v15 (copy), v11 (copy), v8 (ref)
                        local v17 = v15[1];
                        local l_AssetType_0 = v11:getItems()[v17].AssetType;
                        v8.openAssetConfig(v17, l_AssetType_0);
                    end
                });
            end;
            l_showContextMenu_0(v11:getPlugin(), v16);
            return;
        end;
    end, 
    [l_MenuContext_0.Column] = function(v19, v20) --[[ Line: 84 ]]
        -- upvalues: v4 (copy), v7 (copy), l_showContextMenu_0 (copy)
        local v21 = {};
        for _, v23 in v4.getEnumAsList(v4.AssetInfoField) do
            if v23 ~= v4.AssetInfoField.DisplayName and v23 ~= v4.AssetInfoField.ModerationStatus and v23 ~= v4.AssetInfoField.VersionNumber then
                table.insert(v21, {
                    Text = v20:getText("AssetProperty", v23), 
                    OnItemClicked = function() --[[ Line: 96 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v19 (copy), v23 (copy)
                        v19:toggleVisibleProperty(v23);
                    end, 
                    Icon = if v19:getVisiblePropertyIndex(v23) then v7.getImageHelper(v7.AvailableImages.Checkmark) else nil
                });
            end;
        end;
        l_showContextMenu_0(v19:getPlugin(), v21);
    end, 
    [l_MenuContext_0.Scope] = function(v24, v25, v26) --[[ Line: 107 ]]
        -- upvalues: l_showContextMenu_0 (copy)
        local v27 = {
            {
                Text = v25:getText("Scopes", "Hide"), 
                OnItemClicked = function() --[[ Line: 111 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v26 (copy), v24 (copy)
                    v26:toggleVisibleGroup(v24);
                end
            }, 
            {
                Text = v25:getText("Scopes", "Customize"), 
                OnItemClicked = function() --[[ Line: 117 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v26 (copy)
                    v26:enableScopeOptions();
                end
            }, 
            {
                Text = v25:getText("Refresh Groups"), 
                OnItemClicked = function() --[[ Line: 123 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v26 (copy)
                    v26:refreshGroups();
                end
            }
        };
        l_showContextMenu_0(v26:getPlugin(), v27);
    end, 
    [l_MenuContext_0.Sidebar] = function(v28, v29) --[[ Line: 131 ]]
        -- upvalues: l_showContextMenu_0 (copy)
        local v30 = {
            {
                Text = v28:getText("Scopes", "Customize"), 
                OnItemClicked = function() --[[ Line: 135 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v29 (copy)
                    v29:enableScopeOptions();
                end
            }, 
            {
                Text = v28:getText("Scopes", "Refresh"), 
                OnItemClicked = function() --[[ Line: 141 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v29 (copy)
                    v29:refreshGroups();
                end
            }
        };
        l_showContextMenu_0(v29:getPlugin(), v30);
    end
};