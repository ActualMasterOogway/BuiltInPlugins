local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_levenshteinDistance_0 = v1.Util.levenshteinDistance;
local l_values_0 = v2.values;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v7 = require(l_Actions_0.ResetQueue);
local v8 = require(l_Actions_0.ResetState);
local v9 = require(l_Actions_0.DEPRECATED_SetActiveSessionCount);
local v10 = require(l_Actions_0.DEPRECATED_SetSessionCount);
local v11 = require(l_Actions_0.DEPRECATED_SetSessionQueue);
local v12 = require(l_Actions_0.SetShowProgress);
local v13 = require(l_Actions_0.SetShowPreview);
local v14 = require(l_Actions_0.ClearQueue);
local v15 = require(l_Actions_0.RemoveQueueItem);
local v16 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v17 = require(l_script_FirstAncestor_0.Src.Controllers.Uploader);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v19 = require(l_Thunks_0.ClosePreview);
local v20 = require(l_Thunks_0.DEPRECATED_RemoveQueueItem);
local v21 = require(l_Thunks_0.DEPRECATED_UpdateSessionCount);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local v23 = l_ContextItem_0:extend("QueueController");
v23.new = function(v24, v25) --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), v23 (copy)
    return (setmetatable({
        _store = v24, 
        _mock = v25, 
        uploader = v17.new(v24, v25)
    }, v23));
end;
v23.mock = function(v26) --[[ Line: 53 ]] --[[ Name: mock ]]
    -- upvalues: v23 (copy)
    return v23.new(v26, true);
end;
v23.destroy = function(v27) --[[ Line: 57 ]] --[[ Name: destroy ]]
    -- upvalues: v8 (copy), v7 (copy)
    if v27._store:getState().Dialogs.uploading then
        v27:stopImportQueue();
    end;
    v27:removeAllQueuedFiles();
    v27._store:dispatch(v8());
    v27._store:dispatch(v7());
end;
v23.beginImportQueue = function(v28) --[[ Line: 67 ]] --[[ Name: beginImportQueue ]]
    if v28._store:getState().Dialogs.uploading then
        return;
    else
        local l_sessionQueue_0 = v28._store:getState().Sessions.sessionQueue;
        local l_activeSessionCount_0 = v28._store:getState().Sessions.activeSessionCount;
        if next(l_sessionQueue_0) == nil or l_activeSessionCount_0 < 1 then
            return;
        else
            v28.uploader:uploadQueue(l_sessionQueue_0);
            return;
        end;
    end;
end;
v23.uploadItem = function(v31, v32) --[[ Line: 82 ]] --[[ Name: uploadItem ]]
    if v32 then
        v31.uploader:uploadItem(v32);
    end;
end;
v23.stopImportQueue = function(v33) --[[ Line: 88 ]] --[[ Name: stopImportQueue ]]
    v33.uploader:stop();
end;
v23._getSessionQueue = function(v34) --[[ Line: 92 ]] --[[ Name: _getSessionQueue ]]
    return v34._store:getState().Sessions.sessionQueue;
end;
v23.destroyItem = function(_, v36) --[[ Line: 96 ]] --[[ Name: destroyItem ]]
    if v36 and v36.session then
        v36.session:Cancel();
    end;
end;
v23.removeAllQueuedFiles = function(v37) --[[ Line: 102 ]] --[[ Name: removeAllQueuedFiles ]]
    -- upvalues: v19 (copy), v22 (copy), v14 (copy), v11 (copy), v10 (copy), v9 (copy), v13 (copy), v12 (copy)
    if v37._store:getState().Dialogs.uploading then
        return;
    else
        v37._store:dispatch(v19());
        for _, v39 in v37:_getSessionQueue() do
            v37:destroyItem(v39);
        end;
        if v22() then
            v37._store:dispatch(v14());
        else
            v37._store:dispatch(v11({}));
            v37._store:dispatch(v10(0));
            v37._store:dispatch(v9(0));
        end;
        v37._store:dispatch(v13(false));
        v37._store:dispatch(v12(false));
        return;
    end;
end;
v23.removeErroredQueuedFiles = function(v40) --[[ Line: 124 ]] --[[ Name: removeErroredQueuedFiles ]]
    -- upvalues: v19 (copy)
    v40._store:dispatch(v19());
end;
v23.removeUploadedQueuedFiles = function(v41) --[[ Line: 128 ]] --[[ Name: removeUploadedQueuedFiles ]]
    -- upvalues: v19 (copy)
    v41._store:dispatch(v19());
end;
v23.removeSelectedQueuedFile = function(v42, v43) --[[ Line: 132 ]] --[[ Name: removeSelectedQueuedFile ]]
    -- upvalues: v19 (copy), v22 (copy), v15 (copy), v21 (copy), v20 (copy)
    if v42._store:getState().Preview.activeQueueItem.filepath == v43.filepath then
        v42._store:dispatch(v19());
    end;
    if v22() then
        v42._store:dispatch(v15(v43.filepath));
        return;
    else
        v42._store:dispatch(v21(v43, nil));
        v42._store:dispatch(v20(v43.filepath));
        return;
    end;
end;
v23.getFilteredRows = function(v44, v45) --[[ Line: 149 ]] --[[ Name: getFilteredRows ]]
    -- upvalues: l_values_0 (copy), v16 (copy), l_levenshteinDistance_0 (copy)
    local v46 = v44:_getSessionQueue();
    if not v45 or v45 == "" then
        local v47 = l_values_0(v46) or {};
        table.sort(v47, v16.compare);
        return v47;
    else
        v45 = string.lower(v45);
        local v48 = {};
        for _, v50 in v46 do
            local v51 = string.lower(v50.assetName);
            if string.find(v51, v45, 1, true) or l_levenshteinDistance_0(v45, v51) <= 1 then
                table.insert(v48, v50);
            end;
        end;
        table.sort(v48, v16.compare);
        return v48;
    end;
end;
return v23;