local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return v1.Styling.createStyleSheet("SocialPresence", {
    l_createStyleRule_0(".RibbonElement", {
        Size = UDim2.new(0, 24, 0, 24), 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    }), 
    l_createStyleRule_0(".Button", {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$BackgroundPaper", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = "$ActionActivated", 
            BackgroundTransparency = 0
        })
    })
}, {});