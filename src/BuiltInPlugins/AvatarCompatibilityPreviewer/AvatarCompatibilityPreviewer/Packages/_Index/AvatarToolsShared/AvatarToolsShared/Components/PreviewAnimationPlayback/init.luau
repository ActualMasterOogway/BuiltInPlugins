local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local _ = v2.ContextServices.withContext;
local v4 = v1.PureComponent:extend("AnimationPlayback");
local l_RunService_0 = game:GetService("RunService");
v2.Util.Typecheck.wrap(v4, script);
v4.init = function(v6) --[[ Line: 32 ]] --[[ Name: init ]]
    v6.state = {
        playhead = 0, 
        trackLength = 0, 
        isPlaying = false
    };
    v6.tracks = {};
    v6.animations = {};
    v6.previousAnimationURL = nil;
    v6.previousPreviewAvatars = nil;
end;
local _ = function(v7, v8) --[[ Line: 44 ]] --[[ Name: hasFinished ]]
    local _, v10 = next(v7.tracks);
    if v10 then
        return v8 - v7.StartTime > v10.Length;
    else
        return false;
    end;
end;
local function _(v12, v13, v14) --[[ Line: 53 ]] --[[ Name: setPlayhead ]]
    if not v14 then
        v12:setState({
            playhead = v13
        });
    end;
    v12.props.OnPlayheadChanged(v13);
end;
local function _(v16, v17, v18) --[[ Line: 63 ]] --[[ Name: setTrackLength ]]
    if not v18 then
        v16:setState({
            trackLength = v17
        });
    end;
    v16.props.OnTrackLengthChanged(v17);
end;
local function _(v20, v21, v22) --[[ Line: 73 ]] --[[ Name: setIsPlaying ]]
    if not v22 then
        v20:setState({
            isPlaying = v21
        });
    end;
    v20.props.OnIsPlayingChanged(v21);
end;
v4.didMount = function(v24) --[[ Line: 83 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v24.Stepped = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 84 ]]
        -- upvalues: v24 (copy)
        local _ = v24.props;
        local l_state_0 = v24.state;
        local l_playhead_0 = l_state_0.playhead;
        local _, v29 = next(v24.tracks);
        if l_state_0.isPlaying and v29 and v29.Length > 0 then
            if v29.Length ~= l_state_0.trackLength then
                local l_v24_0 = v24;
                local l_Length_0 = v29.Length;
                l_v24_0:setState({
                    trackLength = l_Length_0
                });
                l_v24_0.props.OnTrackLengthChanged(l_Length_0);
            end;
            local v32 = tick();
            if not v24.StartTime then
                v24.StartTime = v32 - l_playhead_0;
            end;
            local l_v24_1 = v24;
            local _, v35 = next(l_v24_1.tracks);
            if if v35 then v32 - l_v24_1.StartTime > v35.Length else false then
                local l_v24_2 = v24;
                l_v24_2.StartTime = l_v24_2.StartTime + v29.Length;
            end;
            local v37 = v32 - v24.StartTime;
            l_v24_1 = v24;
            l_v24_1:setState({
                playhead = v37
            });
            l_v24_1.props.OnPlayheadChanged(v37);
            return;
        else
            if v24.StartTime ~= nil then
                v24.StartTime = nil;
            end;
            return;
        end;
    end);
end;
local function v41(v38) --[[ Line: 108 ]] --[[ Name: getAnimator ]]
    if not v38 then
        return nil;
    else
        local v39 = v38:FindFirstChildOfClass("Humanoid") or v38:FindFirstChildOfClass("AnimationController");
        local v40 = v39 and v39:FindFirstChildOfClass("Animator");
        if v40 then
            return v40;
        else
            return Instance.new("Animator", v39);
        end;
    end;
end;
v4.render = function(v42) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v41 (copy)
    local l_props_1 = v42.props;
    local l_state_1 = v42.state;
    local l_PreviewAvatars_0 = l_props_1.PreviewAvatars;
    for _, v47 in ipairs(l_PreviewAvatars_0) do
        local l_model_0 = v47.model;
        local v49 = v41(l_model_0);
        if v49 and v42.tracks[l_model_0] then
            v42.tracks[l_model_0]:Play();
            v49:StepAnimations(0);
            v49:StepAnimations(l_state_1.playhead);
        end;
    end;
