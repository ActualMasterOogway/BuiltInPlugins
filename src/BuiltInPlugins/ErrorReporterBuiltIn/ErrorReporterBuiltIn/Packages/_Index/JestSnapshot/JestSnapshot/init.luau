local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v6 = require(l_Parent_0.JestMatcherUtils);
local l_BOLD_WEIGHT_0 = v6.BOLD_WEIGHT;
local l_EXPECTED_COLOR_0 = v6.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v6.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v6.matcherErrorMessage;
local l_matcherHint_0 = v6.matcherHint;
local l_printWithType_0 = v6.printWithType;
local l_stringify_0 = v6.stringify;
local v14 = require(l_script_0.State);
local v15 = require(l_script_0.plugins);
local l_addSerializer_0 = v15.addSerializer;
local l_getSerializers_0 = v15.getSerializers;
local v18 = require(l_script_0.printSnapshot);
local l_PROPERTIES_ARG_0 = v18.PROPERTIES_ARG;
local l_bReceivedColor_0 = v18.bReceivedColor;
local l_matcherHintFromConfig_0 = v18.matcherHintFromConfig;
local l_printExpected_0 = v18.printExpected;
local l_printPropertiesAndReceived_0 = v18.printPropertiesAndReceived;
local l_printReceived_0 = v18.printReceived;
local l_printSnapshotAndReceived_0 = v18.printSnapshotAndReceived;
local _ = require(l_script_0.types);
local v27 = require(l_script_0.utils);
local v28 = nil;
local v29 = nil;
local v30 = "Snapshot matchers cannot be used with " .. l_BOLD_WEIGHT_0("never");
local function v37(v31, v32, v33) --[[ Line: 71 ]] --[[ Name: printSnapshotName ]]
    -- upvalues: v27 (copy), l_BOLD_WEIGHT_0 (copy)
    v31 = v31 or "";
    v32 = v32 or "";
    local v34 = v31:len() ~= 0;
    local v35 = #v32 ~= 0;
    local v36 = "Snapshot name: `";
    if v34 then
        v36 = v36 .. v27.escapeBacktickString(v31);
    end;
    if v34 and v35 then
        v36 = v36 .. ": ";
    end;
    if v35 then
        v36 = v36 .. l_BOLD_WEIGHT_0(v27.escapeBacktickString(v32));
    end;
    return v36 .. " " .. v33 .. "`";
end;
local function v47(...) --[[ Line: 103 ]] --[[ Name: toMatchSnapshot ]]
    -- upvalues: l_printWithType_0 (copy), l_printExpected_0 (copy), l_BOLD_WEIGHT_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_PROPERTIES_ARG_0 (copy), l_EXPECTED_COLOR_0 (copy), v28 (ref)
    local v38 = {
        ...
    };
    local v39 = v38[1];
    local v40 = v38[2];
    local v41 = v38[3];
    local v42 = v38[4];
    local v43 = nil;
    local v44 = select("#", ...);
    if v44 == 3 and typeof(v41) == "string" then
        v42 = v41;
    elseif v44 >= 3 then
        if typeof(v41) ~= "table" or typeof(v41) == nil then
            local v45 = {
                isNot = v39.isNot, 
                promise = v39.promise
            };
            local v46 = l_printWithType_0("Expected properties", v41, l_printExpected_0);
            if v44 == 4 then
                v45.secondArgument = "hint";
                v45.secondArgumentColor = l_BOLD_WEIGHT_0;
                if v41 == nil then
                    v46 = v46 .. "\n\nTo provide a hint without properties: toMatchSnapshot('hint')";
                end;
            end;
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchSnapshot", nil, l_PROPERTIES_ARG_0, v45), "Expected " .. l_EXPECTED_COLOR_0("properties") .. " must be an object", v46)));
        end;
        v43 = v41;
    end;
    return v28({
        context = v39, 
        hint = v42, 
        isInline = false, 
        matcherName = "toMatchSnapshot", 
        properties = v43, 
        received = v40
    });
