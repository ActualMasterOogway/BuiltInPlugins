local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".LayerViewCell", {
    BorderSizePixel = 1, 
    BorderColor3 = "$SecondaryHoverBackground", 
    ClipsDescendants = true
}, {
    l_createStyleRule_0(".Section", {
        BackgroundColor3 = "$SecondaryHoverBackground", 
        BackgroundTransparency = 0
    }), 
    l_createStyleRule_0(">> .ActionIcon", {
        Size = UDim2.fromOffset(12, 12)
    })
}, {
    Indent = 20, 
    CellSpacing = 5, 
    ActionIconSize = 12
});