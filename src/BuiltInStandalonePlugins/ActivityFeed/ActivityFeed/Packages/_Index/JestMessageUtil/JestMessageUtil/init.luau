local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local v6 = require(l_Parent_0.RegExp);
local v7 = {};
local v8 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local l_normalizePromiseError_0 = require(l_Parent_0.RobloxShared).normalizePromiseError;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = v8.bold("\226\151\143 ");
local l_dim_0 = v8.dim;
v7.indentAllLines = function(v17, v18) --[[ Line: 83 ]] --[[ Name: indentAllLines ]]
    local v19 = string.split(v17, "\n");
    for v20, v21 in v19 do
        v19[v20] = (v18 or "") .. v21;
    end;
    return table.concat(v19, "\n");
end;
local function v23(v22) --[[ Line: 94 ]] --[[ Name: trim ]]
    -- upvalues: l_String_0 (copy)
    return l_String_0.trim(v22 or "");
end;
local function _(v24) --[[ Line: 102 ]] --[[ Name: trimPaths ]]
    -- upvalues: v23 (copy)
    if v24:find("%s*at.*%(?:%d*:%d*%)?") or v24:find("%s*at.*%(?native%)?") then
        return v23(v24);
    else
        return v24;
    end;
end;
local v28 = {
    test = function(_, v27) --[[ Line: 113 ]] --[[ Name: test ]]
        return string.match(v27, "%S") == nil;
    end
};
local function _(v29) --[[ Line: 119 ]] --[[ Name: checkForCommonEnvironmentErrors ]]
    return v29;
