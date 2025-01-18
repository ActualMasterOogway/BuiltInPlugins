local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.getFFlagDraggerImprovements)();
local v2 = {
    WHITE = Color3.new(1, 1, 1), 
    BLACK = Color3.new(0, 0, 0), 
    GRAY = Color3.new(0.7, 0.7, 0.7), 
    X_AXIS = Color3.new(1, 0, 0), 
    Y_AXIS = Color3.new(0, 1, 0), 
    Z_AXIS = if v1 then Color3.new(0.15, 0.15, 1) else Color3.new(0, 0, 1), 
    WeldJoint = Color3.new(1, 1, 1), 
    RotatingJoint = Color3.new(0, 0, 1), 
    InvalidJoint = Color3.new(1, 0, 0), 
    SizeLimitReached = Color3.new(1, 1, 0)
};
v2.makeDimmed = function(v3) --[[ Line: 20 ]] --[[ Name: makeDimmed ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1 and v3 == v2.Z_AXIS then
        return Color3.new(0, 0, 0.6);
    else
        return v3:Lerp(v2.BLACK, v1 and 0.2 or 0.3);
    end;
end;
local v4 = Color3.new(0.75, 0.75, 0.75);
v2.mostConstrasting = function(v5) --[[ Line: 30 ]] --[[ Name: mostConstrasting ]]
    -- upvalues: v2 (copy), v4 (copy)
    if 0.2126 * v5.R ^ 2.2 + 0.7152 * v5.G ^ 2.2 + 0.0722 * v5.B ^ 2.2 > 0.217637640824031 then
        return v2.BLACK;
    else
        return v4;
    end;
end;
return v2;