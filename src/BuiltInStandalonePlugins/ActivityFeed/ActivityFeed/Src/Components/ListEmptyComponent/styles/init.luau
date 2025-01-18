local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_buttonPaddingHorizontal_0 = v2.buttonPaddingHorizontal;
local l_buttonPaddingVertical_0 = v2.buttonPaddingVertical;
local l_buttonCornerRadius_0 = v2.buttonCornerRadius;
local l_largeIconSize_0 = v2.largeIconSize;
local l_emptyScreenContentPaddingPercentage_0 = v2.emptyScreenContentPaddingPercentage;
return l_createStyleRule_0(".Component-ListEmptyComponent", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTopPercentage = UDim.new(l_emptyScreenContentPaddingPercentage_0, 2)
    }), 
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, 8)
    }), 
    l_createStyleRule_0("> #NoFilterResultsIcon", {
        Size = UDim2.new(0, l_largeIconSize_0, 0, l_largeIconSize_0), 
        Image = "$nofilterresults", 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> #Description", {
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextColor3 = "$TextPrimary", 
        TextSize = v2.normalFontSize, 
        Font = v2.boldedFont
    }), 
    l_createStyleRule_0("> #Edit", {
        AutoButtonColor = false, 
        TextColor3 = "$TextPrimary", 
        BackgroundColor3 = "$SecondaryMain"
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, l_buttonCornerRadius_0)
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingRight = UDim.new(0, l_buttonPaddingHorizontal_0), 
            PaddingLeft = UDim.new(0, l_buttonPaddingHorizontal_0), 
            PaddingTop = UDim.new(0, l_buttonPaddingVertical_0), 
            PaddingBottom = UDim.new(0, l_buttonPaddingVertical_0)
        }), 
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$SecondaryHoverBackground"
        })
    })
});