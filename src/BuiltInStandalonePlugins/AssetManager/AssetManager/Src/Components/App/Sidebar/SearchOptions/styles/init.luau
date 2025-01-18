local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".SearchOptions", {}, {
    l_createStyleRule_0("> .SearchOptionsContents", {}, {
        l_createStyleRule_0("::UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Fill
        })
    }), 
    l_createStyleRule_0(">> .FilterSection", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 5)
        })
    }), 
    l_createStyleRule_0(">> .SourceSection", {}, {
        l_createStyleRule_0("::UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Fill
        }), 
        l_createStyleRule_0(">> .RadioList", {}, {
            l_createStyleRule_0("::UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            l_createStyleRule_0("::UIPadding", {
                PaddingBottom = "$PaddingSmall"
            })
        })
    }), 
    l_createStyleRule_0(">> .SearchOptionHeading", {
        Size = UDim2.new(1, 0, 0, 30)
    })
});