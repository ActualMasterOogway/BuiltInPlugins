local v0 = {
    [Enum.MaterialPattern.Regular] = "Regular", 
    [Enum.MaterialPattern.Organic] = "Organic"
};
return function(v1) --[[ Line: 6 ]]
    -- upvalues: v0 (copy)
    return v0[v1];
end;