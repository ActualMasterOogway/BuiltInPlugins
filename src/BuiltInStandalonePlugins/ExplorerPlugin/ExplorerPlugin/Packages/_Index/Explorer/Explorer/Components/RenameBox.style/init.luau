local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Parent.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer-RenameBox", {}, {
    l_createStyleRule_0(">> .Explorer-RenameBox-Background", {
        Position = UDim2.new(0, -4, 0, 0), 
        Size = UDim2.new(1, 4, 1, 0)
    }), 
    l_createStyleRule_0(">> .Explorer-RenameBox-BackgroundInner", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.new(1, -2, 1, -2)
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        l_createStyleRule_0("::UIStroke", {
            Color = "$RDLSemanticColorActionPrimaryBrandFill", 
            Thickness = 2
        })
    }), 
    l_createStyleRule_0(">> TextBox", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Font = Enum.Font.SourceSans, 
        Size = UDim2.fromScale(1, 1), 
        TextColor3 = "$RDLSemanticColorContentMuted", 
        TextSize = 17.598, 
        TextXAlignment = Enum.TextXAlignment.Left
    })
});