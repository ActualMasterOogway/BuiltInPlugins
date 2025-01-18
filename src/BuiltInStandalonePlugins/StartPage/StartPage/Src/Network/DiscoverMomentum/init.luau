local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v3 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
return function(v4, _, _, v7, _) --[[ Line: 19 ]] --[[ Name: DiscoverMomentum ]]
    -- upvalues: v3 (copy)
    v3:setTargetCount(v7, #v4);
    v3:upsertItemsForList(v7, 0, v4);
end;