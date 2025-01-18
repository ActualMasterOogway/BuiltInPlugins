local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3) --[[ Line: 7 ]] --[[ Name: getExplorerNodeDepth ]]
    -- upvalues: v1 (copy)
    local v4 = 0;
    local l_parent_0 = v3.parent;
    while l_parent_0 ~= nil and l_parent_0.datum.id ~= v1.rootId do
        v4 = v4 + 1;
        l_parent_0 = l_parent_0.parent;
    end;
    return v4;
end;