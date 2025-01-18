local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
local v3 = require(l_Parent_0.UI.Components.Image);
return {
    Padding = 6, 
    ImageSize = UDim2.new(0, 20, 0, 20), 
    BackgroundStyle = {
        Background = v3, 
        BackgroundStyle = {
            Image = "rbxasset://textures/GameSettings/RadioButton.png", 
            Color = v1.MainBackground
        }, 
        [v2.Selected] = {
            BackgroundStyle = {
                Image = "rbxasset://textures/GameSettings/RadioButton.png", 
                Color = v1.MainBackground
            }, 
            Foreground = v3, 
            ForegroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png", 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.4, 0, 0.4, 0)
            }
        }, 
        [v2.Disabled] = {
            BackgroundStyle = {
                Image = "rbxasset://textures/GameSettings/RadioButton.png", 
                Color = v1.MainBackground
            }
        }, 
        [v2.Indeterminate] = {
            BackgroundStyle = {
                Image = "rbxasset://textures/GameSettings/RadioButton.png", 
                Color = v1.MainBackground
            }, 
            Foreground = v3, 
            ForegroundStyle = {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v1.RadioButtonDisabledImage, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.4, 0, 0.4, 0)
            }
        }
    }
};