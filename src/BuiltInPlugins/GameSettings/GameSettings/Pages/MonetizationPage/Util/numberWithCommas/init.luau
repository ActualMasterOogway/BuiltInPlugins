local function v6(v0, v1) --[[ Line: 1 ]] --[[ Name: addGroupDelimiters ]]
    local v2 = string.format("%%1%s%%2", v1);
    local _ = nil;
    repeat
        local v4, v5 = string.gsub(v0, "^(-?%d+)(%d%d%d)", v2);
        v0 = v4;
    until v5 == 0;
    return v0;
end;
return function(v7) --[[ Line: 13 ]]
    -- upvalues: v6 (copy)
    return (v6(v7, ","));
end;