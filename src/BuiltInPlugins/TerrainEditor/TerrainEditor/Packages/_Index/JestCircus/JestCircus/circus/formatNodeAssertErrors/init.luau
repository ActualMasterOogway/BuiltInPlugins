local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_instanceof_0 = v1.instanceof;
local v5 = require(l_Parent_0.RobloxShared);
local l_escapePatternCharacters_0 = v5.escapePatternCharacters;
local l_normalizePromiseError_0 = v5.normalizePromiseError;
local l_Error_0 = v1.Error;
local v9 = {};
local l_AssertionError_0 = v1.AssertionError;
local v11 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local v13 = require(l_Parent_0.JestMatcherUtils);
local l_diff_0 = v13.diff;
local l_printExpected_0 = v13.printExpected;
local l_printReceived_0 = v13.printReceived;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = {
    ["!="] = "notEqual", 
    ["!=="] = "notStrictEqual", 
    ["=="] = "equal", 
    ["==="] = "strictEqual"
};
local v27 = {
    deepEqual = "to deeply equal", 
    deepStrictEqual = "to deeply and strictly equal", 
    equal = "to be equal", 
    notDeepEqual = "not to deeply equal", 
    notDeepStrictEqual = "not to deeply and strictly equal", 
    notEqual = "to not be equal", 
    notStrictEqual = "not be strictly equal", 
    strictEqual = "to strictly be equal"
};
v18 = function(_, v29, v30) --[[ Line: 71 ]] --[[ Name: formatNodeAssertErrors ]]
    -- upvalues: l_Array_0 (copy), l_normalizePromiseError_0 (copy), l_Boolean_0 (copy), l_format_0 (copy), l_Error_0 (copy), v24 (ref), v23 (ref)
    if v29.name == "test_done" then
        v29.test.errors = l_Array_0.map(v29.test.errors, function(v31) --[[ Line: 73 ]]
            -- upvalues: l_Array_0 (ref), l_normalizePromiseError_0 (ref), l_Boolean_0 (ref), l_format_0 (ref), l_Error_0 (ref), v24 (ref), v23 (ref), v30 (copy)
            local v32 = nil;
            if l_Array_0.isArray(v31) then
                local v33, v34 = table.unpack(v31, 1, 2);
                if v33 == nil then
                    v32 = v34;
                elseif v33.kind == "ExecutionError" then
                    v32 = l_normalizePromiseError_0(v33);
                elseif not l_Boolean_0.toJSBoolean(v33.stack) then
                    v32 = v34;
                    v32.message = if l_Boolean_0.toJSBoolean(v33.message) then v33.message else ("thrown: %s"):format(l_format_0(v33, {
                        maxDepth = 3
                    }));
                    l_Error_0.__recalculateStacktrace(v32);
                else
                    v32 = v33;
                end;
            else
                v32 = v31;
            end;
            if v24(v32) then
                return {
                    message = v23(v32, {
                        expand = v30.expand
                    })
                };
            else
                return v31;
            end;
        end);
    end;
end;
v19 = function(v35, v36) --[[ Line: 106 ]] --[[ Name: getOperatorName ]]
    -- upvalues: l_Boolean_0 (copy), v26 (copy)
    if typeof(v35) == "string" then
        if l_Boolean_0.toJSBoolean(v26[v35]) then
            return v26[v35];
        else
            return v35;
        end;
    elseif v36:match("%.doesNotThrow") ~= nil then
        return "doesNotThrow";
    elseif v36:match("%.throws") ~= nil then
        return "throws";
    elseif v36:match("%.fail") ~= nil then
        return "fail";
    else
        return "";
    end;
end;
v20 = function(v37) --[[ Line: 123 ]] --[[ Name: operatorMessage ]]
    -- upvalues: v19 (ref), v27 (copy), l_Boolean_0 (copy)
    local v38 = v19(v37, "");
    local v39 = v27[v38];
    if typeof(v37) == "string" then
        return (("%s to:\n"):format(if l_Boolean_0.toJSBoolean(v39) then v39 else v38));
    else
        return "";
    end;
