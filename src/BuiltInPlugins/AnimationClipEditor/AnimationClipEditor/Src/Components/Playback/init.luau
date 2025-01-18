local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetPlaybackStartInfo);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local l_RunService_0 = game:GetService("RunService");
local v9 = v1.PureComponent:extend("Playback");
v9.didMount = function(v10) --[[ Line: 16 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v7 (copy), v6 (copy)
    v10.StartTime = nil;
    v10.Stepped = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 18 ]]
        -- upvalues: v10 (copy), v7 (ref), v6 (ref)
        local l_props_0 = v10.props;
        local l_Playhead_0 = l_props_0.Playhead;
        local l_PlaybackSpeed_0 = l_props_0.PlaybackSpeed;
        local l_PlaybackStartInfo_0 = l_props_0.PlaybackStartInfo;
        local v15 = nil;
        if v7() then
            local v16 = true;
            if l_props_0.PlayState ~= v6.PLAY_STATE.Play then
                v16 = l_props_0.PlayState == v6.PLAY_STATE.Reverse;
            end;
            v15 = v16;
        else
            v15 = l_props_0.PlayState ~= v6.PLAY_STATE.Pause;
        end;
        if v15 and l_props_0.AnimationData ~= nil then
            local l_Metadata_0 = l_props_0.AnimationData.Metadata;
            if l_Metadata_0.EndTick > 0 then
                local v18 = tick();
                local l_EndTick_0 = l_Metadata_0.EndTick;
                if not l_PlaybackStartInfo_0.startTime then
                    local l_l_Playhead_0_0 = l_Playhead_0;
                    if l_props_0.PlayState == v6.PLAY_STATE.Play and math.floor(l_EndTick_0) <= l_l_Playhead_0_0 then
                        l_l_Playhead_0_0 = 0;
                    end;
                    if l_props_0.PlayState == v6.PLAY_STATE.Reverse and l_l_Playhead_0_0 <= 0 then
                        l_l_Playhead_0_0 = math.floor(l_EndTick_0);
                    end;
                    l_PlaybackStartInfo_0 = {
                        startTime = v18, 
                        startPlayhead = l_l_Playhead_0_0
                    };
                    l_props_0.SetPlaybackStartInfo(l_PlaybackStartInfo_0);
                end;
                local v21 = (v18 - l_PlaybackStartInfo_0.startTime) * l_PlaybackSpeed_0;
                if l_props_0.PlayState == v6.PLAY_STATE.Reverse then
                    v21 = -v21;
                end;
                local v22 = l_PlaybackStartInfo_0.startPlayhead + v21 * v6.TICK_FREQUENCY;
                if l_Metadata_0.Looping then
                    v22 = v22 % l_EndTick_0;
                else
                    v22 = math.clamp(v22, 0, l_EndTick_0);
                    if v22 == l_EndTick_0 and l_props_0.PlayState == v6.PLAY_STATE.Play or v22 == 0 and l_props_0.PlayState == v6.PLAY_STATE.Reverse then
                        l_props_0.SetPlayState(v6.PLAY_STATE.Pause);
                    end;
                end;
                l_props_0.StepAnimation(v22);
                return;
            else
                l_props_0.SetPlayState(v6.PLAY_STATE.Pause);
                return;
            end;
        else
            l_props_0.SetPlaybackStartInfo({});
            return;
        end;
    end);
end;
v9.render = function(_) --[[ Line: 79 ]] --[[ Name: render ]]
    return nil;
end;
v9.willUnmount = function(v24) --[[ Line: 83 ]] --[[ Name: willUnmount ]]
    if v24.Stepped then
        v24.Stepped:Disconnect();
    end;
end;
return v2.connect(function(v25) --[[ Line: 89 ]] --[[ Name: mapStateToProps ]]
    return {
        AnimationData = v25.AnimationData, 
        IsPlaying = v25.Status.IsPlaying, 
        PlayState = v25.Status.PlayState, 
        Playhead = v25.Status.Playhead, 
        PlaybackSpeed = v25.Status.PlaybackSpeed, 
        PlaybackStartInfo = v25.Status.PlaybackStartInfo
    };
end, function(v26) --[[ Line: 100 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy)
    return {
        StepAnimation = function(v27) --[[ Line: 102 ]] --[[ Name: StepAnimation ]]
            -- upvalues: v26 (copy), v3 (ref)
            v26(v3(v27));
        end, 
        SetPlaybackStartInfo = function(v28) --[[ Line: 106 ]] --[[ Name: SetPlaybackStartInfo ]]
            -- upvalues: v26 (copy), v5 (ref)
            v26(v5(v28));
        end, 
        SetPlayState = function(v29) --[[ Line: 110 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v26 (copy), v4 (ref)
            v26(v4(v29));
        end
    };
end)(v9);