end;
v4.cleanOldAnims = function(v50, v51) --[[ Line: 137 ]] --[[ Name: cleanOldAnims ]]
    -- upvalues: v41 (copy)
    for _, v53 in pairs(v50.tracks) do
        v53:Stop(0);
        v53:Destroy();
    end;
    v50.tracks = {};
    local l_PreviewAvatars_1 = v50.props.PreviewAvatars;
    for _, v56 in ipairs(l_PreviewAvatars_1) do
        local l_model_1 = v56.model;
        local v58 = v41(l_model_1);
        if v58 then
            v58:StepAnimations(0);
        end;
        if l_model_1 then
            for _, v60 in pairs(l_model_1:GetDescendants()) do
                if v60:IsA("Motor6D") then
                    v60.CurrentAngle = 0;
                    v60.Transform = CFrame.new();
                end;
            end;
        end;
    end;
    for _, v62 in pairs(v50.animations) do
        v62:Destroy();
    end;
    v50.animations = {};
    v50.StartTime = nil;
    if not v51 then
        v50:setState({
            trackLength = 0
        });
    end;
    v50.props.OnTrackLengthChanged(0);
    if not v51 then
        v50:setState({
            isPlaying = false
        });
    end;
    v50.props.OnIsPlayingChanged(false);
    if not v51 then
        v50:setState({
            playhead = 0
        });
    end;
    v50.props.OnPlayheadChanged(0);
end;
local function _(v63) --[[ Line: 176 ]] --[[ Name: animationIdToURL ]]
    return "http://www.roblox.com/asset/?id=" .. tostring(v63);
end;
local function v69(v65, v66) --[[ Line: 180 ]] --[[ Name: didPreviewAvatarsChange ]]
    if v66 and not v65.previousPreviewAvatars or #v66 ~= #v65.previousPreviewAvatars then
        return true;
    else
        for v67, v68 in ipairs(v66) do
            if v68 ~= v65.previousPreviewAvatars[v67] then
                return true;
            end;
        end;
        return false;
    end;
end;
v4.didUpdate = function(v70, v71, _) --[[ Line: 197 ]] --[[ Name: didUpdate ]]
    -- upvalues: v69 (copy)
    local l_props_2 = v70.props;
    local l_PreviewAvatars_2 = l_props_2.PreviewAvatars;
    local l_AnimationId_0 = l_props_2.AnimationId;
    if l_AnimationId_0 and #l_PreviewAvatars_2 > 0 then
        local v76 = "http://www.roblox.com/asset/?id=" .. tostring(l_AnimationId_0);
        local v77 = not v70.previousAnimationURL or v70.previousAnimationURL ~= v76;
        local v78 = v69(v70, l_PreviewAvatars_2);
        v70.previousAnimationURL = v76;
        v70.previousPreviewAvatars = l_PreviewAvatars_2;
        if v77 or v78 then
            v70:cleanOldAnims();
            for _, v80 in ipairs(l_PreviewAvatars_2) do
                local l_model_2 = v80.model;
                if l_model_2 then
                    local l_Humanoid_0 = l_model_2:FindFirstChildOfClass("Humanoid");
                    if l_Humanoid_0 then
                        v70.animations[l_model_2] = Instance.new("Animation");
                        v70.animations[l_model_2].AnimationId = v76;
                        v70.tracks[l_model_2] = l_Humanoid_0:LoadAnimation(v70.animations[l_model_2]);
                        v70:setState({
                            isPlaying = true
                        });
                        v70.props.OnIsPlayingChanged(true);
                        v70:setState({
                            playhead = 0
                        });
                        v70.props.OnPlayheadChanged(0);
                    end;
                end;
            end;
        end;
        if v71.PlayheadOverride ~= l_props_2.PlayheadOverride and l_props_2.PlayheadOverride >= 0 then
            local l_PlayheadOverride_0 = l_props_2.PlayheadOverride;
            v70:setState({
                playhead = l_PlayheadOverride_0
            });
            v70.props.OnPlayheadChanged(l_PlayheadOverride_0);
        end;
        if v71.IsPlayingOverride ~= l_props_2.IsPlayingOverride and l_props_2.IsPlayingOverride ~= nil then
            local l_IsPlayingOverride_0 = l_props_2.IsPlayingOverride;
            v70:setState({
                isPlaying = l_IsPlayingOverride_0
            });
            v70.props.OnIsPlayingChanged(l_IsPlayingOverride_0);
            return;
        end;
    elseif v70.state.isPlaying then
        v70:cleanOldAnims();
        v70.previousAnimationURL = nil;
        v70.previousPreviewAvatars = nil;
    end;
end;
v4.willUnmount = function(v85) --[[ Line: 239 ]] --[[ Name: willUnmount ]]
    v85:cleanOldAnims(true);
    if v85.Stepped then
        v85.Stepped:Disconnect();
    end;
end;
return v4;