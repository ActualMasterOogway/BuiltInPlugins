local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
local v2 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkFixTextInputWidth();
return v1(".Component-TextInput", {}, {
    v1(".Input", {
        ClipsDescendants = true
    }), 
    v1(">> TextBox", {
        Font = Enum.Font.SourceSans, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        PlaceholderTextColor3 = "$TextDisabled", 
        TextColor3 = "$TextPrimary", 
        TextSize = "$InputTextSize"
    }), 
    v1(".Compact >> TextBox", {
        TextSize = "$CompactInputTextSize"
    }), 
    v1(".PropertyCellError >> TextBox", {
        TextColor3 = "$TextError"
    })
}, {
    ExtraComponentSpacing = 8, 
    Size = UDim2.new(1, 0, 0, 32), 
    InputTextSize = 18, 
    CompactInputTextSize = 14, 
    HorizontalComponentSpacing = v2 and 10 or 8, 
    VerticalComponentSpacing = v2 and 5 or 4
});