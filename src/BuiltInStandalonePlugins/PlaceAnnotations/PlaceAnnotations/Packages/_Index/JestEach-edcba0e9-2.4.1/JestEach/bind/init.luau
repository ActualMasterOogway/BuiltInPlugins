local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v5 = require(script.Parent.nilPlaceholder);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local l_ErrorWithStack_0 = require(l_Parent_0.JestUtil).ErrorWithStack;
local l_default_0 = require(script.Parent.table.array).default;
local l_default_1 = require(script.Parent.table.template).default;
local v11 = require(script.Parent.validation);
local l_extractValidTemplateHeadings_0 = v11.extractValidTemplateHeadings;
local l_validateArrayTable_0 = v11.validateArrayTable;
local l_validateTemplateTableArguments_0 = v11.validateTemplateTableArguments;
local function v15() --[[ Line: 38 ]]
    error("Method unavailable");
end;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
v6.default = function(v21, v22) --[[ Line: 54 ]] --[[ Name: default ]]
    -- upvalues: v15 (copy), v16 (ref), v17 (ref), v18 (ref), l_Array_0 (copy), v20 (ref), l_ErrorWithStack_0 (copy)
    local v23 = v22 == nil or v22;
    local v24 = v21 or v15;
    return function(v25, ...) --[[ Line: 57 ]]
        -- upvalues: v16 (ref), v17 (ref), v18 (ref), l_Array_0 (ref), v24 (copy), v20 (ref), v23 (copy), l_ErrorWithStack_0 (ref)
        local v26 = if select("#", ...) > 0 then {
            ...
        } else {};
        local function v27(v28, v29, v30) --[[ Line: 63 ]] --[[ Name: eachBind ]]
            -- upvalues: v16 (ref), v26 (copy), v17 (ref), v25 (copy), v18 (ref), l_Array_0 (ref), v24 (ref), v20 (ref), v23 (ref), l_ErrorWithStack_0 (ref), v27 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 64 ]]
                -- upvalues: v16 (ref), v26 (ref), v17 (ref), v28 (copy), v25 (ref), v18 (ref), l_Array_0 (ref), v24 (ref), v20 (ref), v23 (ref), v29 (copy), v30 (copy)
                local v31 = if v16(v26) then v17(v28, v25) else v18(v28, v25, v26);
                return (l_Array_0.forEach(v31, function(v32) --[[ Line: 69 ]]
                    -- upvalues: v24 (ref), v20 (ref), v23 (ref), v29 (ref), v30 (ref)
                    return v24(v32.title, v20(v23, v32.arguments, v29), v30);
                end));
            end);
            if not l_status_0 then
                local v35 = l_ErrorWithStack_0.new(l_result_0.message, v27);
                return v24(v28, function() --[[ Line: 77 ]]
                    -- upvalues: v35 (copy)
                    error(v35);
                end);
            else
                return l_result_0;
            end;
        end;
        return v27;
    end;
end;
v16 = function(v36) --[[ Line: 89 ]] --[[ Name: isArrayTable ]]
    return #v36 == 0;
end;
v17 = function(v37, v38) --[[ Line: 93 ]] --[[ Name: buildArrayTests ]]
    -- upvalues: l_validateArrayTable_0 (copy), l_default_0 (copy)
    l_validateArrayTable_0(v38);
    return l_default_0(v37, v38);
end;
v18 = function(v39, v40, v41) --[[ Line: 98 ]] --[[ Name: buildTemplateTests ]]
    -- upvalues: v19 (ref), l_validateTemplateTableArguments_0 (copy), l_default_1 (copy)
    local v42 = v19(v40[1]);
    l_validateTemplateTableArguments_0(v42, v41);
    return l_default_1(v39, v42, v41);
end;
v19 = function(v43) --[[ Line: 104 ]] --[[ Name: getHeadingKeys ]]
    -- upvalues: l_String_0 (copy), l_extractValidTemplateHeadings_0 (copy)
    return l_String_0.split(l_extractValidTemplateHeadings_0(v43):gsub("%s+", ""), "|");
end;
v20 = function(v44, v45, v46) --[[ Line: 109 ]] --[[ Name: applyArguments ]]
    -- upvalues: v5 (copy), l_Array_0 (copy), l_Object_0 (copy)
    local v47 = nil;
    v47 = if typeof(v46) == "function" then debug.info(v46, "a") else 0;
    local v48 = nil;
    v48 = function(v49) --[[ Line: 123 ]] --[[ Name: replaceNilPlaceholders ]]
        -- upvalues: v5 (ref), l_Array_0 (ref), v48 (ref), l_Object_0 (ref)
        if v49 == v5 then
            return nil;
        elseif l_Array_0.isArray(v49) then
            return l_Array_0.map(v49, function(v50) --[[ Line: 127 ]]
                -- upvalues: v48 (ref)
                return v48(v50);
            end);
        elseif typeof(v49) == "table" then
            l_Array_0.forEach(l_Object_0.keys(v49), function(v51) --[[ Line: 131 ]]
                -- upvalues: v49 (copy), v48 (ref)
                v49[v51] = v48(v49[v51]);
            end);
            return v49;
        else
            return v49;
        end;
    end;
    local v52 = nil;
    v52 = function(v53, v54, ...) --[[ Line: 141 ]] --[[ Name: unpackTable ]]
        -- upvalues: v52 (ref), v48 (ref)
        local v55 = if v54 ~= nil then v54 else #v53;
        if v55 == 0 then
            return ...;
        else
            return v52(v53, v55 - 1, v48(v53[v55]), ...);
        end;
    end;
    return v44 and #v45 < v47 and function(v56) --[[ Line: 151 ]]
        -- upvalues: v46 (copy), v52 (ref), v45 (copy)
        return v46(v52(v45), v56);
    end or function() --[[ Line: 154 ]]
        -- upvalues: v46 (copy), v52 (ref), v45 (copy)
        return v46(v52(v45));
    end;
end;
return v6;