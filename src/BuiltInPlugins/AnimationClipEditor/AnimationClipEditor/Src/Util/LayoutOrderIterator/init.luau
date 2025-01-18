local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = {
        order = 0
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.getNextOrder = function(v2) --[[ Line: 15 ]] --[[ Name: getNextOrder ]]
    v2.order = v2.order + 1;
    return v2.order;
end;
return v0;