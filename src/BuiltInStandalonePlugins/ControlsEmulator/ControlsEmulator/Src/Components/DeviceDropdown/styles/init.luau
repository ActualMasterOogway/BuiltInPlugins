local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleConstants);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_deviceHeaderHeight_0 = v2.deviceHeaderHeight;
return l_createStyleRule_0(".Component-DeviceDropdown", {
    Size = UDim2.new(0, 200, 0, l_deviceHeaderHeight_0 - 10), 
    Position = UDim2.new(0, 0, 0, 0), 
    BorderSizePixel = 1, 
    BorderColor3 = "$BackgroundDefault", 
    BackgroundColor3 = "$BackgroundPaper"
}, {
    l_createStyleRule_0("::UICorner", {
        CornerRadius = UDim.new(0, v2.deviceSelectorCornerRadius)
    }), 
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ActionHover"
    }), 
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 8)
    }), 
    l_createStyleRule_0("> #Selected", {
        TextColor3 = "$TextPrimary", 
        TextSize = v2.normalFontSize, 
        TextXAlignment = Enum.TextXAlignment.Left
    }), 
    l_createStyleRule_0("> #Menu", {
        TextColor3 = "$TextPrimary", 
        TextSize = v2.normalFontSize
    }), 
    l_createStyleRule_0("> #ButtonContainer", {
        Position = UDim2.new(1, -16, 0, 0), 
        Size = UDim2.new(0, 16, 1, 0)
    }, {
        l_createStyleRule_0("> #OpenSelectorButton", {
            Size = UDim2.new(0, 16, 0, 16), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0(".Open", {
                Image = "$DownArrow"
            }), 
            l_createStyleRule_0(".Close", {
                Image = "$RightArrow"
            })
        })
    })
});