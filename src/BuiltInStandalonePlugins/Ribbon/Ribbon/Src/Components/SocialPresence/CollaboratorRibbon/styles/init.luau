local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-CollaboratorRibbon", {}, {
    l_createStyleRule_0("> #CollaboratorContainer", {
        LayoutOrder = 1
    }), 
    l_createStyleRule_0("> #CollaboratorButton", {
        LayoutOrder = 2
    }), 
    l_createStyleRule_0(">> .RibbonElement", {
        Size = "$AvatarXS"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = "$GlobalRadiusCircle"
        })
    }), 
    l_createStyleRule_0(">> .Component-OverflowBubble", {
        BackgroundTransparency = "$BackgroundNonTransparent", 
        BackgroundColor3 = "$Gray70", 
        LayoutOrder = 4, 
        ZIndex = 4
    }, {
        l_createStyleRule_0("> TextLabel", {
            TextSize = "$FontSize75", 
            TextColor3 = "$SemanticColorContentStaticLight", 
            Font = Enum.Font.SourceSansBold, 
            ZIndex = 5
        })
    }), 
    l_createStyleRule_0(">> .ThumbnailOverlap", {
        Size = UDim2.fromOffset(20, 24)
    })
});