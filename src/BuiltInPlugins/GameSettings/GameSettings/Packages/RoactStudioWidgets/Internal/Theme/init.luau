local v0 = nil;
local v1 = {};
v1.isDarkerTheme = function() --[[ Line: 9 ]] --[[ Name: isDarkerTheme ]]
    -- upvalues: v1 (copy)
    local v2 = v1.getMainBackgroundColor();
    return (v2.r + v2.g + v2.b) / 3 < 0.5;
end;
v1.getTitleTextColor = function() --[[ Line: 15 ]] --[[ Name: getTitleTextColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.SubText);
end;
v1.getMainTextColor = function() --[[ Line: 19 ]] --[[ Name: getMainTextColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.MainText);
end;
v1.getTextDescriptionColor = function() --[[ Line: 23 ]] --[[ Name: getTextDescriptionColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.DimmedText);
end;
v1.getBorderDefaultColor = function() --[[ Line: 27 ]] --[[ Name: getBorderDefaultColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.Border);
end;
v1.getBorderHoverColor = function() --[[ Line: 31 ]] --[[ Name: getBorderHoverColor ]]
    -- upvalues: v1 (copy), v0 (ref)
    return v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.MainButton) or v0(Enum.StudioStyleGuideColor.CurrentMarker);
end;
v1.getMainBackgroundColor = function() --[[ Line: 35 ]] --[[ Name: getMainBackgroundColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.MainBackground);
end;
v1.getBackgroundColor = function() --[[ Line: 39 ]] --[[ Name: getBackgroundColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.InputFieldBackground);
end;
v1.getRadioButtonTextColor = function() --[[ Line: 43 ]] --[[ Name: getRadioButtonTextColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.BrightText);
end;
v1.getHyperlinkTextTextColor = function() --[[ Line: 47 ]] --[[ Name: getHyperlinkTextTextColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.LinkText);
end;
v1.getDisabledColor = function() --[[ Line: 51 ]] --[[ Name: getDisabledColor ]]
    -- upvalues: v0 (ref)
    return v0(Enum.StudioStyleGuideColor.Tab);
end;
v1.getScrollBarColor = function() --[[ Line: 55 ]] --[[ Name: getScrollBarColor ]]
    -- upvalues: v1 (copy), v0 (ref)
    return v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.ScrollBar) or v0(Enum.StudioStyleGuideColor.Border);
end;
v1.getScrollBarBackgroundColor = function() --[[ Line: 59 ]] --[[ Name: getScrollBarBackgroundColor ]]
    -- upvalues: v1 (copy), v0 (ref)
    return v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.ScrollBarBackground) or Color3.fromRGB(245, 245, 245);
end;
v1.getSeparatorColor = function() --[[ Line: 63 ]] --[[ Name: getSeparatorColor ]]
    -- upvalues: v1 (copy), v0 (ref)
    return v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.Border) or v0(Enum.StudioStyleGuideColor.Titlebar);
end;
v1.getDefaultButtonProps = function() --[[ Line: 67 ]] --[[ Name: getDefaultButtonProps ]]
    -- upvalues: v1 (copy), v0 (ref)
    local v3 = Color3.fromRGB(153, 218, 255);
    return {
        ButtonColor = v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.MainButton) or v0(Enum.StudioStyleGuideColor.CurrentMarker), 
        ButtonHoverColor = v0(Enum.StudioStyleGuideColor.LinkText), 
        ButtonPressedColor = v0(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Pressed), 
        ButtonDisabledColor = v1.isDarkerTheme() and v0(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Disabled) or v3, 
        TextColor = Color3.new(1, 1, 1), 
        TextDisabledColor = v1.isDarkerTheme() and v1.getTextDescriptionColor() or Color3.new(1, 1, 1), 
        BorderColor = v0(Enum.StudioStyleGuideColor.Light)
    };
end;
v1.getCancelButtonProps = function() --[[ Line: 80 ]] --[[ Name: getCancelButtonProps ]]
    -- upvalues: v0 (ref), v1 (copy)
    return {
        ButtonColor = v0(Enum.StudioStyleGuideColor.Button), 
        ButtonHoverColor = v0(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Hover), 
        ButtonPressedColor = v0(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Pressed), 
        ButtonDisabledColor = v0(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Disabled), 
        TextColor = v0(Enum.StudioStyleGuideColor.MainText), 
        TextDisabledColor = v1.getTextDescriptionColor(), 
        BorderColor = v0(Enum.StudioStyleGuideColor.Border)
    };
end;
v0 = function(v4, v5) --[[ Line: 92 ]] --[[ Name: getColor ]]
    return settings().Studio.Theme:GetColor(v4, v5);
end;
return v1;