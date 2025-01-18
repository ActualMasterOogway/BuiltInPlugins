local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 6 ]] --[[ Name: useRefWithInitial ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(nil);
    if v3.current == nil then
        v3.current = v2();
    end;
    return v3;
end;