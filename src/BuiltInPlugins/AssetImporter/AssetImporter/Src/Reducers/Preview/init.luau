local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.ResetState);
local v7 = require(l_Actions_0.SetActiveQueueItem);
local v8 = require(l_Actions_0.SetAssetImportSession);
local v9 = require(l_Actions_0.SetCheckedCount);
local v10 = require(l_Actions_0.SetCurrentPreset);
local v11 = require(l_Actions_0.SetErrorNodeChecked);
local v12 = require(l_Actions_0.SetFilename);
local v13 = require(l_Actions_0.SetHasInvalidPackageId);
local v14 = require(l_Actions_0.SetImportTree);
local v15 = require(l_Actions_0.SetManagedGroups);
local v16 = require(l_Actions_0.SetPreviewInstance);
local v17 = require(l_Actions_0.SetSelectedImportItem);
local v18 = require(l_Actions_0.SetSettingsChanged);
local v19 = require(l_Actions_0.SetTreeChecked);
local v20 = require(l_Actions_0.SetTreeExpansion);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v24 = {
    activeQueueItem = if v21() then v4.new() else nil, 
    assetImportSession = nil, 
    currentPreset = if v21() then nil else "", 
    errorNodeChecked = false, 
    filename = "", 
    hasInvalidPackageId = false, 
    importDataChecked = {}, 
    importDataCheckedCount = -1, 
    importDataExpansion = {}, 
    importTree = nil, 
    managedGroups = {}, 
    previewInstance = nil, 
    selectedImportItem = nil, 
    settingsChanged = not not v22() and nil
};
local function v27(v25, v26) --[[ Line: 72 ]]
    -- upvalues: l_join_0 (copy)
    return l_join_0(v25, {
        currentPreset = v26.currentPreset
    });
end;
return v1.createReducer(v24, {
    [v7.name] = function(v28, v29) --[[ Line: 79 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v28, {
            activeQueueItem = v29.activeQueueItem
        });
    end, 
    [v8.name] = function(v30, v31) --[[ Line: 84 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v30, {
            assetImportSession = v31.assetImportSession
        });
    end, 
    [v14.name] = function(v32, v33) --[[ Line: 89 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v32, {
            importTree = v33.importTree, 
            importDataExpansion = l_join_0(v32.importDataExpansion, {
                [v33.importTree] = true
            })
        });
    end, 
    [v12.name] = function(v34, v35) --[[ Line: 97 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v34, {
            filename = v35.filename
        });
    end, 
    [v13.name] = function(v36, v37) --[[ Line: 102 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v36, {
            hasInvalidPackageId = v37.hasInvalidPackageId
        });
    end, 
    [v16.name] = function(v38, v39) --[[ Line: 107 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v38, {
            previewInstance = v39.previewInstance
        });
    end, 
    [v15.name] = not v23() and function(v40, v41) --[[ Line: 113 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v40, {
            managedGroups = v41.managedGroups
        });
    end or nil, 
    [v17.name] = function(v42, v43) --[[ Line: 119 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v42, {
            selectedImportItem = v43.selectedImportItem
        });
    end, 
    [v19.name] = function(v44, v45) --[[ Line: 124 ]]
        -- upvalues: v21 (copy), l_join_0 (copy)
        for v46, v47 in pairs(v45.checked) do
            if v21() then
                if v46:IsA("BaseImportData") then
                    v46.ShouldImport = v47 ~= false;
                end;
            else
                v46.ShouldImport = v47 ~= false;
            end;
        end;
        return l_join_0(v44, {
            importDataChecked = l_join_0(v44.importDataChecked, v45.checked)
        });
    end, 
    [v9.name] = function(v48, v49) --[[ Line: 139 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v48, {
            importDataCheckedCount = v49.count
        });
    end, 
    [v20.name] = function(v50, v51) --[[ Line: 144 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v50, {
            importDataExpansion = l_join_0(v50.importDataExpansion, v51.expansion)
        });
    end, 
    [v11.name] = function(v52, v53) --[[ Line: 149 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v52, {
            errorNodeChecked = v53.isErrorChecked
        });
    end, 
    [v18.name] = function(v54, v55) --[[ Line: 154 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v54, {
            settingsChanged = v55.settingsChanged
        });
    end, 
    [v10.name] = if v21() then nil else v27, 
    [v6.name] = function() --[[ Line: 160 ]]
        -- upvalues: v21 (copy), v24 (copy), l_join_0 (copy)
        if v21() then
            return (table.clone(v24));
        else
            return (l_join_0({}, v24));
        end;
    end
});