local _ = require(script.ReactInternalTypes);
local _ = require(script.ReactRootTags);
return function(v2) --[[ Line: 17 ]] --[[ Name: initialize ]]
    local v3 = require(script.ReactFiberHostConfig);
    for v4, v5 in pairs(v2) do
        v3[v4] = v5;
    end;
    return require(script.ReactFiberReconciler);
end;