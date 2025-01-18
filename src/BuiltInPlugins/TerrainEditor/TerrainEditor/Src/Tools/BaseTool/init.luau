local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Storage_0 = require(l_script_FirstAncestor_0.Src.Types).Storage;
local v3 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local l_Signal_0 = v1.Util.Signal;
local v5 = require(l_script_FirstAncestor_0.Src.Schemas.Settings);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v8 = require(l_Util_0.AnalyticsHelper);
local v9 = require(l_script_FirstAncestor_0.Src.Util.deepJoinWithExceptions);
local v10 = {};
v10.__index = v10;
v10.new = function(v11, v12, v13, v14, v15) --[[ Line: 41 ]] --[[ Name: new ]]
    local v16 = {
        _name = v12, 
        _category = v13, 
        _configuration = v14, 
        _gizmos = v15
    };
    setmetatable(v16, v11);
    v11.__index = v11;
    return v16;
end;
v10.init = function(v17, v18, v19) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: l_Signal_0 (copy)
    local l_Analytics_0 = v18.Analytics;
    local l_Localization_0 = v18.Localization;
    local l_PluginController_0 = v18.PluginController;
    local l_ShortcutController_0 = v18.ShortcutController;
    local l_Stylizer_0 = v18.Stylizer;
    local l_ToolController_0 = v18.ToolController;
    local v26, v27 = v17:registerSettings(l_PluginController_0);
    l_PluginController_0:setSetting(v17._name, v26);
    v17._analytics = l_Analytics_0;
    v17._localization = l_Localization_0;
    v17._pluginController = l_PluginController_0;
    v17._shortcutController = l_ShortcutController_0;
    v17._stylizer = l_Stylizer_0;
    v17._toolController = l_ToolController_0;
    v17._services = v19;
    v17._tile = {
        icon = {
            Image = ("%*.png"):format("rbxasset://studio_svg_textures/Lua/TerrainEditor/%s/Large/" .. v17._name)
        }, 
        name = l_Localization_0:getText("BaseTool", v17._name)
    };
    v17._persistentUserSettings = v26;
    v17._sessionUserSettings = v27;
    v17._overrides = {};
    v17._errors = {};
    v17._isRunning = false;
    v17._validateFunctions = {};
    v17.OnFormChanged = l_Signal_0.new();
    v17.OnGizmoChanged = l_Signal_0.new();
    v17.OnInternalsChanged = l_Signal_0.new();
    v17.OnNoteChanged = l_Signal_0.new();
    v17.OnShortcutChanged = l_Signal_0.new();
    v17.OnOperationChanged = l_Signal_0.new();
    v17._shortcutConnections = {};
    v17._shortcuts = {};
    v17:registerShortcuts();
    return v17;
end;
v10.registerSettings = function(v28, v29) --[[ Line: 116 ]] --[[ Name: registerSettings ]]
    -- upvalues: v6 (copy), v5 (copy), l_Storage_0 (copy)
    local v30 = (if v6.IsDebuggingSavedSettings then nil else v29:getSetting(v28._name)) or {};
    local v31 = {};
    local v32 = {
        MaterialList = true
    };
    for _, v34 in v28._configuration do
        local function v35(v36, v37) --[[ Line: 127 ]] --[[ Name: removeUnusedSettings ]]
            -- upvalues: v35 (copy)
            for v38, v39 in v36 do
                if not v37[v38] then
                    v36[v38] = nil;
                elseif typeof(v39) == "table" then
                    v36[v38] = v35(v39, v37[v38]);
                end;
            end;
            return v36;
        end;
        if not v30[v34.Id] then
            v30[v34.Id] = v34.Defaults;
        else
            v30[v34.Id] = v35(v30[v34.Id], v34.Defaults);
        end;
        local l_Storage_1 = v5[v34.Id].Storage;
        v31[v34.Id] = {};
        for v41, v42 in v34.Defaults do
            if l_Storage_1[v41] == l_Storage_0.LocalSession then
                v31[v34.Id][v41] = v42;
            end;
        end;
        local function v43(v44, v45, v46) --[[ Line: 160 ]] --[[ Name: addNewDefaults ]]
            -- upvalues: l_Storage_1 (copy), l_Storage_0 (ref), v32 (copy), v43 (copy)
            for v47, v48 in v45 do
                if not v46 or l_Storage_1[v47] == l_Storage_0.LocalPersistent then
                    local v49 = typeof(v44[v47]);
                    local v50 = typeof(v48);
                    if not v44[v47] or v49 ~= v50 then
                        v44[v47] = v48;
                    end;
                    if v49 == "table" and v50 == "table" and not v32[v47] then
                        v44[v47] = v43(v44[v47], v48, false);
                    end;
                end;
            end;
            return v44;
        end;
        v30[v34.Id] = v43(v30[v34.Id], v34.Defaults, true);
    end;
    return v30, v31;
