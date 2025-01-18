local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v2) --[[ Line: 5 ]] --[[ Name: propertyIdToString ]]
    if v2.isAttribute then
        return v2.className .. "Attribute" .. v2.propertyName;
    else
        return v2.className .. v2.propertyName;
    end;
end;