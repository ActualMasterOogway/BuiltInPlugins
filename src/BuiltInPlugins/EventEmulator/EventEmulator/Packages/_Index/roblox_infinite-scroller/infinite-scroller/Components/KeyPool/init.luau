local l_Parent_0 = script:FindFirstAncestor("infinite-scroller").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {};
v2.__index = v2;
local v3 = {};
v3.__index = v3;
local function _(v4, v5) --[[ Line: 29 ]] --[[ Name: newkey ]]
    -- upvalues: v3 (copy)
    local v6 = {
        pool = v4, 
        index = v5
    };
    setmetatable(v6, v3);
    return v6;
end;
v2.new = function(v8) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(v1.string(v8));
    local v9 = {
        class = v8, 
        available = {}, 
        limit = 0, 
        count = 0
    };
    setmetatable(v9, v2);
    return v9;
end;
v2.get = function(v10) --[[ Line: 60 ]] --[[ Name: get ]]
    -- upvalues: v3 (copy)
    if v10.count == 0 then
        v10.limit = v10.limit + 1;
        local l_limit_0 = v10.limit;
        local v12 = {
            pool = v10, 
            index = l_limit_0
        };
        setmetatable(v12, v3);
        return v12;
    else
        local v13 = v10.available[v10.count];
        v10.count = v10.count - 1;
        return v13;
    end;
end;
v3.__tostring = function(v14) --[[ Line: 73 ]] --[[ Name: __tostring ]]
    return v14.pool.class .. "_" .. string.format("%02d", v14.index);
end;
v3.release = function(v15) --[[ Line: 79 ]] --[[ Name: release ]]
    v15.pool.count = v15.pool.count + 1;
    v15.pool.available[v15.pool.count] = v15;
end;
return v2;