local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkStyledDialogCancelAccept);
return {
    Background = v1.MainBackground, 
    Modal = false, 
    Resizable = false, 
    ButtonHorizontalAlignment = Enum.HorizontalAlignment.Right, 
    ButtonWidth = 120, 
    ButtonHeight = 32, 
    ButtonPadding = {
        Top = 24
    }, 
    ButtonSpacing = 24, 
    ContentPadding = 24, 
    ["&Alert"] = {
        Buttons = {
            {
                Style = "RoundPrimary"
            }
        }, 
        Modal = true
    }, 
    ["&AcceptCancel"] = {
        Buttons = {
            {
                Style = "RoundPrimary"
            }, 
            {
                Style = "Round"
            }
        }
    }, 
    ["&CancelAccept"] = if v2() then {
        Buttons = {
            {
                Style = "Round"
            }, 
            {
                Style = "RoundPrimary"
            }
        }
    } else nil, 
    ["&FullBleed"] = {
        ButtonPadding = 24, 
        ContentPadding = 0
    }, 
    ["&LargeCenterButtons"] = {
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        ButtonWidth = 150, 
        ButtonHeight = 36
    }
};