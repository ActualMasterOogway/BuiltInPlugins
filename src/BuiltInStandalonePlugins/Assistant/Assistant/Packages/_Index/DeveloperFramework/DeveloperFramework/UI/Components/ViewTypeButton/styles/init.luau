local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons);
return v1(".Component-ViewTypeButton", {}, {
    v1("> .ButtonContainer", {
        Size = UDim2.fromOffset(100, 32)
    }, {
        v1(".Icon", {
            Size = UDim2.fromOffset(32, 32)
        }), 
        v1("> .ImageContainer", {
            Size = UDim2.fromOffset(32, 32)
        }, {
            if v2() then v1("> ImageLabel .Grid", {
                Image = "$GridImage"
            }) else nil, 
            if v2() then v1("> ImageLabel .List", {
                Image = "$ListImage"
            }) else nil
        })
    }), 
    v1("> .SliderContainer", {
        Size = UDim2.fromOffset(100, 32)
    })
}, {
    ListIcon = ("%*List.png"):format("rbxasset://textures/MaterialFramework/"), 
    GridIcon = ("%*Grid.png"):format("rbxasset://textures/MaterialFramework/"), 
    SliderValueMin = 60, 
    SliderValueMax = 200, 
    SliderSnapIncrement = 10, 
    SliderVerticalDragTolerance = 300
});