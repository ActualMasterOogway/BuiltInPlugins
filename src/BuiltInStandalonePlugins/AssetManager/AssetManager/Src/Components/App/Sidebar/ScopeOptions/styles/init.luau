local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ScopeOptions", {}, {
    l_createStyleRule_0(">> .Header", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = "$Padding", 
            PaddingLeft = "$Padding", 
            PaddingRight = "$Padding"
        })
    }), 
    l_createStyleRule_0(">> .Description", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = "$PaddingSmall", 
            PaddingLeft = "$Padding", 
            PaddingRight = "$Padding"
        })
    }), 
    l_createStyleRule_0(">> .Component-SearchBar", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = "$PaddingSmall", 
            PaddingRight = "$Padding"
        })
    })
}, {});