local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: samePropertyId ]]
    local v4 = false;
    if v2.className == v3.className then
        v4 = false;
        if v2.propertyName == v3.propertyName then
            v4 = v2.isAttribute == v3.isAttribute;
        end;
    end;
    return v4;
end;