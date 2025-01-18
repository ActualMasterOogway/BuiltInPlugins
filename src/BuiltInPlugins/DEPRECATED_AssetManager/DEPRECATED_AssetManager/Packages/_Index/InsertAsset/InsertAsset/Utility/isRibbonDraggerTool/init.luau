local v0 = {
    [Enum.RibbonTool.Move] = true, 
    [Enum.RibbonTool.Rotate] = true, 
    [Enum.RibbonTool.Scale] = true, 
    [Enum.RibbonTool.Select] = true
};
return function(v1) --[[ Line: 8 ]]
    -- upvalues: v0 (copy)
    return v0[v1];
end;