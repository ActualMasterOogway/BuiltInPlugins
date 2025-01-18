return function(v0, v1) --[[ Line: 2 ]] --[[ Name: loadAnimation ]]
    local v2 = nil;
    local l_v0_FirstChildWhichIsA_0 = v0:FindFirstChildWhichIsA("Humanoid", true);
    if l_v0_FirstChildWhichIsA_0 then
        v2 = l_v0_FirstChildWhichIsA_0;
    else
        local l_v0_FirstChildWhichIsA_1 = v0:FindFirstChildWhichIsA("AnimationController", true);
        if not l_v0_FirstChildWhichIsA_1 then
            l_v0_FirstChildWhichIsA_1 = Instance.new("AnimationController");
            l_v0_FirstChildWhichIsA_1.Parent = v0;
        end;
        v2 = l_v0_FirstChildWhichIsA_1;
    end;
    local l_v2_FirstChildWhichIsA_0 = v2:FindFirstChildWhichIsA("Animator", true);
    if not l_v2_FirstChildWhichIsA_0 then
        l_v2_FirstChildWhichIsA_0 = Instance.new("Animator");
        l_v2_FirstChildWhichIsA_0.Parent = v2;
    end;
    local l_v0_FirstChildWhichIsA_2 = v0:FindFirstChildWhichIsA("Animation", true);
    if not l_v0_FirstChildWhichIsA_2 then
        local v7 = game:GetService("KeyframeSequenceProvider"):RegisterKeyframeSequence(v1);
        l_v0_FirstChildWhichIsA_2 = Instance.new("Animation");
        l_v0_FirstChildWhichIsA_2.Name = v1.Name;
        l_v0_FirstChildWhichIsA_2.AnimationId = v7;
        l_v0_FirstChildWhichIsA_2.Parent = v2;
    end;
    local v8 = l_v2_FirstChildWhichIsA_0:LoadAnimation(l_v0_FirstChildWhichIsA_2);
    v8.Looped = true;
    v8:Play();
    local v10 = game:GetService("RunService").Heartbeat:Connect(function(v9) --[[ Line: 35 ]]
        -- upvalues: l_v2_FirstChildWhichIsA_0 (ref)
        l_v2_FirstChildWhichIsA_0:StepAnimations(v9);
    end);
    v0.Destroying:Connect(function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy)
        v10:Disconnect();
    end);
end;