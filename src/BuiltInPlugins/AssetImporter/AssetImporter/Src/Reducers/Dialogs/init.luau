local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.ResetQueue);
local v5 = require(l_Actions_0.SetManagedGroups);
local v6 = require(l_Actions_0.SetShowError);
local v7 = require(l_Actions_0.SetShowParsingWidget);
local v8 = require(l_Actions_0.SetShowPreview);
local v9 = require(l_Actions_0.SetShowProgress);
local v10 = require(l_Actions_0.SetShowQueue);
local v11 = require(l_Actions_0.SetShowUploadWidget);
local v12 = require(l_Actions_0.SetShowWarning);
local v13 = require(l_Actions_0.SetUploading);
local v14 = require(l_Actions_0.SetUploadWidgetItem);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportParseDialog);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v21 = {
    managedGroups = {}, 
    showError = false, 
    showParsingWidget = false, 
    showPreview = false, 
    showProgress = false, 
    showQueue = false, 
    showUploadWidget = false, 
    uploading = false, 
    uploadWidgetItem = {}
};
return v1.createReducer(v21, {
    [v4.name] = function() --[[ Line: 59 ]]
        -- upvalues: v21 (copy)
        return table.clone(v21);
    end, 
    [v5.name] = v19() and function(v22, v23) --[[ Line: 63 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v22, {
            managedGroups = v23.managedGroups
        });
    end or nil, 
    [v6.name] = function(v24, v25) --[[ Line: 69 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v24, {
            showError = v25.showError
        });
    end, 
    [v7.name] = v18() and function(v26, v27) --[[ Line: 75 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v26, {
            showParsingWidget = v27.showParsingWidget
        });
    end or nil, 
    [v8.name] = function(v28, v29) --[[ Line: 81 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v28, {
            showPreview = v29.showPreview
        });
    end, 
    [v9.name] = function(v30, v31) --[[ Line: 86 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v30, {
            showProgress = v31.showProgress
        });
    end, 
    [v11.name] = v17() and function(v32, v33) --[[ Line: 92 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v32, {
            showUploadWidget = v33.showUploadWidget
        });
    end or nil, 
    [v10.name] = v16() and function(v34, v35) --[[ Line: 99 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v34, {
            showQueue = v35.showQueue
        });
    end or nil, 
    [v12.name] = function(v36, v37) --[[ Line: 105 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v36, {
            showWarning = v37.showWarning
        });
    end, 
    [v13.name] = function(v38, v39) --[[ Line: 110 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v38, {
            uploading = v39.uploading
        });
    end, 
    [v14.name] = v17() and function(v40, v41) --[[ Line: 116 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v40, {
            uploadWidgetItem = v41.uploadWidgetItem
        });
    end or nil
});