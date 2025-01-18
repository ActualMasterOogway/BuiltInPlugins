local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(l_Parent_0.Style.StyleKey);
local v3 = require(l_Parent_0.Util.StyleModifier);
local v4 = {
    Background = v2.MainBackground, 
    [v3.Hover] = {
        Background = v2.ButtonHover
    }, 
    [v3.Selected] = {
        Background = v2.DialogMainButton
    }
};
local v5 = l_join_0(v4, {
    Background = v2.SubBackground
});
local v6 = l_join_0(v5, {
    Border = {
        Color = v2.Border
    }
});
local v7 = l_join_0(v4, {
    Image = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
    SliceCenter = Rect.new(3, 3, 13, 13)
});
local v8 = l_join_0(v7, {
    Border = {
        Background = v2.Border, 
        Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
        SliceCenter = Rect.new(3, 3, 13, 13)
    }
});
local v9 = l_join_0(v4, {
    CornerRadius = UDim.new(0, 8)
});
local v10 = l_join_0(v8, {
    Background = v2.InputFieldBackground
});
local v11 = l_join_0(v8, {
    BorderColor = v2.ErrorText
});
return {
    ["&None"] = {
        Transparency = 1
    }, 
    ["&Box"] = v4, 
    ["&SubtleBox"] = v5, 
    ["&SubtleBorderBox"] = v6, 
    ["&RoundBox"] = v7, 
    ["&InputBox"] = v10, 
    ["&BorderBox"] = v8, 
    ["&ErrorBorderBox"] = v11, 
    ["&CornerBox"] = v9
};