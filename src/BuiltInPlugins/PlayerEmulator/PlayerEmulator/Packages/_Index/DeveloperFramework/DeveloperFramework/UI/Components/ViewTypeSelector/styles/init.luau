local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorUpdate);
local v3 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons);
local v4 = UDim2.fromOffset(50, 32);
local v5 = UDim2.fromOffset(16, 16);
return v1(".Component-ViewTypeSelector", {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    Size = v4, 
    Width = 120
}, {
    if v2() then v1(".IconOnly", {
        Size = v5
    }) else nil, 
    if v3() then v1(".List > .Component-SelectInput", {}, {
        v1("> ImageButton", {
            Image = "$ListImage"
        }, {}), 
        v1("> TextButton > #SelectedItemIcon", {
            Image = "$ListImage"
        }, {})
    }) else nil, 
    if v3() then v1(".Grid > .Component-SelectInput", {}, {
        v1("> ImageButton", {
            Image = "$GridImage"
        }, {}), 
        v1("> TextButton > #SelectedItemIcon", {
            Image = "$GridImage"
        }, {})
    }) else nil
}, {
    ListIcon = ("%*List.png"):format("rbxasset://textures/MaterialFramework/"), 
    GridIcon = ("%*Grid.png"):format("rbxasset://textures/MaterialFramework/"), 
    MenuHeight = 64, 
    MenuHeightSlider = 96, 
    SizeDefault = v4, 
    SizeIconOnly = v5
});