local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(script.BasicAggregator);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(script.Vector3Aggregator);
return function(v4) --[[ Line: 7 ]] --[[ Name: getPropertyAggregator ]]
    -- upvalues: v3 (copy), v1 (copy)
    if v4 == "Vector3" then
        return v3;
    else
        return v1;
    end;
end;