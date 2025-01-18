local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_WeakMap_0 = v1.WeakMap;
local v8 = require(l_Parent_0.Promise);
local v9 = {};
local v10 = require(l_Parent_0.ChalkLua);
local l_exit_0 = require(l_Parent_0.RobloxShared).nodeUtils.exit;
local v12 = require(l_Parent_0.JestReporters);
local l_DefaultReporter_0 = v12.DefaultReporter;
local l_SummaryReporter_0 = v12.SummaryReporter;
local l_VerboseReporter_0 = v12.VerboseReporter;
local v16 = require(l_Parent_0.JestTestResult);
local l_addResult_0 = v16.addResult;
local l_buildFailureTestResult_0 = v16.buildFailureTestResult;
local l_makeEmptyAggregatedTestResult_0 = v16.makeEmptyAggregatedTestResult;
local _ = require(l_Parent_0.JestTypes);
local l_formatExecError_0 = require(l_Parent_0.JestMessageUtil).formatExecError;
local _ = require(l_Parent_0.JestRunner);
local _ = require(l_Parent_0.JestRuntime);
local l_default_0 = require(script.Parent.ReporterDispatcher).default;
local _ = require(script.Parent.TestWatcher);
local l_shouldRunInBand_0 = require(script.Parent.testSchedulerHelper).shouldRunInBand;
local _ = require(script.Parent.types);
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
v9.createTestScheduler = function(v32, v33) --[[ Line: 94 ]] --[[ Name: createTestScheduler ]]
    -- upvalues: v8 (copy), v28 (ref)
    return v8.resolve():andThen(function() --[[ Line: 98 ]]
        -- upvalues: v28 (ref), v32 (copy), v33 (copy)
        local v34 = v28.new(v32, v33);
        v34:_setupReporters():expect();
        return v34;
    end);
end;
v28 = {};
v28.__index = v28;
v28.new = function(v35, v36) --[[ Line: 163 ]] --[[ Name: new ]]
    -- upvalues: v28 (ref), l_default_0 (copy)
    local v37 = setmetatable({}, v28);
    v37._context = v36;
    v37._dispatcher = l_default_0.new();
    v37._globalConfig = v35;
    return v37;
end;
v28.addReporter = function(v38, v39) --[[ Line: 171 ]] --[[ Name: addReporter ]]
    v38._dispatcher:register(v39);
end;
v28.removeReporter = function(v40, v41) --[[ Line: 175 ]] --[[ Name: removeReporter ]]
    v40._dispatcher:unregister(v41);
