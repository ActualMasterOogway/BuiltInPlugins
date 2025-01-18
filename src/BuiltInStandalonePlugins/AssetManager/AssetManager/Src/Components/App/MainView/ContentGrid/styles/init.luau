local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ContentGrid", {}, {
    l_createStyleRule_0(">> .ItemCell", {}, {
        l_createStyleRule_0("> .ThumbnailContainer", {
            Size = UDim2.new(1, 0, 1, -30)
        }), 
        l_createStyleRule_0("> .TagContainer", {
            Size = UDim2.new(1, 0, 0, 30)
        })
    })
}, {
    CellHeightDiff = 30, 
    CellPadding = UDim2.fromOffset(10, 10)
});