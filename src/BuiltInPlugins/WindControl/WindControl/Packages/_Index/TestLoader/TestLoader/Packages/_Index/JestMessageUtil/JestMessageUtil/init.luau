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
local v11 = require(l_Parent_0.RobloxShared);
local l_normalizePromiseError_0 = v11.normalizePromiseError;
local l_cleanLoadStringStack_0 = v11.cleanLoadStringStack;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = v8.bold("\226\151\143 ");
local l_dim_0 = v8.dim;
v7.indentAllLines = function(v19, v20) --[[ Line: 85 ]] --[[ Name: indentAllLines ]]
    local v21 = string.split(v19, "\n");
    for v22, v23 in v21 do
        v21[v22] = (v20 or "") .. v23;
    end;
    return table.concat(v21, "\n");
end;
local function v25(v24) --[[ Line: 96 ]] --[[ Name: trim ]]
    -- upvalues: l_String_0 (copy)
    return l_String_0.trim(v24 or "");
end;
local function _(v26) --[[ Line: 104 ]] --[[ Name: trimPaths ]]
    -- upvalues: v25 (copy)
    if v26:find("%s*at.*%(?:%d*:%d*%)?") or v26:find("%s*at.*%(?native%)?") then
        return v25(v26);
    else
        return v26;
    end;
end;
local v30 = {
    test = function(_, v29) --[[ Line: 115 ]] --[[ Name: test ]]
        return string.match(v29, "%S") == nil;
    end
};
local function _(v31) --[[ Line: 121 ]] --[[ Name: checkForCommonEnvironmentErrors ]]
    return v31;