end;
v7.formatExecError = function(v31, v32, v33, v34, v35) --[[ Line: 152 ]] --[[ Name: formatExecError ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy), l_normalizePromiseError_0 (copy), l_format_0 (copy), v14 (ref), l_String_0 (copy), v12 (ref), v28 (copy), v15 (copy)
    if not l_Boolean_0.toJSBoolean(v31) or typeof(v31) == "number" then
        v31 = l_Error_0.new(("Expected an Error, but \"%s\" was thrown"):format((tostring(v31))));
        v31.stack = "";
    end;
    local v36 = nil;
    local v37 = nil;
    if typeof(v31) == "string" or not l_Boolean_0.toJSBoolean(v31) or v31 == nil then
        if not l_Boolean_0.toJSBoolean(v31) then
            v31 = "EMPTY ERROR";
        end;
        v36 = "";
        v37 = v31;
    else
        if v31.kind == "ExecutionError" then
            v31 = l_normalizePromiseError_0(v31);
        end;
        v36 = v31.message;
        v37 = if typeof(v31.stack) == "string" then v31.stack else ("thrown: %s"):format(l_format_0(v31, {
            maxDepth = 3
        }));
    end;
    local v38 = v14(l_Boolean_0.toJSBoolean(v37) and v37 or "");
    v37 = v38.stack;
    if string.find(v38.message, l_String_0.trim(v36 or ""), 1, true) ~= nil then
        v36 = v38.message;
    end;
    local v39 = string.split(v36, "\n");
    for v40, v41 in v39 do
        v39[v40] = "    " .. v41;
    end;
    v36 = table.concat(v39, "\n");
    v37 = (not l_Boolean_0.toJSBoolean(v37) or v33.noStackTrace) and "" or "\n" .. v12(v37, v32, v33, v34);
    if typeof(v37) ~= "string" or v28:test(v36) and v28:test(v37) then
        v36 = ("thrown: %s"):format((tostring(l_format_0(v31, {
            maxDepth = 3
        }))));
    end;
    local v42 = nil;
    v42 = if v35 then (" %s"):format(l_String_0.trim(v36)) else ("%s\n\n%s"):format("Test suite failed to run", v36);
    return "  " .. v15 .. v42 .. v37 .. "\n";
end;
local function v47(v43, v44) --[[ Line: 224 ]] --[[ Name: removeInternalStackEntries ]]
    -- upvalues: l_Array_0 (copy)
    local v45 = 0;
    return l_Array_0.filter(v43, function(v46) --[[ Line: 227 ]]
        -- upvalues: v45 (ref), v44 (copy)
        if v46:find("^%s+at <anonymous>.*$") then
            return false;
        elseif v46:find("^%s+at Promise %(<anonymous>%).*$") or v46:find("^%s+at new Promise %(<anonymous>%).*$") then
            return false;
        elseif v46:find("^%s+at Generator.next %(<anonymous>%).*$") then
            return false;
        elseif v46:find("^%s+at next %(native%).*$") then
            return false;
        elseif not v46:find("%s*at.*%(?:%d*:%d*%)?") or not v46:find("%s*at.*%(?native%)?") then
            return true;
        elseif v46:find("%s+at(.jasmine%-)") or v46:find("%s+at(%s+jasmine%.buildExpectationResult)") then
            return false;
        else
            v45 = v45 + 1;
            if v45 == 1 then
                return true;
            elseif v44.noStackTrace then
                return false;
            else
                return true;
            end;
        end;
    end);
end;
local _ = function(_, _, v50) --[[ Line: 277 ]] --[[ Name: formatPaths ]]
    return v50;
end;
v13 = function(v52, v53) --[[ Line: 282 ]] --[[ Name: getStackTraceLines ]]
    -- upvalues: v47 (copy)
    if v53 == nil then
        v53 = {
            noCodeFrame = false, 
            noStackTrace = false
        };
    end;
    return v47(string.split(v52, "\n"), v53);
end;
v7.getStackTraceLines = v13;
v12 = function(v54, v55, v56, v57) --[[ Line: 290 ]] --[[ Name: formatStackTrace ]]
    -- upvalues: v13 (ref), l_Array_0 (copy), l_Boolean_0 (copy), l_String_0 (copy)
    local v58 = v13(v54, v56);
    local v59 = nil;
    if v57 then
        v59 = "unsupported";
    end;
    local v64 = table.concat(l_Array_0.map(l_Array_0.filter(v58, l_Boolean_0.toJSBoolean), function(v60) --[[ Line: 299 ]]
        -- upvalues: v55 (copy), v59 (ref), l_String_0 (ref)
        local v61 = "      ";
        local _ = v55;
        local _ = v59;
        return v61 .. if not not v60:find("%s*at.*%(?:%d*:%d*%)?") or v60:find("%s*at.*%(?native%)?") then l_String_0.trim(v60 or "") else v60;
    end), "\n");
    return string.format("\n%s", v64);
end;
v7.formatStackTrace = v12;
v7.formatResultsErrors = function(v65, v66, v67, v68) --[[ Line: 314 ]] --[[ Name: formatResultsErrors ]]
    -- upvalues: l_Array_0 (copy), v14 (ref), l_dim_0 (copy), v12 (ref), v8 (copy), v15 (copy)
    local v72 = l_Array_0.reduce(v65, function(v69, v70) --[[ Line: 320 ]]
        -- upvalues: l_Array_0 (ref)
        l_Array_0.forEach(v70.failureMessages, function(v71) --[[ Line: 321 ]]
            -- upvalues: v69 (copy), v70 (copy)
            table.insert(v69, {
                content = v71, 
                result = v70
            });
        end);
        return v69;
    end, {});
    if #v72 <= 0 then
        return nil;
    else
        return l_Array_0.join(l_Array_0.map(v72, function(v73) --[[ Line: 332 ]]
            -- upvalues: v14 (ref), v67 (copy), l_dim_0 (ref), v12 (ref), v66 (copy), v68 (copy), v8 (ref), v15 (ref), l_Array_0 (ref)
            local l_result_0 = v73.result;
            local l_content_0 = v73.content;
            local v76 = v14(l_content_0);
            local l_message_0 = v76.message;
            local l_stack_0 = v76.stack;
            l_stack_0 = v67.noStackTrace and "" or l_dim_0(v12(l_stack_0, v66, v67, v68)) .. "\n";
            local v79 = string.split(l_message_0, "\n");
            for v80, v81 in v79 do
                v79[v80] = "    " .. v81;
            end;
            l_message_0 = table.concat(v79, "\n");
            return (v8.bold(v8.red("  " .. v15 .. l_Array_0.join(l_result_0.ancestorTitles, " \226\128\186 ") .. (#l_result_0.ancestorTitles > 0 and " \226\128\186 " or "") .. l_result_0.title)) .. "\n") .. "\n" .. l_message_0 .. "\n" .. l_stack_0;
        end), "\n");
    end;
end;
local function v84(v82) --[[ Line: 358 ]] --[[ Name: removeBlankErrorLine ]]
    -- upvalues: l_String_0 (copy), l_Array_0 (copy)
    return l_String_0.trimRight(table.concat(l_Array_0.filter(l_String_0.split(v82, "\n"), function(v83) --[[ Line: 360 ]]
        return not v83:find("^Error:?%s*$");
    end), "\n"));
end;
v14 = function(v85) --[[ Line: 370 ]] --[[ Name: separateMessageFromStack ]]
    -- upvalues: v6 (copy), v84 (copy)
    if not v85 then
        return {
            message = "", 
            stack = ""
        };
    else
        local v86 = v6("^(?:Error: )?([\\s\\S]*?(?=\\n\\s*LoadedCode.*:\\d*)|\\s*.*)([\\s\\S]*)$"):exec(v85);
        if not v86 then
            error("If you hit this error, the regex above is buggy.");
        end;
        local v87 = v84(v86[2]);
        local v88 = v84(v86[3]);
        return {
            message = v87, 
            stack = v88
        };
    end;
end;
v7.separateMessageFromStack = v14;
return v7;