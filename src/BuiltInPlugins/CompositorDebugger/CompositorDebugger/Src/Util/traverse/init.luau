local function v0(v1, v2, v3, v4) --[[ Line: 2 ]] --[[ Name: traverse ]]
    -- upvalues: v0 (copy)
    v2(v1, v4);
    local v5 = (if v3 then v3(v1) else v1.children) or {};
    for _, v7 in pairs(v5) do
        v0(v7, v2, v3, v4 + 1);
    end;
end;
return function(v8, v9, v10) --[[ Line: 10 ]]
    -- upvalues: v0 (copy)
    return v0(v8, v9, v10, 1);
end;