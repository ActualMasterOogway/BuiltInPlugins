local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
return {
    Size = UDim2.fromOffset(100, 50), 
    Hover = {
        Background = v1.ButtonHover
    }, 
    Disabled = {
        Background = v1.ButtonDisabled, 
        TextColor = v1.DimmedText
    }, 
    IconSize = 16, 
    Padding = 10, 
    Spacing = 10, 
    ["&Primary"] = {
        BackgroundColor = v1.TextPrimary, 
        TextColor = v1.SecondaryMuted, 
        Hover = {
            Background = v1.TextSecondary
        }
    }, 
    ["&PrimaryBrand"] = {
        BackgroundColor = v1.PrimaryMain, 
        BorderColor = v1.DialogMainButton, 
        Font = Enum.Font.SourceSansBold, 
        TextColor = v1.DialogMainButtonText, 
        Hover = {
            Background = v1.DialogMainButtonHover
        }
    }, 
    ["&Link"] = {}, 
    ["&Compact"] = {
        Padding = 5, 
        Spacing = 5
    }, 
    ["&IconOnly"] = {
        Padding = 0, 
        Spacing = 0
    }
};