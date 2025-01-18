local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetHorizontalScrollZoom);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetEditingLength);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return function(v5) --[[ Line: 12 ]]
        -- upvalues: v4 (ref), v1 (ref), v3 (ref), v2 (ref)
        local l_AnimationData_0 = v5:getState().AnimationData;
        if not l_AnimationData_0 or not l_AnimationData_0.Metadata then
            return;
        else
            local l_EndTick_0 = l_AnimationData_0.Metadata.EndTick;
            v4 = math.max(v4, l_EndTick_0, v1.TICK_FREQUENCY);
            v5:dispatch(v3(v4));
            v5:dispatch(v2(0, 0));
            return;
        end;
    end;
end;