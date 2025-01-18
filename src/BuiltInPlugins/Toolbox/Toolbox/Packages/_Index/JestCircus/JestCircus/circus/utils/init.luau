local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = require(l_Parent_0.Promise);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = require(l_Parent_0.RegExp);
local function v16(v12) --[[ Line: 34 ]] --[[ Name: separateMessageFromStack ]]
    -- upvalues: v11 (copy)
    if not v12 then
        return {
            message = "", 
            stack = ""
        };
    else
        local l_v12_0 = v12;
        local v14 = "";
        local v15 = v11("^(\\s*LoadedCode.*:\\d+)?(: )?(.*)$"):exec(v12);
        if v15 then
            l_v12_0 = v15[4];
            v14 = v15[2];
        end;
        return {
            message = l_v12_0, 
            stack = v14
        };
    end;
end;
local v17 = {};
local l_dedent_0 = require(l_Parent_0.RobloxShared).dedent;
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v21 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v21.ErrorWithStack;
local l_convertDescriptorToString_0 = v21.convertDescriptorToString;
local l_formatTime_0 = v21.formatTime;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v26 = require(script.Parent.state_);
local l_ROOT_DESCRIBE_BLOCK_NAME_0 = v26.ROOT_DESCRIBE_BLOCK_NAME;
local l_getState_0 = v26.getState;
local function _(v29) --[[ Line: 108 ]] --[[ Name: takesDoneCallback ]]
    return debug.info(v29, "a") > 1;
end;
local _ = function(_) --[[ Line: 115 ]] --[[ Name: isGeneratorFunction ]]
    return false;
end;
v17.makeDescribe = function(v33, v34, v35) --[[ Line: 127 ]] --[[ Name: makeDescribe ]]
    -- upvalues: l_Boolean_0 (copy), l_convertDescriptorToString_0 (copy)
    local l_v35_0 = v35;
    if v34 ~= nil and not l_Boolean_0.toJSBoolean(v35) then
        l_v35_0 = v34.mode;
    end;
    return {
        type = "describeBlock", 
        children = {}, 
        hooks = {}, 
        mode = l_v35_0, 
        name = l_convertDescriptorToString_0(v33), 
        parent = v34, 
        tests = {}
    };
end;
v17.makeTest = function(v37, v38, v39, v40, v41, v42, v43) --[[ Line: 151 ]] --[[ Name: makeTest ]]
    -- upvalues: l_convertDescriptorToString_0 (copy)
    return {
        type = "test", 
        asyncError = v42, 
        duration = nil, 
        errors = {}, 
        failing = v43, 
        fn = v37, 
        invocations = 0, 
        mode = v38, 
        name = l_convertDescriptorToString_0(v39), 
        parent = v40, 
        retryReasons = {}, 
        seenDone = false, 
        startedAt = nil, 
        status = nil, 
        timeout = v41
    };
end;
local function v44(v45) --[[ Line: 184 ]] --[[ Name: hasEnabledTest ]]
    -- upvalues: l_getState_0 (copy), l_Array_0 (copy), v44 (copy), v7 (ref)
    local v46 = l_getState_0();
    local l_hasFocusedTests_0 = v46.hasFocusedTests;
    local l_testNamePattern_0 = v46.testNamePattern;
    return l_Array_0.some(v45.children, function(v49) --[[ Line: 187 ]]
        -- upvalues: v44 (ref), l_hasFocusedTests_0 (copy), l_testNamePattern_0 (copy), v7 (ref)
        if v49.type == "describeBlock" then
            return (v44(v49));
        else
            local v50 = true;
            if v49.mode ~= "skip" then
                v50 = l_hasFocusedTests_0 and v49.mode ~= "only" or l_testNamePattern_0 and not l_testNamePattern_0:test(v7(v49));
            end;
            return not v50;
        end;
    end);
end;
v17.getAllHooksForDescribe = function(v51) --[[ Line: 203 ]] --[[ Name: getAllHooksForDescribe ]]
    -- upvalues: l_getState_0 (copy), l_Array_0 (copy), v44 (copy), v7 (ref)
    local v52 = {
        afterAll = {}, 
        beforeAll = {}
    };
    local v53 = l_getState_0();
    local l_hasFocusedTests_1 = v53.hasFocusedTests;
    local l_testNamePattern_1 = v53.testNamePattern;
    local l_l_testNamePattern_1_0 = l_testNamePattern_1 --[[ copy: 5 -> 7 ]];
    if l_Array_0.some(v51.children, function(v57) --[[ Line: 187 ]]
        -- upvalues: v44 (ref), l_hasFocusedTests_1 (copy), l_l_testNamePattern_1_0 (copy), v7 (ref)
        if v57.type == "describeBlock" then
            return (v44(v57));
        else
            local v58 = true;
            if v57.mode ~= "skip" then
                v58 = l_hasFocusedTests_1 and v57.mode ~= "only" or l_l_testNamePattern_1_0 and not l_l_testNamePattern_1_0:test(v7(v57));
            end;
            return not v58;
        end;
    end) then
        for _, v60 in ipairs(v51.hooks) do
            if v60.type == "beforeAll" then
                table.insert(v52.beforeAll, v60);
            elseif v60.type == "afterAll" then
                table.insert(v52.afterAll, v60);
            end;
        end;
    end;
    return v52;
