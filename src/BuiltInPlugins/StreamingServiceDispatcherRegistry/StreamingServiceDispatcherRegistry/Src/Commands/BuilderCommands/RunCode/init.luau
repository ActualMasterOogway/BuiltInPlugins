local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ChatbotUIService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = v1.GetService("ChangeHistoryService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v8 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerTelemetry);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunnerUndoTelemetry);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAISettingAutoRunCode);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFStringConvAICodeRunnerAutorunDisabledWarning);
local v13 = {};
local v14 = 1;
local v15 = {};
local function _(v16) --[[ Line: 33 ]] --[[ Name: newRecording ]]
    return {
        requestId = v16, 
        hasBeenUndone = false, 
        hasBeenRedone = false
    };
end;
local function v18(v19, v20, v21, v22) --[[ Line: 41 ]] --[[ Name: updateResultMessage ]]
    -- upvalues: v3 (copy), v18 (copy)
    v3:DisplayContent("TransformContent", {
        requestId = v19, 
        transformFunction = function(v23) --[[ Line: 44 ]] --[[ Name: transformFunction ]]
            -- upvalues: v20 (copy), v21 (copy)
            for v24, v25 in v23 do
                if string.find(v25, v20) then
                    v23[v24] = v21;
                end;
            end;
            return v23;
        end, 
        completeCallback = function(v26) --[[ Line: 52 ]] --[[ Name: completeCallback ]]
            -- upvalues: v22 (copy), v18 (ref), v19 (copy), v20 (copy), v21 (copy)
            if v26 then
                return;
            else
                task.defer(function() --[[ Line: 56 ]]
                    -- upvalues: v22 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref)
                    local v27 = (v22 or 0) + 1;
                    if v27 > 10 then
                        warn("[RunCode] updateResultMessage: Exceeded maximum depth");
                        return;
                    else
                        v18(v19, v20, v21, v27);
                        return;
                    end;
                end);
                return;
            end;
        end
    });
end;
local function v48(v28) --[[ Line: 68 ]] --[[ Name: runCode ]]
    -- upvalues: v15 (copy), v3 (copy), v7 (copy), v2 (copy), v9 (copy), v4 (copy), v11 (copy), v12 (copy), v14 (ref), v8 (copy), v13 (copy), v18 (copy)
    local l_arguments_0 = v28.arguments;
    local l_code_0 = l_arguments_0.code;
    if l_code_0 then
        l_code_0 = l_code_0:gsub("requestId%s*=%s*\"[^\"]*\"", (("requestId = \"%*\""):format(v28.requestId)));
    end;
    if l_arguments_0.isLocalCommand and l_code_0 then
        local l_syncStreamId_0 = l_arguments_0.syncStreamId;
        assert(l_syncStreamId_0, "Local command must have a streamId!");
        local v32 = (v15[l_syncStreamId_0] or 0) + 1;
        v15[l_syncStreamId_0] = v32;
        l_arguments_0.runCodeGuid = l_syncStreamId_0 .. "_" .. v32;
        v3:DisplayContent("AddTextDropdown", {
            requestId = v28.requestId, 
            streamId = l_syncStreamId_0, 
            content = ("```lua\n%s\n```"):format(l_code_0), 
            closedTitle = v7:getText("RunCode", "CodeDropdownClosedTitle"), 
            openedTitle = v7:getText("RunCode", "CodeDropdownOpenedTitle")
        });
    end;
    local l_v3_Settings_0 = v3:GetSettings();
    if not l_arguments_0.isManualRun then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 102 ]]
            -- upvalues: v2 (ref), l_arguments_0 (copy), l_code_0 (ref)
            return v2:BindCodeToGuid(l_arguments_0.runCodeGuid, l_code_0);
        end);
        if l_status_0 then
            if v9() then
                v4:CodeRunnerActivated(v28.requestId, l_code_0, not l_arguments_0.noAutorun, l_v3_Settings_0.AutoRunCode, l_v3_Settings_0.AutoExpandDropdowns);
            end;
        else
            warn(l_result_0);
        end;
    end;
    local v36 = l_arguments_0.noAutorun or v11() and not l_v3_Settings_0.AutoRunCode;
    if not l_arguments_0.isManualRun and v36 then
        if not l_arguments_0.noAutorun and v11() and not l_v3_Settings_0.AutoRunCode then
            local v37 = v12();
            v3:DisplayContent("StreamText", {
                requestId = v28.requestId, 
                content = ("<span class=\"warningText\">%*</span>"):format(v37)
            });
        end;
        return;
    else
        local v38 = nil;
        if l_arguments_0.isManualRun then
            v38 = ("%* %*"):format("Assistant Code Runner", v14);
        end;
        v14 = v14 + 1;
        local v39 = {
            requestId = v28.requestId, 
            hasBeenUndone = false, 
            hasBeenRedone = false
        };
        local v40 = v8.StartRecordingActions(v28.requestId, v38);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 141 ]]
            -- upvalues: v2 (ref), l_arguments_0 (copy), v28 (copy)
            return v2:RunSandboxedCode(l_arguments_0.runCodeGuid, v28.requestId);
        end);
        local v43 = v8.EndRecordingActions(v28.requestId, v38);
        if v40 and v43 and v38 then
            v13[v38] = v39;
        end;
        if l_status_1 then
            local v44 = ("id='runCodeResult_%*'"):format(l_arguments_0.runCodeGuid);
            local v45 = ("\n<span class=\"successText\" %*>Code executed successfully!</span>\n"):format(v44);
            v18(v28.requestId, v44, v45);
        else
            l_result_1 = string.gsub(l_result_1, "([<>&])", "\\%1");
            local v46 = ("id='runCodeResult_%*'"):format(l_arguments_0.runCodeGuid);
            local v47 = ("\n<span class=\"errorText\" %*>%*</span>\n"):format(v46, l_result_1);
            v18(v28.requestId, v46, v47);
        end;
        if v9() then
            v4:CodeRunnerCompleted(v28.requestId, l_status_1, l_result_1 or "");
        end;
        return;
    end;
end;
if v10() then
    v5.OnUndo:Connect(function(v49) --[[ Line: 167 ]]
        -- upvalues: v13 (copy), v4 (copy)
        local v50 = v13[v49];
        if v50 and not v50.hasBeenUndone then
            v50.hasBeenUndone = true;
            task.delay(5, function() --[[ Line: 171 ]]
                -- upvalues: v50 (copy), v4 (ref)
                if v50.hasBeenRedone then
                    return;
                else
                    v4:CodeRunnerUndone(v50.requestId);
                    return;
                end;
            end);
        end;
    end);
    v5.OnRedo:Connect(function(v51) --[[ Line: 181 ]]
        -- upvalues: v13 (copy)
        local v52 = v13[v51];
        if v52 and not v52.hasBeenRedone then
            v52.hasBeenRedone = true;
        end;
    end);
end;
return v48;