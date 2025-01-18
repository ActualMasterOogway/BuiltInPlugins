local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_instanceof_0 = v1.instanceof;
local v5 = require(l_Parent_0.RobloxShared);
local l_escapePatternCharacters_0 = v5.escapePatternCharacters;
local l_normalizePromiseError_0 = v5.normalizePromiseError;
local l_Error_0 = v1.Error;
local _ = v5.cleanLoadStringStack;
local v10 = {};
local l_AssertionError_0 = v1.AssertionError;
local v12 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local v14 = require(l_Parent_0.JestMatcherUtils);
local l_diff_0 = v14.diff;
local l_printExpected_0 = v14.printExpected;
local l_printReceived_0 = v14.printReceived;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = {
    ["!="] = "notEqual", 
    ["!=="] = "notStrictEqual", 
    ["=="] = "equal", 
    ["==="] = "strictEqual"
};
local v28 = {
    deepEqual = "to deeply equal", 
    deepStrictEqual = "to deeply and strictly equal", 
    equal = "to be equal", 
    notDeepEqual = "not to deeply equal", 
    notDeepStrictEqual = "not to deeply and strictly equal", 
    notEqual = "to not be equal", 
    notStrictEqual = "not be strictly equal", 
    strictEqual = "to strictly be equal"
};
v19 = function(_, v30, v31) --[[ Line: 72 ]] --[[ Name: formatNodeAssertErrors ]]
    -- upvalues: l_Array_0 (copy), l_normalizePromiseError_0 (copy), l_Boolean_0 (copy), l_format_0 (copy), l_Error_0 (copy), v25 (ref), v24 (ref)
    if v30.name == "test_done" then
        v30.test.errors = l_Array_0.map(v30.test.errors, function(v32) --[[ Line: 74 ]]
            -- upvalues: l_Array_0 (ref), l_normalizePromiseError_0 (ref), l_Boolean_0 (ref), l_format_0 (ref), l_Error_0 (ref), v25 (ref), v24 (ref), v31 (copy)
            local v33 = nil;
            if l_Array_0.isArray(v32) then
                local v34, v35 = table.unpack(v32, 1, 2);
                if v34 == nil then
                    v33 = v35;
                elseif v34.kind == "ExecutionError" then
                    v33 = l_normalizePromiseError_0(v34);
                elseif not l_Boolean_0.toJSBoolean(v34.stack) then
                    v33 = v35;
                    v33.message = if l_Boolean_0.toJSBoolean(v34.message) then v34.message else ("thrown: %s"):format(l_format_0(v34, {
                        maxDepth = 3
                    }));
                    l_Error_0.__recalculateStacktrace(v33);
                else
                    v33 = v34;
                end;
            else
                v33 = v32;
            end;
            if v25(v33) then
                return {
                    message = v24(v33, {
                        expand = v31.expand
                    })
                };
            else
                return v32;
            end;
        end);
    end;
end;
v20 = function(v36, v37) --[[ Line: 107 ]] --[[ Name: getOperatorName ]]
    -- upvalues: l_Boolean_0 (copy), v27 (copy)
    if typeof(v36) == "string" then
        if l_Boolean_0.toJSBoolean(v27[v36]) then
            return v27[v36];
        else
            return v36;
        end;
    elseif v37:match("%.doesNotThrow") ~= nil then
        return "doesNotThrow";
    elseif v37:match("%.throws") ~= nil then
        return "throws";
    elseif v37:match("%.fail") ~= nil then
        return "fail";
    else
        return "";
    end;
end;
v21 = function(v38) --[[ Line: 124 ]] --[[ Name: operatorMessage ]]
    -- upvalues: v20 (ref), v28 (copy), l_Boolean_0 (copy)
    local v39 = v20(v38, "");
    local v40 = v28[v39];
    if typeof(v38) == "string" then
        return (("%s to:\n"):format(if l_Boolean_0.toJSBoolean(v40) then v40 else v39));
    else
        return "";
    end;
