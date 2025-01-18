local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-ExpandablePane", {}, {
    v1("> .Header > .Arrow", {
        Image = "$ArrowRightImage", 
        Size = UDim2.fromOffset(16, 16)
    }), 
    v1(".Expanded > .Header > .Arrow", {
        Image = "$ArrowDownImage"
    })
}, {
    ArrowSize = 16, 
    Spacing = 10
});