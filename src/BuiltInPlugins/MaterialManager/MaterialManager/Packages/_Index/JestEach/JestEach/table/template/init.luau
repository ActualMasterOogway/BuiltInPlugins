local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = nil;
local v6 = nil;
local _ = require(l_Parent_0.JestTypes);
local _ = require(script.Parent.interpolation);
local l_interpolateVariables_0 = require(script.Parent.interpolation).interpolateVariables;
v4.default = function(v10, v11, v12) --[[ Line: 33 ]] --[[ Name: default ]]
    -- upvalues: v5 (ref), v6 (ref), l_Array_0 (copy), l_Object_0 (copy), l_interpolateVariables_0 (copy)
    local v13 = v5(v12, v11);
    local v14 = v6(v13, v11);
    return l_Array_0.map(v14, function(v15, v16) --[[ Line: 36 ]]
        -- upvalues: l_Object_0 (ref), l_interpolateVariables_0 (ref), v10 (copy)
        return {
            arguments = {
                l_Object_0.assign({}, v15)
            }, 
            title = l_interpolateVariables_0(v10, v15, v16)
        };
    end);
end;
v5 = function(v17, _) --[[ Line: 47 ]] --[[ Name: convertRowToTable ]]
    return v17;
end;
v6 = function(v19, v20) --[[ Line: 52 ]] --[[ Name: convertTableToTemplates ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    return l_Array_0.map(v19, function(v21) --[[ Line: 53 ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), v20 (copy)
        return l_Array_0.reduce(v21, function(v22, v23, v24) --[[ Line: 54 ]]
            -- upvalues: l_Object_0 (ref), v20 (ref)
            return l_Object_0.assign(v22, {
                [v20[v24]] = v23
            });
        end, {});
    end);
end;
return v4;