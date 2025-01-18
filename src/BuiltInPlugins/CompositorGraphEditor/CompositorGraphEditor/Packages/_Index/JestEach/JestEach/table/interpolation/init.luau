local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v6 = {};
local l_isPrimitive_0 = require(l_Parent_0.JestGetType).isPrimitive;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v9 = nil;
local v10 = nil;
local v11 = nil;
v6.interpolateVariables = function(v12, v13, v14) --[[ Line: 34 ]] --[[ Name: interpolateVariables ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v9 (ref), v10 (ref)
    return l_Array_0.reduce(l_Array_0.reduce(l_Object_0.keys(v13), v9(v12), {}), v10(v13), v12):gsub("%$#", tostring(v14), 1);
end;
v9 = function(v15) --[[ Line: 47 ]] --[[ Name: getMatchingKeyPaths ]]
    -- upvalues: l_Array_0 (copy)
    return function(v16, v17) --[[ Line: 48 ]]
        -- upvalues: l_Array_0 (ref), v15 (copy)
        return l_Array_0.concat(v16, ((function() --[[ Line: 51 ]]
            -- upvalues: v15 (ref), v17 (copy)
            local v18 = {};
            for v19 in v15:gmatch(("%%$%s[%%.%%w]*"):format(v17)) do
                table.insert(v18, v19);
            end;
            return v18;
        end)()));
    end;
end;
v10 = function(v20) --[[ Line: 62 ]] --[[ Name: replaceKeyPathWithValue ]]
    -- upvalues: l_String_0 (copy), v11 (ref), l_isPrimitive_0 (copy), l_format_0 (copy)
    return function(v21, v22) --[[ Line: 63 ]]
        -- upvalues: l_String_0 (ref), v11 (ref), v20 (copy), l_isPrimitive_0 (ref), l_format_0 (ref)
        local v23 = v22:gsub("%$", "", 1);
        local v24 = l_String_0.split(v23, "%.");
        local v25 = v11(v20, v24);
        if l_isPrimitive_0(v25) then
            return v21:gsub(v22, tostring(v25), 1);
        else
            return v21:gsub(v22, l_format_0(v25, {
                maxDepth = 1, 
                min = true
            }), 1);
        end;
    end;
end;
v11 = function(v26, v27) --[[ Line: 112 ]] --[[ Name: getPath ]]
    -- upvalues: l_Boolean_0 (copy), v11 (ref)
    local v28 = table.unpack(v27, 1, 1);
    local v29 = if #v27 > 1 then {
        table.unpack(v27, 2)
    } else {};
    if not l_Boolean_0.toJSBoolean(v28) or v26[v28] == nil then
        return v26;
    else
        return v11(v26[v28], v29);
    end;
end;
v6.getPath = v11;
return v6;