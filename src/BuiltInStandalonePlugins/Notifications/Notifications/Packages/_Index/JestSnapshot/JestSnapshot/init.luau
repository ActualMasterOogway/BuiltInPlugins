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
local v15 = require(l_script_0.State);
local v16 = require(l_script_0.plugins);
local l_addSerializer_0 = v16.addSerializer;
local l_getSerializers_0 = v16.getSerializers;
local v19 = require(l_script_0.printSnapshot);
local l_PROPERTIES_ARG_0 = v19.PROPERTIES_ARG;
local l_bReceivedColor_0 = v19.bReceivedColor;
local l_matcherHintFromConfig_0 = v19.matcherHintFromConfig;
local l_printExpected_0 = v19.printExpected;
local l_printPropertiesAndReceived_0 = v19.printPropertiesAndReceived;
local l_printReceived_0 = v19.printReceived;
local l_printSnapshotAndReceived_0 = v19.printSnapshotAndReceived;
local _ = require(l_script_0.types);
local v28 = require(l_script_0.utils);
local v29 = nil;
local v30 = nil;
local v31 = "Snapshot matchers cannot be used with " .. l_BOLD_WEIGHT_0("never");
local function v40(v32, v33, v34) --[[ Line: 73 ]] --[[ Name: printSnapshotName ]]
    -- upvalues: v28 (copy), l_BOLD_WEIGHT_0 (copy)
    local v35 = v32 or "";
    local v36 = v33 or "";
    local v37 = v35:len() ~= 0;
    local v38 = #v36 ~= 0;
    local v39 = "Snapshot name: `";
    if v37 then
        v39 = v39 .. v28.escapeBacktickString(v35);
    end;
    if v37 and v38 then
        v39 = v39 .. ": ";
    end;
    if v38 then
        v39 = v39 .. l_BOLD_WEIGHT_0(v28.escapeBacktickString(v36));
    end;
    return v39 .. " " .. v34 .. "`";
end;
local function v50(...) --[[ Line: 101 ]] --[[ Name: toMatchSnapshot ]]
    -- upvalues: l_printWithType_0 (copy), l_printExpected_0 (copy), l_BOLD_WEIGHT_0 (copy), l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_PROPERTIES_ARG_0 (copy), l_EXPECTED_COLOR_0 (copy), v29 (ref)
    local v41 = {
        ...
    };
    local v42 = v41[1];
    local v43 = v41[2];
    local v44 = v41[3];
    local v45 = v41[4];
    local v46 = nil;
    local v47 = select("#", ...);
    if v47 == 3 and typeof(v44) == "string" then
        v45 = v44;
    elseif v47 >= 3 then
        if typeof(v44) ~= "table" or typeof(v44) == nil then
            local v48 = {
                isNot = v42.isNot, 
                promise = v42.promise
            };
            local v49 = l_printWithType_0("Expected properties", v44, l_printExpected_0);
            if v47 == 4 then
                v48.secondArgument = "hint";
                v48.secondArgumentColor = l_BOLD_WEIGHT_0;
                if v44 == nil then
                    v49 = v49 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')";
                end;
            end;
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHint_0("toMatchSnapshot", nil, l_PROPERTIES_ARG_0, v48), "Expected " .. l_EXPECTED_COLOR_0("properties") .. " must be an object", v49)
            }));
        end;
        v46 = v44;
    end;
    return v29({
        context = v42, 
        hint = v45, 
        isInline = false, 
        matcherName = "toMatchSnapshot", 
        properties = v46, 
        received = v43
    });
