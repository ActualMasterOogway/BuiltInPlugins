local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getProjectDisplayName).default;
local v7 = nil;
v4.default = function(v8, v9) --[[ Line: 24 ]] --[[ Name: getConfigsOfProjectsToRun ]]
    -- upvalues: v7 (ref), l_Array_0 (copy), l_default_0 (copy)
    local v10 = v7(v9);
    return l_Array_0.filter(v8, function(v11) --[[ Line: 32 ]]
        -- upvalues: l_default_0 (ref), v10 (copy)
        local v12 = l_default_0(v11);
        return v10(v12);
    end);
end;
v7 = function(v13) --[[ Line: 41 ]] --[[ Name: createProjectFilter ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    local v14 = if l_Array_0.isArray(v13.selectProjects) then v13.selectProjects else {};
    local v15 = if l_Array_0.isArray(v13.ignoreProjects) then v13.ignoreProjects else {};
    local function v16() --[[ Line: 55 ]] --[[ Name: always ]]
        return true;
    end;
    local v18 = #v14 > 0 and function(v17) --[[ Line: 63 ]]
        -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), v14 (copy)
        if l_Boolean_0.toJSBoolean(v17) then
            return (l_Array_0.includes(v14, v17));
        else
            return v17;
        end;
    end or v16;
    local v20 = #v15 > 0 and function(v19) --[[ Line: 72 ]]
        -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), v15 (copy)
        return not l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v19) then l_Array_0.includes(v15, v19) else v19);
    end or v16;
    return function(v21) --[[ Line: 84 ]] --[[ Name: test ]]
        -- upvalues: l_Boolean_0 (ref), v18 (copy), v20 (copy)
        return l_Boolean_0.toJSBoolean(v18(v21)) and l_Boolean_0.toJSBoolean(v20(v21));
    end;
end;
return v4;