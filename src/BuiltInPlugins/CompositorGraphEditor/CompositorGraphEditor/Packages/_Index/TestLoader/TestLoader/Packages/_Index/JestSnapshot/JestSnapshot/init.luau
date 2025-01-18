local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_AssertionError_0 = v2.AssertionError;
local l_cleanLoadStringStack_0 = require(l_Parent_0.RobloxShared).cleanLoadStringStack;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v8 = require(l_Parent_0.JestMatcherUtils);
local l_BOLD_WEIGHT_0 = v8.BOLD_WEIGHT;
local l_EXPECTED_COLOR_0 = v8.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v8.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v8.matcherErrorMessage;
local l_matcherHint_0 = v8.matcherHint;
local l_printWithType_0 = v8.printWithType;
local l_stringify_0 = v8.stringify;
local v16 = require(script.SnapshotResolver);
local l_EXTENSION_0 = v16.EXTENSION;
local l_buildSnapshotResolver_0 = v16.buildSnapshotResolver;
local l_isSnapshotPath_0 = v16.isSnapshotPath;
local l_default_0 = require(l_script_0.State).default;
local v21 = require(l_script_0.plugins);
local l_addSerializer_0 = v21.addSerializer;
local l_getSerializers_0 = v21.getSerializers;
local v24 = require(l_script_0.printSnapshot);
local l_PROPERTIES_ARG_0 = v24.PROPERTIES_ARG;
local l_bReceivedColor_0 = v24.bReceivedColor;
local l_matcherHintFromConfig_0 = v24.matcherHintFromConfig;
local l_printExpected_0 = v24.printExpected;
local l_printPropertiesAndReceived_0 = v24.printPropertiesAndReceived;
local l_printReceived_0 = v24.printReceived;
local l_printSnapshotAndReceived_0 = v24.printSnapshotAndReceived;
local _ = require(l_script_0.types);
local v33 = require(l_script_0.utils);
local v34 = nil;
local v35 = nil;
local v36 = "Snapshot matchers cannot be used with " .. l_BOLD_WEIGHT_0("never");
local function v45(v37, v38, v39) --[[ Line: 81 ]] --[[ Name: printSnapshotName ]]
    -- upvalues: v33 (copy), l_BOLD_WEIGHT_0 (copy)
    local v40 = v37 or "";
    local v41 = v38 or "";
    local v42 = v40:len() ~= 0;
    local v43 = #v41 ~= 0;
    local v44 = "Snapshot name: `";
    if v42 then
        v44 = v44 .. v33.escapeBacktickString(v40);
    end;
    if v42 and v43 then
        v44 = v44 .. ": ";
    end;
    if v43 then
        v44 = v44 .. l_BOLD_WEIGHT_0(v33.escapeBacktickString(v41));
    end;
    return v44 .. " " .. v39 .. "`";
end;
local function v55(...) --[[ Line: 109 ]] --[[ Name: toMatchSnapshot ]]
    -- upvalues: l_printWithType_0 (copy), l_printExpected_0 (copy), l_BOLD_WEIGHT_0 (copy), l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_PROPERTIES_ARG_0 (copy), l_EXPECTED_COLOR_0 (copy), v34 (ref)
    local v46 = {
        ...
    };
    local v47 = v46[1];
    local v48 = v46[2];
    local v49 = v46[3];
    local v50 = v46[4];
    local v51 = nil;
    local v52 = select("#", ...);
    if v52 == 3 and typeof(v49) == "string" then
        v50 = v49;
    elseif v52 >= 3 then
        if typeof(v49) ~= "table" or typeof(v49) == nil then
            local v53 = {
                isNot = v47.isNot, 
                promise = v47.promise
            };
            local v54 = l_printWithType_0("Expected properties", v49, l_printExpected_0);
            if v52 == 4 then
                v53.secondArgument = "hint";
                v53.secondArgumentColor = l_BOLD_WEIGHT_0;
                if v49 == nil then
                    v54 = v54 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')";
                end;
            end;
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHint_0("toMatchSnapshot", nil, l_PROPERTIES_ARG_0, v53), "Expected " .. l_EXPECTED_COLOR_0("properties") .. " must be an object", v54)
            }));
        end;
        v51 = v49;
    end;
    return v34({
        context = v47, 
        hint = v50, 
        isInline = false, 
        matcherName = "toMatchSnapshot", 
        properties = v51, 
        received = v48
    });
