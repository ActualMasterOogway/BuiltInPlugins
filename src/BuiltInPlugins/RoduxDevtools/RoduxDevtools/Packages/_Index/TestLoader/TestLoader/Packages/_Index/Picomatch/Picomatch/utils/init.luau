local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v6 = {};
local v7 = require(l_Parent_0.constants);
local l_REGEX_SPECIAL_CHARS_0 = v7.REGEX_SPECIAL_CHARS;
local l_REGEX_SPECIAL_CHARS_GLOBAL_0 = v7.REGEX_SPECIAL_CHARS_GLOBAL;
v6.isObject = function(v10) --[[ Line: 28 ]] --[[ Name: isObject ]]
    -- upvalues: l_Array_0 (copy)
    local v11 = false;
    if v10 ~= nil then
        v11 = false;
        if typeof(v10) == "table" then
            v11 = not l_Array_0.isArray(v10);
        end;
    end;
    return v11;
end;
v6.hasRegexChars = function(v12) --[[ Line: 31 ]] --[[ Name: hasRegexChars ]]
    -- upvalues: l_REGEX_SPECIAL_CHARS_0 (copy)
    return string.match(v12, l_REGEX_SPECIAL_CHARS_0) ~= nil;
end;
v6.isRegexChar = function(v13) --[[ Line: 34 ]] --[[ Name: isRegexChar ]]
    -- upvalues: v6 (copy)
    local v14 = false;
    if #v13 == 1 then
        v14 = v6.hasRegexChars(v13);
    end;
    return v14;
end;
local l_stringReplace_0 = require(l_Parent_0.stringUtils).stringReplace;
v6.escapeRegex = function(v16) --[[ Line: 41 ]] --[[ Name: escapeRegex ]]
    -- upvalues: l_stringReplace_0 (copy), l_REGEX_SPECIAL_CHARS_GLOBAL_0 (copy)
    return l_stringReplace_0(v16, l_REGEX_SPECIAL_CHARS_GLOBAL_0, function(v17) --[[ Line: 43 ]]
        return "\\" .. v17;
    end);
end;
v6.toPosixSlashes = function(_) --[[ Line: 49 ]] --[[ Name: toPosixSlashes ]]
    error("toPosixSlashes not implemented");
end;
v6.removeBackslashes = function(_) --[[ Line: 54 ]] --[[ Name: removeBackslashes ]]
    error("removeBackslashes not implemented");
end;
v6.supportsLookbehinds = function() --[[ Line: 62 ]] --[[ Name: supportsLookbehinds ]]
    return false;
end;
v6.isWindows = function(v20) --[[ Line: 68 ]] --[[ Name: isWindows ]]
    if typeof(v20) == "table" and typeof(v20.windows) == "boolean" then
        return v20.windows;
    else
        return false;
    end;
end;
v6.escapeLast = function(v21, v22, v23) --[[ Line: 80 ]] --[[ Name: escapeLast ]]
    -- upvalues: l_String_0 (copy), v6 (copy)
    local v24 = l_String_0.lastIndexOf(v21, v22, v23);
    if v24 == -1 then
        return v21;
    elseif v21:sub(v24 - 1, v24 - 1) == "\\" then
        return v6.escapeLast(v21, v22, v24 - 1);
    else
        return ("%s%s"):format(l_String_0.slice(v21, 1, v24), l_String_0.slice(v21, v24));
    end;
end;
v6.removePrefix = function(v25, v26) --[[ Line: 91 ]] --[[ Name: removePrefix ]]
    -- upvalues: l_String_0 (copy)
    local v27 = v26 or {};
    local l_v25_0 = v25;
    if l_String_0.startsWith(l_v25_0, "./") then
        l_v25_0 = l_String_0.slice(l_v25_0, 3);
        v27.prefix = "./";
    end;
    return l_v25_0;
end;
v6.wrapOutput = function(v29, v30, v31) --[[ Line: 101 ]] --[[ Name: wrapOutput ]]
    -- upvalues: l_Boolean_0 (copy)
    local v32 = v30 or {};
    local v33 = v31 or {};
    local v34 = ("%s(?:%s)%s"):format(l_Boolean_0.toJSBoolean(v33.contains) and "" or "^", v29, l_Boolean_0.toJSBoolean(v33.contains) and "" or "$");
    if v32.negated == true then
        v34 = ("(?:^(?!%s).*$)"):format(v34);
    end;
    return v34;
end;
return v6;