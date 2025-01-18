local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local v5 = {};
local v6 = require(l_Parent_0.Picomatch);
local _ = require(l_Parent_0.JestTypes);
local v8 = l_Map_0.new();
local v9 = {
    dot = true
};
v5.default = function(v10) --[[ Line: 61 ]] --[[ Name: globsToMatcher ]]
    -- upvalues: l_Array_0 (copy), v8 (copy), v6 (copy), v9 (copy), l_Boolean_0 (copy)
    if #v10 == 0 then
        return function() --[[ Line: 65 ]]
            return false;
        end;
    else
        local v14 = l_Array_0.map(v10, function(v11) --[[ Line: 70 ]]
            -- upvalues: v8 (ref), v6 (ref), v9 (ref), l_Boolean_0 (ref)
            if not v8:has(v11) then
                local v12 = v6(v11, v9, true);
                local v13 = {
                    isMatch = v12, 
                    negated = v12.state.negated or l_Boolean_0.toJSBoolean(v12.state.negatedExtglob)
                };
                v8:set(v11, v13);
            end;
            return (v8:get(v11));
        end);
        return function(v15) --[[ Line: 87 ]]
            -- upvalues: v14 (copy), l_Boolean_0 (ref)
            local v16 = nil;
            local v17 = 0;
            for v18 = 1, #v14 do
                local v19 = nil;
                local v20 = nil;
                local v21 = v14[v18];
                v19 = v21.isMatch;
                v20 = v21.negated;
                if v20 then
                    v17 = v17 + 1;
                end;
                local v22 = v19(v15);
                if not v22 and v20 then
                    v16 = false;
                elseif v22 and not v20 then
                    v16 = true;
                end;
            end;
            if v17 == #v14 then
                return v16 ~= false;
            else
                return (l_Boolean_0.toJSBoolean(v16));
            end;
        end;
    end;
end;
return v5;