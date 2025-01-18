local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.Styling.createStyleRule)(".Component-Table", {}, {}, {
    FooterHeight = 36, 
    HeaderHeight = 32, 
    RowHeight = 24, 
    ScrollHeaderPadding = 10
});