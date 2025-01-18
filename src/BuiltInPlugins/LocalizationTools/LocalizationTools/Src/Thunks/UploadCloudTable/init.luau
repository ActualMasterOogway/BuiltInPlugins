local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Http_0 = v4.Http;
local l_Promise_0 = v4.Util.Promise;
local v7 = require(l_Parent_0.Src.Actions.SetIsBusy);
local v8 = require(l_Parent_0.Src.Actions.SetMessage);
local v9 = require(l_Parent_0.Src.Components.UploadDialogContent);
local v10 = require(l_Parent_0.Src.Components.ErrorDialog);
local v11 = require(l_Parent_0.Src.Components.WarningDialog);
local v12 = require(l_Parent_0.Src.Thunks.DownloadCloudTable);
local v13 = require(l_Parent_0.Src.Util.RbxEntriesToWebEntries);
local v14 = require(l_Parent_0.Src.Util.PatchInfo);
local v15 = require(l_Parent_0.Src.Util.isEmpty);
local v16 = require(l_Parent_0.Src.Util.ValidateCloudTable);
local v17 = Vector2.new(300, 370);
local v18 = Vector2.new(500, 200);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local v20 = nil;
if l_game_EngineFeature_0 then
    v20 = require(l_Parent_0.Src.Util.MapEngineErrors);
end;
local v21 = game:DefineFastFlag("StudioPlat37699UnmoveCreatorInventoryItems", false);
local function _(v22, v23) --[[ Line: 37 ]] --[[ Name: makeDispatchErrorMessageFunc ]]
    -- upvalues: v7 (copy), v8 (copy)
    return function() --[[ Line: 38 ]]
        -- upvalues: v22 (copy), v7 (ref), v8 (ref), v23 (copy)
        v22:dispatch(v7(false));
        v22:dispatch(v8(v23:getText("MessageFrame", "UploadFailedMessage")));
    end;
end;
local function v30(v25) --[[ Line: 44 ]] --[[ Name: getGameSupportedLanguages ]]
    -- upvalues: l_Http_0 (copy)
    local v26 = {};
    v25:makeRequest():andThen(function(v27) --[[ Line: 48 ]]
        -- upvalues: l_Http_0 (ref), v26 (copy)
        if v27 and v27.responseCode == l_Http_0.StatusCodes.OK then
            for _, v29 in ipairs(v27.responseBody.data) do
                v26[v29.languageCode] = true;
            end;
            return;
        else
            return;
        end;
    end, function() --[[ Line: 56 ]]

    end):await();
    return v26;
end;
local function v34(v31) --[[ Line: 64 ]] --[[ Name: getGameSourceLanguage ]]
    -- upvalues: l_Http_0 (copy)
    local v32 = nil;
    v31:makeRequest():andThen(function(v33) --[[ Line: 68 ]]
        -- upvalues: l_Http_0 (ref), v32 (ref)
        if v33 and v33.responseCode == l_Http_0.StatusCodes.OK then
            v32 = v33.responseBody.languageCode or "";
        end;
    end, function() --[[ Line: 72 ]]

    end):await();
    return v32;
end;
local function v45(v35, v36, v37) --[[ Line: 77 ]] --[[ Name: patchSupportedLanguages ]]
    -- upvalues: l_HttpService_0 (copy), l_Http_0 (copy)
    local v38 = {};
    for v39, _ in pairs(v37) do
        table.insert(v38, {
            languageCodeType = "Language", 
            languageCode = v39, 
            delete = false
        });
    end;
    local v41 = l_HttpService_0:JSONEncode(v38);
    local v42 = v35.GameInternationalization.V1.SupportedLanguages.Games.patch(v36, v41);
    local v43 = nil;
    v42:makeRequest():andThen(function(v44) --[[ Line: 91 ]]
        -- upvalues: l_Http_0 (ref), v43 (ref)
        if v44.responseCode == l_Http_0.StatusCodes.OK then
            v43 = true;
            return;
        else
            v43 = false;
            return;
        end;
    end, function() --[[ Line: 97 ]]
        -- upvalues: v43 (ref)
        v43 = false;
    end):await();
    return v43;
