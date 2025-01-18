local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".FlyoutItem", {
    AutomaticSize = Enum.AutomaticSize.Y
}, {
    l_createStyleRule_0("> .Contents", {
        Size = UDim2.new(1, 0, 0, 40)
    }, {
        l_createStyleRule_0(">> .Label", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5)
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 5), 
                PaddingBottom = UDim.new(0, 5)
            })
        }), 
        l_createStyleRule_0("> .Icon", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            l_createStyleRule_0("::UIPadding", {
                PaddingRight = UDim.new(0, 10)
            }), 
            l_createStyleRule_0(".Arrow", {}, {
                l_createStyleRule_0("> ImageLabel", {
                    Image = "$ArrowRightIcon"
                })
            }), 
            l_createStyleRule_0(".Checkmark", {}, {
                l_createStyleRule_0("> ImageLabel", {
                    Image = "$CheckmarkIcon"
                })
            })
        })
    })
}, {
    IconWidth = 26, 
    BaseWidth = 20, 
    OffsetWidth = 36
});