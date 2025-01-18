local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Promise);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetProgress);
local v4 = require(l_Actions_0.SetProgressGoal);
local v5 = require(l_Actions_0.SetShowProgress);
local v6 = require(l_Actions_0.SetUploading);
local v7 = require(l_Actions_0.SetShowPreview);
local v8 = require(l_Actions_0.SetShowUploadWidget);
local v9 = require(l_Actions_0.SetUploadWidgetItem);
local v10 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v12 = require(l_Thunks_0.InsertModelInWorkspace);
local v13 = require(l_Thunks_0.UpdateSessionInfo);
local v14 = require(l_script_FirstAncestor_0.Src.Utility.openInAvatarPreviewer);
local v15 = require(l_script_FirstAncestor_0.Src.Utility.shouldImportItem);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUnlinkImporterAndAvatarPreview);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v10 (copy), v12 (copy), v17 (copy), v14 (copy), v20 (copy)
    local v23 = {
        _store = v21, 
        _mock = v22, 
        _uploadPromise = nil, 
        _uploadingItem = nil, 
        _index = 0
    };
    v23._isUploading = function() --[[ Line: 85 ]] --[[ Name: _isUploading ]]
        -- upvalues: v23 (copy)
        return v23._store:getState().Dialogs.uploading;
    end;
    v23._resolveUploadPromise = function(v24, v25) --[[ Line: 89 ]]
        -- upvalues: v23 (copy), v13 (ref), v10 (ref), v12 (ref), v17 (ref), v14 (ref)
        v23._uploadPromise = nil;
        v23._uploadingItem = nil;
        if not v23._isUploading() then
            return;
        else
            local l_session_0 = v25.session;
            local l_l_session_0_ImportTree_0 = l_session_0:GetImportTree();
            v23._store:dispatch(v13(v10.update(v25, {
                uploaded = true, 
                uploadResults = v24
            })));
            v23._store:dispatch(v12(v24, l_l_session_0_ImportTree_0));
            if not v17() then
                v14(v24, l_l_session_0_ImportTree_0, l_session_0);
            end;
            l_session_0:Cancel();
            return;
        end;
    end;
    v23._rejectUploadPromise = function(v28, v29) --[[ Line: 113 ]]
        -- upvalues: v23 (copy), v13 (ref), v10 (ref)
        v23._uploadPromise = nil;
        v23._store:dispatch(v13(v10.update(v29, {
            uploadResults = v28
        })));
    end;
    return (setmetatable(v23, v20));
end;
v20.mock = function(v30) --[[ Line: 125 ]] --[[ Name: mock ]]
    -- upvalues: v20 (copy)
    return v20.new(v30, true);
end;
v20.destroy = function(v31) --[[ Line: 129 ]] --[[ Name: destroy ]]
    if v31._store:getState().Dialogs.uploading then
        return;
    else
        return;
    end;
end;
v20.uploadQueue = function(v32, v33) --[[ Line: 137 ]] --[[ Name: uploadQueue ]]
    -- upvalues: v7 (copy), v6 (copy), v3 (copy), v4 (copy), v5 (copy), v15 (copy)
    if v32._isUploading() then
        return;
    else
        v32._store:dispatch(v7(false));
        v32._store:dispatch(v6(true));
        v32._index = 0;
        v32._store:dispatch(v3(0));
        local l_activeSessionCount_0 = v32._store:getState().Sessions.activeSessionCount;
        v32._store:dispatch(v4(l_activeSessionCount_0));
        v32._store:dispatch(v5(true));
        for _, v36 in v33 do
            if v32._isUploading() ~= false then
                if v15(v36) then
                    v32:_upload(v36);
                    v32._index = v32._index + 1;
                end;
            else
                break;
            end;
        end;
        v32._store:dispatch(v6(false));
        return;
    end;
