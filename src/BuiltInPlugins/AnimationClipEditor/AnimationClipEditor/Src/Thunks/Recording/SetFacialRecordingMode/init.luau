local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        local v5 = v3 and v1.PLAY_STATE.Record or v1.PLAY_STATE.Pause;
        v4:dispatch(v2(v5));
    end;
end;