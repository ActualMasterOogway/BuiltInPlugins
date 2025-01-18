local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Util.TutorialTypes);
local v5 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseSafeSkip)();
local v6 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseCameraFocus)();
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9, v10) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        tutorial = v9, 
        data = v10, 
        completed = false
    }, v8));
end;
v7.bind = function() --[[ Line: 24 ]] --[[ Name: bind ]]

end;
v7.unbind = function() --[[ Line: 26 ]] --[[ Name: unbind ]]

end;
v7.extend = function(v11) --[[ Line: 28 ]] --[[ Name: extend ]]
    -- upvalues: v8 (copy), v7 (copy)
    local v12 = {
        kind = v11
    };
    setmetatable(v12, v8);
    local v13 = {
        __index = v12
    };
    v12.new = function(v14, v15) --[[ Line: 36 ]] --[[ Name: new ]]
        -- upvalues: v7 (ref), v13 (copy)
        return (setmetatable(v7.new(v14, v15), v13));
    end;
    return v12;
end;
v7.complete = function(v16) --[[ Line: 43 ]] --[[ Name: complete ]]
    v16.completed = true;
    if v16.tutorial:getCurrentStep() == v16 then
        v16.tutorial:increment();
    end;
end;
v7.skip = function(v17, v18) --[[ Line: 50 ]] --[[ Name: skip ]]
    -- upvalues: v5 (copy), l_ChangeHistoryService_0 (copy)
    local l_onSkip_0 = v17.data.onSkip;
    if not l_onSkip_0 then
        return;
    elseif not v5 then
        l_onSkip_0(v18);
        return;
    else
        local v20 = l_ChangeHistoryService_0:TryBeginRecording((("Skipping step %*/%*"):format(v17.data.topic, v17.data.id)));
        local l_status_0, l_result_0 = pcall(l_onSkip_0, v18);
        if not l_status_0 then
            warn((("Error skipping step %*/%*: %*"):format(v17.data.topic, v17.data.id, l_result_0)));
        end;
        if v20 then
            l_ChangeHistoryService_0:FinishRecording(v20, Enum.FinishRecordingOperation.Commit);
        end;
        return;
    end;
end;
v7.setCameraFocus = function(v23) --[[ Line: 71 ]] --[[ Name: setCameraFocus ]]
    -- upvalues: v6 (copy), l_Workspace_0 (copy), l_RunService_0 (copy)
    if not v6 then
        return;
    else
        local l_cameraFocus_0 = v23.data.cameraFocus;
        local v25 = v23.data.cameraOffset or Vector3.new(15, 3, 0, 0);
        local v26 = v23.data.cameraMoveDuration or 1.5;
        local v27 = nil;
        if not l_cameraFocus_0 then
            return;
        else
            if type(l_cameraFocus_0) == "string" then
                l_cameraFocus_0 = v23.tutorial.instances[l_cameraFocus_0];
            end;
            local v28 = typeof(l_cameraFocus_0);
            if v28 == "CFrame" then
                v27 = l_cameraFocus_0;
            elseif v28 == "Vector3" then
                v27 = CFrame.lookAt(l_cameraFocus_0 + v25, l_cameraFocus_0);
            elseif v28 == "Instance" then
                if l_cameraFocus_0:IsA("BasePart") then
                    local l_Position_0 = l_cameraFocus_0.Position;
                    v27 = CFrame.lookAt(l_Position_0 + v25, l_Position_0);
                elseif l_cameraFocus_0:IsA("Model") then
                    local l_l_cameraFocus_0_Pivot_0 = l_cameraFocus_0:GetPivot();
                    v27 = CFrame.lookAt(l_l_cameraFocus_0_Pivot_0.Position + Vector3.new(5, 5, 0, 0), l_l_cameraFocus_0_Pivot_0);
                end;
            end;
            if v23._cameraLerpThread then
                task.cancel(v23._cameraLerpThread);
            end;
            v23._cameraLerpThread = task.spawn(function() --[[ Line: 112 ]]
                -- upvalues: v23 (copy), l_Workspace_0 (ref), v26 (copy), v27 (ref), l_RunService_0 (ref)
                if not v23._priorCameraType then
                    v23._priorCameraType = l_Workspace_0.CurrentCamera.CameraType;
                end;
                local l_CFrame_0 = l_Workspace_0.CurrentCamera.CFrame;
                l_Workspace_0.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                local v32 = 0;
                while v32 < v26 do
                    local v33 = math.clamp(v32 / v26, 0, 1);
                    l_Workspace_0.CurrentCamera.CFrame = l_CFrame_0:Lerp(v27, v33);
                    v32 = v32 + l_RunService_0.RenderStepped:Wait();
                end;
                l_Workspace_0.CurrentCamera.CFrame = v27;
                l_RunService_0.RenderStepped:Wait();
                l_Workspace_0.CurrentCamera.CameraType = v23._priorCameraType;
                v23._priorCameraType = nil;
                v23._cameraLerpThread = nil;
            end);
            return;
        end;
    end;
end;
return v7;