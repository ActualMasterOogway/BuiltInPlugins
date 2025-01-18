local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-TextInfo", {}, {
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, 8)
    }), 
    l_createStyleRule_0(">> .TitleText", {
        TextColor3 = "$TextPrimary", 
        Font = Enum.Font.SourceSansSemibold
    }), 
    l_createStyleRule_0(">> .SubtitleText", {
        TextColor3 = "$TextSecondary", 
        Font = Enum.Font.SourceSansSemibold
    }), 
    l_createStyleRule_0(">> .LoadingIconContainer", {
        Size = "$IconSize"
    }), 
    l_createStyleRule_0(">> .LoadingIcon", {
        Size = "$IconSize", 
        Image = "$LoadingSpinnerImage", 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }), 
    l_createStyleRule_0(">> .StatusTextFrame", {
        Size = UDim2.new(1, 0, 0, 20)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            Padding = UDim.new(0, 4), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        l_createStyleRule_0(">> .StatusText", {
            TextColor3 = "$TextPrimary", 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    })
}, {
    IconSize = UDim2.fromOffset(16, 16), 
    IconToContentPadding = UDim.new(0, 8)
});