local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_AssertionError_0 = v2.AssertionError;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v7 = require(l_Parent_0.JestMatcherUtils);
local l_BOLD_WEIGHT_0 = v7.BOLD_WEIGHT;
local l_EXPECTED_COLOR_0 = v7.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v7.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v7.matcherErrorMessage;
local l_matcherHint_0 = v7.matcherHint;
local l_printWithType_0 = v7.printWithType;
local l_stringify_0 = v7.stringify;
local v15 = require(script.SnapshotResolver);
local l_EXTENSION_0 = v15.EXTENSION;
local l_buildSnapshotResolver_0 = v15.buildSnapshotResolver;
local l_isSnapshotPath_0 = v15.isSnapshotPath;
local l_default_0 = require(l_script_0.State).default;
local v20 = require(l_script_0.plugins);
local l_addSerializer_0 = v20.addSerializer;
local l_getSerializers_0 = v20.getSerializers;
local v23 = require(l_script_0.printSnapshot);
local l_PROPERTIES_ARG_0 = v23.PROPERTIES_ARG;
local l_bReceivedColor_0 = v23.bReceivedColor;
local l_matcherHintFromConfig_0 = v23.matcherHintFromConfig;
local l_printExpected_0 = v23.printExpected;
local l_printPropertiesAndReceived_0 = v23.printPropertiesAndReceived;
local l_printReceived_0 = v23.printReceived;
local l_printSnapshotAndReceived_0 = v23.printSnapshotAndReceived;
local _ = require(l_script_0.types);
local v32 = require(l_script_0.utils);
local v33 = nil;
local v34 = nil;
local v35 = "Snapshot matchers cannot be used with " .. l_BOLD_WEIGHT_0("never");
local function v44(v36, v37, v38) --[[ Line: 76 ]] --[[ Name: printSnapshotName ]]
    -- upvalues: v32 (copy), l_BOLD_WEIGHT_0 (copy)
    local v39 = v36 or "";
    local v40 = v37 or "";
    local v41 = v39:len() ~= 0;
    local v42 = #v40 ~= 0;
    local v43 = "Snapshot name: `";
    if v41 then
        v43 = v43 .. v32.escapeBacktickString(v39);
    end;
    if v41 and v42 then
        v43 = v43 .. ": ";
    end;
    if v42 then
        v43 = v43 .. l_BOLD_WEIGHT_0(v32.escapeBacktickString(v40));
    end;
    return v43 .. " " .. v38 .. "`";
end;
local function v54(...) --[[ Line: 104 ]] --[[ Name: toMatchSnapshot ]]
    -- upvalues: l_printWithType_0 (copy), l_printExpected_0 (copy), l_BOLD_WEIGHT_0 (copy), l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_PROPERTIES_ARG_0 (copy), l_EXPECTED_COLOR_0 (copy), v33 (ref)
    local v45 = {
        ...
    };
    local v46 = v45[1];
    local v47 = v45[2];
    local v48 = v45[3];
    local v49 = v45[4];
    local v50 = nil;
    local v51 = select("#", ...);
    if v51 == 3 and typeof(v48) == "string" then
        v49 = v48;
    elseif v51 >= 3 then
        if typeof(v48) ~= "table" or typeof(v48) == nil then
            local v52 = {
                isNot = v46.isNot, 
                promise = v46.promise
            };
            local v53 = l_printWithType_0("Expected properties", v48, l_printExpected_0);
            if v51 == 4 then
                v52.secondArgument = "hint";
                v52.secondArgumentColor = l_BOLD_WEIGHT_0;
                if v48 == nil then
                    v53 = v53 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')";
                end;
            end;
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHint_0("toMatchSnapshot", nil, l_PROPERTIES_ARG_0, v52), "Expected " .. l_EXPECTED_COLOR_0("properties") .. " must be an object", v53)
            }));
        end;
        v50 = v48;
    end;
    return v33({
        context = v46, 
        hint = v49, 
        isInline = false, 
        matcherName = "toMatchSnapshot", 
        properties = v50, 
        received = v47
    });
