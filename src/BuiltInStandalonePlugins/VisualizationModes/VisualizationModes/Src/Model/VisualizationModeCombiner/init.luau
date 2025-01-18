local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Signal);
local v6 = {};
v6.__index = v6;
local function _(v7) --[[ Line: 45 ]] --[[ Name: isRecentModeRecord ]]
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = false;
        if typeof(v7.visualizationModeCategoryName) == "string" then
            v8 = false;
            if typeof(v7.visualizationModeName) == "string" then
                v8 = typeof(v7.lastEditUnixTimeStamp) == "number";
            end;
        end;
    end;
    return v8;
end;
local function _(v10, v11) --[[ Line: 52 ]] --[[ Name: areSameRecentMode ]]
    local v12 = false;
    if v10.visualizationModeCategoryName == v11.visualizationModeCategoryName then
        v12 = v10.visualizationModeName == v11.visualizationModeName;
    end;
    return v12;
end;
v6.new = function(v14) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v4 (copy), v5 (copy)
    local v15 = setmetatable({}, v6);
    v15._maid = v4.new();
    v15._plugin = assert(v14, "No plugin");
    v15._recentModeRecordList = {};
    v15._lastReportedClientCombinerStateMap = {};
    v15._state = nil;
    v15._session = nil;
    v15.changed = v15._maid:add(v5.new());
    v15:_connectToFocusedDataModelSession();
    v15._maid:giveTask(v15._plugin:OnInvoke("reportClientCombinerState", function(v16) --[[ Line: 75 ]]
        -- upvalues: v15 (copy)
        v15._lastReportedClientCombinerStateMap[v16.hostDataModelType] = v16;
        v15:_queueUpdateState();
    end));
    v15:_loadRecentRecords();
    v15._plugin:Invoke("queryClientCombinerState");
    return v15;
end;
v6._queueUpdateState = function(v17) --[[ Line: 91 ]] --[[ Name: _queueUpdateState ]]
    if v17._maid._stateUpdateQueue then
        return;
    else
        v17._maid._stateUpdateQueue = task.defer(function() --[[ Line: 96 ]]
            -- upvalues: v17 (copy)
            v17._maid._stateUpdateQueue = nil;
            v17:_updateState();
        end);
        return;
    end;
end;
v6._updateState = function(v18) --[[ Line: 102 ]] --[[ Name: _updateState ]]
    local v19 = {};
    local l_None_0 = Enum.StudioDataModelType.None;
    if v18._session ~= nil then
        l_None_0 = v18._session.CurrentDataModelType;
    end;
    for v21, v22 in v18._lastReportedClientCombinerStateMap do
        for _, v24 in v22.visualizationModeServiceState do
            local v25 = v19[v24.name];
            if v25 == nil then
                v25 = {
                    lastState = v24, 
                    visualizationModes = {}
                };
                v19[v24.name] = v25;
            end;
            if v21 == l_None_0 then
                v25.lastState = v24;
            end;
            for _, v27 in v24.visualizationModeList do
                v25.visualizationModes[v27.name] = v27;
            end;
        end;
    end;
    local v28 = {};
    for _, v30 in v19 do
        table.insert(v28, v30.lastState);
    end;
    local v31 = {};
    for _, v33 in v28 do
        v31[v33] = string.lower(v33.title);
    end;
    table.sort(v28, function(v34, v35) --[[ Line: 148 ]]
        -- upvalues: v31 (copy)
        return v31[v34] < v31[v35];
    end);
    local v36 = {};
    for _, v38 in v18._recentModeRecordList do
        local v39 = v19[v38.visualizationModeCategoryName];
        if v39 ~= nil then
            local v40 = v39.visualizationModes[v38.visualizationModeName];
            if v40 ~= nil then
                local v41 = table.clone(v40);
                v41.visualizationModeCategoryName = v38.visualizationModeCategoryName;
                table.insert(v36, v41);
            end;
        end;
    end;
    v18:_setState(table.freeze({
        categories = v28, 
        recentModes = table.freeze(v36)
    }));
end;
v6._setState = function(v42, v43) --[[ Line: 175 ]] --[[ Name: _setState ]]
    if v42._state == v43 then
        return;
    else
        v42._state = v43;
        v42.changed:Fire(v43);
        return;
    end;
end;
v6.getState = function(v44) --[[ Line: 184 ]] --[[ Name: getState ]]
    return v44._state;
end;
v6.updateVisualizationModeCategoryIsEnabled = function(v45, v46, v47) --[[ Line: 188 ]] --[[ Name: updateVisualizationModeCategoryIsEnabled ]]
    -- upvalues: v2 (copy), v3 (copy)
    v45._plugin:Invoke("updateVisualizationModeCategoryIsEnabled", v46, v47);
    for v48, v49 in v45._lastReportedClientCombinerStateMap do
        v45._lastReportedClientCombinerStateMap[v48] = v2.Dictionary.join(v49, {
            visualizationModeServiceState = v3.map(v49.visualizationModeServiceState, function(v50) --[[ Line: 202 ]]
                -- upvalues: v46 (copy), v2 (ref), v47 (copy)
                if v50.name ~= v46 then
                    return v50;
                else
                    return v2.Dictionary.join(v50, {
                        enabled = v47
                    });
                end;
            end)
        });
    end;
    v45:_queueUpdateState();
