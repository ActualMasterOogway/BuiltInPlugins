local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-MappingsListRow", {
    Size = UDim2.new(1, 0, 0, 20), 
    Position = UDim2.new(0.5, 0, 0, 0)
}, {
    l_createStyleRule_0("> TextButton", {
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0(">> .DestKey", {
        TextColor3 = "$TextSecondary", 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Size = UDim2.new(0.6, 0, 1, 0)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingRight = UDim.new(0, 8)
        })
    }), 
    l_createStyleRule_0(">> .SrcKey", {
        TextColor3 = "$TextPrimary", 
        TextXAlignment = Enum.TextXAlignment.Center, 
        BackgroundColor3 = "$MappingLabel", 
        Size = UDim2.new(0.4, 0, 1, 0)
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$MappingLabelHover"
        })
    })
});