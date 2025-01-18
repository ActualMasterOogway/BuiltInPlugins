local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(script.Parent.useStore);
return function() --[[ Line: 11 ]] --[[ Name: useDispatch ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2();
    return (v1.useCallback(function(...) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        return v3:dispatch(...);
    end, {
        v3
    }));
end;