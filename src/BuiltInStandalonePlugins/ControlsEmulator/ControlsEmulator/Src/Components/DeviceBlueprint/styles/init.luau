local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleConstants);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Component-DeviceBlueprint", {
    BorderSizePixel = 0, 
    BackgroundColor3 = "$BlueprintBackgroundColor", 
    Position = UDim2.new(0.5, 0, 0, 0), 
    AnchorPoint = Vector2.new(0.5, 0)
}, {
    l_createStyleRule_0("::UIAspectRatioConstraint", {
        AspectRatio = 1.5
    }), 
    l_createStyleRule_0("::UISizeConstraint", {
        MaxSize = Vector2.new(10000, 420), 
        MinSize = Vector2.new(300, 200)
    }), 
    l_createStyleRule_0("::UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical
    }), 
    l_createStyleRule_0("> #ControllerLayout", {
        BackgroundColor3 = "$BlueprintBackgroundColor"
    }, {
        l_createStyleRule_0(".Mappings-Visible::UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = "$BlueprintWithMappingsPadding", 
            PaddingRight = "$BlueprintWithMappingsPadding"
        })
    }), 
    l_createStyleRule_0(">> #GamepadBlueprint", {
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0.793, 0), 
        ZIndex = -1, 
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0("> TextLabel", {
        TextSize = v2.normalFontSize, 
        Font = v2.defaultFont, 
        TextColor3 = "$TextPrimary", 
        Size = UDim2.new(1, 0, 0, 30), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    }), 
    l_createStyleRule_0("> TextButton", {
        TextSize = v2.normalFontSize, 
        Font = v2.defaultFont, 
        TextColor3 = "$TextPrimary", 
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    })
});