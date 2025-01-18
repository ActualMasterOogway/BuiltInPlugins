local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.warnOnce);
return function(v3) --[[ Line: 21 ]] --[[ Name: oneChild ]]
    -- upvalues: v2 (copy), v1 (copy)
    if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
        v2("oneChild", "You likely don't need this at all! If you were assigning children " .. "via `React.oneChild(someChildren)`, you can simply use " .. "`someChildren` directly.");
    end;
    if not v3 then
        return nil;
    else
        local v4, v5 = next(v3);
        if not v5 then
            return nil;
        else
            if next(v3, v4) then
                error("Expected at most one child, had more than one child.", 2);
            end;
            return v1.Children.only(v5);
        end;
    end;
end;