local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 10 ]] --[[ Name: usePrevious ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v3 (copy), v2 (copy)
        v3.current = v2;
    end);
    return v3.current;
end;