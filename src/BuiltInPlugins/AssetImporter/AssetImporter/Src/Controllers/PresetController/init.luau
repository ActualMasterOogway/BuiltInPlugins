local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_join_0 = v3.join;
local l_keys_0 = v3.keys;
local l_findIndex_0 = v3.findIndex;
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetActiveQueueItem);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.DEPRECATED_SetSessionQueue);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v15 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetCount);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUploadWidgetCleanup);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local v20 = l_ContextItem_0:extend("PresetController");
v20.new = function(v21, v22, v23, v24) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy)
    local v25 = setmetatable({
        lastImportName = v23:getText("Templates", "LastImported"), 
        studioDefaultName = v23:getText("Templates", "StudioDefault"), 
        defaultName = "", 
        _assetImportServiceWrapper = wrapAssetImportService(v24), 
        _plugin = v21, 
        _store = v22, 
        _localization = v23, 
        _mock = v24
    }, v20);
    v25.defaultName = if not v24 and v25._plugin:GetSetting("AssetImporter_DefaultPreset") then v25._plugin:GetSetting("AssetImporter_DefaultPreset") else v25.studioDefaultName;
    return v25;
end;
wrapAssetImportService = function(v26) --[[ Line: 61 ]] --[[ Name: wrapAssetImportService ]]
    if v26 then
        local v27 = {};
        return {
            GetPreset = function(_, v29) --[[ Line: 65 ]] --[[ Name: GetPreset ]]
                -- upvalues: v27 (ref)
                return v27[v29] or {};
            end, 
            GetAllPresets = function(_) --[[ Line: 68 ]] --[[ Name: GetAllPresets ]]
                -- upvalues: v27 (ref)
                return v27;
            end, 
            SavePreset = function(_, v32) --[[ Line: 71 ]] --[[ Name: SavePreset ]]
                -- upvalues: v27 (ref)
                v27[v32] = {};
                return true;
            end, 
            RemovePreset = function(_, v34) --[[ Line: 75 ]] --[[ Name: RemovePreset ]]
                -- upvalues: v27 (ref)
                v27[v34] = nil;
            end, 
            _clearPresets = function() --[[ Line: 78 ]] --[[ Name: _clearPresets ]]
                -- upvalues: v27 (ref)
                v27 = {};
            end
        };
    else
        return game:GetService("AssetImportService");
    end;
end;
v20.mock = function(v35) --[[ Line: 87 ]] --[[ Name: mock ]]
    -- upvalues: v20 (copy)
    local v40 = {
        getText = function(_, _, v38, _) --[[ Line: 90 ]] --[[ Name: getText ]]
            return v38;
        end
    };
    local v43 = {
        SetSetting = function(_, _) --[[ Line: 96 ]] --[[ Name: SetSetting ]]

        end
    };
    return v20.new(v43, v35, v40, true);
end;
v20.destroy = function(v44) --[[ Line: 102 ]] --[[ Name: destroy ]]
    if v44._mock then
        v44._assetImportServiceWrapper:_clearPresets();
    end;
    v44.defaultName = "";
end;
v20._filter = function(_, v46) --[[ Line: 110 ]] --[[ Name: _filter ]]
    v46.Material = nil;
    for _, v48 in v46 do
        v48.ImportName = nil;
        v48.ShouldImport = nil;
    end;
end;
v20.save = function(v49, v50) --[[ Line: 125 ]] --[[ Name: save ]]
    -- upvalues: l_join_0 (copy), v17 (copy), v15 (copy), v18 (copy), v12 (copy), v8 (copy), v10 (copy), v9 (copy)
    if v49:isStudioDefault(v50) or v49:isLastImport(v50) then
        return false;
    else
        local l_PresetFromData_0 = v49._store:getState().Preview.assetImportSession:CreatePresetFromData(v49._store:getState().Preview.selectedImportItem);
        v49:_filter(l_PresetFromData_0);
        local l_Preset_0 = v49._assetImportServiceWrapper:GetPreset(v50);
        local v53 = l_join_0(l_Preset_0, l_PresetFromData_0);
        if v17() then
            local l_activeQueueItem_0 = v49._store:getState().Preview.activeQueueItem;
            if l_activeQueueItem_0 then
                local v55 = v15.update(l_activeQueueItem_0, {
                    currentPreset = v50, 
                    settingsChanged = not v18() and nil
                });
                v49._store:dispatch(v12(v55));
                v49._store:dispatch(v8(v55));
            end;
        else
            v49._store:dispatch(v10(false));
            v49._store:dispatch(v9(v50));
        end;
        return v49._assetImportServiceWrapper:SavePreset(v50, v53);
    end;
