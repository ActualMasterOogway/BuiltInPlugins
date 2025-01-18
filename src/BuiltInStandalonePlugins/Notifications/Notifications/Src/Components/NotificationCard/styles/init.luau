local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_createStyleRule_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleRule;
local l_TRAY_WIDTH_0 = require(l_Parent_0.Src.Util.TraySize).TRAY_WIDTH;
local v3 = l_TRAY_WIDTH_0 - 11;
local v4 = l_TRAY_WIDTH_0 - 20 - 65;
local v5 = UDim2.new(0, 20, 0, 20);
local v6 = UDim2.new(0, 16, 0, 16);
return l_createStyleRule_0(".Component-InnerNotificationCard", {
    BackgroundColor3 = "$BackgroundPaper", 
    BorderSizePixel = 0, 
    Size = UDim2.new(0, v3, 0, 0), 
    AutomaticSize = Enum.AutomaticSize.Y
}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 6), 
        PaddingRight = UDim.new(0, 3), 
        PaddingTop = UDim.new(0, 0), 
        PaddingBottom = UDim.new(0, 0)
    }), 
    l_createStyleRule_0("> #InnerCard", {
        Size = UDim2.new(1, 0, 1, 0), 
        TextTransparency = 1
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = "$NotificationContentPadding", 
            PaddingRight = "$NotificationContentPaddingXL", 
            PaddingTop = "$NotificationContentPadding", 
            PaddingBottom = "$NotificationContentPadding"
        }), 
        l_createStyleRule_0("::UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = "$NotificationContentPadding"
        }), 
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("> .Component-NotificationCard-User", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        l_createStyleRule_0("> #Icon", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = v5
        }), 
        l_createStyleRule_0("> #Content", {
            Size = UDim2.new(0, v4, 0, 0)
        }), 
        l_createStyleRule_0("> #StatusIndicator", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("> #Indicator", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v6
            })
        })
    })
}, {
    NotificationContentPadding = UDim.new(0, 6), 
    NotificationContentPaddingXL = UDim.new(0, 12)
});