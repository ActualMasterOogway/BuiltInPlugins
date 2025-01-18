local v0 = {};
v0.new = function(v1) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(v1 > 0, "Invalid buffer size, should be > 0");
    return (setmetatable({
        __buffer = {}, 
        __size = v1, 
        __writeIndex = 1, 
        __firstIndex = nil
    }, v0));
end;
v0.clone = function(v2) --[[ Line: 31 ]] --[[ Name: clone ]]
    -- upvalues: v0 (copy)
    local v3 = v0.new(v2.__size);
    for v4, v5 in v2.__buffer do
        v3.__buffer[v4] = v5;
    end;
    v3.__writeIndex = v2.__writeIndex;
    v3.__firstIndex = v2.__firstIndex;
    return v3;
end;
v0.clear = function(v6) --[[ Line: 42 ]] --[[ Name: clear ]]
    -- upvalues: v0 (copy)
    return (v0.new(v6.__size));
end;
v0.getSize = function(v7) --[[ Line: 47 ]] --[[ Name: getSize ]]
    return v7.__size;
end;
v0.push = function(v8, v9) --[[ Line: 51 ]] --[[ Name: push ]]
    if not v8.__firstIndex then
        v8.__firstIndex = v8.__writeIndex;
    elseif v8.__firstIndex == v8.__writeIndex then
        v8.__firstIndex = v8.__firstIndex % v8.__size + 1;
    end;
    v8.__buffer[v8.__writeIndex] = v9;
    v8.__writeIndex = v8.__writeIndex % v8.__size + 1;
end;
v0.__index = function(v10, v11) --[[ Line: 62 ]] --[[ Name: __index ]]
    local v12 = getmetatable(v10)[v11];
    if v12 ~= nil then
        return v12;
    elseif v11 == "last" then
        return v10[1];
    elseif v11 == "first" then
        return v10.__buffer[v10.__firstIndex or 1];
    elseif type(v11) == "number" then
        local v13 = v10.__writeIndex - v11;
        if v13 < 1 then
            v13 = v13 + v10.__size;
        end;
        return v10.__buffer[v13];
    else
        return nil;
    end;
end;
v0.resize = function(v14, v15) --[[ Line: 83 ]] --[[ Name: resize ]]
    -- upvalues: v0 (copy)
    local v16 = v0.new(v15);
    local v17 = math.max(v14.__size, v15);
    if v14.__firstIndex ~= nil then
        local l___firstIndex_0 = v14.__firstIndex;
        for _ = 1, v17 do
            v16:push(v14.__buffer[l___firstIndex_0]);
            l___firstIndex_0 = l___firstIndex_0 % v14.__size + 1;
            if l___firstIndex_0 == v14.__writeIndex then
                break;
            end;
        end;
    end;
    return v16;
end;
v0.dump = function(v20, v21, v22) --[[ Line: 101 ]] --[[ Name: dump ]]
    local v23 = v21 or tostring;
    local v24 = "Buffer:\n";
    for v25 = 1, v20.__size do
        v24 = v24 .. string.format("[%d]: %s\n", v25, if v20.__buffer[v25] then v23(v20.__buffer[v25]) else "<nil>");
    end;
    v24 = (v24 .. string.format("WriteIndex: %d\n", v20.__writeIndex)) .. string.format("FirstIndex: %d\n", v20.__firstIndex or -1);
    (v22 or print)(v24);
end;
return v0;