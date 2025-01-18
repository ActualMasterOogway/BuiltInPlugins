local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v2) --[[ Line: 5 ]] --[[ Name: instanceIdsToSet ]]
    local v3 = {};
    for _, v5 in v2 do
        v3[v5] = true;
    end;
    return table.freeze(v3);
end;