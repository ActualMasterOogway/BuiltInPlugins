local v0 = require(script.Parent.storeKey);
return function(v1) --[[ Line: 3 ]] --[[ Name: getStore ]]
    -- upvalues: v0 (copy)
    return v1._context[v0];
end;