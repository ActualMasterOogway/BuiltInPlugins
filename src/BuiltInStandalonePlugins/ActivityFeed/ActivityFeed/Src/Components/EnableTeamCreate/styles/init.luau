local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_defaultPadding_0 = v2.defaultPadding;
local l_buttonPaddingVertical_0 = v2.buttonPaddingVertical;
local l_buttonPaddingHorizontal_0 = v2.buttonPaddingHorizontal;
local l_largeIconSize_0 = v2.largeIconSize;
local l_normalFontSize_0 = v2.normalFontSize;
local l_boldedFont_0 = v2.boldedFont;
local l_emptyScreenContentPaddingPercentage_0 = v2.emptyScreenContentPaddingPercentage;
return l_createStyleRule_0(".Component-EnableTeamCreate", {
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(l_emptyScreenContentPaddingPercentage_0, 0)
    }), 
    l_createStyleRule_0("::UIListLayout", {
        Padding = UDim.new(0, l_defaultPadding_0)
    }), 
    l_createStyleRule_0("> #UnsavedExperienceIcon", {
        Size = UDim2.new(0, l_largeIconSize_0, 0, l_largeIconSize_0), 
        Image = "$unsavedexperience", 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> #Text", {
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextColor3 = "$TextPrimary", 
        TextSize = l_normalFontSize_0, 
        Font = l_boldedFont_0
    }), 
    l_createStyleRule_0("> #Button", {
        BackgroundColor3 = "$PrimaryMain", 
        TextColor3 = "$TextContrast", 
        TextSize = l_normalFontSize_0
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, l_buttonPaddingVertical_0), 
            PaddingBottom = UDim.new(0, l_buttonPaddingVertical_0), 
            PaddingLeft = UDim.new(0, l_buttonPaddingHorizontal_0), 
            PaddingRight = UDim.new(0, l_buttonPaddingHorizontal_0)
        }), 
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$PrimaryHoverBackground"
        })
    })
});