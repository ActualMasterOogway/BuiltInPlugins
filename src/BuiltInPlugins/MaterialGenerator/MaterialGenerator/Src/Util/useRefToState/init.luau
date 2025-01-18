local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 30 ]] --[[ Name: useRefToState ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(v2);
    v3.current = v2;
    return v3;
end;