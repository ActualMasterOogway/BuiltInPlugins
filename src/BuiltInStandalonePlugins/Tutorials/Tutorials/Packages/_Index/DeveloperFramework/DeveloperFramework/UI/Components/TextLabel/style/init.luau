local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.Util.StyleModifier);
return {
    Font = Enum.Font.SourceSans, 
    [v2.Disabled] = {
        TextTransparency = 0.5
    }, 
    ["&Body"] = {
        TextSize = 14, 
        TextColor = v1.SubText
    }, 
    ["&Bold"] = {
        Font = Enum.Font.SourceSansBold
    }, 
    ["&Normal"] = {
        Font = Enum.Font.SourceSans, 
        TextSize = 22, 
        TextColor = v1.MainText
    }, 
    ["&Semibold"] = {
        Font = Enum.Font.SourceSansSemibold, 
        TextSize = 22, 
        TextColor = v1.MainText
    }, 
    ["&SubText"] = {
        Font = Enum.Font.SourceSans, 
        TextSize = 16, 
        TextColor = v1.SubText
    }, 
    ["&Label"] = {
        Font = Enum.Font.SourceSans, 
        TextColor = v1.SubText
    }, 
    ["&Selected"] = {
        TextColor = v1.DialogMainButtonText
    }, 
    ["&Subtitle"] = {
        TextColor = v1.SubText, 
        TextSize = 22
    }, 
    ["&Title"] = {
        Font = Enum.Font.SourceSans, 
        TextSize = 24, 
        TextColor = v1.TitlebarText
    }, 
    ["&Success"] = {
        TextColor = v1.SuccessMain
    }, 
    ["&Error"] = {
        TextSize = 16, 
        TextColor = v1.ErrorText
    }, 
    ["&Warning"] = {
        TextSize = 16, 
        TextColor = v1.WarningText
    }
};