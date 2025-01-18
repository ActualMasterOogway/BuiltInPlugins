local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v2) --[[ Line: 5 ]]
    local l_children_0 = v2.children;
    if l_children_0 then
        return l_children_0.treeDescendantCount;
    else
        return 1;
    end;
end;