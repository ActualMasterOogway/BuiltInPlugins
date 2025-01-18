local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
return {
    KnobColor = v1.DialogMainButton, 
    KnobSize = Vector2.new(18, 18), 
    BackgroundStyle = {
        Background = v1.SliderBackground, 
        CornerRadius = UDim.new(0, 8), 
        Size = UDim2.new(1, 0, 0, 6)
    }, 
    ForegroundStyle = {
        Background = v1.DialogMainButton, 
        Color = v1.DialogMainButton, 
        CornerRadius = UDim.new(0, 8), 
        [v2.Disabled] = {
            Background = v1.DialogMainButtonDisabled, 
            Color = v1.DialogMainButtonDisabled
        }
    }
};