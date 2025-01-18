local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (setmetatable({
        Icon = "rbxasset://SystemCursors/Arrow", 
        Origin = CFrame.new(), 
        UnitRay = Ray.new(Vector3.new(), (Vector3.new())), 
        Target = nil, 
        WheelForward = v1.new(), 
        WheelBackward = v1.new(), 
        Button1Down = v1.new(), 
        Button1Up = v1.new(), 
        DragEnter = v1.new(), 
        Move = v1.new()
    }, v2));
end;
v2.Destroy = function(_) --[[ Line: 24 ]] --[[ Name: Destroy ]]

end;
return v2;