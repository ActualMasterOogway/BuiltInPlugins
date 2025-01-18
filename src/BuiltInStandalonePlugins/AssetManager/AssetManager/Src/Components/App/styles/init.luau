local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".App", {}, {
    l_createStyleRule_0(">> .TopBar", {
        Size = UDim2.new(1, 0, 0, 42)
    }), 
    l_createStyleRule_0(">> .Explorer", {
        Size = UDim2.new(1, 0, 1, -42)
    }), 
    l_createStyleRule_0(">> .MainContents", {
        Size = UDim2.new(1, 0, 1, -42)
    }, {
        l_createStyleRule_0("::UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Fill
        }), 
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 1)
        }), 
        l_createStyleRule_0(".HasLoadingBar", {
            Size = UDim2.new(1, 0, 1, -50)
        })
    }), 
    l_createStyleRule_0(">> .ProgressBar", {
        Size = UDim2.new(1, 0, 0, 8)
    }), 
    l_createStyleRule_0("> .SidebarButton", {
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 5, 1, -10)
    }, {
        l_createStyleRule_0("> Frame", {}, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = "$PaddingSmall", 
                PaddingRight = "$PaddingSmall", 
                PaddingTop = "$PaddingSmall", 
                PaddingBottom = "$PaddingSmall"
            }), 
            l_createStyleRule_0("> ImageLabel", {
                Size = UDim2.new(0, 12, 0, 12)
            })
        })
    })
}, {
    DefaultSizeSidebar = UDim.new(0.2, 0), 
    MinimumSizeSidebar = UDim.new(0, 100), 
    DefaultSizeMainView = UDim.new(0.8, 0), 
    MinimumSizeMainView = UDim.new(0, 400)
});