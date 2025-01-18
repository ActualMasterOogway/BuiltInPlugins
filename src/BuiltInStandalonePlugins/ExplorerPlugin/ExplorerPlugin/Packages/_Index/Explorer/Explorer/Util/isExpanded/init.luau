local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v2) --[[ Line: 5 ]] --[[ Name: isExpanded ]]
    local l_uiState_0 = v2.uiState;
    if l_uiState_0 ~= nil then
        return l_uiState_0.isExpanded;
    else
        return false;
    end;
end;