end;
v28.scheduleTests = function(v42, v43, v44) --[[ Line: 179 ]] --[[ Name: scheduleTests ]]
    -- upvalues: v8 (copy), l_Set_0 (copy), l_Array_0 (copy), v30 (ref), v31 (ref), l_shouldRunInBand_0 (copy), l_Error_0 (copy), l_Boolean_0 (copy), v10 (copy), l_addResult_0 (copy), l_buildFailureTestResult_0 (copy), l_formatExecError_0 (copy), l_WeakMap_0 (copy), l_Parent_0 (copy), l_Object_0 (copy), v29 (ref)
    return v8.resolve():andThen(function() --[[ Line: 180 ]]
        -- upvalues: v42 (copy), l_Set_0 (ref), l_Array_0 (ref), v43 (copy), v30 (ref), v31 (ref), l_shouldRunInBand_0 (ref), v8 (ref), v44 (copy), l_Error_0 (ref), l_Boolean_0 (ref), v10 (ref), l_addResult_0 (ref), l_buildFailureTestResult_0 (ref), l_formatExecError_0 (ref), l_WeakMap_0 (ref), l_Parent_0 (ref), l_Object_0 (ref), v29 (ref)
        local v45 = nil;
        local v46 = nil;
        local v47 = nil;
        local function v48(...) --[[ Line: 187 ]]
            -- upvalues: v42 (ref)
            return v42._dispatcher:onTestFileStart(...);
        end;
        local v49 = {};
        local v50 = l_Set_0.new();
        l_Array_0.forEach(v43, function(v51) --[[ Line: 192 ]]
            -- upvalues: v50 (copy), v49 (copy)
            v50:add(v51.context);
            local v52 = v51.duration or 0;
            if v52 > 0 then
                table.insert(v49, v52);
            end;
        end);
        local v53 = v30(#v43);
        local v54 = math.ceil(v31(v49, v42._globalConfig.maxWorkers) / 1000);
        local v55 = l_shouldRunInBand_0(v43, v49, v42._globalConfig);
        v45 = function(v56, v57) --[[ Line: 207 ]] --[[ Name: onResult ]]
            -- upvalues: v8 (ref), v44 (ref), v46 (ref), l_Error_0 (ref), l_Boolean_0 (ref), v10 (ref), l_addResult_0 (ref), v53 (copy), v42 (ref), v50 (copy)
            return v8.resolve():andThen(function() --[[ Line: 208 ]]
                -- upvalues: v44 (ref), v8 (ref), v57 (copy), v46 (ref), v56 (copy), l_Error_0 (ref), l_Boolean_0 (ref), v10 (ref), l_addResult_0 (ref), v53 (ref), v42 (ref), v50 (ref)
                if v44:isInterrupted() then
                    return v8.resolve();
                elseif #v57.testResults == 0 then
                    return v46(v56, {
                        message = "Your test suite must contain at least one test.", 
                        stack = l_Error_0.new("Your test suite must contain at least one test.").stack
                    });
                elseif l_Boolean_0.toJSBoolean(v57.leaks) then
                    local v58 = ("%sYour test suite is leaking memory. Please ensure all references are cleaned.\n"):format((tostring(v10.red:bold("EXPERIMENTAL FEATURE!\n")))) .. "\n" .. "There is a number of things that can leak memory:\n" .. "  - Async operations that have not finished (e.g. fs.readFile).\n" .. "  - Timers not properly mocked (e.g. setInterval, setTimeout).\n" .. "  - Keeping references to the global scope.";
                    return v46(v56, {
                        message = v58, 
                        stack = l_Error_0.new(v58).stack
                    });
                else
                    l_addResult_0(v53, v57);
                    v42._dispatcher:onTestFileResult(v56, v57, v53):expect();
                    return v42:_bailIfNeeded(v50, v53, v44);
                end;
            end);
        end;
        v46 = function(v59, v60) --[[ Line: 230 ]] --[[ Name: onFailure ]]
            -- upvalues: v8 (ref), v44 (ref), l_buildFailureTestResult_0 (ref), l_formatExecError_0 (ref), v42 (ref), l_addResult_0 (ref), v53 (copy)
            return v8.resolve():andThen(function() --[[ Line: 231 ]]
                -- upvalues: v44 (ref), l_buildFailureTestResult_0 (ref), v59 (copy), v60 (copy), l_formatExecError_0 (ref), v42 (ref), l_addResult_0 (ref), v53 (ref)
                if v44:isInterrupted() then
                    return;
                else
                    local v61 = l_buildFailureTestResult_0(v59.path, v60);
                    v61.failureMessage = l_formatExecError_0(v61.testExecError, v59.context.config, v42._globalConfig, v59.path);
                    l_addResult_0(v53, v61);
                    v42._dispatcher:onTestFileResult(v59, v61, v53):expect();
                    return;
                end;
            end);
        end;
        v47 = function() --[[ Line: 248 ]] --[[ Name: updateSnapshotState ]]
            -- upvalues: v8 (ref), l_Array_0 (ref), v50 (copy), v53 (copy), v42 (ref)
            return v8.resolve():andThen(function() --[[ Line: 249 ]]
                -- upvalues: v8 (ref), l_Array_0 (ref), v50 (ref), v53 (ref), v42 (ref)
                local v63 = v8.all(l_Array_0.map(l_Array_0.from(v50), function(v62) --[[ Line: 250 ]]
                    -- upvalues: v8 (ref)
                    return v8.resolve():andThen(function() --[[ Line: 251 ]]
                        -- upvalues: v62 (copy)
                        return {
                            v62
                        };
                    end);
                end)):expect();
                l_Array_0.forEach(v63, function(_) --[[ Line: 261 ]]
                    -- upvalues: v53 (ref), l_Array_0 (ref)
                    local v65 = {
                        filesRemoved = 0, 
                        filesRemovedList = {}
                    };
                    local l_snapshot_0 = v53.snapshot;
                    l_snapshot_0.filesRemoved = l_snapshot_0.filesRemoved + v65.filesRemoved;
                    v53.snapshot.filesRemovedList = l_Array_0.concat(if v53.snapshot.filesRemovedList ~= nil then v53.snapshot.filesRemovedList else {}, v65.filesRemovedList);
                end);
                local v67 = v42._globalConfig.updateSnapshot == "all";
                v53.snapshot.didUpdate = v67;
                v53.snapshot.failure = not v67 and (v53.snapshot.unchecked > 0 or v53.snapshot.unmatched > 0 or v53.snapshot.filesRemoved > 0);
            end);
        end;
        v42._dispatcher:onRunStart(v53, {
            estimatedTime = v54, 
            showStatus = not l_Boolean_0.toJSBoolean(v55)
        }):expect();
        local v68 = {};
        local v69 = l_WeakMap_0.new();
        v8.all(l_Array_0.map(l_Array_0.from(v50), function(v70) --[[ Line: 304 ]]
            -- upvalues: v8 (ref), l_Boolean_0 (ref), v68 (copy), l_Parent_0 (ref), v42 (ref), v69 (copy)
            return v8.resolve():andThen(function() --[[ Line: 305 ]]
                -- upvalues: v70 (copy), l_Boolean_0 (ref), v68 (ref), l_Parent_0 (ref), v42 (ref), v69 (ref)
                local l_config_0 = v70.config;
                if not l_Boolean_0.toJSBoolean(v68[l_config_0.runner]) then
                    local v72 = require(l_Parent_0.JestRunner).default.new(v42._globalConfig, {
                        changedFiles = v42._context.changedFiles, 
                        sourcesRelatedToTestsInChangedFiles = v42._context.sourcesRelatedToTestsInChangedFiles
                    });
                    v68[l_config_0.runner] = v72;
                    v69:set(v72, v70);
                end;
            end);
        end)):expect();
        local v73 = v42:_partitionTests(v68, v43);
        if v73 ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 326 ]]
                -- upvalues: l_Object_0 (ref), v68 (copy), v69 (copy), v29 (ref), v73 (copy), v55 (copy), l_Boolean_0 (ref), v48 (copy), v45 (ref), v46 (ref), v42 (ref), v44 (ref), l_Array_0 (ref)
                for _, v75 in l_Object_0.keys(v68) do
                    local v76 = v68[v75];
                    local v77 = v69:get(v76);
                    v29(v77);
                    local v78 = v73[v75];
                    local v79 = {
                        serial = v55 or l_Boolean_0.toJSBoolean(v76.isSerial)
                    };
                    if v76.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ then
                        local v92 = {
                            v76:on("test-file-start", function(v80) --[[ Line: 345 ]]
                                -- upvalues: v48 (ref)
                                local v81 = v80[1];
                                return v48(v81);
                            end), 
                            v76:on("test-file-success", function(v82) --[[ Line: 349 ]]
                                -- upvalues: v45 (ref)
                                local v83, v84 = table.unpack(v82, 1, 2);
                                return v45(v83, v84);
                            end), 
                            v76:on("test-file-failure", function(v85) --[[ Line: 353 ]]
                                -- upvalues: v46 (ref)
                                local v86, v87 = table.unpack(v85, 1, 2);
                                return v46(v86, v87);
                            end), 
                            v76:on("test-case-result", function(v88) --[[ Line: 357 ]]
                                -- upvalues: v77 (copy), v42 (ref)
                                local v89, v90 = table.unpack(v88, 1, 2);
                                local v91 = {
                                    context = v77, 
                                    path = v89.Name, 
                                    script = v89
                                };
                                v42._dispatcher:onTestCaseResult(v91, v90);
                            end)
                        };
                        v76:runTests(v78, v44, nil, nil, nil, v79):expect();
                        l_Array_0.forEach(v92, function(v93) --[[ Line: 381 ]]
                            return v93();
                        end);
                    else
                        v76:runTests(v78, v44, v48, v45, v46, v79):expect();
                    end;
                    v76:cleanup();
                end;
            end);
            if not l_status_0 and not v44:isInterrupted() then
                error(l_result_0);
            end;
        end;
        v47():expect();
        v53.wasInterrupted = v44:isInterrupted();
        v42._dispatcher:onRunComplete(v50, v53):expect();
        local v96 = false;
        if v53.numFailedTests == 0 then
            v96 = v53.numRuntimeErrorTestSuites == 0;
        end;
        local v97 = not v96;
        v96 = v42._dispatcher:hasErrors();
        v53.success = v97 or v53.snapshot.failure or v96;
        return v53;
    end);
