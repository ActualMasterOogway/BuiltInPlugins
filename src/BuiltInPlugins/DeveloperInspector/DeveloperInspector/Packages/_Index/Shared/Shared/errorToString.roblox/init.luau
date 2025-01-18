local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
return function(v2) --[[ Line: 9 ]]
    -- upvalues: l_inspect_0 (copy)
    local _ = nil;
    if typeof(v2) == "table" then
        if v2.message and v2.stack then
            return v2.message .. "\n" .. tostring(v2.stack);
        else
            return (l_inspect_0(v2));
        end;
    else
        return (l_inspect_0(v2));
    end;
end;