local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local v4 = {};
local _ = require(script.Parent.Parent.Parent.types);
local _ = require(script.Parent.types);
local v7 = l_Map_0.new();
v4.getChartData = function(v8) --[[ Line: 30 ]] --[[ Name: getChartData ]]
    -- upvalues: v7 (copy), l_Array_0 (copy)
    local l_profilerStore_0 = v8.profilerStore;
    local l_rootID_0 = v8.rootID;
    if v7:has(l_rootID_0) then
        return (v7:get(l_rootID_0));
    else
        local v11 = l_profilerStore_0:getDataForRoot(l_rootID_0);
        if v11 == nil then
            error(string.format("Could not find profiling data for root \"%s\"", (tostring(l_rootID_0))));
        end;
        local l_commitData_0 = v11.commitData;
        local l_interactions_0 = v11.interactions;
        local v14 = if #l_commitData_0 > 0 then l_commitData_0[#l_commitData_0].timestamp else 0;
        local v15 = 0;
        l_Array_0.forEach(l_commitData_0, function(v16) --[[ Line: 49 ]]
            -- upvalues: v15 (ref)
            v15 = math.max(v15, v16.duration);
        end);
        local v17 = {
            interactions = l_Array_0.from(l_interactions_0:values()), 
            lastInteractionTime = v14, 
            maxCommitDuration = v15
        };
        v7:set(l_rootID_0, v17);
        return v17;
    end;
end;
v4.invalidateChartData = function() --[[ Line: 61 ]] --[[ Name: invalidateChartData ]]
    -- upvalues: v7 (copy)
    return v7:clear();
end;
return v4;