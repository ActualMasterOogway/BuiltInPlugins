local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Parent.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer-DragDropIndicator-Target", {}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, 5)
    }), 
    l_createStyleRule_0("::UIStroke", {
        Color = "$RDLSemanticColorActionPrimaryBrandFill", 
        Thickness = 1
    })
});