local l_Parent_0 = script.Parent.Parent;
local l_includes_0 = require(l_Parent_0.Parent.Dash).includes;
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: hasTag ]]
    -- upvalues: l_includes_0 (copy)
    if v2 and v3 then
        return (l_includes_0(v2:split(" "), v3));
    else
        return false;
    end;
end;