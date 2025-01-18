local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-SimpleTab", {}, {
    v1(":: UIPadding", {
        PaddingLeft = UDim.new(0, 1), 
        PaddingRight = UDim.new(0, 1)
    }), 
    v1("> .Contents", {
        AutomaticSize = Enum.AutomaticSize.X, 
        BorderSizePixel = 1, 
        BorderColor3 = "$SecondaryMain", 
        Size = UDim2.fromOffset(0, 32)
    }, {
        v1(".TabSelected", {
            BorderColor3 = "$Divider"
        }), 
        v1("::UIPadding", {
            PaddingLeft = UDim.new(0, 20), 
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingRight = UDim.new(0, 20)
        }), 
        v1("> ImageLabel", {
            ImageColor3 = "$PrimaryText"
        })
    }), 
    v1("> .TopLine", {
        BackgroundColor3 = "$PrimaryMain", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, 3), 
        ZIndex = 2
    }), 
    v1("> .BottomLine", {
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundColor3 = "$SecondaryMain", 
        BackgroundTransparency = 0, 
        Position = UDim2.fromOffset(0, 33), 
        Size = UDim2.new(1, 0, 0, 1)
    }, {
        v1(".TabSelected", {
            BackgroundColor3 = "$ForegroundMuted"
        })
    })
});