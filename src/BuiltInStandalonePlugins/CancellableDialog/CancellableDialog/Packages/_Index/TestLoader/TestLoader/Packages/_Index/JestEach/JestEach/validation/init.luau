local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local l_green_0 = v6.green;
local l_red_0 = v6.red;
v5.validateArrayTable = function(v15) --[[ Line: 33 ]] --[[ Name: validateArrayTable ]]
    -- upvalues: l_Array_0 (copy), l_Error_0 (copy), l_format_0 (copy), v9 (ref), v10 (ref), v11 (ref)
    if not l_Array_0.isArray(v15) then
        error(l_Error_0.new("`.each` must be called with an Array or Tagged Template Literal.\n\n" .. ("Instead was called with: %s\n"):format(l_format_0(v15, {
            maxDepth = 1, 
            min = true
        }))));
    end;
    if v9(v15) then
        if v10(v15[1]) then
            error(l_Error_0.new("Error: `.each` called with an empty Tagged Template Literal of table data.\n"));
        end;
        error(l_Error_0.new("Error: `.each` called with a Tagged Template Literal with no data, remember to interpolate with ${expression} syntax.\n"));
    end;
    if v11(v15) then
        error(l_Error_0.new("Error: `.each` called with an empty Array of table data.\n"));
    end;
end;
v9 = function(v16) --[[ Line: 64 ]] --[[ Name: isTaggedTemplateLiteral ]]
    return v16.raw ~= nil;
end;
v11 = function(v17) --[[ Line: 68 ]] --[[ Name: isEmptyTable ]]
    return #v17 == 0;
end;
v10 = function(v18) --[[ Line: 72 ]] --[[ Name: isEmptyString ]]
    -- upvalues: l_String_0 (copy)
    local v19 = false;
    if typeof(v18) == "string" then
        v19 = l_String_0.trim(v18) == "";
    end;
    return v19;
end;
v5.validateTemplateTableArguments = function(v20, v21) --[[ Line: 76 ]] --[[ Name: validateTemplateTableArguments ]]
    -- upvalues: l_Array_0 (copy), l_Error_0 (copy), l_green_0 (copy), l_red_0 (copy), l_format_0 (copy), v12 (ref)
    l_Array_0.forEach(v21, function(v22, v23) --[[ Line: 78 ]]
        -- upvalues: v20 (copy), l_Error_0 (ref), l_green_0 (ref), l_Array_0 (ref), l_red_0 (ref), l_format_0 (ref), v21 (copy), v12 (ref)
        local v24 = #v20 - #v22;
        local v25 = if v24 >= 0 then v24 else v24 - #v20;
        if v25 ~= 0 then
            error(l_Error_0.new(("%s arguments supplied for given headings:\n"):format(v24 > 0 and "Not enough" or "Too many") .. tostring(l_green_0(l_Array_0.join(v20, " | "))) .. "\n\n" .. "Received:\n" .. tostring(l_red_0(l_format_0(v21))) .. "\n\n" .. ("%s %s %s in row %d"):format(v24 > 0 and "Missing" or "Remove", l_red_0((tostring(v25))), v12("argument", v25), v23)));
        end;
    end);
end;
v12 = function(v26, v27) --[[ Line: 107 ]] --[[ Name: pluralize ]]
    return v26 .. (v27 == 1 and "" or "s");
end;
local v28 = "^" .. "s*[^%.*]+s*" .. "$";
v5.extractValidTemplateHeadings = function(v29) --[[ Line: 122 ]] --[[ Name: extractValidTemplateHeadings ]]
    -- upvalues: v28 (copy), l_Array_0 (copy), l_String_0 (copy), l_Error_0 (copy), l_green_0 (copy), l_red_0 (copy), l_format_0 (copy)
    local v30 = v29:match(v28);
    local v31 = nil;
    local v32 = nil;
    if v30 then
        v31 = l_Array_0.filter(l_String_0.split(v30, "\n"), function(v33) --[[ Line: 127 ]]
            -- upvalues: l_String_0 (ref)
            return l_String_0.trim(v33) ~= "";
        end);
    end;
    if v31 and #v31 > 0 then
        local v35 = l_Array_0.map(l_String_0.split(v31[1], "|"), function(v34) --[[ Line: 132 ]]
            -- upvalues: l_String_0 (ref)
            return l_String_0.trim(v34);
        end);
        v32 = l_Array_0.some(v35, function(v36) --[[ Line: 135 ]]
            return v36:match("%s") ~= nil;
        end);
    end;
    if v30 == nil or v32 then
        error(l_Error_0.new("Table headings do not conform to expected format:\n\n" .. l_green_0("heading1 | headingN") .. "\n\n" .. "Received:\n\n" .. l_red_0(l_format_0(v29))));
    end;
    return v31[1];
end;
return v5;