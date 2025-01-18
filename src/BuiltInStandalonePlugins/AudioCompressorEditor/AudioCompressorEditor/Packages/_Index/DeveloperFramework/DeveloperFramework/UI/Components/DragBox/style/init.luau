local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.UI.Components.Image);
local v4 = Rect.new(3, 0, 4, 6);
local v5 = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    Color = v1.SliderKnobColor, 
    Image = v1.SliderKnobImage, 
    Size = UDim2.new(0, 18, 0, 18), 
    [v2.Disabled] = {
        Color = v1.Button
    }
};
return {
    KnobSize = Vector2.new(18, 18), 
    Background = v3, 
    BackgroundStyle = {
        AnchorPoint = Vector2.new(0, 0.5), 
        Color = v1.SliderBackground, 
        Position = UDim2.new(0, 0, 0.5, 0), 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(UDim.new(1, 0), UDim.new(0, 6)), 
        SliceCenter = v4, 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }, 
    OutlineStyle = {
        Color = Color3.fromRGB(87, 87, 87)
    }, 
    KnobBackground = v3, 
    KnobBackgroundStyle = v5
};