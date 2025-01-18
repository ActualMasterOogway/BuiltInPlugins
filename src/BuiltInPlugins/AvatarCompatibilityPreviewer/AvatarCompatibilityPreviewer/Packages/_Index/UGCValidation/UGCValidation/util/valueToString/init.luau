local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local function _(v2, v3) --[[ Line: 5 ]] --[[ Name: round ]]
    local v4 = 10 ^ (v3 or 0);
    return math.floor(v2 * v4 + 0.5) / v4;
end;
return function(v6) --[[ Line: 10 ]] --[[ Name: valueToString ]]
    -- upvalues: v1 (copy)
    local v7 = typeof(v6);
    if v6 == v1.None then
        return "not defined";
    elseif v7 == "Vector3" then
        return string.format("%d, %d, %d", math.floor(v6.X * 100 + 0.5) / 100, math.floor(v6.Y * 100 + 0.5) / 100, math.floor(v6.Z * 100 + 0.5) / 100);
    elseif v7 == "Color3" then
        return string.format("%d, %d, %d", math.floor(v6.r * 255), math.floor(v6.g * 255), (math.floor(v6.b * 255)));
    else
        return (tostring(v6));
    end;
end;