local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v12(v7) --[[ Line: 12 ]] --[[ Name: getAnimator ]]
    local l_Humanoid_0 = v7:FindFirstChildWhichIsA("Humanoid");
    local l_AnimationController_0 = v7:FindFirstChildWhichIsA("AnimationController");
    local v10 = l_Humanoid_0 or l_AnimationController_0;
    assert(v10 ~= nil, "AnimateTarget must have either a Humanoid or an AnimationController");
    local l_Animator_0 = v10:FindFirstChildWhichIsA("Animator");
    if l_Animator_0 == nil then
        l_Animator_0 = Instance.new("Animator");
        l_Animator_0.Parent = v10;
    end;
    return l_Animator_0;
end;
local function v18(v13) --[[ Line: 28 ]] --[[ Name: resetAnimation ]]
    -- upvalues: v5 (copy)
    for _, v15 in v13:GetDescendants() do
        if v15:IsA("Motor6D") then
            v15.CurrentAngle = 0;
            v15.Transform = CFrame.new();
        elseif v15:IsA("FaceControls") then
            for _, v17 in v5.FACE_CONTROLS_PROPERTIES do
                v15[v17] = 0;
            end;
        end;
    end;
end;
local function _(v19, v20) --[[ Line: 43 ]] --[[ Name: stepAnimations ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsRunning() then
        return;
    else
        v19:StepAnimations(v20);
        return;
    end;
end;
return function(v22, v23, v24, v25) --[[ Line: 51 ]] --[[ Name: useAnimationOnAnimateTarget ]]
    -- upvalues: v3 (copy), v5 (copy), v12 (copy), l_ContentProvider_0 (copy), v4 (copy), l_RunService_0 (copy), v18 (copy)
    local v26, v27 = v3.useState(nil);
    local v28, v29 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v22 (copy), v29 (copy), v5 (ref)
        if v22 == nil then
            v29(nil);
            return nil;
        else
            assert(v22 ~= nil, v5.LUAU_ANALYZE_ERROR);
            if v22:IsDescendantOf(game) then
                v29(v22);
                return nil;
            else
                local v30 = v22.AncestryChanged:Connect(function() --[[ Line: 76 ]]
                    -- upvalues: v22 (ref), v29 (ref)
                    if v22:IsDescendantOf(game) then
                        v29(v22);
                        return;
                    else
                        v29(nil);
                        return;
                    end;
                end);
                return function() --[[ Line: 84 ]]
                    -- upvalues: v30 (copy)
                    v30:Disconnect();
                end;
            end;
        end;
    end, {
        v22
    });
    v3.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v27 (copy), v28 (copy), v5 (ref), v23 (copy), v12 (ref), l_ContentProvider_0 (ref), v4 (ref), l_RunService_0 (ref), v18 (ref)
        v27(nil);
        if v28 == nil then
            return nil;
        else
            assert(v28 ~= nil, v5.LUAU_ANALYZE_ERROR);
            if not v28:IsDescendantOf(game) then
                return nil;
            else
                local l_Animation_0 = Instance.new("Animation");
                l_Animation_0.AnimationId = ("rbxassetid://%*"):format(v23);
                local v32 = v12(v28);
                local v33 = nil;
                local v34 = task.spawn(function() --[[ Line: 107 ]]
                    -- upvalues: l_ContentProvider_0 (ref), l_Animation_0 (copy), v4 (ref), v28 (ref), v33 (ref), v32 (copy), v27 (ref)
                    l_ContentProvider_0:PreloadAsync({
                        l_Animation_0
                    });
                    if v4() and not v28:IsDescendantOf(game) then
                        return;
                    else
                        v33 = v32:LoadAnimation(l_Animation_0);
                        if v4() and not v28:IsDescendantOf(game) then
                            return;
                        else
                            v33.Looped = true;
                            v33:Play();
                            v27(v33);
                            return;
                        end;
                    end;
                end);
                return function() --[[ Line: 125 ]]
                    -- upvalues: v34 (copy), v33 (ref), v32 (copy), l_RunService_0 (ref), v18 (ref), v28 (ref)
                    task.cancel(v34);
                    if v33 ~= nil then
                        v33:Stop(0);
                        v33:Destroy();
                    end;
                    local l_v32_0 = v32;
                    if not l_RunService_0:IsRunning() then
                        l_v32_0:StepAnimations(0);
                    end;
                    v18(v28);
                end;
            end;
        end;
    end, {
        v28 or 0, 
        v23 or 0
    });
    v3.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v22 (copy), v26 (copy), v5 (ref), v12 (ref), v25 (copy), l_RunService_0 (ref), v24 (copy)
        if v22 == nil or v26 == nil then
            return;
        else
            assert(v22 ~= nil, v5.LUAU_ANALYZE_ERROR);
            local v36 = v12(v22);
            if v25 == nil then
                local v39 = l_RunService_0.Heartbeat:Connect(function(v37) --[[ Line: 151 ]]
                    -- upvalues: v36 (copy), l_RunService_0 (ref), v24 (ref), v26 (ref)
                    local l_v36_0 = v36;
                    if not l_RunService_0:IsRunning() then
                        l_v36_0:StepAnimations(v37);
                    end;
                    if v24 ~= nil then
                        v24(v26.TimePosition / v26.Length);
                    end;
                end);
                return function() --[[ Line: 159 ]]
                    -- upvalues: v39 (copy)
                    v39:Disconnect();
                end;
            else
                v26:Stop(0);
                v26:Play();
                local v40 = v25 * v26.Length;
                if not l_RunService_0:IsRunning() then
                    v36:StepAnimations(v40);
                end;
                return nil;
            end;
        end;
    end, {
        v22, 
        v26, 
        v25, 
        v24
    });
    return v26;
end;