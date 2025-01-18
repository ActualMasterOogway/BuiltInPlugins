local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local l_default_0 = require(l_Parent_0.Throat).default;
local _ = require(l_Parent_0.JestEnvironment);
local l_createEmptyTestResult_0 = require(l_Parent_0.JestTestResult).createEmptyTestResult;
local _ = require(l_Parent_0.JestTypes);
local v11 = require(l_Parent_0.Expect);
local l_extractExpectedAssertionsErrors_0 = v11.extractExpectedAssertionsErrors;
local l_getState_0 = v11.getState;
local l_setState_0 = v11.setState;
local l_bind_0 = require(l_Parent_0.JestEach).bind;
local v16 = require(l_Parent_0.JestMessageUtil);
local l_formatExecError_0 = v16.formatExecError;
local l_formatResultsErrors_0 = v16.formatResultsErrors;
local v19 = require(l_Parent_0.JestSnapshot);
local l_SnapshotState_0 = v19.SnapshotState;
local l_addSerializer_0 = v19.addSerializer;
local l_buildSnapshotResolver_0 = v19.buildSnapshotResolver;
local l_default_1 = require(script.Parent.Parent).default;
local l_default_2 = require(script.Parent.Parent.run).default;
local v25 = require(script.Parent.Parent.state);
local l_ROOT_DESCRIBE_BLOCK_NAME_0 = v25.ROOT_DESCRIBE_BLOCK_NAME;
local l_addEventHandler_0 = v25.addEventHandler;
local l_dispatch_0 = v25.dispatch;
local l_getState_1 = v25.getState;
local l_default_3 = require(script.Parent.Parent.testCaseReportHandler).default;
local l_getTestID_0 = require(script.Parent.Parent.utils).getTestID;
local l_default_4 = require(script.Parent.jestExpect).default;
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
v6.initialize = function(v38) --[[ Line: 93 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy), l_getState_1 (copy), l_default_0 (copy), l_Object_0 (copy), l_default_1 (copy), l_bind_0 (copy), l_addEventHandler_0 (copy), v35 (ref), l_default_4 (copy), l_dispatch_0 (copy), l_Array_0 (copy), l_addSerializer_0 (copy), l_buildSnapshotResolver_0 (copy), l_SnapshotState_0 (copy), l_setState_0 (copy), v34 (ref), l_default_3 (copy), l_getRelativePath_0 (copy)
    local l_config_0 = v38.config;
    local l_environment_0 = v38.environment;
    local l_globalConfig_0 = v38.globalConfig;
    local l_localRequire_0 = v38.localRequire;
    local l_parentProcess_0 = v38.parentProcess;
    local l_sendMessageToJest_0 = v38.sendMessageToJest;
    local l_setGlobalsForRuntime_0 = v38.setGlobalsForRuntime;
    local l_testPath_0 = v38.testPath;
    return v5.resolve():andThen(function() --[[ Line: 118 ]]
        -- upvalues: l_globalConfig_0 (copy), l_getState_1 (ref), l_default_0 (ref), l_Object_0 (ref), l_default_1 (ref), l_bind_0 (ref), l_addEventHandler_0 (ref), v35 (ref), l_environment_0 (copy), l_default_4 (ref), l_setGlobalsForRuntime_0 (copy), l_config_0 (copy), l_dispatch_0 (ref), l_parentProcess_0 (copy), l_Array_0 (ref), l_addSerializer_0 (ref), l_localRequire_0 (copy), l_buildSnapshotResolver_0 (ref), l_testPath_0 (copy), l_SnapshotState_0 (ref), l_setState_0 (ref), v34 (ref), l_sendMessageToJest_0 (copy), l_default_3 (ref), l_getRelativePath_0 (ref)
        if l_globalConfig_0.testTimeout ~= nil and l_globalConfig_0.testTimeout > 0 then
            l_getState_1().testTimeout = l_globalConfig_0.testTimeout;
        end;
        local v47 = l_default_0(l_globalConfig_0.maxConcurrency);
        local v48 = l_Object_0.assign({}, l_default_1, {
            fdescribe = l_default_1.describe.only, 
            fit = l_default_1.it.only, 
            xdescribe = l_default_1.describe.skip, 
            xit = l_default_1.it.skip, 
            xtest = l_default_1.it.skip
        });
        v48.test.concurrent = (function(v49) --[[ Line: 134 ]]
            -- upvalues: v47 (copy), v48 (copy), l_bind_0 (ref)
            local function v54(v50, v51, v52) --[[ Line: 138 ]] --[[ Name: concurrent_ ]]
                -- upvalues: v47 (ref), v48 (ref)
                local v53 = v47(function() --[[ Line: 145 ]]
                    -- upvalues: v51 (copy)
                    return v51();
                end);
                v53:catch(function() --[[ Line: 150 ]]

                end);
                v48.test(v50, function() --[[ Line: 152 ]]
                    -- upvalues: v53 (copy)
                    return v53;
                end, v52);
            end;
            local v59 = setmetatable({}, {
                __call = function(_, v56, v57, v58) --[[ Line: 157 ]] --[[ Name: __call ]]
                    -- upvalues: v54 (copy)
                    v54(v56, v57, v58);
                end
            });
            local function v64(v60, v61, v62) --[[ Line: 162 ]] --[[ Name: only_ ]]
                -- upvalues: v47 (ref), v49 (copy)
                local v63 = v47(function() --[[ Line: 163 ]]
                    -- upvalues: v61 (copy)
                    return v61();
                end);
                v49.only(v60, function() --[[ Line: 167 ]]
                    -- upvalues: v63 (copy)
                    return v63;
                end, v62);
            end;
            local v69 = setmetatable({}, {
                __call = function(_, v66, v67, v68) --[[ Line: 172 ]] --[[ Name: __call ]]
                    -- upvalues: v64 (copy)
                    return v64(v66, v67, v68);
                end
            });
            v59.only = v69;
            v59.skip = v49.skip;
            v59.each = l_bind_0(v49, false);
            v59.skip.each = l_bind_0(v49.skip, false);
            v69.each = l_bind_0(v49.only, false);
            return v59;
        end)(v48.test);
        l_addEventHandler_0(v35);
        if l_environment_0.handleTestEvent ~= nil then
            local l_handleTestEvent_0 = l_environment_0.handleTestEvent;
            local l_l_handleTestEvent_0_0 = l_handleTestEvent_0 --[[ copy: 2 -> 8 ]];
            l_addEventHandler_0(function(...) --[[ Line: 191 ]]
                -- upvalues: l_l_handleTestEvent_0_0 (copy), l_environment_0 (ref)
                return l_l_handleTestEvent_0_0(l_environment_0, ...);
            end);
        end;
        local v72 = l_Object_0.assign({}, v48, {
            expect = l_default_4(l_globalConfig_0)
        });
        v72.expectExtended = v72.expect;
        l_setGlobalsForRuntime_0(v72);
        if l_config_0.injectGlobals then
            l_Object_0.assign(l_environment_0.global, v72);
        end;
        l_dispatch_0({
            name = "setup", 
            parentProcess = l_parentProcess_0, 
            runtimeGlobals = v72, 
            testNamePattern = l_globalConfig_0.testNamePattern
        }):expect();
        if l_config_0.testLocationInResults then
            l_dispatch_0({
                name = "include_test_location_in_result"
            }):expect();
        end;
        l_Array_0.forEach(l_Array_0.reverse(l_Array_0.concat(l_config_0.snapshotSerializers)), function(v73) --[[ Line: 217 ]]
            -- upvalues: l_addSerializer_0 (ref), l_localRequire_0 (ref)
            return l_addSerializer_0(l_localRequire_0(v73));
        end);
        local l_expand_0 = l_globalConfig_0.expand;
        local l_updateSnapshot_0 = l_globalConfig_0.updateSnapshot;
        local v76 = l_buildSnapshotResolver_0(l_config_0, l_localRequire_0):expect():resolveSnapshotPath(l_testPath_0);
        local v77 = l_SnapshotState_0.new(v76, {
            expand = l_expand_0, 
            snapshotFormat = l_config_0.snapshotFormat, 
            updateSnapshot = l_updateSnapshot_0
        });
        l_setState_0({
            snapshotState = v77, 
            testPath = l_testPath_0
        });
        l_addEventHandler_0(v34(v77));
        if l_sendMessageToJest_0 ~= nil then
            l_addEventHandler_0(l_default_3(l_getRelativePath_0(l_testPath_0), l_sendMessageToJest_0));
        end;
        return {
            globals = v48, 
            snapshotState = v77
        };
    end);
end;
v6.runAndTransformResultsToJestFormat = function(v78) --[[ Line: 264 ]] --[[ Name: runAndTransformResultsToJestFormat ]]
    -- upvalues: v5 (copy), l_default_2 (copy), l_Array_0 (copy), l_ROOT_DESCRIBE_BLOCK_NAME_0 (copy), l_Boolean_0 (copy), l_formatResultsErrors_0 (copy), l_formatExecError_0 (copy), l_dispatch_0 (copy), l_Object_0 (copy), l_createEmptyTestResult_0 (copy)
    local l_config_1 = v78.config;
    local l_globalConfig_1 = v78.globalConfig;
    local l_testPath_1 = v78.testPath;
    return v5.resolve():andThen(function() --[[ Line: 271 ]]
        -- upvalues: v5 (ref), l_default_2 (ref), l_Array_0 (ref), l_ROOT_DESCRIBE_BLOCK_NAME_0 (ref), l_Boolean_0 (ref), l_formatResultsErrors_0 (ref), l_config_1 (copy), l_globalConfig_1 (copy), l_testPath_1 (copy), l_formatExecError_0 (ref), l_dispatch_0 (ref), l_Object_0 (ref), l_createEmptyTestResult_0 (ref)
        local v82 = v5.resolve(l_default_2()):expect();
        local v83 = 0;
        local v84 = 0;
        local v85 = 0;
        local v86 = 0;
        local v92 = l_Array_0.map(v82.testResults, function(v87) --[[ Line: 279 ]]
            -- upvalues: v85 (ref), v86 (ref), v83 (ref), v84 (ref), l_Array_0 (ref), l_ROOT_DESCRIBE_BLOCK_NAME_0 (ref), l_Boolean_0 (ref)
            local v88 = nil;
            if v87.status == "skip" then
                v88 = "pending";
                v85 = v85 + 1;
            elseif v87.status == "todo" then
                v88 = "todo";
                v86 = v86 + 1;
            elseif #v87.errors ~= 0 then
                v88 = "failed";
                v83 = v83 + 1;
            else
                v88 = "passed";
                v84 = v84 + 1;
            end;
            local v90 = l_Array_0.filter(v87.testPath, function(v89) --[[ Line: 295 ]]
                -- upvalues: l_ROOT_DESCRIBE_BLOCK_NAME_0 (ref)
                return v89 ~= l_ROOT_DESCRIBE_BLOCK_NAME_0;
            end);
            local v91 = table.remove(v90);
            return {
                ancestorTitles = v90, 
                duration = v87.duration, 
                failureDetails = v87.errorsDetailed, 
                failureMessages = v87.errors, 
                fullName = if l_Boolean_0.toJSBoolean(v91) then l_Array_0.join(l_Array_0.concat(v90, v91), " ") else l_Array_0.join(v90, " "), 
                invocations = v87.invocations, 
                location = v87.location, 
                numPassingAsserts = 0, 
                retryReasons = v87.retryReasons, 
                status = v88, 
                title = v87.testPath[#v87.testPath]
            };
        end);
        local v93 = l_formatResultsErrors_0(v92, l_config_1, l_globalConfig_1, l_testPath_1);
        local v94 = nil;
        if #v82.unhandledErrors ~= 0 then
            v94 = {
                message = "", 
                stack = l_Array_0.join(v82.unhandledErrors, "\n")
            };
            v93 = (l_Boolean_0.toJSBoolean(v93) and v93 or "") .. "\n\n" .. l_Array_0.join(l_Array_0.map(v82.unhandledErrors, function(v95) --[[ Line: 334 ]]
                -- upvalues: l_formatExecError_0 (ref), l_config_1 (ref), l_globalConfig_1 (ref)
                return l_formatExecError_0(v95, l_config_1, l_globalConfig_1);
            end), "\n");
        end;
        l_dispatch_0({
            name = "teardown"
        }):expect();
        return l_Object_0.assign({}, l_createEmptyTestResult_0(), {
            console = l_Object_0.None, 
            displayName = l_config_1.displayName, 
            failureMessage = v93, 
            numFailingTests = v83, 
            numPassingTests = v84, 
            numPendingTests = v85, 
            numTodoTests = v86, 
            testExecError = v94, 
            testFilePath = l_testPath_1, 
            testResults = v92
        });
    end);
end;
v34 = function(v96) --[[ Line: 364 ]] --[[ Name: handleSnapshotStateAfterRetry ]]
    return function(_, v98) --[[ Line: 365 ]]
        -- upvalues: v96 (copy)
        if v98.name == "test_retry" then
            v96:clear();
        end;
    end;
end;
v35 = function(_, v100) --[[ Line: 373 ]] --[[ Name: eventHandler ]]
    -- upvalues: v5 (copy), l_setState_0 (copy), l_getTestID_0 (copy), v37 (ref), v36 (ref)
    return v5.resolve():andThen(function() --[[ Line: 374 ]]
        -- upvalues: v100 (copy), l_setState_0 (ref), l_getTestID_0 (ref), v37 (ref), v36 (ref)
        if v100.name == "test_start" then
            l_setState_0({
                currentTestName = l_getTestID_0(v100.test)
            });
            return;
        elseif v100.name == "test_done" then
            v37(v100.test);
            v36(v100.test);
            return;
        else
            return;
        end;
    end);
end;
v36 = function(v101) --[[ Line: 388 ]] --[[ Name: _addExpectedAssertionErrors ]]
    -- upvalues: l_extractExpectedAssertionsErrors_0 (copy), l_Array_0 (copy)
    local v102 = l_extractExpectedAssertionsErrors_0();
    local v104 = l_Array_0.map(v102, function(v103) --[[ Line: 390 ]]
        return v103.error;
    end);
    v101.errors = l_Array_0.concat(v101.errors, v104);
end;
v37 = function(v105) --[[ Line: 399 ]] --[[ Name: _addSuppressedErrors ]]
    -- upvalues: l_getState_0 (copy), l_setState_0 (copy), l_Array_0 (copy)
    local l_suppressedErrors_0 = l_getState_0().suppressedErrors;
    l_setState_0({
        suppressedErrors = {}
    });
    if #l_suppressedErrors_0 ~= 0 then
        v105.errors = l_Array_0.concat(v105.errors, l_suppressedErrors_0);
    end;
end;
return v6;