end;
v20.createPresetFromLastImport = function(v56, v57) --[[ Line: 167 ]] --[[ Name: createPresetFromLastImport ]]
    local l_PresetFromData_1 = v56._store:getState().Preview.assetImportSession:CreatePresetFromData(v57);
    v56:_filter(l_PresetFromData_1);
    v56._assetImportServiceWrapper:SavePreset("Last Imported", l_PresetFromData_1);
end;
v20.DEPRECATED_updateQueueItems = function(v59, v60, v61) --[[ Line: 177 ]] --[[ Name: DEPRECATED_updateQueueItems ]]
    -- upvalues: v17 (copy), v19 (copy), v12 (copy), v15 (copy), v11 (copy), v8 (copy)
    local v62 = v59._store:getState();
    local v63 = {};
    if v17() then
        if v19() then
            local l__store_0 = v59._store;
            for v65, _ in l__store_0:getState() do
                local v67 = l__store_0:getState().Sessions.sessionQueue[v65];
                if v67.currentPreset == v61 then
                    l__store_0:dispatch(v12(v15.update(v67, {
                        currentPreset = v60
                    })));
                end;
            end;
        else
            for v68, v69 in v62.Sessions.sessionQueue do
                if v69.currentPreset == v61 then
                    v63[v68] = v15.update(v69, {
                        currentPreset = v60
                    });
                else
                    v63[v68] = v69;
                end;
            end;
            v59._store:dispatch(v11(v63));
        end;
    else
        local l_activeQueueItem_1 = v62.Preview.activeQueueItem;
        v63[l_activeQueueItem_1.filepath] = v15.update(l_activeQueueItem_1, {
            currentPreset = v60
        });
    end;
    if v62.Dialogs.showPreview then
        local l_activeQueueItem_2 = v62.Preview.activeQueueItem;
        v59._store:dispatch(v8(v63[l_activeQueueItem_2.filepath]));
    end;
end;
v20._updateQueueItems = function(v72, v73, v74) --[[ Line: 219 ]] --[[ Name: _updateQueueItems ]]
    -- upvalues: v17 (copy), v19 (copy), v12 (copy), v15 (copy), v11 (copy), v8 (copy)
    local v75 = v72._store:getState();
    local v76 = {};
    if v17() then
        if v19() then
            local l__store_1 = v72._store;
            for v78, _ in l__store_1:getState().Sessions.sessionQueue do
                local v80 = l__store_1:getState().Sessions.sessionQueue[v78];
                if v80.currentPreset == v73 then
                    l__store_1:dispatch(v12(v15.update(v80, v74)));
                end;
            end;
        else
            for v81, v82 in v75.Sessions.sessionQueue do
                if v82.currentPreset == v73 then
                    v76[v81] = v15.update(v82, v74);
                else
                    v76[v81] = v82;
                end;
            end;
            v72._store:dispatch(v11(v76));
        end;
    else
        local l_activeQueueItem_3 = v75.Preview.activeQueueItem;
        v76[l_activeQueueItem_3.filepath] = v15.update(l_activeQueueItem_3, v74);
    end;
    if v75.Dialogs.showPreview then
        local l_activeQueueItem_4 = v75.Preview.activeQueueItem;
        v72._store:dispatch(v8(v76[l_activeQueueItem_4.filepath]));
    end;
