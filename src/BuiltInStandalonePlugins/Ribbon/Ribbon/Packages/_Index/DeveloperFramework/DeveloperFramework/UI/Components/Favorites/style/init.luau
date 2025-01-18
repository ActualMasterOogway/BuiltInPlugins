local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.Image);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.Style.StyleKey);
local v4 = Color3.fromRGB(246, 183, 2);
local v5 = {
    Foreground = v1, 
    ForegroundStyle = {
        Color = v4, 
        Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png"
    }
};
return {
    ElementPadding = UDim.new(0, 5), 
    Size = UDim2.new(1, 0, 0, 20), 
    IconSize = UDim2.fromOffset(14, 14), 
    Button = {
        Filled = v5, 
        Unfilled = {
            Foreground = v1, 
            ForegroundStyle = {
                Color = v3.MainText, 
                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_stroke_white.png"
            }, 
            [v2.Hover] = {
                ForegroundStyle = {
                    Color = v4, 
                    Image = "rbxasset://textures/StudioToolbox/AssetPreview/star_filled.png"
                }
            }
        }
    }, 
    Spacing = 5, 
    Text = {
        Font = Enum.Font.SourceSans, 
        TextColor = v3.MainText, 
        TextSize = 18
    }
};