local _ = require(script.Parent.types.actions);
local _ = require(script.Parent.types.reducers);
local _ = require(script.Parent.types.store);
return function(v3) --[[ Line: 17 ]] --[[ Name: combineReducers ]]
    return function(v4, v5) --[[ Line: 19 ]]
        -- upvalues: v3 (copy)
        if v4 == nil then
            v4 = {};
        end;
        local v6 = {};
        for v7, v8 in pairs(v3) do
            v6[v7] = v8(v4[v7], v5);
        end;
        return v6;
    end;
end;