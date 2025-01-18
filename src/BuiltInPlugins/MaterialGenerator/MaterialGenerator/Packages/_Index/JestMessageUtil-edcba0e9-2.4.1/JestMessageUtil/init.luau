local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
local l_toJSBoolean_0 = v1.Boolean.toJSBoolean;
local _ = nil;
local v6 = nil;
local function v8(v7) --[[ Line: 75 ]] --[[ Name: trim ]]
    -- upvalues: l_String_0 (copy)
    return l_String_0.trim(v7 or "");
end;
local function _(v9) --[[ Line: 83 ]] --[[ Name: trimPaths ]]
    -- upvalues: v8 (copy)
    if v9:find("%s*at.*%(?:%d*:%d*%)?") or v9:find("%s*at.*%(?native%)?") then
        return v8(v9);
    else
        return v9;
    end;
end;
local function v15(v11, v12) --[[ Line: 188 ]] --[[ Name: removeInternalStackEntries ]]
    -- upvalues: l_Array_0 (copy)
    local v13 = 0;
    return l_Array_0.filter(v11, function(v14) --[[ Line: 191 ]]
        -- upvalues: v13 (ref), v12 (copy)
        if v14:find("^%s+at <anonymous>.*$") then
            return false;
        elseif v14:find("^%s+at Promise %(<anonymous>%).*$") or v14:find("^%s+at new Promise %(<anonymous>%).*$") then
            return false;
        elseif v14:find("^%s+at Generator.next %(<anonymous>%).*$") then
            return false;
        elseif v14:find("^%s+at next %(native%).*$") then
            return false;
        elseif not v14:find("%s*at.*%(?:%d*:%d*%)?") or not v14:find("%s*at.*%(?native%)?") then
            return true;
        elseif v14:find("%s+at(.jasmine%-)") or v14:find("%s+at(%s+jasmine%.buildExpectationResult)") then
            return false;
        else
            v13 = v13 + 1;
            if v13 == 1 then
                return true;
            elseif v12.noStackTrace then
                return false;
            else
                return true;
            end;
        end;
    end);
end;
local _ = function(_, _, v18) --[[ Line: 241 ]] --[[ Name: formatPaths ]]
    return v18;
end;
v6 = function(v20, v21) --[[ Line: 246 ]] --[[ Name: getStackTraceLines ]]
    -- upvalues: v15 (copy)
    if v21 == nil then
        v21 = {
            noCodeFrame = false, 
            noStackTrace = false
        };
    end;
    return v15(string.split(v20, "\n"), v21);
end;
return {
    formatStackTrace = function(v22, v23, v24, v25) --[[ Line: 253 ]] --[[ Name: formatStackTrace ]]
        -- upvalues: v6 (ref), l_Array_0 (copy), l_toJSBoolean_0 (copy), l_String_0 (copy)
        local v26 = v6(v22, v24);
        local v27 = nil;
        if v25 then
            v27 = "unsupported";
        end;
        local v32 = table.concat(l_Array_0.map(l_Array_0.filter(v26, l_toJSBoolean_0), function(v28) --[[ Line: 262 ]]
            -- upvalues: v23 (copy), v27 (ref), l_String_0 (ref)
            local v29 = "      ";
            local _ = v23;
            local _ = v27;
            return v29 .. if not not v28:find("%s*at.*%(?:%d*:%d*%)?") or v28:find("%s*at.*%(?native%)?") then l_String_0.trim(v28 or "") else v28;
        end), "\n");
        return string.format("\n%s", v32);
    end, 
    getStackTraceLines = v6
};