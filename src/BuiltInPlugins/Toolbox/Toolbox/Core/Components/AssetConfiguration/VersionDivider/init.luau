local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
return function(v2) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        AnchorPoint = v2.AnchorPoint, 
        Position = v2.Position, 
        Size = v2.Size, 
        BackgroundColor3 = Color3.fromRGB(151, 151, 151), 
        BorderSizePixel = 0, 
        LayoutOrder = v2.LayoutOrder or 0
    });
end;