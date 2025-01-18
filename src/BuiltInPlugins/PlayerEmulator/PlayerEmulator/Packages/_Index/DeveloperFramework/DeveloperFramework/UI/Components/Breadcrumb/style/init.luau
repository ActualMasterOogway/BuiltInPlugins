local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return require(l_Parent_0.Parent.Dash).join({
    Spacing = 5
}, {
    ["&PropertyCellError"] = {
        TextColor = v1.ErrorText, 
        ErrorImage = {
            Image = "rbxasset://textures/DeveloperFramework/StudioTheme/clear.png", 
            ImageColor3 = v1.ErrorText, 
            Size = UDim2.fromOffset(16, 16)
        }
    }
});