end;
v20.rename = function(v85, v86, v87) --[[ Line: 255 ]] --[[ Name: rename ]]
    -- upvalues: v18 (copy)
    local l__assetImportServiceWrapper_0 = v85._assetImportServiceWrapper;
    local l_l__assetImportServiceWrapper_0_Preset_0 = l__assetImportServiceWrapper_0:GetPreset(v87);
    l__assetImportServiceWrapper_0:RemovePreset(v87);
    l__assetImportServiceWrapper_0:SavePreset(v86, l_l__assetImportServiceWrapper_0_Preset_0);
    if v85.defaultName == v87 then
        v85._plugin:SetSetting("AssetImporter_DefaultPreset", v86);
        v85.defaultName = v86;
    end;
    if v18() then
        v85:_updateQueueItems(v87, {
            currentPreset = v86
        });
        return;
    else
        v85:DEPRECATED_updateQueueItems(v86, v87);
        return;
    end;
end;
v20.DEPRECATED_rename = function(v90, v91) --[[ Line: 274 ]] --[[ Name: DEPRECATED_rename ]]
    -- upvalues: v9 (copy)
    local l_currentPreset_0 = v90._store:getState().Preview.currentPreset;
    local l__assetImportServiceWrapper_1 = v90._assetImportServiceWrapper;
    local l_l__assetImportServiceWrapper_1_Preset_0 = l__assetImportServiceWrapper_1:GetPreset(l_currentPreset_0);
    l__assetImportServiceWrapper_1:RemovePreset(l_currentPreset_0);
    l__assetImportServiceWrapper_1:SavePreset(v91, l_l__assetImportServiceWrapper_1_Preset_0);
    if v90.defaultName == l_currentPreset_0 then
        v90._plugin:SetSetting("AssetImporter_DefaultPreset", v91);
        v90.defaultName = v91;
    end;
    v90._store:dispatch(v9(v91));
end;
v20.delete = function(v95, v96) --[[ Line: 291 ]] --[[ Name: delete ]]
    -- upvalues: v17 (copy), v18 (copy), v9 (copy), v10 (copy)
    v95._assetImportServiceWrapper:RemovePreset(v96);
    if v17() then
        if v96 == v95.defaultName then
            v95.defaultName = v95.studioDefaultName;
        end;
        if v18() then
            v95:_updateQueueItems(v96, {
                currentPreset = v95.studioDefaultName, 
                settingsChanged = true
            });
        else
            v95:DEPRECATED_updateQueueItems(v95.defaultName, v96);
        end;
    else
        v95._store:dispatch(v9(v95.studioDefaultName));
    end;
    if not v18() then
        v95._store:dispatch(v10(true));
    end;
end;
v20.setDefault = function(v97, v98) --[[ Line: 317 ]] --[[ Name: setDefault ]]
    v97._plugin:SetSetting("AssetImporter_DefaultPreset", v98);
    v97.defaultName = v98;
end;
v20.hasCustomDefault = function(v99) --[[ Line: 322 ]] --[[ Name: hasCustomDefault ]]
    local v100 = false;
    if v99.defaultName ~= "" then
        v100 = v99.defaultName ~= v99.studioDefaultName;
    end;
    return v100;
end;
v20.applyPresetToAllSessions = function(v101, v102) --[[ Line: 326 ]] --[[ Name: applyPresetToAllSessions ]]
    for _, v104 in v101._store:getState().Sessions.sessionQueue do
        if v104.validSession and not v104.uploaded then
            v101:resolvePreset(v102, v104);
        end;
    end;
end;
v20.applyImportDataToSession = function(v105, v106) --[[ Line: 337 ]] --[[ Name: applyImportDataToSession ]]
    -- upvalues: v17 (copy), v12 (copy)
    if v17() and not v105._store:getState().Dialogs.showPreview then
        return;
    else
        local l_v106_PresetFromData_0 = v106:CreatePresetFromData();
        for _, v109 in l_v106_PresetFromData_0 do
            v109.ImportName = nil;
        end;
        if v17() then
            local l_activeQueueItem_5 = v105._store:getState().Preview.activeQueueItem;
            l_activeQueueItem_5.session:ApplyPreset(l_v106_PresetFromData_0);
            v105._store:dispatch(v12(l_activeQueueItem_5));
            return;
        else
            v105._store:getState().Preview.assetImportSession:ApplyPreset(l_v106_PresetFromData_0);
            return;
        end;
    end;
