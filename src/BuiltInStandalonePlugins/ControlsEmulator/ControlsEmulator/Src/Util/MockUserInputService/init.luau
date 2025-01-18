local v0 = {};
v0.__index = v0;
v0.new = function(_) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    setmetatable(v2, {
        __index = v0
    });
    return v2;
end;
return v0;