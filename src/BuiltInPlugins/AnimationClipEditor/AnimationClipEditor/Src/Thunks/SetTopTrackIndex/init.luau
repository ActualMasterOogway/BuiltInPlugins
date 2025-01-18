local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetTopTrackIndex);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.AnimationData);
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.deepCopy);
local _ = require(l_Util_0.TrackUtils);
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v2 (copy)
    return function(v9) --[[ Line: 20 ]]
        -- upvalues: v8 (ref), v2 (ref)
        local l_Tracks_0 = v9:getState().Status.Tracks;
        v8 = math.clamp(v8, 1, (math.max(1, #l_Tracks_0)));
        v9:dispatch(v2(v8));
    end;
end;