end;
v20.isDefault = function(v111, v112) --[[ Line: 359 ]] --[[ Name: isDefault ]]
    return v111.defaultName == v112;
end;
v20.isLastImport = function(v113, v114) --[[ Line: 363 ]] --[[ Name: isLastImport ]]
    local v115 = true;
    if v113.lastImportName ~= v114 then
        v115 = v114 == "Last Imported";
    end;
    return v115;
end;
v20.isStudioDefault = function(v116, v117) --[[ Line: 367 ]] --[[ Name: isStudioDefault ]]
    local v118 = true;
    if v116.studioDefaultName ~= v117 then
        v118 = v117 == "Studio Default";
    end;
    return v118;
end;
v20.reset = function(_, v120) --[[ Line: 371 ]] --[[ Name: reset ]]
    local l_v120_ImportTree_0 = v120:GetImportTree();
    local v122 = {
        [l_v120_ImportTree_0] = l_v120_ImportTree_0.ImportName
    };
    for _, v124 in l_v120_ImportTree_0:GetDescendants() do
        v122[v124] = v124.ImportName;
    end;
    v120:Reset();
    l_v120_ImportTree_0.ImportName = v122[l_v120_ImportTree_0];
    for _, v126 in v120:GetImportTree():GetDescendants() do
        v126.ImportName = v122[v126];
    end;
end;
v20.resolvePreset = function(v127, v128, v129) --[[ Line: 390 ]] --[[ Name: resolvePreset ]]
    -- upvalues: v15 (copy), v18 (copy), v17 (copy), v13 (copy), v14 (copy), v10 (copy), v8 (copy), v12 (copy)
    local v130 = v15.update(v129, {
        currentPreset = v128, 
        settingsChanged = not v18() and nil
    });
    local l_session_0 = v129.session;
    if l_session_0 and l_session_0:GetImportTree() then
        if v17() then
            v127:reset(l_session_0);
        else
            l_session_0:Reset();
        end;
        l_session_0:ApplyPreset(if v127:isLastImport(v128) then v127._assetImportServiceWrapper:GetPreset(v127.lastImportName) else v127._assetImportServiceWrapper:GetPreset(v128));
        if v127._store:getState().Dialogs.showPreview then
            local v132 = {};
            for v133, _ in v127._store:getState().Preview.importDataChecked do
                v132[v133] = v133.ShouldImport;
            end;
            v127._store:dispatch(v13(v132));
            local l_selectedImportItem_0 = v127._store:getState().Preview.selectedImportItem;
            if l_selectedImportItem_0 then
                local l_l_selectedImportItem_0_Preview_0 = l_selectedImportItem_0:GetPreview();
                v127._store:dispatch(v14(l_l_selectedImportItem_0_Preview_0));
            end;
            if not v18() then
                v127._store:dispatch(v10(false));
            end;
            v127._store:dispatch(v8(v130));
        end;
    end;
    if v17() then
        v127._store:dispatch(v12(v130));
    end;
