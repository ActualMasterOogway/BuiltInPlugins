local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.FitFrameOnAxis);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    v4 = v4 or {};
    local l_width_0 = v4.width;
    local v6 = v1.Dictionary.join(v4, {
        axis = v3.Axis.Vertical, 
        minimumSize = UDim2.new(l_width_0, UDim.new(0, 0)), 
        width = v1.None
    });
    return v2.createElement(v3, v6);
end;