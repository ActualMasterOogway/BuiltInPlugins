local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.shallowEqual);
return function() --[[ Line: 8 ]] --[[ Name: useRememberLastValue ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useRef(nil);
    return v1.useCallback(function(v4) --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v2 (ref)
        if v3.current ~= nil and v2(v3.current, v4) then
            return v3.current;
        else
            v3.current = v4;
            return v4;
        end;
    end, {});
end;