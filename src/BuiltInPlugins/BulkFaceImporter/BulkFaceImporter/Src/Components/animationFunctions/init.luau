return {
    attachAnimation = function(v0) --[[ Line: 5 ]]
        local l_RunService_0 = game:GetService("RunService");
        local l_Selection_0 = game:GetService("Selection");
        if l_RunService_0:IsRunning() then
            for _, v4 in pairs(l_Selection_0:Get()) do
                local l_Humanoid_0 = v4:FindFirstChild("Humanoid");
                if l_Humanoid_0 ~= nil then
                    local l_Head_0 = v4:FindFirstChild("Head");
                    if l_Head_0 ~= nil and l_Head_0:IsA("MeshPart") then
                        l_Head_0.Anchored = false;
                    end;
                    local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
                    if l_Animator_0 then
                        local l_l_Animator_0_PlayingAnimationTracks_0 = l_Animator_0:GetPlayingAnimationTracks();
                        for _, v10 in pairs(l_l_Animator_0_PlayingAnimationTracks_0) do
                            v10:Stop();
                        end;
                        local l_Animation_0 = Instance.new("Animation");
                        l_Animation_0.AnimationId = string.format("rbxassetid://%s", v0);
                        local v12 = l_Animator_0:LoadAnimation(l_Animation_0);
                        v12.Looped = true;
                        v12:Play();
                    end;
                end;
            end;
            return;
        else
            print("Animation will be played only in Play mode.");
            return;
        end;
    end
};