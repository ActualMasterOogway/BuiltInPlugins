local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 7 ]] --[[ Name: useAssertNeverChanges ]]
    -- upvalues: v1 (copy)
    assert(v1.useRef(v2).current == v2, "Value has changed");
end;