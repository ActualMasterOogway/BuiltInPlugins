local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = require(script.Parent.queries);
v4.getQueriesForElement = function(v6, v7, v8) --[[ Line: 24 ]] --[[ Name: getQueriesForElement ]]
    -- upvalues: v5 (copy), l_Array_0 (copy), l_Object_0 (copy)
    local v9 = if v7 == nil then v5 else v7;
    local v10 = if v8 == nil then {} else v8;
    return (l_Array_0.reduce(l_Object_0.keys(v9), function(v11, v12) --[[ Line: 29 ]]
        -- upvalues: v9 (copy), v6 (copy)
        local v13 = v9[v12];
        v11[v12] = function(...) --[[ Line: 31 ]]
            -- upvalues: v13 (copy), v6 (ref)
            return v13(v6, ...);
        end;
        return v11;
    end, v10));
end;
return v4;