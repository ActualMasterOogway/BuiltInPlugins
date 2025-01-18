local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Src.Util.Constants);
return {
    switchToAvatar = function(v5, v6, v7, v8) --[[ Line: 10 ]] --[[ Name: switchToAvatar ]]
        -- upvalues: l_Workspace_0 (copy)
        if not v7 then
            return;
        else
            local l_Humanoid_0 = v7:FindFirstChildOfClass("Humanoid");
            local l_AnimationController_0 = v7:FindFirstChildOfClass("AnimationController");
            local v11 = if l_Humanoid_0 then l_Humanoid_0:FindFirstChildOfClass("Animator") else false;
            if l_AnimationController_0 then
                v11 = l_AnimationController_0:FindFirstChildOfClass("Animator");
            end;
            local v12 = v6.Character or v6.CharacterAdded:Wait();
            local v13 = v12:WaitForChild("Animate"):Clone();
            v12:WaitForChild("HumanoidRootPart");
            local l_p_0 = v12:GetPrimaryPartCFrame().p;
            if v8 then
                local l_l_Workspace_0_FirstChildWhichIsA_0 = l_Workspace_0:FindFirstChildWhichIsA("SpawnLocation", true);
                if l_l_Workspace_0_FirstChildWhichIsA_0 then
                    l_p_0 = l_l_Workspace_0_FirstChildWhichIsA_0.CFrame.p;
                end;
            end;
            local v16 = v7:Clone();
            local l_Animate_0 = v16:FindFirstChild("Animate");
            v16.Name = v12.Name;
            v16.Parent = l_Workspace_0;
            v6.Character = v16;
            v12:Destroy();
            if not v11 then
                Instance.new("Animator").Parent = v16:FindFirstChild("Humanoid");
            end;
            if l_Animate_0 then
                l_Animate_0:Destroy();
            end;
            v13.Parent = v16;
            v16:MoveTo(l_p_0);
            v5.previewChangedEvent:FireClient(v6);
            return;
        end;
    end, 
    initRemoteEvents = function(v18) --[[ Line: 58 ]] --[[ Name: initRemoteEvents ]]
        -- upvalues: v4 (copy), l_ReplicatedStorage_0 (copy)
        v18.previewChangedEvent = Instance.new("RemoteEvent");
        v18.previewChangedEvent.Name = v4.PREVIEW_REMOTE_EVENT_NAME;
        v18.previewChangedEvent.Parent = l_ReplicatedStorage_0;
    end, 
    destroyRemoteEvents = function(v19) --[[ Line: 64 ]] --[[ Name: destroyRemoteEvents ]]
        if v19.previewChangedEvent then
            v19.previewChangedEvent:Destroy();
            v19.previewChangedEvent = nil;
        end;
    end, 
    initPlayerPreviewData = function(v20) --[[ Line: 71 ]] --[[ Name: initPlayerPreviewData ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v4 (copy)
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild(v4.PREVIEW_FOLDER_NAME);
        if not l_l_ReplicatedStorage_0_FirstChild_0 then
            return;
        else
            v20.playerPreviewAvatarData = {};
            for _, v23 in ipairs(l_l_ReplicatedStorage_0_FirstChild_0:GetChildren()) do
                local v24 = tonumber(v23.Name);
                v20.playerPreviewAvatarData[v24] = {
                    CurrentIndex = 1, 
                    PreviousIndex = 1, 
                    Avatars = v23:GetChildren()
                };
                for v25, v26 in ipairs(v23:GetChildren()) do
                    v26.Name = v25;
                end;
            end;
            return;
        end;
    end, 
    initConnections = function(v27) --[[ Line: 91 ]] --[[ Name: initConnections ]]
        -- upvalues: l_Players_0 (copy)
        v27.connections = {};
        table.insert(v27.connections, l_Players_0.PlayerAdded:Connect(function(v28) --[[ Line: 96 ]]
            -- upvalues: v27 (copy)
            local v29 = v27.playerPreviewAvatarData[v28.UserId];
            if v29 then
                if v29.appearanceLoadedHandle then
                    v29.appearanceLoadedHandle:Disconnect();
                end;
                v29.appearanceLoadedHandle = v28.CharacterAppearanceLoaded:Connect(function() --[[ Line: 102 ]]
                    -- upvalues: v27 (ref), v28 (copy), v29 (copy)
                    v27:switchToAvatar(v28, v29.Avatars[v29.CurrentIndex], true);
                end);
                if v29.characterAddedHandle then
                    v29.characterAddedHandle:Disconnect();
                end;
                v29.characterAddedHandle = v28.CharacterAdded:Connect(function(v30) --[[ Line: 109 ]]
                    -- upvalues: v29 (copy), v27 (ref), v28 (copy)
                    if v29.diedHandle then
                        v29.diedHandle:Disconnect();
                    end;
                    v29.diedHandle = v30:WaitForChild("Humanoid").Died:Connect(function() --[[ Line: 113 ]]
                        -- upvalues: v27 (ref), v28 (ref), v29 (ref)
                        v27:switchToAvatar(v28, v29.Avatars[v29.CurrentIndex]);
                    end);
                end);
            end;
        end));
        table.insert(v27.connections, v27.previewChangedEvent.OnServerEvent:Connect(function(v31, v32) --[[ Line: 123 ]]
            -- upvalues: v27 (copy)
            local v33 = v27.playerPreviewAvatarData[v31.UserId];
            if v33 then
                v33.CurrentIndex = v32;
                if v32 ~= v33.PreviousIndex then
                    v33.Avatars[v33.PreviousIndex]:Destroy();
                    v33.Avatars[v33.PreviousIndex] = v31.Character:Clone();
                end;
                v27:switchToAvatar(v31, v33.Avatars[v32]);
                v33.PreviousIndex = v32;
            end;
        end));
    end, 
    destroyConnections = function(v34) --[[ Line: 138 ]] --[[ Name: destroyConnections ]]
        if not v34.playerPreviewAvatarData then
            return;
        else
            for _, v36 in pairs(v34.playerPreviewAvatarData) do
                if v36.appearanceLoadedHandle then
                    v36.appearanceLoadedHandle:Disconnect();
                end;
                if v36.characterAddedHandle then
                    v36.characterAddedHandle:Disconnect();
                end;
                if v36.diedHandle then
                    v36.diedHandle:Disconnect();
                end;
            end;
            for _, v38 in ipairs(v34.connections) do
                v38:Disconnect();
            end;
            v34.connections = {};
            return;
        end;
    end, 
    init = function(v39) --[[ Line: 161 ]] --[[ Name: init ]]
        -- upvalues: l_Players_0 (copy)
        if #l_Players_0:GetPlayers() > 1 then
            return;
        else
            v39:initPlayerPreviewData();
            if not v39.playerPreviewAvatarData then
                return;
            else
                v39:initRemoteEvents();
                v39:initConnections();
                return;
            end;
        end;
    end, 
    shutdown = function(v40) --[[ Line: 175 ]] --[[ Name: shutdown ]]
        v40:destroyConnections();
        v40.playerPreviewAvatarData = nil;
        v40:destroyRemoteEvents();
    end
};