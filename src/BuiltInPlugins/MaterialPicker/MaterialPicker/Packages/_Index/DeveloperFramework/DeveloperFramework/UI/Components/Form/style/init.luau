local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
return {
    FormItem = {
        Spacing = 6, 
        StatusIconSize = 20, 
        HelpIconSize = 16, 
        DepthPadding = 10, 
        WithChildrenPadding = 10, 
        Padding = 28, 
        StatusIconError = "rbxasset://textures/StudioSharedUI/alert_error@2x.png", 
        StatusIconWarning = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png", 
        HelpIcon = "rbxasset://textures/StudioSharedUI/Help.png", 
        IconColor = v1.Icon, 
        Arrow = {
            Color = v1.MainText, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [v2.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        }, 
        Font = Enum.Font.SourceSans, 
        FontSize = 18
    }
};