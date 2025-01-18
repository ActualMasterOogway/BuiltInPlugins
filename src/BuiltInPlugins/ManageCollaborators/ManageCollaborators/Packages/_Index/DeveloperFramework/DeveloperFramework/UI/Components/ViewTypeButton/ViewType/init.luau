local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
return require(l_Parent_0.Util.enumerate)("ViewType", {
    List = 1, 
    Grid = 2, 
    Unsupported = 3
});