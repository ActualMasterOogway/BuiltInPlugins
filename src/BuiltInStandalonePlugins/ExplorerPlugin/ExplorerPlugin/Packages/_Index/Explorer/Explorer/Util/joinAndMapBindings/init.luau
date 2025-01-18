local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
return function(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: joinAndMapBindings ]]
    -- upvalues: v1 (copy)
    return v1.joinBindings({
        v3, 
        v4, 
        v5
    }):map(function(v6) --[[ Line: 12 ]]
        -- upvalues: v2 (copy)
        return v2(unpack(v6));
    end);
end;