local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Widget-Button", {
    BorderSizePixel = 3, 
    BorderMode = Enum.BorderMode.Outline, 
    Size = UDim2.new(0, 36, 0, 36), 
    AnchorPoint = Vector2.new(0.5, 0.5), 
    TextScaled = true
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(1, 0)
    })
});