end;
v33 = function(v55) --[[ Line: 164 ]] --[[ Name: _toMatchSnapshot ]]
    -- upvalues: l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHintFromConfig_0 (copy), v35 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), l_getType_0 (copy), l_RECEIVED_COLOR_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printReceived_0 (copy), v44 (copy), l_printPropertiesAndReceived_0 (copy), v32 (copy), l_BOLD_WEIGHT_0 (copy), l_bReceivedColor_0 (copy), l_printSnapshotAndReceived_0 (copy)
    local l_context_0 = v55.context;
    local l_hint_0 = v55.hint;
    local l_inlineSnapshot_0 = v55.inlineSnapshot;
    local l_isInline_0 = v55.isInline;
    local l_matcherName_0 = v55.matcherName;
    local l_properties_0 = v55.properties;
    local l_received_0 = v55.received;
    local l_currentTestName_0 = l_context_0.currentTestName;
    local l_isNot_0 = l_context_0.isNot;
    local l_snapshotState_0 = l_context_0.snapshotState;
    if l_isNot_0 then
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v55, false), v35)
        }));
    end;
    if l_snapshotState_0 == nil then
        error(l_AssertionError_0.new({
            message = l_matcherHintFromConfig_0(v55, false) .. "\n\n" .. "Snapshot state must be initialized" .. "\n\n" .. l_printWithType_0("Snapshot state", l_snapshotState_0, l_stringify_0)
        }));
    end;
    local v66 = if l_currentTestName_0 and l_hint_0 then l_currentTestName_0 .. ": " .. l_hint_0 else l_currentTestName_0 or "";
    if typeof(l_properties_0) == "table" then
        if l_received_0 == nil or typeof(l_received_0) ~= "table" and l_getType_0(l_received_0) ~= "Instance" then
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v55, false), l_RECEIVED_COLOR_0("received") .. " value must be an object when the matcher has " .. l_EXPECTED_COLOR_0("properties"), l_printWithType_0("Received", l_received_0, l_printReceived_0))
            }));
        end;
        if not l_context_0.equals(l_received_0, l_properties_0, {
            l_context_0.utils.iterableEquality, 
            l_context_0.utils.subsetEquality
        }) then
            local v67 = l_snapshotState_0:fail(v66, l_received_0):match("(%d+)$");
            local v68 = v67 == nil and 1 or tonumber(v67);
            return {
                message = function() --[[ Line: 242 ]]
                    -- upvalues: l_matcherHintFromConfig_0 (ref), v55 (copy), v44 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), v68 (copy), l_printPropertiesAndReceived_0 (ref), l_properties_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
                    return l_matcherHintFromConfig_0(v55, false) .. "\n\n" .. v44(l_currentTestName_0, l_hint_0, v68) .. "\n\n" .. l_printPropertiesAndReceived_0(l_properties_0, l_received_0, l_snapshotState_0.expand);
                end, 
                name = l_matcherName_0, 
                pass = false
            };
        else
            l_received_0 = v32.deepMerge(l_received_0, l_properties_0);
        end;
    end;
    local v69 = l_snapshotState_0:match({
        error = l_context_0.error, 
        inlineSnapshot = l_inlineSnapshot_0, 
        isInline = l_isInline_0, 
        received = l_received_0, 
        testName = v66
    });
    local l_actual_0 = v69.actual;
    local l_count_0 = v69.count;
    local l_expected_0 = v69.expected;
    if v69.pass then
        return {
            message = function() --[[ Line: 274 ]] --[[ Name: message ]]
                return "";
            end, 
            pass = true
        };
    else
        local v73 = nil;
        v73 = l_expected_0 == nil and function() --[[ Line: 283 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v55 (copy), v44 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_BOLD_WEIGHT_0 (ref), l_actual_0 (copy), l_bReceivedColor_0 (ref)
            local v74 = l_matcherHintFromConfig_0(v55, true) .. "\n\n" .. v44(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. "New snapshot was " .. l_BOLD_WEIGHT_0("not written") .. ". The update flag " .. "must be explicitly passed to write a new snapshot.\n\n" .. "This is likely because this test is run in a continuous integration " .. "(CI) environment in which snapshots are not written by default.\n\n" .. "Received:";
            return (if l_actual_0:find("\n") then v74 .. "\n" else v74 .. " ") .. l_bReceivedColor_0(l_actual_0);
        end or function() --[[ Line: 307 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v55 (copy), v44 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_printSnapshotAndReceived_0 (ref), l_expected_0 (copy), l_actual_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
            return l_matcherHintFromConfig_0(v55, true) .. "\n\n" .. v44(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. l_printSnapshotAndReceived_0(l_expected_0, l_actual_0, l_received_0, l_snapshotState_0.expand);
        end;
        return {
            actual = l_actual_0, 
            expected = l_expected_0, 
            message = v73, 
            name = l_matcherName_0, 
            pass = false
        };
    end;
end;
local function v79(v75, v76, v77, v78) --[[ Line: 328 ]] --[[ Name: toThrowErrorMatchingSnapshot ]]
    -- upvalues: v34 (ref)
    return v34({
        context = v75, 
        hint = v77, 
        isInline = false, 
        matcherName = "toThrowErrorMatchingSnapshot", 
        received = v76
    }, v78);
end;
v34 = function(v80, v81) --[[ Line: 348 ]] --[[ Name: _toThrowErrorMatchingSnapshot ]]
    -- upvalues: l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_matcherHintFromConfig_0 (copy), v35 (copy), l_instanceof_0 (copy), l_Error_0 (copy), v33 (ref)
    local l_context_1 = v80.context;
    local l_hint_1 = v80.hint;
    local l_inlineSnapshot_1 = v80.inlineSnapshot;
    local l_isInline_1 = v80.isInline;
    local l_matcherName_1 = v80.matcherName;
    local l_received_1 = v80.received;
    local l_isNot_1 = l_context_1.isNot;
    local l_promise_0 = l_context_1.promise;
    if not v81 and typeof(l_received_1) ~= "function" then
        local v90 = {
            isNot = l_isNot_1, 
            promise = l_promise_0
        };
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHint_0(l_matcherName_1, nil, "", v90), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", l_received_1, l_printReceived_0))
        }));
    end;
    if l_isNot_1 then
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v80, false), v35)
        }));
    end;
    local v91 = nil;
    if v81 then
        v91 = l_received_1;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 390 ]]
            -- upvalues: l_received_1 (copy)
            l_received_1();
        end);
        if not l_status_0 then
            v91 = l_result_0;
        end;
    end;
    if v91 == nil then
        error(l_AssertionError_0.new({
            message = l_matcherHintFromConfig_0(v80, false) .. "\n\n" .. "Received function did not throw"
        }));
    end;
    if l_instanceof_0(v91, l_Error_0) or typeof(v91) == "table" and rawget(v91, "message") ~= nil then
        v91 = v91.message;
    elseif typeof(v91) ~= "string" then
        v91 = tostring(v91);
    end;
    return v33({
        context = l_context_1, 
        hint = l_hint_1, 
        inlineSnapshot = l_inlineSnapshot_1, 
        isInline = l_isInline_1, 
        matcherName = l_matcherName_1, 
        received = v91
    });
end;
return {
    EXTENSION = l_EXTENSION_0, 
    SnapshotState = l_default_0, 
    addSerializer = l_addSerializer_0, 
    buildSnapshotResolver = l_buildSnapshotResolver_0, 
    getSerializers = l_getSerializers_0, 
    isSnapshotPath = l_isSnapshotPath_0, 
    toMatchSnapshot = v54, 
    toThrowErrorMatchingSnapshot = v79, 
    utils = v32, 
    plugins = require(l_script_0.plugins)
};