end;
v28._partitionTests = function(_, v99, v100) --[[ Line: 429 ]] --[[ Name: _partitionTests ]]
    -- upvalues: l_Object_0 (copy), l_Array_0 (copy), l_Boolean_0 (copy)
    if #l_Object_0.keys(v99) > 1 then
        return l_Array_0.reduce(v100, function(v101, v102) --[[ Line: 434 ]]
            -- upvalues: l_Boolean_0 (ref)
            local l_runner_0 = v102.context.config.runner;
            if not l_Boolean_0.toJSBoolean(v101[l_runner_0]) then
                v101[l_runner_0] = {};
            end;
            table.insert(v101[l_runner_0], v102);
            return v101;
        end, {});
    elseif #v100 > 0 and v100[1] ~= nil then
        return l_Object_0.assign({}, {
            [v100[1].context.config.runner] = v100
        });
    else
        return nil;
    end;
end;
v28._shouldAddDefaultReporters = function(v104, v105) --[[ Line: 452 ]] --[[ Name: _shouldAddDefaultReporters ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    local v106 = true;
    if v105 ~= nil then
        v106 = l_Boolean_0.toJSBoolean(l_Array_0.find(v105, function(v107) --[[ Line: 454 ]]
            -- upvalues: v104 (copy)
            return v104:_getReporterProps(v107).path == "default";
        end));
    end;
    return v106;
end;
v28._setupReporters = function(v108) --[[ Line: 459 ]] --[[ Name: _setupReporters ]]
    -- upvalues: v8 (copy)
    return v8.resolve():andThen(function() --[[ Line: 460 ]]
        -- upvalues: v108 (copy)
        if v108:_shouldAddDefaultReporters(nil) then
            v108:_setupDefaultReporters(false);
        end;
    end);
end;
v28._setupDefaultReporters = function(v109, _) --[[ Line: 498 ]] --[[ Name: _setupDefaultReporters ]]
    -- upvalues: l_VerboseReporter_0 (copy), l_DefaultReporter_0 (copy), l_SummaryReporter_0 (copy)
    v109:addReporter(if v109._globalConfig.verbose then l_VerboseReporter_0.new(v109._globalConfig) else l_DefaultReporter_0.new(v109._globalConfig));
    v109:addReporter(l_SummaryReporter_0.new(v109._globalConfig));
end;
v28._getReporterProps = function(v111, v112) --[[ Line: 552 ]] --[[ Name: _getReporterProps ]]
    -- upvalues: l_Array_0 (copy), l_Error_0 (copy)
    if typeof(v112) == "string" then
        return {
            options = v111._options, 
            path = v112
        };
    elseif l_Array_0.isArray(v112) then
        local v113 = v112[1];
        return {
            options = v112[2], 
            path = v113
        };
    else
        error(l_Error_0.new("Reporter should be either a string or an array"));
        return;
    end;
end;
v28._bailIfNeeded = function(v114, v115, v116, v117) --[[ Line: 567 ]] --[[ Name: _bailIfNeeded ]]
    -- upvalues: v8 (copy), l_exit_0 (copy)
    return v8.resolve():andThen(function() --[[ Line: 572 ]]
        -- upvalues: v114 (copy), v116 (copy), v117 (copy), v115 (copy), l_exit_0 (ref)
        if v114._globalConfig.bail ~= 0 and v116.numFailedTests >= v114._globalConfig.bail then
            if v117:isWatchMode() then
                v117:setState({
                    interrupted = true
                }):expect();
                return;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 579 ]]
                    -- upvalues: v114 (ref), v115 (ref), v116 (ref)
                    v114._dispatcher:onRunComplete(v115, v116):expect();
                end);
                local l_testFailureExitCode_0 = v114._globalConfig.testFailureExitCode;
                l_exit_0(l_testFailureExitCode_0);
                if not l_status_1 then
                    error(l_result_1);
                end;
            end;
        end;
    end);
end;
v29 = function(v121, v122) --[[ Line: 591 ]] --[[ Name: invariant ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy)
    if not l_Boolean_0.toJSBoolean(v121) then
        error(l_Error_0.new(v122));
    end;
end;
v30 = function(v123) --[[ Line: 600 ]] --[[ Name: createAggregatedResults ]]
    -- upvalues: l_makeEmptyAggregatedTestResult_0 (copy)
    local v124 = l_makeEmptyAggregatedTestResult_0();
    v124.numTotalTestSuites = v123;
    v124.startTime = DateTime.now().UnixTimestampMillis;
    v124.success = false;
    return v124;
end;
v31 = function(v125, v126) --[[ Line: 608 ]] --[[ Name: getEstimatedTime ]]
    -- upvalues: l_Array_0 (copy)
    if #v125 == 0 then
        return 0;
    else
        local v127 = math.max(table.unpack(v125));
        if #v125 <= v126 then
            return v127;
        else
            return (math.max(l_Array_0.reduce(v125, function(v128, v129) --[[ Line: 615 ]]
                return v128 + v129;
            end) / v126, v127));
        end;
    end;
end;
return v9;