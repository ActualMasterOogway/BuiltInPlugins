local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return {
    BackgroundColor = require(l_Parent_0.Framework).Style.StyleKey.ScrollBarBackground, 
    InitialDistance = 6.3, 
    Ambient = Color3.fromRGB(120, 120, 135), 
    AmbientColor = Color3.fromRGB(120, 120, 135), 
    LightColor = Color3.fromRGB(316, 316, 331), 
    LightDirection = Vector3.new(10, -10, 10, 0), 
    RecenterModelOnUpdate = true, 
    Use2022Materials = true, 
    ["&CornerBox"] = {
        CornerRadius = UDim.new(0, 4)
    }
};