end;
v34 = function(v56) --[[ Line: 169 ]] --[[ Name: _toMatchSnapshot ]]
    -- upvalues: l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHintFromConfig_0 (copy), v36 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), l_getType_0 (copy), l_RECEIVED_COLOR_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printReceived_0 (copy), v45 (copy), l_printPropertiesAndReceived_0 (copy), v33 (copy), l_BOLD_WEIGHT_0 (copy), l_bReceivedColor_0 (copy), l_printSnapshotAndReceived_0 (copy)
    local l_context_0 = v56.context;
    local l_hint_0 = v56.hint;
    local l_inlineSnapshot_0 = v56.inlineSnapshot;
    local l_isInline_0 = v56.isInline;
    local l_matcherName_0 = v56.matcherName;
    local l_properties_0 = v56.properties;
    local l_received_0 = v56.received;
    local l_currentTestName_0 = l_context_0.currentTestName;
    local l_isNot_0 = l_context_0.isNot;
    local l_snapshotState_0 = l_context_0.snapshotState;
    if l_isNot_0 then
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v56, false), v36)
        }));
    end;
    if l_snapshotState_0 == nil then
        error(l_AssertionError_0.new({
            message = l_matcherHintFromConfig_0(v56, false) .. "\n\n" .. "Snapshot state must be initialized" .. "\n\n" .. l_printWithType_0("Snapshot state", l_snapshotState_0, l_stringify_0)
        }));
    end;
    local v67 = if l_currentTestName_0 and l_hint_0 then l_currentTestName_0 .. ": " .. l_hint_0 else l_currentTestName_0 or "";
    if typeof(l_properties_0) == "table" then
        if l_received_0 == nil or typeof(l_received_0) ~= "table" and l_getType_0(l_received_0) ~= "Instance" then
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v56, false), l_RECEIVED_COLOR_0("received") .. " value must be an object when the matcher has " .. l_EXPECTED_COLOR_0("properties"), l_printWithType_0("Received", l_received_0, l_printReceived_0))
            }));
        end;
        if not l_context_0.equals(l_received_0, l_properties_0, {
            l_context_0.utils.iterableEquality, 
            l_context_0.utils.subsetEquality
        }) then
            local v68 = l_snapshotState_0:fail(v67, l_received_0):match("(%d+)$");
            local v69 = v68 == nil and 1 or tonumber(v68);
            return {
                message = function() --[[ Line: 247 ]]
                    -- upvalues: l_matcherHintFromConfig_0 (ref), v56 (copy), v45 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), v69 (copy), l_printPropertiesAndReceived_0 (ref), l_properties_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
                    return l_matcherHintFromConfig_0(v56, false) .. "\n\n" .. v45(l_currentTestName_0, l_hint_0, v69) .. "\n\n" .. l_printPropertiesAndReceived_0(l_properties_0, l_received_0, l_snapshotState_0.expand);
                end, 
                name = l_matcherName_0, 
                pass = false
            };
        else
            l_received_0 = v33.deepMerge(l_received_0, l_properties_0);
        end;
    end;
    local v70 = l_snapshotState_0:match({
        error = l_context_0.error, 
        inlineSnapshot = l_inlineSnapshot_0, 
        isInline = l_isInline_0, 
        received = l_received_0, 
        testName = v67
    });
    local l_actual_0 = v70.actual;
    local l_count_0 = v70.count;
    local l_expected_0 = v70.expected;
    if v70.pass then
        return {
            message = function() --[[ Line: 279 ]] --[[ Name: message ]]
                return "";
            end, 
            pass = true
        };
    else
        local v74 = nil;
        v74 = l_expected_0 == nil and function() --[[ Line: 288 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v56 (copy), v45 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_BOLD_WEIGHT_0 (ref), l_actual_0 (copy), l_bReceivedColor_0 (ref)
            local v75 = l_matcherHintFromConfig_0(v56, true) .. "\n\n" .. v45(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. "New snapshot was " .. l_BOLD_WEIGHT_0("not written") .. ". The update flag " .. "must be explicitly passed to write a new snapshot.\n\n" .. "This is likely because this test is run in a continuous integration " .. "(CI) environment in which snapshots are not written by default.\n\n" .. "Received:";
            return (if l_actual_0:find("\n") then v75 .. "\n" else v75 .. " ") .. l_bReceivedColor_0(l_actual_0);
        end or function() --[[ Line: 312 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v56 (copy), v45 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_printSnapshotAndReceived_0 (ref), l_expected_0 (copy), l_actual_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
            return l_matcherHintFromConfig_0(v56, true) .. "\n\n" .. v45(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. l_printSnapshotAndReceived_0(l_expected_0, l_actual_0, l_received_0, l_snapshotState_0.expand);
        end;
        return {
            actual = l_actual_0, 
            expected = l_expected_0, 
            message = v74, 
            name = l_matcherName_0, 
            pass = false
        };
    end;
end;
local function v80(v76, v77, v78, v79) --[[ Line: 333 ]] --[[ Name: toThrowErrorMatchingSnapshot ]]
    -- upvalues: v35 (ref)
    return v35({
        context = v76, 
        hint = v78, 
        isInline = false, 
        matcherName = "toThrowErrorMatchingSnapshot", 
        received = v77
    }, v79);
end;
v35 = function(v81, v82) --[[ Line: 353 ]] --[[ Name: _toThrowErrorMatchingSnapshot ]]
    -- upvalues: l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_matcherHintFromConfig_0 (copy), v36 (copy), l_instanceof_0 (copy), l_Error_0 (copy), l_cleanLoadStringStack_0 (copy), v34 (ref)
    local l_context_1 = v81.context;
    local l_hint_1 = v81.hint;
    local l_inlineSnapshot_1 = v81.inlineSnapshot;
    local l_isInline_1 = v81.isInline;
    local l_matcherName_1 = v81.matcherName;
    local l_received_1 = v81.received;
    local l_isNot_1 = l_context_1.isNot;
    local l_promise_0 = l_context_1.promise;
    if not v82 and typeof(l_received_1) ~= "function" then
        local v91 = {
            isNot = l_isNot_1, 
            promise = l_promise_0
        };
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHint_0(l_matcherName_1, nil, "", v91), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", l_received_1, l_printReceived_0))
        }));
    end;
    if l_isNot_1 then
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v81, false), v36)
        }));
    end;
    local v92 = nil;
    if v82 then
        v92 = l_received_1;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 395 ]]
            -- upvalues: l_received_1 (copy)
            l_received_1();
        end);
        if not l_status_0 then
            v92 = l_result_0;
        end;
    end;
    if v92 == nil then
        error(l_AssertionError_0.new({
            message = l_matcherHintFromConfig_0(v81, false) .. "\n\n" .. "Received function did not throw"
        }));
    end;
    if l_instanceof_0(v92, l_Error_0) or typeof(v92) == "table" and rawget(v92, "message") ~= nil then
        v92 = v92.message;
    elseif typeof(v92) ~= "string" then
        v92 = tostring(v92);
    end;
    v92 = l_cleanLoadStringStack_0(v92);
    return v34({
        context = l_context_1, 
        hint = l_hint_1, 
        inlineSnapshot = l_inlineSnapshot_1, 
        isInline = l_isInline_1, 
        matcherName = l_matcherName_1, 
        received = v92
    });
end;
return {
    EXTENSION = l_EXTENSION_0, 
    SnapshotState = l_default_0, 
    addSerializer = l_addSerializer_0, 
    buildSnapshotResolver = l_buildSnapshotResolver_0, 
    getSerializers = l_getSerializers_0, 
    isSnapshotPath = l_isSnapshotPath_0, 
    toMatchSnapshot = v55, 
    toThrowErrorMatchingSnapshot = v80, 
    utils = v33, 
    plugins = require(l_script_0.plugins)
};