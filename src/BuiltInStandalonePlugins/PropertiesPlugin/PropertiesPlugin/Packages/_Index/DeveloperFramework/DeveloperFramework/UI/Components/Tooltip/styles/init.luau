local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.Styling.createStyleRule)(".Component-Tooltip", {}, {}, {
    DropShadowPadding = 6, 
    MaxWidth = 200, 
    Offset = Vector2.new(10, 5), 
    Padding = 5, 
    ShowDelay = 0.3
});