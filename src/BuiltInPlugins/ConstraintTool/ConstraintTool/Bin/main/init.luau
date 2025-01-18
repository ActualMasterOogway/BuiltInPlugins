local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: main ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), l_ChangeHistoryService_0 (copy)
    local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
    local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
    local l_DraggerSchemaCore_0 = l_script_FirstAncestor_0.Packages.DraggerSchemaCore;
    local v9 = require(l_DraggerSchemaCore_0.DraggerSchema);
    local v10 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v11 = require(l_script_FirstAncestor_0.Src.Components.ConstraintToolComponent);
    local v12 = require(l_script_FirstAncestor_0.Src.Util.WeldInitiator);
    local v13 = nil;
    local v14 = "ConstraintToolDragging_" .. v5;
    local v15 = false;
    local v16 = nil;
    local v17 = nil;
    local v18 = {};
    local v19 = {};
    local function v20() --[[ Line: 42 ]] --[[ Name: closeConstraintPlugin ]]
        -- upvalues: v15 (ref), v3 (copy), v16 (ref), v6 (copy)
        v15 = false;
        v3.mainButton:SetActive(false);
        if v16 then
            v6.unmount(v16);
            v16 = nil;
        end;
    end;
    local function v22() --[[ Line: 52 ]] --[[ Name: undo ]]
        -- upvalues: v18 (copy), v19 (copy)
        local v21 = table.remove(v18, 1);
        table.insert(v19, 1, v21);
        return v21;
    end;
    local function _() --[[ Line: 59 ]] --[[ Name: redo ]]
        -- upvalues: v19 (copy), v18 (copy)
        local v23 = table.remove(v19, 1);
        table.insert(v18, 1, v23);
        return v23;
    end;
    local function v26(v25) --[[ Line: 66 ]] --[[ Name: setConstraintToolModelReference ]]
        -- upvalues: v17 (ref), v22 (copy)
        v17 = v25;
        return {
            undo = v22
        };
    end;
    local function v27() --[[ Line: 75 ]] --[[ Name: createUndoEvent ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v14 (copy), v18 (copy), v19 (copy), v17 (ref), v15 (ref), v5 (copy), v27 (copy)
        local v28 = nil;
        v28 = l_ChangeHistoryService_0.OnUndo:Connect(function(v29) --[[ Line: 77 ]]
            -- upvalues: v14 (ref), v18 (ref), v19 (ref), v17 (ref), v15 (ref), v5 (ref), l_ChangeHistoryService_0 (ref), v28 (ref), v27 (ref)
            if v29 == v14 then
                local v30 = table.remove(v18, 1);
                table.insert(v19, 1, v30);
                local l_v30_0 = v30;
                v30 = v17:_getConstraintData();
                if v15 or v30.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                    v17:_onUndo(l_v30_0);
                    return;
                elseif v18[1] and v18[1].type == "initial" and l_ChangeHistoryService_0:GetCanUndo() then
                    v28:Disconnect();
                    l_ChangeHistoryService_0:Undo();
                    local v32 = table.remove(v18, 1);
                    table.insert(v19, 1, v32);
                    v27();
                end;
            end;
        end);
    end;
    local function v33() --[[ Line: 103 ]] --[[ Name: createRedoEvent ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v14 (copy), v19 (copy), v18 (copy), v17 (ref), v15 (ref), v5 (copy), v33 (copy)
        local v34 = nil;
        v34 = l_ChangeHistoryService_0.OnRedo:Connect(function(v35) --[[ Line: 105 ]]
            -- upvalues: v14 (ref), v19 (ref), v18 (ref), v17 (ref), v15 (ref), v5 (ref), l_ChangeHistoryService_0 (ref), v34 (ref), v33 (ref)
            if v35 == v14 then
                local v36 = table.remove(v19, 1);
                table.insert(v18, 1, v36);
                local l_v36_0 = v36;
                v36 = v17:_getConstraintData();
                if v15 or v36.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                    v17:_onRedo(l_v36_0);
                    return;
                elseif l_v36_0 and l_v36_0.type == "initial" and l_ChangeHistoryService_0:GetCanRedo() then
                    v34:Disconnect();
                    l_ChangeHistoryService_0:Redo();
                    local v38 = table.remove(v19, 1);
                    table.insert(v18, 1, v38);
                    v33();
                end;
            end;
        end);
    end;
    local function v42() --[[ Line: 127 ]] --[[ Name: openPlugin ]]
        -- upvalues: v16 (ref), v5 (copy), l_ChangeHistoryService_0 (ref), v12 (copy), v4 (copy), v15 (ref), v3 (copy), v6 (copy), v11 (copy), v2 (copy), v26 (copy), v13 (ref), v9 (copy), v18 (copy), v19 (copy), v14 (copy)
        if v16 then
            return;
        else
            if v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                local v39 = l_ChangeHistoryService_0:TryBeginRecording("WeldTool");
                if v39 == nil then
                    return;
                else
                    local v40, v41 = v12(v5);
                    if v41 then
                        l_ChangeHistoryService_0:FinishRecording(v39, Enum.FinishRecordingOperation.Commit);
                    else
                        l_ChangeHistoryService_0:FinishRecording(v39, Enum.FinishRecordingOperation.Cancel);
                    end;
                    if v40 then
                        v4.closeCallback();
                        return;
                    end;
                end;
            end;
            v15 = true;
            v3.mainButton:SetActive(true);
            v16 = v6.mount(v6.createElement(v11, {
                plugin = v2, 
                Mouse = v2:GetMouse(), 
                ClosePluginCallback = v4.closeCallback, 
                SetConstraintToolModelReference = v26, 
                DraggerContext = v13, 
                DraggerSchema = v9, 
                DraggerSettings = {
                    AnalyticsName = "ConstraintTool", 
                    AllowDragSelect = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true
                }, 
                constraintType = v5, 
                undoAttachmentStack = v18, 
                redoAttachmentStack = v19, 
                recordingName = v14
            }));
            return;
        end;
    end;
    local function _() --[[ Line: 184 ]] --[[ Name: init ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v14 (copy), v18 (copy), v19 (copy), v17 (ref), v15 (ref), v5 (copy), v27 (copy), v33 (copy), v13 (ref), v10 (copy), v2 (copy), v9 (copy)
        local v43 = nil;
        do
            local l_v43_0 = v43;
            l_v43_0 = l_ChangeHistoryService_0.OnUndo:Connect(function(v45) --[[ Line: 77 ]]
                -- upvalues: v14 (ref), v18 (ref), v19 (ref), v17 (ref), v15 (ref), v5 (ref), l_ChangeHistoryService_0 (ref), l_v43_0 (ref), v27 (ref)
                if v45 == v14 then
                    local v46 = table.remove(v18, 1);
                    table.insert(v19, 1, v46);
                    local l_v46_0 = v46;
                    v46 = v17:_getConstraintData();
                    if v15 or v46.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                        v17:_onUndo(l_v46_0);
                        return;
                    elseif v18[1] and v18[1].type == "initial" and l_ChangeHistoryService_0:GetCanUndo() then
                        l_v43_0:Disconnect();
                        l_ChangeHistoryService_0:Undo();
                        local v48 = table.remove(v18, 1);
                        table.insert(v19, 1, v48);
                        v27();
                    end;
                end;
            end);
        end;
        v43 = nil;
        do
            local l_v43_1 = v43;
            l_v43_1 = l_ChangeHistoryService_0.OnRedo:Connect(function(v50) --[[ Line: 105 ]]
                -- upvalues: v14 (ref), v19 (ref), v18 (ref), v17 (ref), v15 (ref), v5 (ref), l_ChangeHistoryService_0 (ref), l_v43_1 (ref), v33 (ref)
                if v50 == v14 then
                    local v51 = table.remove(v19, 1);
                    table.insert(v18, 1, v51);
                    local l_v51_0 = v51;
                    v51 = v17:_getConstraintData();
                    if v15 or v51.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                        v17:_onRedo(l_v51_0);
                        return;
                    elseif l_v51_0 and l_v51_0.type == "initial" and l_ChangeHistoryService_0:GetCanRedo() then
                        l_v43_1:Disconnect();
                        l_ChangeHistoryService_0:Redo();
                        local v53 = table.remove(v19, 1);
                        table.insert(v18, 1, v53);
                        v33();
                    end;
                end;
            end);
        end;
        v13 = v10.new(v2, game, settings(), v9.Selection.new());
    end;
    local v55 = nil;
    do
        local l_v55_0 = v55;
        l_v55_0 = l_ChangeHistoryService_0.OnUndo:Connect(function(v57) --[[ Line: 77 ]]
            -- upvalues: v14 (copy), v18 (copy), v19 (copy), v17 (ref), v15 (ref), v5 (copy), l_ChangeHistoryService_0 (ref), l_v55_0 (ref), v27 (copy)
            if v57 == v14 then
                local v58 = table.remove(v18, 1);
                table.insert(v19, 1, v58);
                local l_v58_0 = v58;
                v58 = v17:_getConstraintData();
                if v15 or v58.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                    v17:_onUndo(l_v58_0);
                    return;
                elseif v18[1] and v18[1].type == "initial" and l_ChangeHistoryService_0:GetCanUndo() then
                    l_v55_0:Disconnect();
                    l_ChangeHistoryService_0:Undo();
                    local v60 = table.remove(v18, 1);
                    table.insert(v19, 1, v60);
                    v27();
                end;
            end;
        end);
    end;
    v55 = nil;
    do
        local l_v55_1 = v55;
        l_v55_1 = l_ChangeHistoryService_0.OnRedo:Connect(function(v62) --[[ Line: 105 ]]
            -- upvalues: v14 (copy), v19 (copy), v18 (copy), v17 (ref), v15 (ref), v5 (copy), l_ChangeHistoryService_0 (ref), l_v55_1 (ref), v33 (copy)
            if v62 == v14 then
                local v63 = table.remove(v19, 1);
                table.insert(v18, 1, v63);
                local l_v63_0 = v63;
                v63 = v17:_getConstraintData();
                if v15 or v63.Attachments == 1 or v5 == "WeldConstraint" or v5 == "NoCollisionConstraint" then
                    v17:_onRedo(l_v63_0);
                    return;
                elseif l_v63_0 and l_v63_0.type == "initial" and l_ChangeHistoryService_0:GetCanRedo() then
                    l_v55_1:Disconnect();
                    l_ChangeHistoryService_0:Redo();
                    local v65 = table.remove(v19, 1);
                    table.insert(v18, 1, v65);
                    v33();
                end;
            end;
        end);
    end;
    v13 = v10.new(v2, game, settings(), v9.Selection.new());
    return {
        close = v20, 
        open = v42
    };
end;