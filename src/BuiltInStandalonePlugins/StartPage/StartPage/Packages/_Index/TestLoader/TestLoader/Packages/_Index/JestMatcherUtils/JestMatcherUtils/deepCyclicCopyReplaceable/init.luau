local v0 = nil;
local v1 = nil;
v0 = function(v2, v3) --[[ Line: 16 ]] --[[ Name: deepCyclicCopyTable ]]
    -- upvalues: v1 (ref)
    local v4 = {};
    v3[v2] = v4;
    for v5, v6 in pairs(v2) do
        v4[v5] = v1(v6, v3);
    end;
    return v4;
end;
v1 = function(v7, v8) --[[ Line: 28 ]] --[[ Name: deepCyclicCopyReplaceable ]]
    -- upvalues: v0 (ref)
    if typeof(v7) ~= "table" then
        return v7;
    elseif v8[v7] then
        return v8[v7];
    else
        local v9 = v0(v7, v8);
        local v10 = getmetatable(v7);
        if v10 and typeof(v10) == "table" then
            setmetatable(v9, v10);
        end;
        return v9;
    end;
end;
return function(v11, v12) --[[ Line: 43 ]]
    -- upvalues: v1 (ref)
    local v13 = v12 or {};
    setmetatable(v13, {
        _mode = "kv"
    });
    return v1(v11, v13);
end;