local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return v1.createReducer({
    Past = {}, 
    Future = {}, 
    MaxWaypointSize = v3.MAX_WAYPOINT_SIZE
}, {
    SetPast = function(v4, v5) --[[ Line: 11 ]] --[[ Name: SetPast ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            Past = v5.past
        });
    end, 
    SetFuture = function(v6, v7) --[[ Line: 17 ]] --[[ Name: SetFuture ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            Future = v7.future
        });
    end, 
    SetMaxWaypointSize = function(v8, v9) --[[ Line: 23 ]] --[[ Name: SetMaxWaypointSize ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            MaxWaypointSize = v9.maxSize
        });
    end
});