end;
v17.getEachHooksForTest = function(v61) --[[ Line: 225 ]] --[[ Name: getEachHooksForTest ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy)
    local v62 = {
        afterEach = {}, 
        beforeEach = {}
    };
    local l_parent_0 = v61.parent;
    repeat
        local v64 = {};
        local v65 = nil;
        for _, v67 in ipairs(l_parent_0.hooks) do
            v65 = v67;
            if v65.type == "beforeEach" then
                table.insert(v64, v65);
            elseif v65.type == "afterEach" then
                table.insert(v62.afterEach, v65);
            end;
        end;
        v62.beforeEach = l_Array_0.concat({}, v64, v62.beforeEach);
        l_parent_0 = l_parent_0.parent;
    until not l_Boolean_0.toJSBoolean(l_parent_0);
    return v62;
end;
local function v68(v69) --[[ Line: 253 ]] --[[ Name: describeBlockHasTests ]]
    -- upvalues: l_Array_0 (copy), v68 (copy)
    return l_Array_0.some(v69.children, function(v70) --[[ Line: 254 ]]
        -- upvalues: v68 (ref)
        local v71 = true;
        if v70.type ~= "test" then
            v71 = v68(v70);
        end;
        return v71;
    end);
end;
v17.describeBlockHasTests = v68;
local function v74(v72, v73) --[[ Line: 260 ]] --[[ Name: _makeTimeoutMessage ]]
    -- upvalues: l_formatTime_0 (copy)
    return ("Exceeded timeout of %s for a %s.\nUse jest.setTimeout(newTimeout) to increase the timeout value, if this is a long-running test."):format(l_formatTime_0(v72), v73 and "hook" or "test");
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local function _(v77) --[[ Line: 272 ]] --[[ Name: checkIsError ]]
    -- upvalues: l_Boolean_0 (copy)
    return l_Boolean_0.toJSBoolean(v77) and l_Boolean_0.toJSBoolean(v77.message) and l_Boolean_0.toJSBoolean(v77.stack);
end;
v17.callAsyncCircusFn = function(v79, v80, v81) --[[ Line: 280 ]] --[[ Name: callAsyncCircusFn ]]
    -- upvalues: v5 (copy), l_setTimeout_0 (copy), v74 (copy), l_ErrorWithStack_0 (copy), l_Boolean_0 (copy), l_format_0 (copy), l_dedent_0 (copy), l_clearTimeout_0 (copy), v16 (copy), l_Error_0 (copy)
    local l_isHook_0 = v81.isHook;
    local l_timeout_0 = v81.timeout;
    local v84 = nil;
    local v85 = false;
    local l_fn_0 = v79.fn;
    local l_asyncError_0 = v79.asyncError;
    return v5.new(function(v88, v89) --[[ Line: 291 ]]
        -- upvalues: v84 (ref), l_setTimeout_0 (ref), v74 (ref), l_timeout_0 (copy), l_isHook_0 (copy), l_fn_0 (copy), l_ErrorWithStack_0 (ref), v85 (ref), v79 (copy), l_Boolean_0 (ref), l_format_0 (ref), v5 (ref), l_asyncError_0 (copy), l_dedent_0 (ref), v80 (copy)
        v84 = l_setTimeout_0(function() --[[ Line: 292 ]]
            -- upvalues: v89 (copy), v74 (ref), l_timeout_0 (ref), l_isHook_0 (ref)
            return v89(v74(l_timeout_0, l_isHook_0));
        end, l_timeout_0);
        local l_l_fn_0_0 = l_fn_0;
        if debug.info(l_l_fn_0_0, "a") > 1 then
            local v91 = nil;
            l_l_fn_0_0 = function(v92) --[[ Line: 301 ]] --[[ Name: done ]]
                -- upvalues: l_ErrorWithStack_0 (ref), l_l_fn_0_0 (copy), v85 (ref), v79 (ref), l_Boolean_0 (ref), l_format_0 (ref), v89 (copy), v5 (ref), v91 (ref), l_asyncError_0 (ref), l_dedent_0 (ref), v88 (copy)
                local v93 = l_ErrorWithStack_0.new(nil, l_l_fn_0_0);
                if not v85 and v79.seenDone then
                    v93.message = "Expected done to be called once, but it was called multiple times.";
                    if l_Boolean_0.toJSBoolean(v92) then
                        v93.message = v93.message .. " Reason: " .. l_format_0(v92, {
                            maxDepth = 3
                        });
                    end;
                    v89(v93);
                    error(v93);
                else
                    v79.seenDone = true;
                end;
                v5.delay(0):andThen(function() --[[ Line: 320 ]]
                    -- upvalues: v91 (ref), l_asyncError_0 (ref), l_dedent_0 (ref), l_format_0 (ref), v89 (ref), v92 (copy), l_Boolean_0 (ref), v93 (copy), v85 (ref), v88 (ref)
                    if v91 ~= nil then
                        l_asyncError_0.message = l_dedent_0(("\n      Test functions cannot both take a 'done' callback and return something. Either use a 'done' callback, or return a promise.\n      Returned value: %s\n      "):format(l_format_0(v91, {
                            maxDepth = 3
                        })));
                        return v89(l_asyncError_0);
                    else
                        local v94 = nil;
                        local l_v92_0 = v92;
                        if l_Boolean_0.toJSBoolean(l_v92_0) and l_Boolean_0.toJSBoolean(l_v92_0.message) and l_Boolean_0.toJSBoolean(l_v92_0.stack) then
                            v94 = v92;
                        else
                            v94 = v93;
                            v93.message = ("Failed: %s"):format(l_format_0(v92, {
                                maxDepth = 3
                            }));
                        end;
                        if v85 and l_Boolean_0.toJSBoolean(v92) then
                            v94.message = "Caught error after test environment was torn down\n\n" .. v94.message;
                            error(v94);
                        end;
                        if l_Boolean_0.toJSBoolean(v92) then
                            return (v89(v94));
                        else
                            return (v88());
                        end;
                    end;
                end);
            end;
            v91 = l_fn_0(v80, l_l_fn_0_0);
            return;
        else
            local v96 = nil;
            local l_l_fn_0_1 = l_fn_0;
            if false then
                error("Generator functions are not supported in Lua");
            else
                l_l_fn_0_0, l_l_fn_0_1 = pcall(l_fn_0, v80);
                if not l_l_fn_0_0 then
                    v89(l_l_fn_0_1);
                    return;
                else
                    v96 = l_l_fn_0_1;
                end;
            end;
            if typeof(v96) == "table" and v96 ~= nil and typeof(v96.andThen) == "function" then
                v96:andThen(function() --[[ Line: 385 ]]
                    -- upvalues: v88 (copy)
                    return v88();
                end, v89);
                return;
            elseif not l_isHook_0 and v96 ~= nil then
                v89((l_dedent_0(("\ntest functions can only return Promise or undefined.\n      Returned value: %s\n      "):format(l_format_0(v96, {
                    maxDepth = 3
                })))));
                return;
            else
                v88();
                return;
            end;
        end;
    end):andThen(function() --[[ Line: 407 ]]
        -- upvalues: v85 (ref), l_clearTimeout_0 (ref), v84 (ref)
        v85 = true;
        l_clearTimeout_0(v84);
    end):catch(function(v98) --[[ Line: 415 ]]
        -- upvalues: v85 (ref), l_clearTimeout_0 (ref), v84 (ref), v16 (ref), l_Error_0 (ref)
        v85 = true;
        l_clearTimeout_0(v84);
        if typeof(v98) == "string" then
            local v99 = v16(v98);
            local v100 = l_Error_0.new(v99.message);
            v100.__stack = v99.stack;
            l_Error_0.__recalculateStacktrace(v100);
            error(v100);
        end;
        error(v98);
    end);
end;
v17.getTestDuration = function(v101) --[[ Line: 434 ]] --[[ Name: getTestDuration ]]
    local l_startedAt_0 = v101.startedAt;
    if typeof(l_startedAt_0) == "number" then
        return DateTime.now().UnixTimestampMillis - l_startedAt_0;
    else
        return nil;
    end;
end;
v17.makeRunResult = function(v103, v104) --[[ Line: 440 ]] --[[ Name: makeRunResult ]]
    -- upvalues: v6 (ref), l_Array_0 (copy), v8 (ref), v9 (ref)
    return {
        testResults = v6(v103), 
        unhandledErrors = l_Array_0.map(l_Array_0.map(v104, v8), v9)
    };
end;
local function v111(v105) --[[ Line: 448 ]] --[[ Name: makeSingleTestResult ]]
    -- upvalues: l_getState_0 (copy), v10 (ref), l_Array_0 (copy), v8 (ref), v9 (ref)
    local _ = l_getState_0().includeTestLocationInResult;
    local v107 = {};
    local l_v105_0 = v105;
    local l_status_0 = v105.status;
    v10(l_status_0, "Status should be present after tests are run.");
    repeat
        table.insert(v107, 1, l_v105_0.name);
        l_v105_0 = l_v105_0.parent;
    until l_v105_0 == nil;
    local v110 = l_Array_0.map(v105.errors, v8);
    return {
        duration = v105.duration, 
        errors = l_Array_0.map(v110, v9), 
        errorsDetailed = v110, 
        invocations = v105.invocations, 
        location = nil, 
        retryReasons = l_Array_0.map(l_Array_0.map(v105.retryReasons, v8), v9), 
        status = l_status_0, 
        testPath = l_Array_0.from(v107)
    };
end;
v17.makeSingleTestResult = v111;
v6 = function(v112) --[[ Line: 507 ]] --[[ Name: makeTestResults ]]
    -- upvalues: l_Array_0 (copy), v6 (ref), v111 (copy)
    local v113 = {};
    for _, v115 in ipairs(v112.children) do
        if v115.type == "describeBlock" then
            v113 = l_Array_0.concat(v113, v6(v115));
        elseif v115.type == "test" then
            table.insert(v113, (v111(v115)));
        end;
    end;
    return v113;
end;
v7 = function(v116) --[[ Line: 523 ]] --[[ Name: getTestID ]]
    -- upvalues: l_Array_0 (copy)
    local v117 = {};
    local l_v116_0 = v116;
    repeat
        table.insert(v117, 1, l_v116_0.name);
        l_v116_0 = l_v116_0.parent;
    until l_v116_0 == nil;
    table.remove(v117, 1);
    return l_Array_0.join(v117, " ");
end;
v17.getTestID = v7;
v8 = function(v119) --[[ Line: 543 ]] --[[ Name: _getError ]]
    -- upvalues: l_Array_0 (copy), l_Error_0 (copy), l_Boolean_0 (copy), l_format_0 (copy)
    local v120 = nil;
    local v121 = nil;
    if l_Array_0.isArray(v119) then
        v120 = v119[1];
        v121 = v119[2];
    else
        v120 = v119;
        v121 = l_Error_0.new();
    end;
    if v120 ~= nil and (typeof(v120.stack) == "string" or l_Boolean_0.toJSBoolean(v120.message)) then
        return v120;
    else
        v121.message = ("thrown: %s"):format(l_format_0(v120, {
            maxDepth = 3
        }));
        return v121;
    end;
end;
v9 = function(v122) --[[ Line: 567 ]] --[[ Name: getErrorStack ]]
    if typeof(v122.stack) == "string" then
        if string.find(v122.stack, v122.message, nil, true) then
            return v122.stack;
        else
            return v122.message .. "\n" .. v122.stack;
        end;
    else
        return v122.message;
    end;
end;
local function v123(v124, v125, v126) --[[ Line: 583 ]] --[[ Name: addErrorToEachTestUnderDescribe ]]
    -- upvalues: v123 (copy)
    for _, v128 in ipairs(v124.children) do
        if v128.type == "describeBlock" then
            v123(v128, v125, v126);
        elseif v128.type == "test" then
            table.insert(v128.errors, {
                v125, 
                v126
            });
        end;
    end;
end;
v17.addErrorToEachTestUnderDescribe = v123;
v10 = function(v129, v130) --[[ Line: 599 ]] --[[ Name: invariant ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy)
    if not l_Boolean_0.toJSBoolean(v129) then
        error(l_Error_0.new(v130));
    end;
end;
v17.invariant = v10;
v17.parseSingleTestResult = function(v131) --[[ Line: 609 ]] --[[ Name: parseSingleTestResult ]]
    -- upvalues: l_Array_0 (copy), l_ROOT_DESCRIBE_BLOCK_NAME_0 (copy), l_Boolean_0 (copy)
    local v132 = nil;
    v132 = v131.status == "skip" and "pending" or v131.status == "todo" and "todo" or #v131.errors > 0 and "failed" or "passed";
    local v134 = l_Array_0.filter(v131.testPath, function(v133) --[[ Line: 621 ]]
        -- upvalues: l_ROOT_DESCRIBE_BLOCK_NAME_0 (ref)
        return v133 ~= l_ROOT_DESCRIBE_BLOCK_NAME_0;
    end);
    local v135 = table.remove(v134);
    return {
        ancestorTitles = v134, 
        duration = v131.duration, 
        failureDetails = v131.errorsDetailed, 
        failureMessages = l_Array_0.from(v131.errors), 
        fullName = if l_Boolean_0.toJSBoolean(v135) then l_Array_0.join(l_Array_0.concat(v134, v135), " ") else l_Array_0.join(v134, " "), 
        invocations = v131.invocations, 
        location = v131.location, 
        numPassingAsserts = 0, 
        retryReasons = l_Array_0.from(v131.retryReasons), 
        status = v132, 
        title = v131.testPath[#v131.testPath]
    };
end;
return v17;