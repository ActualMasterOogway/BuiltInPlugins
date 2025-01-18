local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2) --[[ Line: 5 ]] --[[ Name: getTangentNameForSide ]]
    if v2 == "Left" then
        return "LeftTangent";
    else
        return "RightTangent";
    end;
end;