end;
v20.uploadItem = function(v37, v38) --[[ Line: 173 ]] --[[ Name: uploadItem ]]
    -- upvalues: v15 (copy), v19 (copy), v9 (copy), v8 (copy), v6 (copy), v7 (copy), v18 (copy), v3 (copy), v4 (copy), v5 (copy)
    if v37._isUploading() or not v15(v38) then
        return;
    else
        if not v19() then
            v37._store:dispatch(v9(v38));
            v37._store:dispatch(v8(true));
        end;
        v37._store:dispatch(v6(true));
        v37._store:dispatch(v7(false));
        if v18() then
            v37._store:dispatch(v3(0));
            v37._store:dispatch(v4(1));
            v37._store:dispatch(v5(true));
        else
            v37._store:dispatch(v8(true));
        end;
        v37:_upload(v38);
        if v18() then
            v37._store:dispatch(v3(1));
        end;
        v37._store:dispatch(v6(false));
        return;
    end;
end;
v20._upload = function(v39, v40) --[[ Line: 202 ]] --[[ Name: _upload ]]
    v39._uploadingItem = v40;
    v39._uploadPromise = v39:_createUploadPromise(v40):andThen(v39._resolveUploadPromise, v39._rejectUploadPromise);
    v39._uploadPromise:await();
end;
v20.stop = function(v41) --[[ Line: 208 ]] --[[ Name: stop ]]
    -- upvalues: v6 (copy), v1 (copy), v5 (copy)
    if not v41._isUploading() then
        return;
    else
        v41._store:dispatch(v6(false));
        if v41._uploadingItem and v41._uploadingItem.session then
            v41._uploadingItem.session:Cancel();
            v41._uploadingItem = nil;
        end;
        if v41._uploadPromise then
            v1.reject(v41._uploadPromise):catch(function() --[[ Line: 221 ]]
                -- upvalues: v41 (copy)
                v41._uploadPromise = nil;
            end);
        end;
        v41._store:dispatch(v5(false));
        return;
    end;
end;
v20._createUploadPromise = function(v42, v43) --[[ Line: 228 ]] --[[ Name: _createUploadPromise ]]
    -- upvalues: v1 (copy), v10 (copy), v13 (copy), v3 (copy), v18 (copy)
    return v1.new(function(v44, v45) --[[ Line: 229 ]]
        -- upvalues: v43 (copy), v42 (copy), v10 (ref), v13 (ref), v3 (ref), v18 (ref)
        local v46 = nil;
        local v47 = nil;
        if not v43.session or not v43.session:GetImportTree() then
            v45({}, v43);
            return;
        else
            local function v50(v48) --[[ Line: 240 ]]
                -- upvalues: v46 (ref), v47 (ref), v42 (ref), v10 (ref), v43 (ref), v13 (ref), v44 (copy), v45 (copy)
                if v46 then
                    v46:Disconnect();
                    v46 = nil;
                end;
                if v47 then
                    v47:Disconnect();
                    v47 = nil;
                end;
                if v42._isUploading() then
                    local v49 = v10.update(v43, {
                        uploadResults = v48
                    });
                    v42._store:dispatch(v13(v49));
                end;
                if v48 then
                    if v48.Succeeded then
                        v44(v48, v43);
                        return;
                    else
                        v45(v48, v43);
                        return;
                    end;
                else
                    v45({}, v43);
                    return;
                end;
            end;
            local function v54(v51) --[[ Line: 269 ]]
                -- upvalues: v42 (ref), v3 (ref)
                local l_progress_0 = v42._store:getState().Sessions.progress;
                local v53 = v42._index + v51;
                if l_progress_0 < v53 then
                    v42._store:dispatch(v3(v53));
                end;
            end;
            local l_session_1 = v43.session;
            v46 = l_session_1.UploadComplete:Connect(v50);
            if v18() then
                v47 = l_session_1.UploadProgress:Connect(v54);
            end;
            l_session_1:Upload();
            return;
        end;
    end);
end;
return v20;