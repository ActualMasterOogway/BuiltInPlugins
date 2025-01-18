local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Bin.Common.defineLuaFlags);
return l_createStyleRule_0(".Component-ResolveButton", {
    Text = "", 
    Size = UDim2.fromOffset(24, 24), 
    BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFill" or "$ResolveIconBase", 
    BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFillTransparency" or 0.3
}, {
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = if v2.fflagAnnotationsModernColors then nil else "$ResolveIconHovered", 
        BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFillHoverTransparency" or nil
    }), 
    l_createStyleRule_0(":pressed", {
        BackgroundColor3 = if v2.fflagAnnotationsModernColors then nil else "$ResolveIconSelected", 
        BackgroundTransparency = v2.fflagAnnotationsModernColors and "$SemanticColorActionSecondaryFillPressTransparency" or nil
    }), 
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(1, 0)
    }), 
    l_createStyleRule_0("> ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(14, 14), 
        Image = "$ResolveIcon", 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0(".Resolved", {}, {
        l_createStyleRule_0("> ImageLabel", {
            Image = "$ResolveIconResolved"
        })
    }), 
    l_createStyleRule_0(".Disabled", {}, {
        l_createStyleRule_0("> ImageLabel", {
            ImageTransparency = 0.4
        })
    })
});