end;
v6.updateVisualizationModeIsEnabled = function(v51, v52, v53, v54) --[[ Line: 218 ]] --[[ Name: updateVisualizationModeIsEnabled ]]
    -- upvalues: v2 (copy), v3 (copy)
    v51._plugin:Invoke("updateVisualizationModeIsEnabled", v52, v53, v54);
    for v55, v56 in v51._lastReportedClientCombinerStateMap do
        local v60 = v2.Dictionary.join(v56, {
            visualizationModeServiceState = v3.map(v56.visualizationModeServiceState, function(v57) --[[ Line: 237 ]]
                -- upvalues: v52 (copy), v3 (ref), v53 (copy), v2 (ref), v54 (copy)
                if v57.name ~= v52 then
                    return v57;
                else
                    local v59 = v3.map(v57.visualizationModeList, function(v58) --[[ Line: 244 ]]
                        -- upvalues: v53 (ref), v2 (ref), v54 (ref)
                        if v58.name ~= v53 then
                            return v58;
                        else
                            return v2.Dictionary.join(v58, {
                                enabled = v54
                            });
                        end;
                    end);
                    return v2.Dictionary.join(v57, {
                        visualizationModeList = v59
                    });
                end;
            end)
        });
        v51._lastReportedClientCombinerStateMap[v55] = v60;
    end;
    v51:_queueUpdateState();
end;
v6._loadRecentRecords = function(v61) --[[ Line: 268 ]] --[[ Name: _loadRecentRecords ]]
    local l_Setting_0 = v61._plugin:GetSetting("RecentVisualizationModes");
    if typeof(l_Setting_0) ~= "table" then
        return;
    else
        local v63 = {};
        for _, v65 in l_Setting_0 do
            local v66 = false;
            if typeof(v65) == "table" then
                v66 = false;
                if typeof(v65.visualizationModeCategoryName) == "string" then
                    v66 = false;
                    if typeof(v65.visualizationModeName) == "string" then
                        v66 = typeof(v65.lastEditUnixTimeStamp) == "number";
                    end;
                end;
            end;
            if v66 then
                table.insert(v63, v65);
            end;
        end;
        table.sort(v63, function(v67, v68) --[[ Line: 281 ]]
            return v67.lastEditUnixTimeStamp > v68.lastEditUnixTimeStamp;
        end);
        while #v63 > 3 do
            table.remove(v63);
        end;
        v61._recentModeRecordList = v63;
        v61:_queueUpdateState();
        return;
    end;
end;
v6._connectToFocusedDataModelSession = function(v69) --[[ Line: 293 ]] --[[ Name: _connectToFocusedDataModelSession ]]
    local l_MultipleDocumentInterfaceInstance_0 = v69._plugin.MultipleDocumentInterfaceInstance;
    if l_MultipleDocumentInterfaceInstance_0 == nil then
        return;
    else
        local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 == nil then
            return;
        else
            v69._session = l_FocusedDataModelSession_0;
            v69._maid:giveTask(l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 307 ]]
                -- upvalues: v69 (copy)
                v69:_queueUpdateState();
            end));
            return;
        end;
    end;
end;
v6.recordRecentVisualizationMode = function(v72, v73, v74) --[[ Line: 312 ]] --[[ Name: recordRecentVisualizationMode ]]
    local v75 = {
        visualizationModeCategoryName = v73, 
        visualizationModeName = v74, 
        lastEditUnixTimeStamp = DateTime.now().UnixTimestamp
    };
    local v76 = nil;
    local v77 = nil;
    for v78, v79 in v72._recentModeRecordList do
        local v80 = false;
        if v79.visualizationModeCategoryName == v75.visualizationModeCategoryName then
            v80 = v79.visualizationModeName == v75.visualizationModeName;
        end;
        if v80 then
            v76 = v78;
        elseif v77 == nil then
            v77 = v78;
        elseif v79.lastEditUnixTimeStamp < v72._recentModeRecordList[v77].lastEditUnixTimeStamp then
            v77 = v78;
        end;
    end;
    local v81 = nil;
    v81 = if v76 ~= nil then v76 else if #v72._recentModeRecordList >= 3 and v77 ~= nil then v77 else #v72._recentModeRecordList + 1;
    local v82 = table.clone(v72._recentModeRecordList);
    v82[v81] = v75;
    v72._recentModeRecordList = table.freeze(v82);
    v72._plugin:SetSetting("RecentVisualizationModes", v82);
    v72:_queueUpdateState();
end;
v6.destroy = function(v83) --[[ Line: 352 ]] --[[ Name: destroy ]]
    v83._maid:destroy();
end;
return v6;