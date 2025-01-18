local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {};
    setmetatable(v1, v0);
    v1.data = {};
    return v1;
end;
v0.size = function(v2) --[[ Line: 11 ]] --[[ Name: size ]]
    return #v2.data;
end;
v0.push = function(v3, v4) --[[ Line: 15 ]] --[[ Name: push ]]
    v3.data[v3:size() + 1] = v4;
    return v3;
end;
v0.pop = function(v5) --[[ Line: 20 ]] --[[ Name: pop ]]
    local v6 = v5:getBack();
    table.remove(v5.data, v5:size());
    return v6;
end;
v0.getBack = function(v7) --[[ Line: 26 ]] --[[ Name: getBack ]]
    if v7:size() == 0 then
        error("stack is empty");
    end;
    return v7.data[v7:size()];
end;
v0.setBack = function(v8, v9) --[[ Line: 32 ]] --[[ Name: setBack ]]
    if v8:size() == 0 then
        error("stack is empty");
    end;
    v8.data[v8:size()] = v9;
    return v8;
end;
return v0;