end;
local v52 = {
    ["38"] = function(v46, v47) --[[ Line: 105 ]]
        if v46.identifier == nil then
            return;
        else
            if v47["38"] == nil then
                v47["38"] = {};
            end;
            table.insert(v47["38"], v46.identifier);
            return;
        end;
    end, 
    ["43"] = function(v48, v49) --[[ Line: 116 ]]
        if v48.translations == nil then
            return;
        else
            if v49["43"] == nil then
                v49["43"] = {};
            end;
            for _, v51 in pairs(v48.translations) do
                table.insert(v49["43"], v51);
            end;
            return;
        end;
    end
};
local function v73(v53, v54, v55, v56, v57) --[[ Line: 130 ]] --[[ Name: patchCloudTable ]]
    -- upvalues: v14 (copy), v15 (copy), l_HttpService_0 (copy), l_Promise_0 (copy), v52 (copy)
    local v58 = v14.SplitByLimits(v56.makePatch(), game:GetFastInt("LocalizationTableUploadRowMax"), game:GetFastInt("LocalizationTableUploadTranslationMax"));
    if v15(v58) then
        return true;
    else
        local v59 = {};
        for _, v61 in pairs(v58) do
            local v62 = l_HttpService_0:JSONEncode(v61);
            table.insert(v59, v53.LocalizationTables.V1.LocalizationTable.tables(v54, v55, v62):makeRequest());
        end;
        return l_Promise_0.all(v59):andThen(function(v63) --[[ Line: 148 ]]
            -- upvalues: v52 (ref), v57 (copy)
            local v64 = {};
            for _, v66 in pairs(v63) do
                if v66.responseBody ~= nil and next(v66.responseBody) ~= nil and v66.responseBody.failedEntriesAndTranslations ~= nil and next(v66.responseBody.failedEntriesAndTranslations) then
                    for _, v68 in pairs(v66.responseBody.failedEntriesAndTranslations) do
                        if v68.error then
                            local v69 = v52[tostring(v68.error.errorCode)];
                            if v69 then
                                v69(v68, v64);
                            end;
                        end;
                    end;
                end;
            end;
            if next(v64) then
                local v70 = {
                    ["38"] = v57:getText("UploadDialogContent", "InvalidIdentifier"), 
                    ["43"] = v57:getText("UploadDialogContent", "InvalidTranslation")
                };
                warn(v57:getText("UploadDialogContent", "UploadCompleteWithInvalidEntries"));
                for v71, v72 in pairs(v64) do
                    print(v70[v71]);
                    print(v72);
                end;
            end;
            return true;
        end, function() --[[ Line: 179 ]]
            return false;
        end):await();
    end;
end;
local function v77(v74, v75) --[[ Line: 185 ]] --[[ Name: requestGenerateAssets ]]
    -- upvalues: v21 (copy)
    local _ = nil;
    (if v21 then v74.GameInternationalization.V1.LocalizationTable.Games.assetsGenerationRequest(v75) else v74.API.Loc.assetsGenerationRequest(v75)):makeRequest():andThen(function() --[[ Line: 192 ]]

    end, function() --[[ Line: 192 ]]

    end):await();
end;
local function _(v78) --[[ Line: 195 ]] --[[ Name: makeRenderDialogContent ]]
    -- upvalues: v3 (copy), v9 (copy)
    return function(v79, v80) --[[ Line: 196 ]]
        -- upvalues: v3 (ref), v9 (ref), v78 (copy)
        return v3.createElement(v9, {
            PatchInfo = v78, 
            OkCallback = v79, 
            CancelCallback = v80
        });
    end;
end;
local function _(v82) --[[ Line: 205 ]] --[[ Name: makeErrorDialogContent ]]
    -- upvalues: v3 (copy), v10 (copy)
    return function(v83, v84) --[[ Line: 206 ]]
        -- upvalues: v3 (ref), v10 (ref), v82 (copy)
        return v3.createElement(v10, {
            OkCallback = v83, 
            CancelCallback = v84, 
            Text = v82
        });
    end;
