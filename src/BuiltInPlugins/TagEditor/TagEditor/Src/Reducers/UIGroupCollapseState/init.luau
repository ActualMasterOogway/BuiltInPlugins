local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 4 ]]
    v2 = v2 or {};
    if v3.type == "SetUIGroupCollapseState" then
        return v3.data;
    else
        return v2;
    end;
end;