end;
v20.DEPRECATED_resolvePreset = function(v137, v138) --[[ Line: 442 ]] --[[ Name: DEPRECATED_resolvePreset ]]
    -- upvalues: v17 (copy), v9 (copy), v13 (copy), v14 (copy), v10 (copy)
    assert(not v17(), "Do not call this function with FFlagAssetImportQueuedSessionRefactor=true");
    local l_assetImportSession_0 = v137._store:getState().Preview.assetImportSession;
    if not l_assetImportSession_0 or v17() and not l_assetImportSession_0:GetImportTree() then
        return;
    else
        assert(l_assetImportSession_0, "Session does not exist!");
        l_assetImportSession_0:Reset();
        v137._store:dispatch(v9(v138));
        local _ = nil;
        l_assetImportSession_0:ApplyPreset(if v137:isLastImport(v138) then v137._assetImportServiceWrapper:GetPreset(v137.lastImportName) else v137._assetImportServiceWrapper:GetPreset(v138));
        local v141 = {};
        for v142, _ in v137._store:getState().Preview.importDataChecked do
            v141[v142] = v142.ShouldImport;
        end;
        v137._store:dispatch(v13(v141));
        local l_selectedImportItem_1 = v137._store:getState().Preview.selectedImportItem;
        if l_selectedImportItem_1 then
            local l_l_selectedImportItem_1_Preview_0 = l_selectedImportItem_1:GetPreview();
            v137._store:dispatch(v14(l_l_selectedImportItem_1_Preview_0));
        end;
        v137._store:dispatch(v10(false));
        return;
    end;
end;
v20.getNameList = function(v146, v147, v148) --[[ Line: 490 ]] --[[ Name: getNameList ]]
    -- upvalues: l_keys_0 (copy), v18 (copy), l_findIndex_0 (copy)
    local v149 = l_keys_0(v146:getAllPresets());
    local v150 = if v18() and v148 then v148.settingsChanged else v146._store:getState().Preview.settingsChanged;
    local v152 = l_findIndex_0(v149, function(v151) --[[ Line: 496 ]]
        -- upvalues: v147 (copy)
        return v151 == v147;
    end);
    if v152 and v150 then
        v149[v152] = v147 .. "*";
    end;
    return v149;
end;
v20.getAllPresets = function(v153) --[[ Line: 507 ]] --[[ Name: getAllPresets ]]
    local l_AllPresets_0 = v153._assetImportServiceWrapper:GetAllPresets();
    if l_AllPresets_0["Last Imported"] then
        local v155 = l_AllPresets_0["Last Imported"];
        l_AllPresets_0["Last Imported"] = nil;
        l_AllPresets_0[v153.lastImportName] = v155;
    end;
    l_AllPresets_0[v153.studioDefaultName] = {};
    return l_AllPresets_0;
end;
v20.initializePresets = function(v156, v157) --[[ Line: 520 ]] --[[ Name: initializePresets ]]
    -- upvalues: v17 (copy), v19 (copy), v15 (copy), v11 (copy), v9 (copy)
    if v17() then
        if v19() then
            for _, v159 in v157 do
                local v160 = v156._store:getState().Sessions.sessionQueue[v159];
                if v156:hasCustomDefault() and v160.validSession then
                    v156:resolvePreset(v156.defaultName, v160);
                end;
            end;
            return;
        else
            local l_sessionQueue_0 = v156._store:getState().Sessions.sessionQueue;
            local v162 = table.clone(l_sessionQueue_0);
            for _, v164 in v157 do
                local v165 = v15.update(l_sessionQueue_0[v164], {
                    currentPreset = v156.defaultName
                });
                if v156:hasCustomDefault() and v165.validSession then
                    v156:resolvePreset(v156.defaultName, v165);
                end;
                v162[v164] = v165;
            end;
            v156._store:dispatch(v11(v162));
            return;
        end;
    else
        local v166 = v156:getNameList();
        local v167 = nil;
        for v168, v169 in v166 do
            if v169 == v156.defaultName then
                v167 = v168;
                break;
            end;
        end;
        if v167 then
            v156._store:dispatch(v9(v156.defaultName));
            v156:DEPRECATED_resolvePreset(v156.defaultName);
            return;
        else
            v156._store:dispatch(v9(v156.studioDefaultName));
            return;
        end;
    end;
end;
v20.getNumPresetsRemaining = function(v170) --[[ Line: 569 ]] --[[ Name: getNumPresetsRemaining ]]
    -- upvalues: v16 (copy), l_keys_0 (copy)
    local v171 = v170:getAllPresets();
    local v172 = v171[v170.lastImportName] and 1 or 0;
    return v16() - #l_keys_0(v171) + v172;
end;
return v20;