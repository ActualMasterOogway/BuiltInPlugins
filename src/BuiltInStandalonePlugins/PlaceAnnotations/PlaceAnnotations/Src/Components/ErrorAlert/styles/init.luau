local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Bin.Common.defineLuaFlags);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-ErrorAlert", {
    BackgroundTransparency = 1, 
    AutomaticSize = Enum.AutomaticSize.XY
}, {
    l_createStyleRule_0("> ImageLabel", {
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> TextLabel", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextSize = "$FontSizeS", 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        RichText = true
    }, {
        l_createStyleRule_0(".Red", {
            TextColor3 = "$TextError"
        })
    }), 
    l_createStyleRule_0(".Popup", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = v2.fflagAnnotationsModernColors and "$SemanticColorSurface100" or "$ForegroundMain"
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    })
});