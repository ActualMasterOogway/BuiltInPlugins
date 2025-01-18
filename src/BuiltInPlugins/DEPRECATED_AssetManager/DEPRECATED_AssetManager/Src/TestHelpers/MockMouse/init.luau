local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy)
    return (setmetatable({
        Origin = CFrame.new(), 
        UnitRay = Ray.new(Vector3.new(), (Vector3.new())), 
        Target = nil, 
        WheelForward = l_Signal_0.new(), 
        WheelBackward = l_Signal_0.new()
    }, v2));
end;
return v2;