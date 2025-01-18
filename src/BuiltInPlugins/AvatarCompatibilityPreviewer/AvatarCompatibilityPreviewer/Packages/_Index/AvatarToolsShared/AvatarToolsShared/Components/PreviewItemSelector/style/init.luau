local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_StyleKey_0 = require(l_Parent_0.Framework).Style.StyleKey;
return {
    EquippedIcon = "rbxasset://textures/LayeredClothingEditor/RemoveIcon.png", 
    UnequippedIcon = "rbxasset://textures/LayeredClothingEditor/AddIcon.png", 
    DefaultColor = Color3.new(1, 1, 1), 
    EquippedColor = l_StyleKey_0.ErrorMain, 
    UnequippedColor = l_StyleKey_0.DialogMainButton, 
    MinRadius = 31, 
    MaxRadius = 62
};