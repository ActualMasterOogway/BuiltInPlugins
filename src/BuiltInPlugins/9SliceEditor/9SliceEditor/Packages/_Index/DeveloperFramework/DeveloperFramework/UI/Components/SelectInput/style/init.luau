local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(v1.RoundBox.style);
local v3 = require(l_Parent_0.Style.StyleKey);
local v4 = require(l_Parent_0.Util);
local v5 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v4.deepCopy;
local v7 = require(l_Parent_0.Util.StyleModifier);
local v8 = l_deepCopy_0(v2);
return {
    Padding = 10, 
    BackgroundStyle = v5.Dictionary.join(v8, {
        Color = v3.InputFieldBackground, 
        [v7.Hover] = {
            BorderColor = v3.DialogMainButton, 
            Color = v3.InputFieldBackground
        }, 
        [v7.Error] = {
            BorderColor = v3.ErrorText
        }
    }), 
    ErrorTextStyle = {
        Font = Enum.Font.SourceSans, 
        TextColor = v3.ErrorText, 
        TextSize = 18, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, 
    DropdownMenu = {
        BackgroundStyle = v8, 
        Width = 240, 
        MaxHeight = 240, 
        Offset = Vector2.new(0, 0)
    }, 
    Size = UDim2.new(0, 240, 0, 32), 
    ArrowOffset = 10, 
    ArrowSize = UDim2.new(0, 12, 0, 12), 
    ArrowImage = "rbxasset://textures/StudioToolbox/ArrowDownIconWhite.png", 
    ArrowColor = v3.MainText, 
    IconOffset = 10, 
    IconSize = UDim2.fromOffset(16, 16), 
    PlaceholderTextColor = v3.DimmedText, 
    Text = {
        Font = Enum.Font.SourceSans, 
        TextColor = v3.MainText, 
        TextSize = 18, 
        TextXAlignment = Enum.TextXAlignment.Left
    }
};