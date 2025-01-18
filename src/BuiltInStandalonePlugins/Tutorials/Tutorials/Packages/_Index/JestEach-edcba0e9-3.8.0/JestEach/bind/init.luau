local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v5 = require(script.Parent.nilPlaceholder);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local v8 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v8.ErrorWithStack;
local l_convertDescriptorToString_0 = v8.convertDescriptorToString;
local l_default_0 = require(script.Parent.table.array).default;
local l_default_1 = require(script.Parent.table.template).default;
local v13 = require(script.Parent.validation);
local l_extractValidTemplateHeadings_0 = v13.extractValidTemplateHeadings;
local l_validateArrayTable_0 = v13.validateArrayTable;
local l_validateTemplateTableArguments_0 = v13.validateTemplateTableArguments;
local function v17() --[[ Line: 41 ]]
    error("Method unavailable");
end;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
v6.default = function(v23, v24) --[[ Line: 60 ]] --[[ Name: default ]]
    -- upvalues: v17 (copy), l_convertDescriptorToString_0 (copy), v18 (ref), v19 (ref), v20 (ref), l_Array_0 (copy), v22 (ref), l_ErrorWithStack_0 (copy)
    local v25 = v24 == nil or v24;
    local v26 = v23 or v17;
    return function(v27, ...) --[[ Line: 63 ]]
        -- upvalues: l_convertDescriptorToString_0 (ref), v18 (ref), v19 (ref), v20 (ref), l_Array_0 (ref), v26 (copy), v22 (ref), v25 (copy), l_ErrorWithStack_0 (ref)
        local v28 = if select("#", ...) > 0 then {
            ...
        } else {};
        local function v29(v30, v31, v32) --[[ Line: 69 ]] --[[ Name: eachBind ]]
            -- upvalues: l_convertDescriptorToString_0 (ref), v18 (ref), v28 (copy), v19 (ref), v27 (copy), v20 (ref), l_Array_0 (ref), v26 (ref), v22 (ref), v25 (ref), l_ErrorWithStack_0 (ref), v29 (copy)
            v30 = l_convertDescriptorToString_0(v30);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
                -- upvalues: v18 (ref), v28 (ref), v19 (ref), v30 (ref), v27 (ref), v20 (ref), l_Array_0 (ref), v26 (ref), v22 (ref), v25 (ref), v31 (copy), v32 (copy)
                local v33 = if v18(v28) then v19(v30, v27) else v20(v30, v27, v28);
                return (l_Array_0.forEach(v33, function(v34) --[[ Line: 77 ]]
                    -- upvalues: v26 (ref), v22 (ref), v25 (ref), v31 (ref), v32 (ref)
                    return v26(v34.title, v22(v25, v34.arguments, v31), v32);
                end));
            end);
            if not l_status_0 then
                local v37 = l_ErrorWithStack_0.new(l_result_0.message, v29);
                return v26(v30, function() --[[ Line: 89 ]]
                    -- upvalues: v37 (copy)
                    error(v37);
                end);
            else
                return l_result_0;
            end;
        end;
        return v29;
    end;
end;
v18 = function(v38) --[[ Line: 101 ]] --[[ Name: isArrayTable ]]
    return #v38 == 0;
end;
v19 = function(v39, v40) --[[ Line: 105 ]] --[[ Name: buildArrayTests ]]
    -- upvalues: l_validateArrayTable_0 (copy), l_default_0 (copy)
    l_validateArrayTable_0(v40);
    return l_default_0(v39, v40);
end;
v20 = function(v41, v42, v43) --[[ Line: 110 ]] --[[ Name: buildTemplateTests ]]
    -- upvalues: l_Array_0 (copy), v21 (ref), l_validateTemplateTableArguments_0 (copy), l_default_1 (copy)
    local v44 = if l_Array_0.isArray(v42) then v42[1] else v42;
    local v45 = v21(v44);
    l_validateTemplateTableArguments_0(v45, v43);
    return l_default_1(v41, v45, v43);
end;
v21 = function(v46) --[[ Line: 119 ]] --[[ Name: getHeadingKeys ]]
    -- upvalues: l_String_0 (copy), l_extractValidTemplateHeadings_0 (copy)
    return l_String_0.split(l_extractValidTemplateHeadings_0(v46):gsub("%s+", ""), "|");
end;
v22 = function(v47, v48, v49) --[[ Line: 124 ]] --[[ Name: applyArguments ]]
    -- upvalues: v5 (copy), l_Array_0 (copy), l_Object_0 (copy)
    local v50 = nil;
    v50 = if typeof(v49) == "function" then debug.info(v49, "a") else 0;
    local v51 = nil;
    v51 = function(v52) --[[ Line: 138 ]] --[[ Name: replaceNilPlaceholders ]]
        -- upvalues: v5 (ref), l_Array_0 (ref), v51 (ref), l_Object_0 (ref)
        if v52 == v5 then
            return nil;
        elseif l_Array_0.isArray(v52) then
            return l_Array_0.map(v52, function(v53) --[[ Line: 142 ]]
                -- upvalues: v51 (ref)
                return v51(v53);
            end);
        elseif typeof(v52) == "table" then
            l_Array_0.forEach(l_Object_0.keys(v52), function(v54) --[[ Line: 146 ]]
                -- upvalues: v52 (copy), v51 (ref)
                v52[v54] = v51(v52[v54]);
            end);
            return v52;
        else
            return v52;
        end;
    end;
    local v55 = nil;
    v55 = function(v56, v57, ...) --[[ Line: 156 ]] --[[ Name: unpackTable ]]
        -- upvalues: v55 (ref), v51 (ref)
        local v58 = if v57 ~= nil then v57 else #v56;
        if v58 == 0 then
            return ...;
        else
            return v55(v56, v58 - 1, v51(v56[v58]), ...);
        end;
    end;
    return v47 and #v48 < v50 and function(v59) --[[ Line: 166 ]]
        -- upvalues: v49 (copy), v55 (ref), v48 (copy)
        return v49(v55(v48), v59);
    end or function() --[[ Line: 169 ]]
        -- upvalues: v49 (copy), v55 (ref), v48 (copy)
        return v49(v55(v48));
    end;
end;
return v6;