local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.getReadablePropertiesForClass);
local v4 = require(l_script_FirstAncestor_0.Guest.getValueAggregator);
local v5 = require(l_script_FirstAncestor_0.Util.propertyIdToString);
local v6 = require(l_script_FirstAncestor_0.Util.samePropertyId);
local function v9(v7, v8) --[[ Line: 11 ]] --[[ Name: safeReadProperty ]]
    return v7[v8];
end;
local function v13(v10, v11, v12) --[[ Line: 15 ]] --[[ Name: safeWriteProperty ]]
    v10[v11] = v12;
end;
return function(v14, v15) --[[ Line: 19 ]] --[[ Name: createInstanceGuestRPCInterface ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v5 (copy), l_ChangeHistoryService_0 (copy), v6 (copy), v13 (copy)
    local v16 = {};
    local v17 = {};
    local function v28(v18, v19) --[[ Line: 27 ]] --[[ Name: prepareValuesForSend ]]
        -- upvalues: v3 (ref), v9 (ref), v4 (ref), v5 (ref)
        for _, v21 in v3(v19.ClassName) do
            local l_status_0, l_result_0 = pcall(v9, v19, v21.Name);
            if not l_status_0 then
                warn((("Error reading %* on %*: %*"):format(v21.Name, v19.ClassName, l_result_0)));
            elseif typeof(l_result_0) ~= "Instance" then
                local v24 = {
                    className = v21.Class, 
                    propertyName = v21.Name, 
                    isAttribute = false
                };
                local v25 = v4(v21.Type);
                local v26 = v5(v24);
                local v27 = v18[v26];
                if v27 then
                    v25.aggregateParts(v27.value.parts, {
                        l_result_0
                    }, 1);
                else
                    v18[v26] = {
                        id = v24, 
                        value = {
                            typeof = v21.Type, 
                            modified = false, 
                            readonly = v21.Readonly, 
                            parts = v25.initParts(l_result_0)
                        }
                    };
                end;
            end;
        end;
    end;
    local function v35(v29) --[[ Line: 69 ]] --[[ Name: sendUpdatedPropertyValues ]]
        -- upvalues: v28 (copy), v15 (copy)
        local v30 = {};
        v28(v30, v29);
        local v31 = {};
        local v32 = {};
        for _, v34 in v30 do
            table.insert(v31, v34.id);
            table.insert(v32, v34.value);
        end;
        v15.showProperties(v31, v32);
    end;
    local function v45() --[[ Line: 81 ]] --[[ Name: sendSelection ]]
        -- upvalues: v15 (copy), v16 (copy), v17 (copy), v14 (copy), v28 (copy), v35 (copy)
        v15.clearProperties(v16);
        table.clear(v16);
        for _, v37 in v17 do
            v37:Disconnect();
        end;
        table.clear(v17);
        local v38 = {};
        for _, v40 in v14:Get() do
            v28(v38, v40);
            table.insert(v17, v40.Changed:Connect(function() --[[ Line: 99 ]]
                -- upvalues: v35 (ref), v40 (copy)
                v35(v40);
            end));
        end;
        local v41 = {};
        local v42 = {};
        for _, v44 in v38 do
            table.insert(v41, v44.id);
            table.insert(v42, v44.value);
            table.insert(v16, v44.id);
        end;
        v15.showProperties(v41, v42);
    end;
    local v46 = v14.SelectionChanged:Connect(function() --[[ Line: 114 ]]
        -- upvalues: v45 (copy)
        v45();
    end);
    task.delay(0.1, function() --[[ Line: 117 ]]
        -- upvalues: v45 (copy)
        v45();
    end);
    local v47 = nil;
    local v48 = nil;
    local function _(v49) --[[ Line: 126 ]] --[[ Name: ensureRecording ]]
        -- upvalues: v48 (ref), l_ChangeHistoryService_0 (ref)
        if v48 then
            return true;
        else
            v48 = l_ChangeHistoryService_0:TryBeginRecording("EditProperty", (("Edit property %*"):format(v49.propertyName)));
            return v48 ~= nil;
        end;
    end;
    local function v54(v51, _) --[[ Line: 134 ]] --[[ Name: beginEditingAsync ]]
        -- upvalues: v47 (ref), v48 (ref), l_ChangeHistoryService_0 (ref)
        assert(v47 == nil, "Already editing a property");
        v47 = v51;
        if not v48 then
            v48 = l_ChangeHistoryService_0:TryBeginRecording("EditProperty", (("Edit property %*"):format(v51.propertyName)));
            local _ = v48 ~= nil;
        end;
        return nil;
    end;
    local function v76(v55, v56, v57) --[[ Line: 143 ]] --[[ Name: continueEditing ]]
        -- upvalues: v47 (ref), v6 (ref), v48 (ref), l_ChangeHistoryService_0 (ref), v14 (copy), v3 (ref), v9 (ref), v4 (ref), v13 (ref), v15 (copy)
        assert(v47, "Not editing a property");
        assert(v6(v47, v55), "Editing a different property");
        local v58;
        if v48 then
            v58 = true;
        else
            v48 = l_ChangeHistoryService_0:TryBeginRecording("EditProperty", (("Edit property %*"):format(v55.propertyName)));
            v58 = v48 ~= nil;
        end;
        if v58 then
            v58 = {};
            local v59 = false;
            local v60 = nil;
            for _, v62 in v14:Get() do
                for _, v64 in v3(v62.ClassName) do
                    if v64.Name == v55.propertyName and v64.Class == v55.className then
                        local l_status_1, l_result_1 = pcall(v9, v62, v64.Name);
                        if l_status_1 and typeof(l_result_1) ~= "Instance" then
                            v60 = v64;
                            local v67 = v4(v64.Type);
                            local v68 = {
                                v67.initParts(l_result_1).value.value
                            };
                            v67.setPart(v68, 1, v56 or "value", v57);
                            local v69 = v68[1];
                            local v70 = nil;
                            local l_status_2, l_result_2 = pcall(v13, v62, v64.Name, v69);
                            l_status_1 = l_status_2;
                            v70 = l_result_2;
                            if not l_status_1 then
                                warn((("Error \"%*\" writing %* on %*: %*"):format(v70, v64.Name, v62.ClassName, v70)));
                            end;
                            l_status_2, l_result_2 = pcall(v9, v62, v64.Name);
                            table.insert(v58, l_result_2);
                            if l_status_2 and l_result_2 ~= v69 then
                                v59 = true;
                                break;
                            else
                                break;
                            end;
                        end;
                    end;
                end;
            end;
            if v60 and v59 then
                local v73 = v4(v60.Type);
                local v74 = v73.initParts(v58[1]);
                v73.aggregateParts(v74, v58, 2);
                local v75 = {
                    typeof = v60.Type, 
                    modified = false, 
                    readonly = v60.Readonly, 
                    parts = v74
                };
                v15.showProperties({
                    v55
                }, {
                    v75
                });
            end;
        end;
    end;
    local function v79(v77, v78) --[[ Line: 212 ]] --[[ Name: finishEditing ]]
        -- upvalues: v47 (ref), v6 (ref), v48 (ref), l_ChangeHistoryService_0 (ref)
        assert(v47, "Not editing a property");
        assert(v6(v47, v77), "Editing a different property");
        if v48 then
            l_ChangeHistoryService_0:FinishRecording(v48, v78);
            v48 = nil;
        elseif v78 ~= Enum.FinishRecordingOperation.Cancel then
            warn((("Couldn't edit %* because another edit is in progress."):format(v77.propertyName)));
        end;
        v47 = nil;
    end;
    local function v81(_) --[[ Line: 228 ]] --[[ Name: resetProperty ]]
        error("Not yet implemented");
    end;
    local function v84() --[[ Line: 232 ]] --[[ Name: destroy ]]
        -- upvalues: v17 (copy), v48 (ref), l_ChangeHistoryService_0 (ref), v46 (copy)
        for _, v83 in v17 do
            v83:Disconnect();
        end;
        table.clear(v17);
        if v48 then
            warn("Canceling edit due to disconnect");
            l_ChangeHistoryService_0:FinishRecording(v48, Enum.FinishRecordingOperation.Cancel);
            v48 = nil;
        end;
        v46:Disconnect();
    end;
    return {
        beginEditingAsync = v54, 
        continueEditing = v76, 
        finishEditing = v79, 
        resetProperty = v81
    }, v84;
end;