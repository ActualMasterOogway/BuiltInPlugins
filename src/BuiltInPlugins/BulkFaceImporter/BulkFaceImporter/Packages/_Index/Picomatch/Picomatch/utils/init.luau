local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v6 = {};
local l_REGEX_SPECIAL_CHARS_0 = require(l_Parent_0.constants).REGEX_SPECIAL_CHARS;
v6.isObject = function(v8) --[[ Line: 28 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    local v9 = false;
    if v8 ~= nil then
        v9 = false;
        if typeof(v8) == "table" then
            v9 = not l_Array_0.isArray(v8);
        end;
    end;
    return v9;
end;
v6.hasRegexChars = function(v10) --[[ Line: 31 ]] --[[ Name: hasRegexChars ]]
    -- upvalues: l_REGEX_SPECIAL_CHARS_0 (copy)
    return string.match(v10, l_REGEX_SPECIAL_CHARS_0) ~= nil;
end;
v6.isRegexChar = function(v11) --[[ Line: 34 ]] --[[ Name: isRegexChar ]]
    -- upvalues: v6 (copy)
    local v12 = false;
    if #v11 == 1 then
        v12 = v6.hasRegexChars(v11);
    end;
    return v12;
end;
v6.escapeRegex = function(_) --[[ Line: 38 ]] --[[ Name: escapeRegex ]]
    error("escapeRegex not implemented");
end;
v6.toPosixSlashes = function(_) --[[ Line: 42 ]] --[[ Name: toPosixSlashes ]]
    error("toPosixSlashes not implemented");
end;
v6.removeBackslashes = function(_) --[[ Line: 47 ]] --[[ Name: removeBackslashes ]]
    error("removeBackslashes not implemented");
end;
v6.supportsLookbehinds = function() --[[ Line: 55 ]] --[[ Name: supportsLookbehinds ]]
    return false;
end;
v6.isWindows = function(v16) --[[ Line: 61 ]] --[[ Name: isWindows ]]
    if typeof(v16) == "table" and typeof(v16.windows) == "boolean" then
        return v16.windows;
    else
        return false;
    end;
end;
v6.escapeLast = function(v17, v18, v19) --[[ Line: 73 ]] --[[ Name: escapeLast ]]
    -- upvalues: l_String_0 (copy), v6 (copy)
    local v20 = l_String_0.lastIndexOf(v17, v18, v19);
    if v20 == -1 then
        return v17;
    elseif v17:sub(v20 - 1, v20 - 1) == "\\" then
        return v6.escapeLast(v17, v18, v20 - 1);
    else
        return ("%s%s"):format(l_String_0.slice(v17, 1, v20), l_String_0.slice(v17, v20));
    end;
end;
v6.removePrefix = function(v21, v22) --[[ Line: 84 ]] --[[ Name: removePrefix ]]
    -- upvalues: l_String_0 (copy)
    local v23 = v22 or {};
    local l_v21_0 = v21;
    if l_String_0.startsWith(l_v21_0, "./") then
        l_v21_0 = l_String_0.slice(l_v21_0, 3);
        v23.prefix = "./";
    end;
    return l_v21_0;
end;
v6.wrapOutput = function(v25, v26, v27) --[[ Line: 94 ]] --[[ Name: wrapOutput ]]
    -- upvalues: l_Boolean_0 (copy)
    local v28 = v26 or {};
    local v29 = v27 or {};
    local v30 = ("%s(?:%s)%s"):format(l_Boolean_0.toJSBoolean(v29.contains) and "" or "^", v25, l_Boolean_0.toJSBoolean(v29.contains) and "" or "$");
    if v28.negated == true then
        v30 = ("(?:^(?!%s).*$)"):format(v30);
    end;
    return v30;
end;
return v6;