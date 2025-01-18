local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Framework);
local _ = v1.UI;
local l_StyleKey_0 = v1.Style.StyleKey;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v5 = Rect.new(3, 3, 13, 13);
return {
    paneStyle = {
        Background = l_StyleKey_0.MainBackground, 
        Image = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
        SliceCenter = v5, 
        Border = {
            Background = l_StyleKey_0.Border, 
            Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
            SliceCenter = v5
        }, 
        [l_StyleModifier_0.Selected] = {
            Background = l_StyleKey_0.DialogMainButton, 
            Image = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
            SliceCenter = v5, 
            Border = {
                Background = l_StyleKey_0.Light, 
                Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
                SliceCenter = v5
            }
        }
    }
};