end;
v10.registerShortcuts = function(v51) --[[ Line: 187 ]] --[[ Name: registerShortcuts ]]
    for v52, v53 in (v51:getPayload()) do
        for v54, _ in v53 do
            if v51._shortcutController:supportsShortcut(v54) then
                if not v51._shortcuts[v52] then
                    v51._shortcuts[v52] = {};
                end;
                table.insert(v51._shortcuts[v52], v54);
            end;
        end;
    end;
end;
v10.empty = function() --[[ Line: 202 ]] --[[ Name: empty ]]
    -- upvalues: v10 (copy)
    return (setmetatable({
        _configuration = {}, 
        _name = "Empty"
    }, v10));
end;
v10.getPayload = function(v56) --[[ Line: 211 ]] --[[ Name: getPayload ]]
    -- upvalues: v3 (copy)
    local v57 = {};
    for _, v59 in v56._configuration do
        v57[v59.Id] = v3.Get(v59.Id, v56._pluginController, v56._persistentUserSettings[v59.Id], v56._sessionUserSettings[v59.Id]);
    end;
    return v57;
end;
v10.setPayload = function(v60, v61) --[[ Line: 225 ]] --[[ Name: setPayload ]]
    -- upvalues: v5 (copy), v3 (copy), v9 (copy)
    local v62 = false;
    for v63, v64 in v61 do
        if v5[v63] then
            local v65, v66 = v3.Set(v63, v60._pluginController, v64);
            v60._persistentUserSettings[v63] = if v60._persistentUserSettings[v63] then v9(v60._persistentUserSettings[v63], v65) else v65;
            v60._sessionUserSettings[v63] = if v60._sessionUserSettings[v63] then v9(v60._sessionUserSettings[v63], v66) else v66;
            v62 = v62 or next(v65) ~= nil;
        end;
    end;
    if v62 then
        if v60._saveSettingsTask then
            task.cancel(v60._saveSettingsTask);
            v60._saveSettingsTask = nil;
        end;
        v60._saveSettingsTask = task.delay(1, function() --[[ Line: 246 ]]
            -- upvalues: v60 (copy)
            v60._pluginController:setSetting(v60._name, v60._persistentUserSettings);
            v60._saveSettingsTask = nil;
        end);
    end;
end;
v10.getShouldBeCompact = function(v67) --[[ Line: 253 ]] --[[ Name: getShouldBeCompact ]]
    return v67._pluginController:getShouldBeCompact();
end;
v10.form = function(v68) --[[ Line: 257 ]] --[[ Name: form ]]
    -- upvalues: v5 (copy), v3 (copy)
    return ((function(v69) --[[ Line: 258 ]] --[[ Name: createFormElement ]]
        -- upvalues: v5 (ref), v68 (copy), v3 (ref)
        local v70 = {};
        for _, v72 in v69 do
            local l_Id_0 = v72.Id;
            local v74 = v5[l_Id_0];
            table.insert(v70, {
                Id = l_Id_0, 
                Label = v68._localization:getText("Category", v72.Id), 
                Children = v74.Generator({
                    Localization = v68._localization, 
                    Stylizer = v68._stylizer, 
                    Tool = v68
                }, v3.Get(v72.Id, v68._pluginController, v68._persistentUserSettings[v72.Id], v68._sessionUserSettings[v72.Id]), v68._name, v68._overrides[v72.Id] or {})
            });
        end;
        return v70;
    end)(v68._configuration));
end;
v10.gizmos = function(v75) --[[ Line: 292 ]] --[[ Name: gizmos ]]
    local v76 = {};
    local v77 = v75:getPayload();
    for _, v79 in v75._gizmos do
        table.insert(v76, {
            Id = v79.Id, 
            Schema = v79.Schema, 
            Value = v77
        });
    end;
    return v76;
end;
v10.saveForm = function(v80, v81) --[[ Line: 308 ]] --[[ Name: saveForm ]]
    v80:setPayload(v81);
    v80:setDisabledState();
    task.spawn(function() --[[ Line: 312 ]]
        -- upvalues: v80 (copy)
        v80.OnFormChanged:Fire();
    end);
end;
v10.saveGizmos = function(v82, v83) --[[ Line: 317 ]] --[[ Name: saveGizmos ]]
    v82:setPayload(v83);
    v82:setDisabledState();
    task.spawn(function() --[[ Line: 321 ]]
        -- upvalues: v82 (copy)
        v82.OnGizmoChanged:Fire();
    end);
end;
v10.checkDisabledState = function(v84) --[[ Line: 326 ]] --[[ Name: checkDisabledState ]]
    for _, v86 in (v84:form()) do
        for _, v88 in v86.Children do
            if v88.Validate and v88.Value then
                v88.Validate(v88.Value);
            end;
        end;
    end;
end;
v10.getCategory = function(v89) --[[ Line: 338 ]] --[[ Name: getCategory ]]
    return v89._category;
end;
v10.getTile = function(v90) --[[ Line: 342 ]] --[[ Name: getTile ]]
    return v90._tile;
