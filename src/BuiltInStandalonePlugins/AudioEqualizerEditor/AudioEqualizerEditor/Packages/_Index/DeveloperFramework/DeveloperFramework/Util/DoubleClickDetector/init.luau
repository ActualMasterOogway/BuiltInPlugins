local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {
        lastClick = 0
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.isDoubleClick = function(v2) --[[ Line: 22 ]] --[[ Name: isDoubleClick ]]
    local v3 = tick();
    local v4 = v3 < v2.lastClick + 0.2;
    v2.lastClick = v3;
    return v4;
end;
return v0;