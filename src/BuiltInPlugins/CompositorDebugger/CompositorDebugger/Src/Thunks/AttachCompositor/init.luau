local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetDebugDataEvent);
local v4 = require(l_Actions_0.SetActor);
local v5 = require(l_Actions_0.SetDebugPoseEvent);
local v6 = require(l_Actions_0.SetPropertyOverridesEvent);
local v7 = require(l_Actions_0.SetSendPayloadAnalytics);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v9 = require(l_Thunks_0.DetachCompositor);
local v10 = require(l_Thunks_0.ParseDebugData);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v12 = require(l_Util_0.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v14, v15) --[[ Line: 28 ]] --[[ Name: findOrCreateFolder ]]
    local l_v14_FirstChild_0 = v14:FindFirstChild(v15);
    if l_v14_FirstChild_0 and l_v14_FirstChild_0:IsA("Folder") then
        return l_v14_FirstChild_0;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Archivable = false;
        l_Folder_0.Name = v15;
        return l_Folder_0;
    end;
end;
local function v23(v19, v20) --[[ Line: 40 ]] --[[ Name: findOrCreateEvent ]]
    local l_v19_FirstChild_0 = v19:FindFirstChild(v20);
    if l_v19_FirstChild_0 and not l_v19_FirstChild_0:IsA("BindableEvent") then
        return nil;
    else
        if not l_v19_FirstChild_0 then
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            l_BindableEvent_0.Archivable = false;
            l_BindableEvent_0.Name = v20;
            l_BindableEvent_0.Parent = v19;
            l_v19_FirstChild_0 = l_BindableEvent_0;
        end;
        assert(l_v19_FirstChild_0 and l_v19_FirstChild_0:IsA("BindableEvent"));
        return l_v19_FirstChild_0;
    end;
end;
return function(v24, v25) --[[ Line: 58 ]]
    -- upvalues: v9 (copy), v12 (copy), l_RunService_0 (copy), v23 (copy), v7 (copy), v10 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy)
    return function(v26) --[[ Line: 59 ]]
        -- upvalues: v24 (copy), v9 (ref), v12 (ref), l_RunService_0 (ref), v23 (ref), v7 (ref), v10 (ref), v25 (copy), v3 (ref), v6 (ref), v5 (ref), v4 (ref)
        if v26:getState().Status.Actor == v24 then
            return;
        else
            v26:dispatch(v9());
            local l_v24_0 = v24;
            local l_CompositorDebugger_0 = v12.FOLDERS.CompositorDebugger;
            local l_l_v24_0_FirstChild_0 = l_v24_0:FindFirstChild(l_CompositorDebugger_0);
            local v30;
            if l_l_v24_0_FirstChild_0 and l_l_v24_0_FirstChild_0:IsA("Folder") then
                v30 = l_l_v24_0_FirstChild_0;
            else
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Archivable = false;
                l_Folder_1.Name = l_CompositorDebugger_0;
                v30 = l_Folder_1;
            end;
            l_CompositorDebugger_0 = v12.FOLDERS.Gizmos;
            l_l_v24_0_FirstChild_0 = v30:FindFirstChild(l_CompositorDebugger_0);
            if l_l_v24_0_FirstChild_0 and l_l_v24_0_FirstChild_0:IsA("Folder") then
                l_v24_0 = l_l_v24_0_FirstChild_0;
            else
                local l_Folder_2 = Instance.new("Folder");
                l_Folder_2.Archivable = false;
                l_Folder_2.Name = l_CompositorDebugger_0;
                l_v24_0 = l_Folder_2;
            end;
            l_l_v24_0_FirstChild_0 = if l_RunService_0:IsServer() then v12.FOLDERS.Server else v12.FOLDERS.Client;
            local l_v30_FirstChild_0 = v30:FindFirstChild(l_l_v24_0_FirstChild_0);
            if l_v30_FirstChild_0 and l_v30_FirstChild_0:IsA("Folder") then
                l_CompositorDebugger_0 = l_v30_FirstChild_0;
            else
                local l_Folder_3 = Instance.new("Folder");
                l_Folder_3.Archivable = false;
                l_Folder_3.Name = l_l_v24_0_FirstChild_0;
                l_CompositorDebugger_0 = l_Folder_3;
            end;
            l_l_v24_0_FirstChild_0 = v23(l_CompositorDebugger_0, v12.EVENTS.DebugData);
            l_v30_FirstChild_0 = v23(l_CompositorDebugger_0, v12.EVENTS.PropertyOverrides);
            local v35 = v23(l_CompositorDebugger_0, v12.EVENTS.DebugPose);
            if l_l_v24_0_FirstChild_0 and l_v30_FirstChild_0 and v35 then
                v26:dispatch(v7(true));
                local v37 = l_l_v24_0_FirstChild_0.Event:Connect(function(v36) --[[ Line: 81 ]]
                    -- upvalues: v26 (copy), v10 (ref), v25 (ref)
                    v26:dispatch(v10(v36, v25));
                end);
                v26:dispatch(v3(l_l_v24_0_FirstChild_0, v37));
                v26:dispatch(v6(l_v30_FirstChild_0));
                v26:dispatch(v5(v35));
                v26:dispatch(v4(v24));
                l_CompositorDebugger_0.Parent = v30;
                v30.Parent = v24;
                l_v24_0.Parent = v30;
            end;
            return;
        end;
    end;
end;