end;
v21 = function(v40) --[[ Line: 134 ]] --[[ Name: assertThrowingMatcherHint ]]
    -- upvalues: l_Boolean_0 (copy), v11 (copy)
    if l_Boolean_0.toJSBoolean(v40) then
        return v11.dim("assert") .. v11.dim("." .. v40 .. "(") .. v11.red("function") .. v11.dim(")");
    else
        return "";
    end;
end;
v22 = function(v41, v42, v43) --[[ Line: 140 ]] --[[ Name: assertMatcherHint ]]
    -- upvalues: v11 (copy), l_Boolean_0 (copy)
    local v44 = "";
    if v41 == "==" and v43 == true then
        return v11.dim("assert") .. v11.dim("(") .. v11.red("received") .. v11.dim(")");
    else
        if l_Boolean_0.toJSBoolean(v42) then
            v44 = v11.dim("assert") .. v11.dim("." .. v42 .. "(") .. v11.red("received") .. v11.dim(", ") .. v11.green("expected") .. v11.dim(")");
        end;
        return v44;
    end;
end;
v23 = function(v45, v46) --[[ Line: 157 ]] --[[ Name: assertionErrorMessage ]]
    -- upvalues: l_diff_0 (copy), l_Boolean_0 (copy), v19 (ref), l_escapePatternCharacters_0 (copy), v25 (ref), v21 (ref), v11 (copy), l_printReceived_0 (copy), v22 (ref), v20 (ref), l_printExpected_0 (copy)
    local l_expected_0 = v45.expected;
    local l_actual_0 = v45.actual;
    local l_generatedMessage_0 = v45.generatedMessage;
    local l_message_0 = v45.message;
    local l_operator_0 = v45.operator;
    local l_stack_0 = v45.stack;
    local v53 = l_diff_0(l_expected_0, l_actual_0, v46);
    local v54 = not l_Boolean_0.toJSBoolean(l_generatedMessage_0);
    local v55 = v19(l_operator_0, l_stack_0);
    local v56 = l_stack_0:gsub(l_escapePatternCharacters_0(l_message_0), "", 1):gsub("^AssertionError([^\n]*)", ""):gsub("^Error([^\n]*)", "");
    if v55 == "doesNotThrow" then
        return v25(v21(v55)) .. v11.reset("Expected the function not to throw an error.\n") .. v11.reset("Instead, it threw:\n") .. ("  %s"):format(l_printReceived_0(l_actual_0)) .. v11.reset(if l_Boolean_0.toJSBoolean(v54) then "\n\nMessage:\n  " .. tostring(l_message_0) else "") .. v56;
    elseif v55 == "throws" then
        return v25(v21(v55)) .. v11.reset("Expected the function to throw an error.\n") .. v11.reset("But it didn't throw anything.") .. v11.reset(if v54 then "\n\nMessage:\n  " .. l_message_0 else "") .. v56;
    elseif v55 == "fail" then
        return v25(v22(l_operator_0, v55, l_expected_0)) .. v11.reset(if v54 then "Message:\n  " .. tostring(l_message_0) else "") .. v56;
    else
        return v25(v22(l_operator_0, v55, l_expected_0)) .. v11.reset(("Expected value %s"):format(v20(l_operator_0))) .. ("  %s\n"):format(l_printExpected_0(l_expected_0)) .. v11.reset("Received:\n") .. ("  %s"):format(l_printReceived_0(l_actual_0)) .. v11.reset(if v54 then "\n\nMessage:\n  " .. tostring(l_message_0) else "") .. (if l_Boolean_0.toJSBoolean(v53) and v53 ~= nil then ("\n\nDifference:\n\n%s"):format(v53) else "") .. v56;
    end;
end;
v24 = function(v57) --[[ Line: 207 ]] --[[ Name: isAssertionError ]]
    -- upvalues: l_instanceof_0 (copy), l_AssertionError_0 (copy)
    return v57 and (l_instanceof_0(v57, l_AssertionError_0) or v57.name == l_AssertionError_0.name or v57.code == "ERR_ASSERTION");
end;
v25 = function(v58) --[[ Line: 212 ]] --[[ Name: buildHintString ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v58) then
        return tostring(v58) .. "\n\n";
    else
        return "";
    end;
end;
v9.default = v18;
return v9;