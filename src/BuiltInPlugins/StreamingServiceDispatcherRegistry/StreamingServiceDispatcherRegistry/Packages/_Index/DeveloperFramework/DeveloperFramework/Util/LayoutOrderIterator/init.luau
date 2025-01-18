local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = setmetatable({}, v0);
    v2.order = v1 or 0;
    return v2;
end;
v0.getNextOrder = function(v3) --[[ Line: 35 ]] --[[ Name: getNextOrder ]]
    v3.order = v3.order + 1;
    return v3.order;
end;
return v0;