end;
v7.formatExecError = function(v33, v34, v35, v36, v37) --[[ Line: 154 ]] --[[ Name: formatExecError ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy), l_normalizePromiseError_0 (copy), l_format_0 (copy), v16 (ref), l_String_0 (copy), v14 (ref), v30 (copy), v17 (copy)
    if not l_Boolean_0.toJSBoolean(v33) or typeof(v33) == "number" then
        v33 = l_Error_0.new(("Expected an Error, but \"%s\" was thrown"):format((tostring(v33))));
        v33.stack = "";
    end;
    local v38 = nil;
    local v39 = nil;
    if typeof(v33) == "string" or not l_Boolean_0.toJSBoolean(v33) or v33 == nil then
        if not l_Boolean_0.toJSBoolean(v33) then
            v33 = "EMPTY ERROR";
        end;
        v38 = "";
        v39 = v33;
    else
        if v33.kind == "ExecutionError" then
            v33 = l_normalizePromiseError_0(v33);
        end;
        v38 = v33.message;
        v39 = if typeof(v33.stack) == "string" then v33.stack else ("thrown: %s"):format(l_format_0(v33, {
            maxDepth = 3
        }));
    end;
    local v40 = v16(l_Boolean_0.toJSBoolean(v39) and v39 or "");
    v39 = v40.stack;
    if string.find(v40.message, l_String_0.trim(v38 or ""), 1, true) ~= nil then
        v38 = v40.message;
    end;
    local v41 = string.split(v38, "\n");
    for v42, v43 in v41 do
        v41[v42] = "    " .. v43;
    end;
    v38 = table.concat(v41, "\n");
    v39 = (not l_Boolean_0.toJSBoolean(v39) or v35.noStackTrace) and "" or "\n" .. v14(v39, v34, v35, v36);
    if typeof(v39) ~= "string" or v30:test(v38) and v30:test(v39) then
        v38 = ("thrown: %s"):format((tostring(l_format_0(v33, {
            maxDepth = 3
        }))));
    end;
    local v44 = nil;
    v44 = if v37 then (" %s"):format(l_String_0.trim(v38)) else ("%s\n\n%s"):format("Test suite failed to run", v38);
    return "  " .. v17 .. v44 .. v39 .. "\n";
end;
local function v49(v45, v46) --[[ Line: 226 ]] --[[ Name: removeInternalStackEntries ]]
    -- upvalues: l_Array_0 (copy)
    local v47 = 0;
    return l_Array_0.filter(v45, function(v48) --[[ Line: 229 ]]
        -- upvalues: v47 (ref), v46 (copy)
        if v48:find("^%s+at <anonymous>.*$") then
            return false;
        elseif v48:find("^%s+at Promise %(<anonymous>%).*$") or v48:find("^%s+at new Promise %(<anonymous>%).*$") then
            return false;
        elseif v48:find("^%s+at Generator.next %(<anonymous>%).*$") then
            return false;
        elseif v48:find("^%s+at next %(native%).*$") then
            return false;
        elseif not v48:find("%s*at.*%(?:%d*:%d*%)?") or not v48:find("%s*at.*%(?native%)?") then
            return true;
        elseif v48:find("%s+at(.jasmine%-)") or v48:find("%s+at(%s+jasmine%.buildExpectationResult)") then
            return false;
        else
            v47 = v47 + 1;
            if v47 == 1 then
                return true;
            elseif v46.noStackTrace then
                return false;
            else
                return true;
            end;
        end;
    end);
end;
local _ = function(_, _, v52) --[[ Line: 279 ]] --[[ Name: formatPaths ]]
    -- upvalues: l_cleanLoadStringStack_0 (copy)
    return l_cleanLoadStringStack_0(v52);
end;
v15 = function(v54, v55) --[[ Line: 284 ]] --[[ Name: getStackTraceLines ]]
    -- upvalues: v49 (copy)
    if v55 == nil then
        v55 = {
            noCodeFrame = false, 
            noStackTrace = false
        };
    end;
    return v49(string.split(v54, "\n"), v55);
end;
v7.getStackTraceLines = v15;
v14 = function(v56, v57, v58, v59) --[[ Line: 292 ]] --[[ Name: formatStackTrace ]]
    -- upvalues: v15 (ref), l_Array_0 (copy), l_Boolean_0 (copy), l_String_0 (copy), l_cleanLoadStringStack_0 (copy)
    local v60 = v15(v56, v58);
    local v61 = nil;
    if v59 then
        v61 = "unsupported";
    end;
    local v67 = table.concat(l_Array_0.map(l_Array_0.filter(v60, l_Boolean_0.toJSBoolean), function(v62) --[[ Line: 301 ]]
        -- upvalues: v57 (copy), v61 (ref), l_String_0 (ref), l_cleanLoadStringStack_0 (ref)
        local v63 = "      ";
        local _ = v57;
        local _ = v61;
        local v66 = if not not v62:find("%s*at.*%(?:%d*:%d*%)?") or v62:find("%s*at.*%(?native%)?") then l_String_0.trim(v62 or "") else v62;
        return v63 .. l_cleanLoadStringStack_0(v66);
    end), "\n");
    return string.format("\n%s", v67);
end;
v7.formatStackTrace = v14;
v7.formatResultsErrors = function(v68, v69, v70, v71) --[[ Line: 316 ]] --[[ Name: formatResultsErrors ]]
    -- upvalues: l_Array_0 (copy), v16 (ref), l_dim_0 (copy), v14 (ref), v8 (copy), v17 (copy)
    local v75 = l_Array_0.reduce(v68, function(v72, v73) --[[ Line: 322 ]]
        -- upvalues: l_Array_0 (ref)
        l_Array_0.forEach(v73.failureMessages, function(v74) --[[ Line: 323 ]]
            -- upvalues: v72 (copy), v73 (copy)
            table.insert(v72, {
                content = v74, 
                result = v73
            });
        end);
        return v72;
    end, {});
    if #v75 <= 0 then
        return nil;
    else
        return l_Array_0.join(l_Array_0.map(v75, function(v76) --[[ Line: 334 ]]
            -- upvalues: v16 (ref), v70 (copy), l_dim_0 (ref), v14 (ref), v69 (copy), v71 (copy), v8 (ref), v17 (ref), l_Array_0 (ref)
            local l_result_0 = v76.result;
            local l_content_0 = v76.content;
            local v79 = v16(l_content_0);
            local l_message_0 = v79.message;
            local l_stack_0 = v79.stack;
            l_stack_0 = v70.noStackTrace and "" or l_dim_0(v14(l_stack_0, v69, v70, v71)) .. "\n";
            local v82 = string.split(l_message_0, "\n");
            for v83, v84 in v82 do
                v82[v83] = "    " .. v84;
            end;
            l_message_0 = table.concat(v82, "\n");
            return (v8.bold(v8.red("  " .. v17 .. l_Array_0.join(l_result_0.ancestorTitles, " \226\128\186 ") .. (#l_result_0.ancestorTitles > 0 and " \226\128\186 " or "") .. l_result_0.title)) .. "\n") .. "\n" .. l_message_0 .. "\n" .. l_stack_0;
        end), "\n");
    end;
end;
local function v87(v85) --[[ Line: 360 ]] --[[ Name: removeBlankErrorLine ]]
    -- upvalues: l_String_0 (copy), l_Array_0 (copy)
    return l_String_0.trimRight(table.concat(l_Array_0.filter(l_String_0.split(v85, "\n"), function(v86) --[[ Line: 362 ]]
        return not v86:find("^Error:?%s*$");
    end), "\n"));
end;
v16 = function(v88) --[[ Line: 372 ]] --[[ Name: separateMessageFromStack ]]
    -- upvalues: v6 (copy), v87 (copy)
    if not v88 then
        return {
            message = "", 
            stack = ""
        };
    else
        local v89 = v6("^(?:Error: )?([\\s\\S]*?(?=\\n\\s*LoadedCode.*:\\d*)|\\s*.*)([\\s\\S]*)$"):exec(v88);
        if not v89 then
            error("If you hit this error, the regex above is buggy.");
        end;
        local v90 = v87(v89[2]);
        local v91 = v87(v89[3]);
        return {
            message = v90, 
            stack = v91
        };
    end;
end;
v7.separateMessageFromStack = v16;
return v7;