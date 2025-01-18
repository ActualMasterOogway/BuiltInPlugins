local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".HeaderBar", {}, {
    l_createStyleRule_0("> .HeaderTitle", {
        Size = UDim2.new(0, 30, 1, 0)
    }, {
        l_createStyleRule_0("::UIFlexItem", {
            FlexMode = Enum.UIFlexMode.Grow
        }), 
        l_createStyleRule_0("> .ScopeThumbnail", {
            Size = UDim2.fromOffset(20, 20)
        }, {
            l_createStyleRule_0(".SearchResults", {
                Image = "$SearchIcon"
            }), 
            l_createStyleRule_0(".User", {
                Image = "$UserLargeDefaultIcon"
            }), 
            l_createStyleRule_0(".Group", {
                Image = "$GroupLargeDefaultIcon"
            }), 
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    })
}, {});