end;
v28 = function(v48) --[[ Line: 168 ]] --[[ Name: _toMatchSnapshot ]]
    -- upvalues: v14 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHintFromConfig_0 (copy), v30 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), l_getType_0 (copy), l_RECEIVED_COLOR_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printReceived_0 (copy), v37 (copy), l_printPropertiesAndReceived_0 (copy), v27 (copy), l_BOLD_WEIGHT_0 (copy), l_bReceivedColor_0 (copy), l_printSnapshotAndReceived_0 (copy)
    local l_context_0 = v48.context;
    local l_hint_0 = v48.hint;
    local l_inlineSnapshot_0 = v48.inlineSnapshot;
    local l_isInline_0 = v48.isInline;
    local l_matcherName_0 = v48.matcherName;
    local l_properties_0 = v48.properties;
    local l_received_0 = v48.received;
    local v56 = _G.__JEST_TEST_CONTEXT__.instance.Name:match("(.*)%.spec") .. ".snap";
    if _G.__JEST_TEST_CONTEXT__.snapshotState == nil then
        local v57 = nil;
        pcall(function() --[[ Line: 186 ]]
            -- upvalues: v57 (ref), v56 (copy)
            v57 = _G.__JEST_TEST_CONTEXT__.instance.Parent.__snapshots__[v56];
        end);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 189 ]]
            -- upvalues: v14 (ref), v57 (ref)
            return v14.new(v57, {
                updateSnapshot = _G.UPDATESNAPSHOT or "none"
            });
        end);
        if l_status_0 then
            _G.__JEST_TEST_CONTEXT__.snapshotState = l_result_0;
            --[[ close >= 9 ]]
        else
            return {
                message = function() --[[ Line: 198 ]] --[[ Name: message ]]
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
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v48, false), v30)));
    end;
    if l_snapshotState_0 == nil then
        error(l_Error_0(l_matcherHintFromConfig_0(v48, false) .. "\n\n" .. "Snapshot state must be initialized" .. "\n\n" .. l_printWithType_0("Snapshot state", l_snapshotState_0, l_stringify_0)));
    end;
    local v63 = nil;
    v63 = if l_currentTestName_0 and l_hint_0 then l_currentTestName_0 .. ": " .. l_hint_0 else l_currentTestName_0 or "";
    if typeof(l_properties_0) == "table" then
        if l_received_0 == nil or typeof(l_received_0) ~= "table" and l_getType_0(l_received_0) ~= "Instance" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v48, false), l_RECEIVED_COLOR_0("received") .. " value must be an object when the matcher has " .. l_EXPECTED_COLOR_0("properties"), l_printWithType_0("Received", l_received_0, l_printReceived_0))));
        end;
        if not l_context_0.equals(l_received_0, l_properties_0, {
            l_context_0.utils.iterableEquality, 
            l_context_0.utils.subsetEquality
        }) then
            local v64 = l_snapshotState_0:fail(v63, l_received_0):match("(%d+)$");
            local v65 = nil;
            v65 = v64 == nil and 1 or tonumber(v64);
            return {
                message = function() --[[ Line: 278 ]]
                    -- upvalues: l_matcherHintFromConfig_0 (ref), v48 (copy), v37 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), v65 (ref), l_printPropertiesAndReceived_0 (ref), l_properties_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
                    return l_matcherHintFromConfig_0(v48, false) .. "\n\n" .. v37(l_currentTestName_0, l_hint_0, v65) .. "\n\n" .. l_printPropertiesAndReceived_0(l_properties_0, l_received_0, l_snapshotState_0.expand);
                end, 
                name = l_matcherName_0, 
                pass = false
            };
        else
            l_received_0 = v27.deepMerge(l_received_0, l_properties_0);
        end;
    end;
    local v66 = l_snapshotState_0:match({
        error = l_context_0.error, 
        inlineSnapshot = l_inlineSnapshot_0, 
        isInline = l_isInline_0, 
        received = l_received_0, 
        testName = v63
    });
    local l_actual_0 = v66.actual;
    local l_count_0 = v66.count;
    local l_expected_0 = v66.expected;
    if v66.pass then
        return {
            message = function() --[[ Line: 309 ]] --[[ Name: message ]]
                return "";
            end, 
            pass = true
        };
    else
        local v70 = nil;
        v70 = l_expected_0 == nil and function() --[[ Line: 314 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v48 (copy), v37 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_BOLD_WEIGHT_0 (ref), l_actual_0 (copy), l_bReceivedColor_0 (ref)
            local v71 = l_matcherHintFromConfig_0(v48, true) .. "\n\n" .. v37(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. "New snapshot was " .. l_BOLD_WEIGHT_0("not written") .. ". The update flag " .. "must be explicitly passed to write a new snapshot.\n\n" .. "This is likely because this test is run in a continuous integration " .. "(CI) environment in which snapshots are not written by default.\n\n" .. "Received:";
            return (if l_actual_0:find("\n") then v71 .. "\n" else v71 .. " ") .. l_bReceivedColor_0(l_actual_0);
        end or function() --[[ Line: 336 ]]
            -- upvalues: l_matcherHintFromConfig_0 (ref), v48 (copy), v37 (ref), l_currentTestName_0 (copy), l_hint_0 (copy), l_count_0 (copy), l_printSnapshotAndReceived_0 (ref), l_expected_0 (copy), l_actual_0 (copy), l_received_0 (ref), l_snapshotState_0 (copy)
            return l_matcherHintFromConfig_0(v48, true) .. "\n\n" .. v37(l_currentTestName_0, l_hint_0, l_count_0) .. "\n\n" .. l_printSnapshotAndReceived_0(l_expected_0, l_actual_0, l_received_0, l_snapshotState_0.expand);
        end;
        return {
            actual = l_actual_0, 
            expected = l_expected_0, 
            message = v70, 
            name = l_matcherName_0, 
            pass = false
        };
    end;
end;
local function v76(v72, v73, v74, v75) --[[ Line: 362 ]] --[[ Name: toThrowErrorMatchingSnapshot ]]
    -- upvalues: v29 (ref)
    return v29({
        context = v72, 
        hint = v74, 
        isInline = false, 
        matcherName = "toThrowErrorMatchingSnapshot", 
        received = v73
    }, v75);
end;
v29 = function(v77, v78) --[[ Line: 385 ]] --[[ Name: _toThrowErrorMatchingSnapshot ]]
    -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_matcherHintFromConfig_0 (copy), v30 (copy), l_instanceof_0 (copy), v28 (ref)
    local l_context_1 = v77.context;
    local l_hint_1 = v77.hint;
    local l_inlineSnapshot_1 = v77.inlineSnapshot;
    local l_isInline_1 = v77.isInline;
    local l_matcherName_1 = v77.matcherName;
    local l_received_1 = v77.received;
    local l_isNot_1 = l_context_1.isNot;
    local l_promise_0 = l_context_1.promise;
    if not v78 and typeof(l_received_1) ~= "function" then
        local v87 = {
            isNot = l_isNot_1, 
            promise = l_promise_0
        };
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_matcherName_1, nil, "", v87), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", l_received_1, l_printReceived_0))));
    end;
    if l_isNot_1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHintFromConfig_0(v77, false), v30)));
    end;
    local v88 = nil;
    if v78 then
        v88 = l_received_1;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 432 ]]
            -- upvalues: l_received_1 (copy)
            l_received_1();
        end);
        if not l_status_1 then
            v88 = l_result_1;
        end;
    end;
    if v88 == nil then
        error(l_Error_0(l_matcherHintFromConfig_0(v77, false) .. "\n\n" .. "Received function did not throw"));
    end;
    if l_instanceof_0(v88, l_Error_0) or typeof(v88) == "table" and rawget(v88, "message") ~= nil then
        v88 = v88.message;
    elseif typeof(v88) ~= "string" then
        v88 = tostring(v88);
    end;
    return v28({
        context = l_context_1, 
        hint = l_hint_1, 
        inlineSnapshot = l_inlineSnapshot_1, 
        isInline = l_isInline_1, 
        matcherName = l_matcherName_1, 
        received = v88
    });
end;
return {
    SnapshotState = v14, 
    addSerializer = l_addSerializer_0, 
    getSerializers = l_getSerializers_0, 
    toMatchSnapshot = v47, 
    toThrowErrorMatchingSnapshot = v76, 
    utils = v27, 
    plugins = require(l_script_0.plugins)
};