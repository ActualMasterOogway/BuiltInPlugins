local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.ConstantColors);
local v2 = {};
local v3 = nil;
local v4 = nil;
v2.getBackgroundColor = function(v5) --[[ Line: 11 ]] --[[ Name: getBackgroundColor ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v5) and v3(v5).backgroundColor or v1.White;
end;
v2.getTitleTextColor = function(v6) --[[ Line: 15 ]] --[[ Name: getTitleTextColor ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v6) and v3(v6).titledFrame.text or v1.TitleText;
end;
v2.getBodyTextColor = function(v7) --[[ Line: 19 ]] --[[ Name: getBodyTextColor ]]
    -- upvalues: v4 (ref), v3 (ref), v1 (copy)
    return v4(v7) and v3(v7).textBox.text or v1.BodyText;
end;
v2.getBodyTextInputColor = function(v8) --[[ Line: 23 ]] --[[ Name: getBodyTextInputColor ]]
    -- upvalues: v4 (ref), v3 (ref), v1 (copy)
    if v8.PlayerChoice then
        return v4(v8) and v3(v8).textBox.text or v1.BodyText;
    else
        return v4(v8) and v3(v8).textBox.text or v1.TitleText;
    end;
end;
v2.getButtonPressedTextColor = function(_) --[[ Line: 31 ]] --[[ Name: getButtonPressedTextColor ]]
    -- upvalues: v1 (copy)
    return v1.White;
end;
v2.getButtonHoveredTextColor = function(v10) --[[ Line: 35 ]] --[[ Name: getButtonHoveredTextColor ]]
    -- upvalues: v2 (copy)
    return v2.getTitleTextColor(v10);
end;
v2.getButtonTextColor = function(v11) --[[ Line: 39 ]] --[[ Name: getButtonTextColor ]]
    -- upvalues: v2 (copy)
    return v2.getTitleTextColor(v11);
end;
v2.getButtonPressedImageColor = function(_) --[[ Line: 43 ]] --[[ Name: getButtonPressedImageColor ]]
    -- upvalues: v1 (copy)
    return v1.White;
end;
v2.getButtonHoveredImageColor = function(v13) --[[ Line: 47 ]] --[[ Name: getButtonHoveredImageColor ]]
    -- upvalues: v4 (ref), v1 (copy)
    return v4(v13) and v1.DarkGrey2 or v1.White;
end;
v2.getButtonImageColor = function(v14) --[[ Line: 51 ]] --[[ Name: getButtonImageColor ]]
    -- upvalues: v4 (ref), v1 (copy)
    return v4(v14) and v1.DarkGrey or v1.White;
end;
v2.getDividerColor = function(v15) --[[ Line: 55 ]] --[[ Name: getDividerColor ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v15) and v3(v15).separator or v1.DefaultColor;
end;
v2.getBorderColor = function(v16) --[[ Line: 59 ]] --[[ Name: getBorderColor ]]
    -- upvalues: v3 (ref), v1 (copy)
    return v3(v16) and v3(v16).separator or v1.DefaultColor;
end;
v2.getRadioButtonTextColor = function(v17) --[[ Line: 63 ]] --[[ Name: getRadioButtonTextColor ]]
    -- upvalues: v3 (ref)
    if v3(v17) and v3(v17).radioButton then
        return v3(v17).radioButton.title;
    else
        return nil;
    end;
end;
v3 = function(v18) --[[ Line: 69 ]]
    return v18.ThemeData and v18.ThemeData.theme;
end;
v4 = function(v19) --[[ Line: 73 ]]
    -- upvalues: v3 (ref)
    return v3(v19) and v3(v19).isDarkerTheme;
end;
return v2;