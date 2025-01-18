local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
return function() --[[ Line: 4 ]] --[[ Name: getPlaceId ]]
    -- upvalues: v1 (copy)
    local v2 = -1;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref)
        v2 = game.PlaceId;
    end);
    if not l_status_0 and v1.shouldDebugWarnings() then
        warn(l_result_0);
    end;
    return v2;
end;