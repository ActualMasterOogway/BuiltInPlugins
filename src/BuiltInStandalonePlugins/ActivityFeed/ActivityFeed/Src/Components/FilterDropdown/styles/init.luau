local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_defaultPadding_0 = v2.defaultPadding;
local l_smallPadding_0 = v2.smallPadding;
local v6 = v2.normalFontSize + l_defaultPadding_0 * 2;
local l_defaultIconSize_0 = v2.defaultIconSize;
local l_bubbleCornerRadius_0 = v2.bubbleCornerRadius;
return l_createStyleRule_0(".Component-FilterDropdown", {
    BorderSizePixel = 1, 
    BackgroundColor3 = "$BackgroundPaper", 
    BorderColor3 = "$BackgroundDefault"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, l_bubbleCornerRadius_0)
    }), 
    l_createStyleRule_0("::UIStroke", {
        Color = "$Divider"
    }), 
    l_createStyleRule_0("> #Content", {
        Size = UDim2.new(1, 0, 0, v6)
    }, {
        l_createStyleRule_0("::UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
        }), 
        l_createStyleRule_0("> #Selected", {
            TextColor3 = "$TextPrimary", 
            TextSize = v2.normalFontSize, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, l_defaultPadding_0), 
                PaddingTop = UDim.new(0, l_defaultPadding_0), 
                PaddingBottom = UDim.new(0, l_defaultPadding_0), 
                PaddingRight = UDim.new(0, 0)
            })
        }), 
        l_createStyleRule_0("> #DropdownIconContainer", {
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            l_createStyleRule_0("::UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, l_smallPadding_0), 
                PaddingRight = UDim.new(0, l_smallPadding_0)
            }), 
            l_createStyleRule_0("> #DropdownIcon", {
                Size = UDim2.new(0, l_defaultIconSize_0, 0, l_defaultIconSize_0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Image = "$arrowdownicon"
            })
        })
    }), 
    l_createStyleRule_0(".ContentHovered", {}, {
        l_createStyleRule_0("::UIStroke", {
            Color = "$ActionHover"
        }), 
        l_createStyleRule_0(">> #DropdownIconContainer", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = "$ActionHover"
        })
    })
});