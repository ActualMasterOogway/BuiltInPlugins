local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return v1.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, v2.Padding), 
        PaddingRight = UDim.new(0, v2.Padding), 
        PaddingLeft = UDim.new(0, v2.Padding), 
        PaddingTop = UDim.new(0, v2.Padding)
    });
end;