end;
v29 = function(v51) --[[ Line: 161 ]] --[[ Name: _toMatchSnapshot ]]
    -- upvalues: v15 (copy), l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHintFromConfig_0 (copy), v31 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), l_getType_0 (copy), l_RECEIVED_COLOR_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printReceived_0 (copy), v40 (copy), l_printPropertiesAndReceived_0 (copy), v28 (copy), l_BOLD_WEIGHT_0 (copy), l_bReceivedColor_0 (copy), l_printSnapshotAndReceived_0 (copy)
    local l_context_0 = v51.context;
    local l_hint_0 = v51.hint;
    local l_inlineSnapshot_0 = v51.inlineSnapshot;
    local l_isInline_0 = v51.isInline;
    local l_matcherName_0 = v51.matcherName;
    local l_properties_0 = v51.properties;
    local l_received_0 = v51.received;
    local v59 = _G.__JEST_TEST_CONTEXT__.instance.Name:match("(.*)%.spec") .. ".snap";
    if _G.__JEST_TEST_CONTEXT__.snapshotState == nil then
        local v60 = nil;
        pcall(function() --[[ Line: 179 ]]
            -- upvalues: v60 (ref), v59 (copy)
            v60 = _G.__JEST_TEST_CONTEXT__.instance.Parent.__snapshots__[v59];
        end);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 182 ]]
            -- upvalues: v15 (ref), v60 (ref)
            return v15.new(v60, {
                updateSnapshot = _G.UPDATESNAPSHOT or "none", 
                snapshotFormat = {}
            });
        end);
        if l_status_0 then
            _G.__JEST_TEST_CONTEXT__.snapshotState = l_result_0;
            --[[ close >= 9 ]]
        else
            return {
                message = function() --[[ Line: 192 ]] --[[ Name: message ]]
                    return "Jest-Roblox: Error while loading snapshot file";
                end, 
                pass = false
            };
        end;
    end;
    l_context_0.snapshotState = l_context_0.snapshotState or _G.__JEST_TEST_CONTEXT__.snapshotState;
    l_context_0.currentTestName = l_context_0.currentTestName or table.concat(_G.__JEST_TEST_CONTEXT__.blocks, " ");
    local l_currentTestName_0 = l_context_0.currentTestName;
    local l_isNot_0 = l_context_0.isNot;
    local l_snapshotState_0 = l_context_0.snapshotState;
    if l_isNot_0 then
        error(l_AssertionError_0.new({
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v51, false), v31)
        }));
    end;
    if l_snapshotState_0 == nil then
        error(l_AssertionError_0.new({
            message = l_matcherHintFromConfig_0(v51, false) .. "\n\n" .. "Snapshot state must be initialized" .. "\n\n" .. l_printWithType_0("Snapshot state", l_snapshotState_0, l_stringify_0)
        }));
    end;
    local v66 = if l_currentTestName_0 and l_hint_0 then l_currentTestName_0 .. ": " .. l_hint_0 else l_currentTestName_0 or "";
    if typeof(l_properties_0) == "table" then
        if l_received_0 == nil or typeof(l_received_0) ~= "table" and l_getType_0(l_received_0) ~= "Instance" then
            error(l_AssertionError_0.new({
                message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v51, false), l_RECEIVED_COLOR_0("received") .. " value must be an object when the matcher has " .. l_EXPECTED_COLOR_0("properties"), l_printWithType_0("Received", l_received_0, l_printReceived_0))
            }));
        end;
        if not l_context_0.equals(l_received_0, l_properties_0, {
            l_context_0.utils.iterableEquality, 
            l_context_0.utils.subsetEquality
        }) then
            local v67 = l_snapshotState_0:fail(v66, l_received_0):match("(%d+)$");
            local v68 = v67 == nil and 1 or tonumber(v67);
            return {
                message = function() --[[ Line: 264 ]]
                    -- upvalues: l_matcherHintFromConfig_0 (ref), v51 (copy), v40 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), v68 (copy), l_printPropertiesAndReceived_0 (ref), l_properties_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
                    return l_matcherHintFromConfig_0(v51, false) .. "\n\n" .. v40(l_currentTestName_0, l_hint_0, v68) .. "\n\n" .. l_printPropertiesAndReceived_0(l_properties_0, l_received_0, l_snapshotState_0.expand);
                end, 
                name = l_matcherName_0, 
                pass = false
            };
        else
            l_received_0 = v28.deepMerge(l_received_0, l_properties_0);
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
            message = function() --[[ Line: 296 ]] --[[ Name: message ]]
                return "";
            end, 
            pass = true
        };
    else
        local v73 = nil;
        v73 = l_expected_0 == nil and function() --[[ Line: 305 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v51 (copy), v40 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_BOLD_WEIGHT_0 (ref), l_actual_0 (copy), l_bReceivedColor_0 (ref)
            local v74 = l_matcherHintFromConfig_0(v51, true) .. "\n\n" .. v40(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. "New snapshot was " .. l_BOLD_WEIGHT_0("not written") .. ". The update flag " .. "must be explicitly passed to write a new snapshot.\n\n" .. "This is likely because this test is run in a continuous integration " .. "(CI) environment in which snapshots are not written by default.\n\n" .. "Received:";
            return (if l_actual_0:find("\n") then v74 .. "\n" else v74 .. " ") .. l_bReceivedColor_0(l_actual_0);
        end or function() --[[ Line: 329 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v51 (copy), v40 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_printSnapshotAndReceived_0 (ref), l_expected_0 (copy), l_actual_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
            return l_matcherHintFromConfig_0(v51, true) .. "\n\n" .. v40(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. l_printSnapshotAndReceived_0(l_expected_0, l_actual_0, l_received_0, l_snapshotState_0.expand);
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
local function v79(v75, v76, v77, v78) --[[ Line: 350 ]] --[[ Name: toThrowErrorMatchingSnapshot ]]
    -- upvalues: v30 (ref)
    return v30({
        context = v75, 
        hint = v77, 
        isInline = false, 
        matcherName = "toThrowErrorMatchingSnapshot", 
        received = v76
    }, v78);
end;
v30 = function(v80, v81) --[[ Line: 370 ]] --[[ Name: _toThrowErrorMatchingSnapshot ]]
    -- upvalues: l_AssertionError_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_matcherHintFromConfig_0 (copy), v31 (copy), l_instanceof_0 (copy), l_Error_0 (copy), v29 (ref)
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
            message = l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v80, false), v31)
        }));
    end;
    local v91 = nil;
    if v81 then
        v91 = l_received_1;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 411 ]]
            -- upvalues: l_received_1 (copy)
            l_received_1();
        end);
        if not l_status_1 then
            v91 = l_result_1;
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
    return v29({
        context = l_context_1, 
        hint = l_hint_1, 
        inlineSnapshot = l_inlineSnapshot_1, 
        isInline = l_isInline_1, 
        matcherName = l_matcherName_1, 
        received = v91
    });
end;
return {
    SnapshotState = v15, 
    addSerializer = l_addSerializer_0, 
    getSerializers = l_getSerializers_0, 
    toMatchSnapshot = v50, 
    toThrowErrorMatchingSnapshot = v79, 
    utils = v28, 
    plugins = require(l_script_0.plugins)
};