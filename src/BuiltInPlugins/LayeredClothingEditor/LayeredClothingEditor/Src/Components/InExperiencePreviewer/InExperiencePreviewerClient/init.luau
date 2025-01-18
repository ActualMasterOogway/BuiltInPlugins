local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.Roact);
local l_PreviewContext_0 = require(l_Parent_0.Packages.AvatarToolsShared).Contexts.PreviewContext;
local v8 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v10 = require(script.Parent.InExperiencePreviewFrame);
local v11 = require(l_Parent_0.Src.Util.Constants);
return {
    focusCamera = function(_) --[[ Line: 25 ]] --[[ Name: focusCamera ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Workspace_0 (copy)
        local v13 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        if not v13 then
            return;
        else
            local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
            l_CurrentCamera_0.CameraSubject = v13;
            return;
        end;
    end, 
    initRemoteConnections = function(v15) --[[ Line: 37 ]] --[[ Name: initRemoteConnections ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v11 (copy)
        v15.connections = {};
        local v16 = l_ReplicatedStorage_0:WaitForChild(v11.PREVIEW_REMOTE_EVENT_NAME);
        table.insert(v15.connections, v15.previewContext:getPreviewModelChangedSignal():Connect(function() --[[ Line: 44 ]]
            -- upvalues: v16 (copy), v15 (copy)
            v16:FireServer(v15.previewContext:getCurrentPreviewAvatarIndex());
        end));
        table.insert(v15.connections, v16.OnClientEvent:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v15 (copy)
            v15:focusCamera();
        end));
    end, 
    initUI = function(v17) --[[ Line: 57 ]] --[[ Name: initUI ]]
        -- upvalues: l_ContextServices_0 (copy), v8 (copy), v6 (copy), v10 (copy), l_CoreGui_0 (copy)
        local v18 = l_ContextServices_0.provide({
            v8.makePluginTheme(), 
            v17.previewContext
        }, {
            InExperiencePreviewFrame = v6.createElement(v10)
        });
        v17.roactHandle = v6.mount(v18, l_CoreGui_0);
    end, 
    initPreviewContext = function(v19) --[[ Line: 68 ]] --[[ Name: initPreviewContext ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v11 (copy), l_LocalPlayer_0 (copy), l_PreviewContext_0 (copy)
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v11.PREVIEW_FOLDER_NAME);
        if not l_l_ReplicatedStorage_0_FirstChild_0 then
            return;
        else
            local v21 = nil;
            for _, v23 in ipairs(l_l_ReplicatedStorage_0_FirstChild_0:GetChildren()) do
                if tonumber(v23.Name) == l_LocalPlayer_0.UserId then
                    v21 = v23;
                end;
            end;
            if not v21 then
                return;
            else
                v19.previewContext = l_PreviewContext_0.new();
                local v24 = {};
                for _, v26 in ipairs(v21:Clone():GetChildren()) do
                    v24[tonumber(v26.Name)] = v26;
                end;
                v19.previewContext:setAvatars(v24);
                return;
            end;
        end;
    end, 
    init = function(v27) --[[ Line: 93 ]] --[[ Name: init ]]
        -- upvalues: l_Players_0 (copy)
        if #l_Players_0:GetPlayers() > 1 then
            return;
        else
            v27:initPreviewContext();
            if not v27.previewContext then
                return;
            else
                v27:initRemoteConnections();
                v27:initUI();
                return;
            end;
        end;
    end, 
    shutdown = function(v28) --[[ Line: 107 ]] --[[ Name: shutdown ]]
        -- upvalues: v6 (copy)
        if not v28.connections then
            return;
        else
            for _, v30 in ipairs(v28.connections) do
                v30:Disconnect();
            end;
            v28.connections = {};
            if v28.roactHandle then
                v6.unmount(v28.roactHandle);
                v28.roactHandle = nil;
            end;
            return;
        end;
    end
};