end;
v22 = function(v41) --[[ Line: 135 ]] --[[ Name: assertThrowingMatcherHint ]]
    -- upvalues: l_Boolean_0 (copy), v12 (copy)
    if l_Boolean_0.toJSBoolean(v41) then
        return v12.dim("assert") .. v12.dim("." .. v41 .. "(") .. v12.red("function") .. v12.dim(")");
    else
        return "";
    end;
end;
v23 = function(v42, v43, v44) --[[ Line: 141 ]] --[[ Name: assertMatcherHint ]]
    -- upvalues: v12 (copy), l_Boolean_0 (copy)
    local v45 = "";
    if v42 == "==" and v44 == true then
        return v12.dim("assert") .. v12.dim("(") .. v12.red("received") .. v12.dim(")");
    else
        if l_Boolean_0.toJSBoolean(v43) then
            v45 = v12.dim("assert") .. v12.dim("." .. v43 .. "(") .. v12.red("received") .. v12.dim(", ") .. v12.green("expected") .. v12.dim(")");
        end;
        return v45;
    end;
end;
v24 = function(v46, v47) --[[ Line: 158 ]] --[[ Name: assertionErrorMessage ]]
    -- upvalues: l_diff_0 (copy), l_Boolean_0 (copy), v20 (ref), l_escapePatternCharacters_0 (copy), v26 (ref), v22 (ref), v12 (copy), l_printReceived_0 (copy), v23 (ref), v21 (ref), l_printExpected_0 (copy)
    local l_expected_0 = v46.expected;
    local l_actual_0 = v46.actual;
    local l_generatedMessage_0 = v46.generatedMessage;
    local l_message_0 = v46.message;
    local l_operator_0 = v46.operator;
    local l_stack_0 = v46.stack;
    local v54 = l_diff_0(l_expected_0, l_actual_0, v47);
    local v55 = not l_Boolean_0.toJSBoolean(l_generatedMessage_0);
    local v56 = v20(l_operator_0, l_stack_0);
    local v57 = l_stack_0:gsub(l_escapePatternCharacters_0(l_message_0), "", 1):gsub("^AssertionError([^\n]*)", ""):gsub("^Error([^\n]*)", "");
    if v56 == "doesNotThrow" then
        return v26(v22(v56)) .. v12.reset("Expected the function not to throw an error.\n") .. v12.reset("Instead, it threw:\n") .. ("  %s"):format(l_printReceived_0(l_actual_0)) .. v12.reset(if l_Boolean_0.toJSBoolean(v55) then "\n\nMessage:\n  " .. tostring(l_message_0) else "") .. v57;
    elseif v56 == "throws" then
        return v26(v22(v56)) .. v12.reset("Expected the function to throw an error.\n") .. v12.reset("But it didn't throw anything.") .. v12.reset(if v55 then "\n\nMessage:\n  " .. l_message_0 else "") .. v57;
    elseif v56 == "fail" then
        return v26(v23(l_operator_0, v56, l_expected_0)) .. v12.reset(if v55 then "Message:\n  " .. tostring(l_message_0) else "") .. v57;
    else
        return v26(v23(l_operator_0, v56, l_expected_0)) .. v12.reset(("Expected value %s"):format(v21(l_operator_0))) .. ("  %s\n"):format(l_printExpected_0(l_expected_0)) .. v12.reset("Received:\n") .. ("  %s"):format(l_printReceived_0(l_actual_0)) .. v12.reset(if v55 then "\n\nMessage:\n  " .. tostring(l_message_0) else "") .. (if l_Boolean_0.toJSBoolean(v54) and v54 ~= nil then ("\n\nDifference:\n\n%s"):format(v54) else "") .. v57;
    end;
end;
v25 = function(v58) --[[ Line: 208 ]] --[[ Name: isAssertionError ]]
    -- upvalues: l_instanceof_0 (copy), l_AssertionError_0 (copy)
    return v58 and (l_instanceof_0(v58, l_AssertionError_0) or v58.name == l_AssertionError_0.name or v58.code == "ERR_ASSERTION");
end;
v26 = function(v59) --[[ Line: 213 ]] --[[ Name: buildHintString ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v59) then
        return tostring(v59) .. "\n\n";
    else
        return "";
    end;
end;
v10.default = v19;
return v10;