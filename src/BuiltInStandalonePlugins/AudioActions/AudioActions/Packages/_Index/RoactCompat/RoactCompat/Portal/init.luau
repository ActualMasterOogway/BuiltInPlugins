local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(script.Parent.warnOnce);
return function(v3) --[[ Line: 22 ]] --[[ Name: PortalComponent ]]
    -- upvalues: v2 (copy), v1 (copy)
    if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
        v2("Roact.Portal", "Please use the createPortal API on ReactRoblox instead");
    end;
    return v1.createPortal(v3.children, v3.target);
end;