local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Parent.Cryo);
local l_deepCopy_0 = v2.deepCopy;
local v5 = require(l_Parent_0.Util.StyleModifier);
local v6 = require(l_Parent_0.UI.Components.UIFolderData);
local v7 = require(v6.RoundBox.style);
local v8 = {
    Left = 10, 
    Top = 5, 
    Right = 10, 
    Bottom = 5
};
local v9 = {
    Left = 1, 
    Top = 0, 
    Right = 0, 
    Bottom = 0
};
local v10 = l_deepCopy_0(v7);
return {
    PlaceholderTextColor = v1.DimmedText, 
    useRoundBox = false, 
    Padding = v9, 
    ["&RoundedBorder"] = {
        useRoundBox = true, 
        Padding = v8, 
        BackgroundStyle = v7, 
        [v5.Hover] = {
            BackgroundStyle = v3.Dictionary.join(v10, {
                BorderColor = v1.DialogMainButton
            })
        }
    }, 
    ["&FilledRoundedBorder"] = {
        useRoundBox = true, 
        Padding = v8, 
        BackgroundStyle = v3.Dictionary.join(v10, {
            Color = v1.InputFieldBackground
        }), 
        [v5.Selected] = {
            BackgroundStyle = v3.Dictionary.join(v10, {
                Color = v1.InputFieldBackground, 
                BorderColor = v1.DialogMainButton
            })
        }
    }, 
    ["&FilledRoundedRedBorder"] = {
        useRoundBox = true, 
        Padding = v8, 
        BackgroundStyle = v3.Dictionary.join(v10, {
            Color = v1.InputFieldBackground, 
            BorderColor = v1.ErrorText
        })
    }
};