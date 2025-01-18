local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_ContextItem_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.ResetState);
local v4 = require(l_Actions_0.SetShowError);
local v5 = require(l_Actions_0.SetShowPreview);
local v6 = require(l_Actions_0.SetShowProgress);
local v7 = require(l_Actions_0.SetShowQueue);
local v8 = require(l_Actions_0.SetUploading);
local v9 = require(l_Actions_0.DEPRECATED_SetSessionQueue);
local v10 = require(l_Actions_0.ClearQueue);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v13 = require(l_Thunks_0.ShowImportPreview);
local v14 = require(l_Thunks_0.LoadManagedGroups);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableImportQueueModal);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v19 = l_ContextItem_0:extend("FileController");
v19.new = function(v20, v21, v22) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: l_Thunks_0 (copy), v19 (copy)
    local v23 = {
        _store = v20, 
        _presetController = v21, 
        _mock = v22, 
        promptRequested = false
    };
    if v22 then
        v23.showImportPrompt = function() --[[ Line: 45 ]]
            error("Please call FileController.overrideShowImportPrompt to provide testing function");
        end;
        v23.showReplaceImportPrompt = function() --[[ Line: 49 ]]
            error("TODO: Implement FileController.showReplaceImportPrompt for mock");
        end;
        v23.overrideShowImportPrompt = function(v24) --[[ Line: 53 ]]
            -- upvalues: v23 (copy)
            v23.showImportPrompt = v24;
        end;
        v23.setPromptRequested = function(v25) --[[ Line: 57 ]]
            -- upvalues: v23 (copy)
            v23.promptRequested = v25;
        end;
    else
        v23.showImportPrompt = function(v26) --[[ Line: 62 ]]
            -- upvalues: l_Thunks_0 (ref), v23 (copy)
            local v27 = require(l_Thunks_0.ShowImportPrompt);
            v23._store:dispatch(v27(v26));
        end;
        v23.showReplaceImportPrompt = function(v28, v29) --[[ Line: 67 ]]
            -- upvalues: l_Thunks_0 (ref), v23 (copy)
            local v30 = require(l_Thunks_0.ShowReplaceImportPrompt);
            v23._store:dispatch(v30(v28, v29));
        end;
    end;
    return (setmetatable(v23, v19));
end;
v19.mock = function(v31, v32) --[[ Line: 76 ]] --[[ Name: mock ]]
    -- upvalues: v19 (copy)
    return v19.new(v31, v32, true);
end;
v19.DEPRECATED_cleanupPreview = function(v33) --[[ Line: 82 ]] --[[ Name: DEPRECATED_cleanupPreview ]]
    -- upvalues: v3 (copy)
    local l_assetImportSession_0 = v33._store:getState().Preview.assetImportSession;
    if l_assetImportSession_0 then
        v33:DEPRECATED_onSessionCanceled(l_assetImportSession_0);
    end;
    v33._store:dispatch(v3());
end;
v19.DEPRECATED_onSessionCanceled = function(v35, v36) --[[ Line: 91 ]] --[[ Name: DEPRECATED_onSessionCanceled ]]
    -- upvalues: v5 (copy), v8 (copy)
    if v36 then
        v36:Cancel();
    end;
    v35._store:dispatch(v5(false));
    v35._store:dispatch(v8(false));
end;
v19.destroy = function(v37) --[[ Line: 100 ]] --[[ Name: destroy ]]
    v37:DEPRECATED_cleanupPreview();
end;
v19.onPluginButtonClicked = function(v38) --[[ Line: 104 ]] --[[ Name: onPluginButtonClicked ]]
    -- upvalues: v17 (copy), v15 (copy), v16 (copy), v10 (copy), v9 (copy), v7 (copy), v18 (copy), v14 (copy), v5 (copy), v4 (copy)
    local v39 = v38._store:getState();
    local l_uploading_0 = v39.Dialogs.uploading;
    if v17() and l_uploading_0 then
        warn("The importer is currently uploading. To close, please press the `X` button on the plugin.");
        return;
    else
        local v41 = v39.Dialogs.showPreview or v39.Dialogs.showError or v38.promptRequested;
        if not if v17() then v41 or v39.Dialogs.showQueue else v41 or v39.Dialogs.showProgress then
            if v15() and not v17() then
                if v16() then
                    v38._store:dispatch(v10());
                else
                    v38._store:dispatch(v9({}));
                end;
            end;
            if v15() then
                if v17() then
                    v38._store:dispatch(v7(true));
                end;
                if not v18() then
                    v38._store:dispatch(v14());
                end;
            end;
            v38:requestFilePicker();
            return;
        elseif v38.promptRequested then
            return;
        else
            v38._store:dispatch(v5(false));
            v38._store:dispatch(v4(false));
            if v17() then
                v38._store:dispatch(v7(false));
            end;
            return;
        end;
    end;
