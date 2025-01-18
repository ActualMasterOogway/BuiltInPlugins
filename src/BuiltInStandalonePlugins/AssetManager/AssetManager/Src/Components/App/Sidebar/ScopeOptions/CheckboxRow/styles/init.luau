local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".CheckboxRow", {
    BackgroundTransparency = 1
}, {
    l_createStyleRule_0("> .CheckboxRowContents", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, -32, 0, 0)
    }), 
    l_createStyleRule_0(">> .ScopeIcon", {}, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    }), 
    l_createStyleRule_0("> .Component-Checkbox", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.fromScale(0, 1)
    }, {
        l_createStyleRule_0("::UIPadding", {
            PaddingRight = UDim.new(0, 5)
        })
    })
}, {
    CheckboxSize = 16
});