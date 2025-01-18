local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: dump ]]
    -- upvalues: v0 (copy)
    local v3 = v1.Name .. "\n";
    local v4 = string.rep("..", v2);
    for _, v6 in pairs(v1:GetChildren()) do
        v3 = v3 .. v4 .. ".." .. v0(v6, v2 + 1);
    end;
    return v3;
end;
return function(v7) --[[ Line: 12 ]] --[[ Name: dumpChildren ]]
    -- upvalues: v0 (copy)
    if v7 then
        print((v0(v7, 0)));
        return;
    else
        print("<nil>");
        return;
    end;
end;