end;
v19.requestFilePicker = function(v42) --[[ Line: 153 ]] --[[ Name: requestFilePicker ]]
    -- upvalues: v15 (copy), v5 (copy), v4 (copy)
    v42.promptRequested = true;
    if v15() then
        v42.showImportPrompt(function(v43) --[[ Line: 156 ]]
            -- upvalues: v42 (copy)
            v42:_onFilePicked(v43);
            v42.promptRequested = false;
        end);
        return;
    else
        v42.showImportPrompt(function(v44, v45) --[[ Line: 161 ]]
            -- upvalues: v15 (ref), v42 (copy), v5 (ref), v4 (ref)
            if v15() then
                if not v42.promptRequested then
                    return;
                end;
            else
                assert(v42.promptRequested, "Prompt not requested!");
            end;
            v42.promptRequested = false;
            if not v45 then
                if v44 then
                    v42._presetController:initializePresets();
                    v42._store:dispatch(v5(true));
                    return;
                else
                    v42._store:dispatch(v4(true));
                end;
            end;
        end);
        return;
    end;
end;
v19._onFilePicked = function(v46, v47) --[[ Line: 185 ]] --[[ Name: _onFilePicked ]]
    if #v47 == 0 then
        return;
    else
        v46._presetController:initializePresets(v47);
        local l_sessionQueue_0 = v46._store:getState().Sessions.sessionQueue;
        local v49, v50 = next(l_sessionQueue_0);
        local v51 = false;
        if v50 ~= nil then
            v51 = next(l_sessionQueue_0, v49) == nil;
        end;
        local v52 = false;
        if v50 ~= nil then
            v52 = v50.validSession;
        end;
        if v51 and v52 then
            v46:requestPreview(v50);
        end;
        return;
    end;
end;
v19.requestFileSwap = function(v53, v54) --[[ Line: 203 ]] --[[ Name: requestFileSwap ]]
    v53.promptRequested = true;
    v53.showReplaceImportPrompt(v54, function(v55, v56) --[[ Line: 205 ]]
        -- upvalues: v53 (copy)
        v53:_onFileSwapped(v55, v56);
        v53.promptRequested = false;
    end);
end;
v19._onFileSwapped = function(v57, v58, v59) --[[ Line: 211 ]] --[[ Name: _onFileSwapped ]]
    -- upvalues: v13 (copy)
    if not v58 then
        return;
    else
        local v60 = v57._store:getState().Sessions.sessionQueue[v58];
        if v57._store:getState().Dialogs.showPreview then
            v57._store:dispatch(v13(v60));
        end;
        local v61 = if v59.currentPreset ~= "" then v59.currentPreset else v57._presetController.defaultName;
        if v61 ~= v60.currentPreset then
            v57._presetController:resolvePreset(v61, v60);
        end;
        return;
    end;
end;
v19.requestPreview = function(v62, v63) --[[ Line: 231 ]] --[[ Name: requestPreview ]]
    -- upvalues: v13 (copy)
    v62._store:dispatch(v13(v63, function(_, _) --[[ Line: 232 ]]

    end));
end;
v19.DEPRECATED_onImport = function(v66, v67) --[[ Line: 236 ]] --[[ Name: DEPRECATED_onImport ]]
    -- upvalues: v5 (copy), v4 (copy), v8 (copy), v6 (copy)
    if not v67 then
        v66._store:dispatch(v5(false));
        v66._store:dispatch(v4(true));
        return;
    elseif v66._store:getState().Dialogs.uploading then
        return;
    else
        v66._presetController:createPresetFromLastImport(v67:GetImportTree());
        v67:Upload();
        v66._store:dispatch(v5(false));
        v66._store:dispatch(v8(true));
        v66._store:dispatch(v6(true));
        return;
    end;
end;
v19.DEPRECATED_onImportCompleted = function(v68) --[[ Line: 257 ]] --[[ Name: DEPRECATED_onImportCompleted ]]
    -- upvalues: v8 (copy)
    v68._store:dispatch(v8(false));
    v68:DEPRECATED_cleanupPreview();
end;
return v19;