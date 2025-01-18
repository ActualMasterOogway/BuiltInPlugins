local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v2 = require(l_script_FirstAncestor_0.Util.isExpanded);
return function(v3) --[[ Line: 6 ]] --[[ Name: isNodeVisible ]]
    -- upvalues: v2 (copy)
    local l_v3_0 = v3;
    while true do
        if l_v3_0.parent == nil then
            return true;
        elseif not v2(l_v3_0.parent) then
            return false;
        else
            l_v3_0 = l_v3_0.parent;
        end;
    end;
end;