end;
local function _(v86) --[[ Line: 215 ]] --[[ Name: makeWarningDialogContent ]]
    -- upvalues: v3 (copy), v11 (copy)
    return function(v87, v88) --[[ Line: 216 ]]
        -- upvalues: v3 (ref), v11 (ref), v86 (copy)
        return v3.createElement(v11, {
            OkCallback = v87, 
            CancelCallback = v88, 
            Text = v86
        });
    end;
end;
return function(v90, v91, v92, v93, v94) --[[ Line: 225 ]]
    -- upvalues: v7 (copy), v8 (copy), l_LocalizationService_0 (copy), l_game_EngineFeature_0 (copy), v20 (ref), v16 (copy), v18 (copy), v3 (copy), v11 (copy), v10 (copy), v34 (copy), v30 (copy), v12 (copy), v13 (copy), v14 (copy), v17 (copy), v9 (copy), v15 (copy), v45 (copy), v73 (copy), v77 (copy)
    return function(v95) --[[ Line: 226 ]]
        -- upvalues: v91 (copy), v7 (ref), v8 (ref), l_LocalizationService_0 (ref), l_game_EngineFeature_0 (ref), v20 (ref), v94 (copy), v16 (ref), v93 (copy), v18 (ref), v3 (ref), v11 (ref), v10 (ref), v34 (ref), v90 (copy), v30 (ref), v12 (ref), v13 (ref), v14 (ref), v17 (ref), v9 (ref), v15 (ref), v45 (ref), v73 (ref), v92 (copy), v77 (ref)
        local l_v91_0 = v91;
        local l_l_v91_0_0 = l_v91_0 --[[ copy: 2 -> 22 ]];
        local function v98() --[[ Line: 38 ]]
            -- upvalues: v95 (copy), v7 (ref), v8 (ref), l_l_v91_0_0 (copy)
            v95:dispatch(v7(false));
            v95:dispatch(v8(l_l_v91_0_0:getText("MessageFrame", "UploadFailedMessage")));
        end;
        l_v91_0 = v95:getState();
        if l_v91_0.CloudTable.IsBusy then
            warn(v91:getText("MessageFrame", "BusyMessage"));
            return;
        else
            v95:dispatch(v7(true));
            v95:dispatch(v8(v91:getText("MessageFrame", "OpenCSVFileMessage")));
            local v99 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 241 ]]
                -- upvalues: v99 (ref), l_LocalizationService_0 (ref)
                v99 = l_LocalizationService_0:PromptUploadCSVToGameTable();
            end);
            if not l_status_0 or v99 == nil then
                v98();
                if l_game_EngineFeature_0 then
                    warn(v20.getTranslationForEngineError(l_result_0, v91));
                else
                    warn(l_result_0);
                end;
                return;
            else
                if v94 and v16.isTableEmpty(v99:GetEntries()) then
                    v98();
                    local l_v93_0 = v93;
                    local v103 = v91:getText("UploadTable", "EmptyCSVDialogTitle");
                    local l_v18_0 = v18;
                    local v105 = v91:getText("UploadTable", "EmptyCSVWarning");
                    local l_v105_0 = v105 --[[ copy: 11 -> 23 ]];
                    if not l_v93_0(v103, l_v18_0, function(v107, v108) --[[ Line: 216 ]]
                        -- upvalues: v3 (ref), v11 (ref), l_v105_0 (copy)
                        return v3.createElement(v11, {
                            OkCallback = v107, 
                            CancelCallback = v108, 
                            Text = l_v105_0
                        });
                    end):await() then
                        return;
                    end;
                end;
                local v109, v110 = v16.tableContainsInvalidEntries(v99:GetEntries(), v91);
                if v109 then
                    v98();
                    for _, v112 in ipairs(v110) do
                        warn(v112);
                    end;
                    local l_v93_1 = v93;
                    local v114 = v91:getText("UploadTable", "InvalidTableDialogTitle");
                    local l_v18_1 = v18;
                    local v116 = v91:getText("UploadTable", "InvalidEntryDialogError");
                    l_v93_1(v114, l_v18_1, function(v117, v118) --[[ Line: 206 ]]
                        -- upvalues: v3 (ref), v10 (ref), v116 (copy)
                        return v3.createElement(v10, {
                            OkCallback = v117, 
                            CancelCallback = v118, 
                            Text = v116
                        });
                    end):await();
                    return;
                else
                    v95:dispatch(v8(v91:getText("MessageFrame", "ComputingPatchMessage")));
                    local v119 = v34(v90.GameInternationalization.V1.SourceLanguage.Games.get(game.GameId));
                    if v119 == nil then
                        v98();
                        warn(v91:getText("UploadTable", "GetGameSourceLanguageFailed"));
                        return;
                    else
                        local v120 = v30(v90.GameInternationalization.V1.SupportedLanguages.Games.get(game.GameId));
                        if v120 == nil then
                            v98();
                            warn(v91:getText("UploadTable", "GetSupportedLanguagesFailedMessage"));
                            return;
                        else
                            local l_CloudTableId_0 = l_v91_0.PluginMetadata.CloudTableId;
                            local v122 = v12.Download(v90, v91, l_CloudTableId_0);
                            if v122 == nil then
                                v98();
                                warn(v91:getText("UploadTable", "GetCloudTableFailed"));
                                return;
                            else
                                local l_AllLanguages_0 = l_v91_0.PluginMetadata.AllLanguages;
                                local l_LocalesToLanguages_0 = l_v91_0.PluginMetadata.LocalesToLanguages;
                                local v125 = v13(v122:GetEntries(), l_AllLanguages_0, l_LocalesToLanguages_0);
                                local v126 = v13(v99:GetEntries(), l_AllLanguages_0, l_LocalesToLanguages_0, v120);
                                local v127 = v14.DiffTables("MyLocalizationTable", v125.entries, v126.entries, v94, v119, l_LocalesToLanguages_0, v91);
                                v127.totalRows = v126.totalRows;
                                v127.totalTranslations = v126.totalTranslations;
                                v127.supportedLocales = v126.supportedLocales;
                                v127.unsupportedLocales = v126.unsupportedLocales;
                                v127.includeDeletes = v94;
                                v127.newLanguages = v126.newLanguages;
                                v127.newLanguagesSet = v126.newLanguagesSet;
                                v95:dispatch(v8(v91:getText("MessageFrame", "ConfirmUploadMessage")));
                                local v128 = v91:getText("UploadDialogContent", "ConfirmUploadDialogTitle");
                                if not v93(v128, v17, function(v129, v130) --[[ Line: 196 ]]
                                    -- upvalues: v3 (ref), v9 (ref), v127 (copy)
                                    return v3.createElement(v9, {
                                        PatchInfo = v127, 
                                        OkCallback = v129, 
                                        CancelCallback = v130
                                    });
                                end):await() then
                                    v95:dispatch(v7(false));
                                    v95:dispatch(v8(v91:getText("MessageFrame", "UploadCanceledMessage")));
                                    return;
                                else
                                    v95:dispatch(v8(v91:getText("MessageFrame", "UploadingPatchMessage")));
                                    if v127.newLanguagesSet ~= nil and not v15(v127.newLanguagesSet) and not v45(v90, game.GameId, v127.newLanguagesSet) then
                                        v98();
                                        warn(v91:getText("UploadTable", "PatchSupportedLangugesFailed"));
                                        return;
                                    elseif not v73(v90, l_CloudTableId_0, game.GameId, v127, v91) then
                                        v98();
                                        warn(v91:getText("UploadTable", "PatchCloudTableFailed"));
                                        return;
                                    else
                                        v95:dispatch(v7(false));
                                        v95:dispatch(v8(v91:getText("MessageFrame", "UploadCompletedMessage")));
                                        local v131 = v94 and "replace" or "update";
                                        v92:reportUploadTable(v127, v131);
                                        v77(v90, game.GameId);
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;