local v0 = require(script.Parent.Expectation);
local l_checkMatcherNameCollisions_0 = v0.checkMatcherNameCollisions;
local function _(v2) --[[ Line: 4 ]] --[[ Name: copy ]]
    local v3 = {};
    for v4, v5 in pairs(v2) do
        v3[v4] = v5;
    end;
    return v3;
end;
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v9 = false;
    local v10 = {};
    local v11;
    if v8 then
        local l__extensions_0 = v8._extensions;
        local v13 = {};
        for v14, v15 in pairs(l__extensions_0) do
            v13[v14] = v15;
        end;
        v11 = v13;
        v9 = v11;
    end;
    if not v9 then
        v11 = {};
    end;
    v9 = false;
    v10._extensions = v11;
    return (setmetatable(v10, v7));
end;
v7.startExpectationChain = function(v16, ...) --[[ Line: 25 ]] --[[ Name: startExpectationChain ]]
    -- upvalues: v0 (copy)
    return v0.new(...):extend(v16._extensions);
end;
v7.extend = function(v17, v18) --[[ Line: 29 ]] --[[ Name: extend ]]
    -- upvalues: l_checkMatcherNameCollisions_0 (copy)
    for v19, v20 in pairs(v18) do
        assert(v17._extensions[v19] == nil, string.format("Cannot reassign %q in expect.extend", v19));
        assert(l_checkMatcherNameCollisions_0(v19), string.format("Cannot overwrite matcher %q; it already exists", v19));
        v17._extensions[v19] = v20;
    end;
end;
return v7;