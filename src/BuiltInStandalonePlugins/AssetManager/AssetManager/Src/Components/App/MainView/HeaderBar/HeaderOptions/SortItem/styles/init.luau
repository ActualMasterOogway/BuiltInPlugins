local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".SortItem", {}, {
    l_createStyleRule_0("> ImageLabel .ArrowUp", {
        Image = "$ArrowUpIcon"
    }), 
    l_createStyleRule_0("> ImageLabel .ArrowDown", {
        Image = "$ArrowDownIcon"
    })
}, {
    SortItemSize = UDim2.new(0, 150, 0, 24)
});