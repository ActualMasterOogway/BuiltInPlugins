local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ContentList", {}, {
    l_createStyleRule_0("> .HeaderRow", {
        Size = UDim2.new(1, 0, 0, 25)
    }, {
        l_createStyleRule_0(">> .Ascending", {
            Image = "$ArrowUpIcon"
        }), 
        l_createStyleRule_0(">> .Descending", {
            Image = "$ArrowDownIcon"
        })
    }), 
    l_createStyleRule_0("> .ItemList", {
        Size = UDim2.new(1, 0, 1, -25)
    })
}, {
    ColumnMinSize = UDim.new(0, 60), 
    RowHeight = 50
});