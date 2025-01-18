local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetHorizontalScrollZoom);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateEditingLength);
return function(v9) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v7 (copy), v6 (copy), v8 (copy), v3 (copy), v1 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v9 (copy), v5 (ref), v4 (ref), v2 (ref), v7 (ref), v6 (ref), v8 (ref), v3 (ref), v1 (ref)
        local v11 = v10:getState();
        if not v9 then
            return;
        elseif not v9.Metadata then
            v10:dispatch(v5(v9));
            return;
        else
            local l_HorizontalScroll_0 = v11.Status.HorizontalScroll;
            local l_HorizontalZoom_0 = v11.Status.HorizontalZoom;
            local l_Playhead_0 = v11.Status.Playhead;
            local l_EditingLength_0 = v11.Status.EditingLength;
            local l_StartTick_0 = v9.Metadata.StartTick;
            local v17 = v4.getZoomRange(v9, l_HorizontalScroll_0, l_HorizontalZoom_0, l_EditingLength_0);
            if v2.removeExtraKeyframes(v9) then
                v10:dispatch(v7("ClippedWarning", true));
            end;
            v2.setEndTick(v9);
            local l_EndTick_0 = v9.Metadata.EndTick;
            for _, v20 in ipairs(v9.Events.Keyframes) do
                if l_EndTick_0 < v20 then
                    v9.Metadata.EndTick = v20;
                    l_EndTick_0 = v20;
                end;
            end;
            v2.validateKeyframeNames(v9);
            v10:dispatch(v5(v9));
            if l_StartTick_0 ~= l_EndTick_0 then
                l_Playhead_0 = math.clamp(l_Playhead_0, l_StartTick_0, l_EndTick_0);
            end;
            v10:dispatch(v6(l_Playhead_0));
            local v21 = l_EndTick_0 - l_StartTick_0;
            if l_EditingLength_0 < v21 then
                v10:dispatch(v8(v21));
                local v22 = math.ceil(v21 * v3.LENGTH_PADDING);
                local v23 = v17.End - v17.Start;
                l_HorizontalScroll_0 = 0;
                if v22 ~= v23 then
                    l_HorizontalScroll_0 = math.clamp((v17.Start - l_StartTick_0) / (v22 - v23), 0, 1);
                end;
                l_HorizontalZoom_0 = 1 - math.clamp(v23 / v22, 0, 1);
                v10:dispatch(v1(l_HorizontalScroll_0, l_HorizontalZoom_0));
            end;
            return;
        end;
    end;
end;