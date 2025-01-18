local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer", {}, {
    l_createStyleRule_0(">> .Element", {
        Size = UDim2.new(1, 0, 0, 24)
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(".Selected", {
            BackgroundColor3 = "$ActionSelected", 
            BackgroundTransparency = 0
        }, {
            l_createStyleRule_0(":hover", {
                BackgroundColor3 = "$ActionHover"
            })
        }), 
        l_createStyleRule_0("> .ScopeIcon", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    })
}, {
    RowHeight = 24
});