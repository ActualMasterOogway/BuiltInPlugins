local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.UpdateQueueItem);
local v3 = require(l_Actions_0.SetActiveQueueItem);
local v4 = require(l_Actions_0.SetUploadWidgetItem);
local v5 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.DEPRECATED_UpdateSessionCount);
local v7 = require(l_script_FirstAncestor_0.Src.Utility.GetErrorChecked);
local v8 = require(l_script_FirstAncestor_0.Src.Utility.GetCheckedCount);
local v9 = require(l_script_FirstAncestor_0.Src.Utility.Status.countStatusLevelsForTree);
local v10 = require(l_script_FirstAncestor_0.Src.Utility.isAssetNameValid);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
return function(v14) --[[ Line: 30 ]]
    -- upvalues: v9 (copy), v8 (copy), v7 (copy), v10 (copy), v12 (copy), v5 (copy), v11 (copy), v2 (copy), v13 (copy), v6 (copy), v3 (copy), v4 (copy)
    return function(v15) --[[ Line: 31 ]]
        -- upvalues: v14 (copy), v9 (ref), v8 (ref), v7 (ref), v10 (ref), v12 (ref), v5 (ref), v11 (ref), v2 (ref), v13 (ref), v6 (ref), v3 (ref), v4 (ref)
        if not v14 or not v14.session then
            return;
        else
            local l_ImportTree_0 = v14.session:GetImportTree();
            local v17 = {};
            if l_ImportTree_0 then
                local v18 = v9(l_ImportTree_0);
                v17.errors = v18[l_ImportTree_0].errors + v18[l_ImportTree_0].descErrors;
                v17.warnings = v18[l_ImportTree_0].warnings + v18[l_ImportTree_0].descWarnings;
                local v19 = v8(l_ImportTree_0);
                local v20 = v7(l_ImportTree_0);
                local v21 = true;
                if v19 ~= 0 then
                    v21 = v20;
                end;
                v17.importDataError = v21;
                if l_ImportTree_0.ImportName ~= v14.assetName then
                    v17.assetName = l_ImportTree_0.ImportName;
                end;
                v17.importDataError = v17.importDataError or not v10(l_ImportTree_0.ImportName);
                if v12() and l_ImportTree_0.PreferredUploadId ~= v14.creatorId then
                    v17.creatorId = l_ImportTree_0.PreferredUploadId;
                end;
            else
                v17.validSession = false;
            end;
            local v22 = v5.update(v14, v17);
            if v11() then
                local v23 = v15:getState().Sessions.sessionQueue[v14.filepath];
                v15:dispatch(v2(v22));
                if not v13() then
                    v15:dispatch(v6(v23, v22));
                end;
            end;
            if v15:getState().Dialogs.showPreview then
                v15:dispatch(v3(v22));
            end;
            if v11() and v15:getState().Dialogs.showUploadWidget then
                v15:dispatch(v4(v22));
            end;
            return;
        end;
    end;
end;