end;
v10.activateShortcuts = function(v91) --[[ Line: 346 ]] --[[ Name: activateShortcuts ]]
    local v92 = v91:getPayload();
    for v93, v94 in v91._shortcuts do
        for _, v96 in v94 do
            table.insert(v91._shortcutConnections, v91._shortcutController:registerShortcut(v96, v92[v93][v96], function(v97) --[[ Line: 353 ]]
                -- upvalues: v93 (copy), v96 (copy), v91 (copy)
                local v98 = {
                    [v93] = {
                        [v96] = v97
                    }
                };
                v91:setPayload(v98);
                task.spawn(function() --[[ Line: 362 ]]
                    -- upvalues: v91 (ref)
                    v91.OnShortcutChanged:Fire();
                end);
            end, function() --[[ Line: 365 ]]
                -- upvalues: v91 (copy)
                v91:deactivateShortcuts();
                v91:activateShortcuts();
            end));
        end;
    end;
    v91._refreshShortcuts = v91.OnFormChanged:Connect(function() --[[ Line: 373 ]]
        -- upvalues: v91 (copy)
        v91:deactivateShortcuts();
        v91:activateShortcuts();
    end);
end;
v10.deactivateShortcuts = function(v99) --[[ Line: 379 ]] --[[ Name: deactivateShortcuts ]]
    for _, v101 in v99._shortcutConnections do
        for _, v103 in v101 do
            v103:Disconnect();
        end;
    end;
    if v99._refreshShortcuts then
        v99._refreshShortcuts:Disconnect();
    end;
end;
v10.activate = function(v104) --[[ Line: 391 ]] --[[ Name: activate ]]
    v104:activateShortcuts();
    v104:setDisabledState();
    v104:checkDisabledState();
    v104._compactConnection = v104._pluginController.Compact:Connect(function() --[[ Line: 396 ]]
        -- upvalues: v104 (copy)
        task.spawn(function() --[[ Line: 397 ]]
            -- upvalues: v104 (ref)
            v104.OnInternalsChanged:Fire();
        end);
    end);
end;
v10.reportAnalytics = function(_) --[[ Line: 403 ]] --[[ Name: reportAnalytics ]]

end;
v10.deactivate = function(v106) --[[ Line: 407 ]] --[[ Name: deactivate ]]
    v106:deactivateShortcuts();
    v106:reportAnalytics();
    if v106._compactConnection then
        v106._compactConnection:Disconnect();
    end;
end;
v10.startOperation = function(v107, _) --[[ Line: 416 ]] --[[ Name: startOperation ]]
    v107._isRunning = true;
    v107:setDisabledState();
end;
v10.operation = function(_) --[[ Line: 423 ]] --[[ Name: operation ]]

end;
v10.reportError = function(v110, v111, v112, _) --[[ Line: 427 ]] --[[ Name: reportError ]]
    if not v110._errors[v111] then
        v110._errors[v111] = {};
    end;
    v110._errors[v111][v112] = true;
    v110:setDisabledState();
end;
v10.clearError = function(v114, v115, v116) --[[ Line: 437 ]] --[[ Name: clearError ]]
    if not v114._errors[v115] then
        return;
    else
        v114._errors[v115][v116] = nil;
        if next(v114._errors[v115]) == nil then
            v114._errors[v115] = nil;
        end;
        v114:setDisabledState();
        return;
    end;
end;
v10.hasError = function(v117) --[[ Line: 450 ]] --[[ Name: hasError ]]
    local v118 = true;
    if next(v117._errors) == nil then
        v118 = v117._isRunning;
    end;
    return v118;
end;
v10.setValidateFunction = function(v119, v120, v121, v122) --[[ Line: 454 ]] --[[ Name: setValidateFunction ]]
    if not v119._validateFunctions[v120] then
        v119._validateFunctions[v120] = {};
    end;
    v119._validateFunctions[v120][v121] = v122;
end;
v10.getValidateFunction = function(v123, v124, v125) --[[ Line: 462 ]] --[[ Name: getValidateFunction ]]
    if not v123._validateFunctions[v124] then
        return;
    else
        return v123._validateFunctions[v124][v125];
    end;
end;
v10.setDisabledState = function(_) --[[ Line: 470 ]] --[[ Name: setDisabledState ]]

end;
v10.finishOperation = function(v127) --[[ Line: 474 ]] --[[ Name: finishOperation ]]
    -- upvalues: v8 (copy)
    v127._isRunning = false;
    if not v127._operation:wasCanceled() then
        local v128 = v127:getPayload();
        v127._analytics:report("RegionProperties", v8.getRegionPayload(v128, v127._operation:getTimeTaken(), v127._name));
        v127._analytics:report("Usage", v127._name, 1);
        local v129 = v127._operation:getTimeStatistic();
        if v129 then
            v127._analytics:report("Performance", v127._name, v129);
        end;
        if v127._operationFinishedConnection then
            v127._operationFinishedConnection:Disconnect();
            v127._operationFinishedConnection = nil;
        end;
    end;
    v127:setDisabledState();
end;
v10.note = function(_) --[[ Line: 499 ]] --[[ Name: note ]]

end;
return v10;