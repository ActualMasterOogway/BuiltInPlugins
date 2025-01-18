local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local l_CustomConsole_0 = require(l_Parent_0.JestConsole).CustomConsole;
local v9 = require(l_Parent_0.JestTestResult);
local l_formatTestResults_0 = v9.formatTestResults;
local l_makeEmptyAggregatedTestResult_0 = v9.makeEmptyAggregatedTestResult;
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local l_default_0 = require(script.Parent.SearchSource).default;
local l_createTestScheduler_0 = require(script.Parent.TestScheduler).createTestScheduler;
local _ = require(script.Parent.TestWatcher);
local l_default_1 = require(script.Parent.getNoTestsFoundMessage).default;
local _ = require(script.Parent.types);
local l_nodeUtils_0 = require(l_Parent_0.RobloxShared).nodeUtils;
local l_process_0 = l_nodeUtils_0.process;
local l_exit_0 = l_nodeUtils_0.exit;
local l_JSON_0 = l_nodeUtils_0.JSON;
local _ = function(v23, v24, _, v26, _, v28) --[[ Line: 98 ]] --[[ Name: getTestPaths ]]
    -- upvalues: v6 (copy), l_Array_0 (copy), l_Object_0 (copy)
    return v6.resolve():andThen(function() --[[ Line: 106 ]]
        -- upvalues: v24 (copy), v23 (copy), v26 (copy), v28 (copy), v6 (ref), l_Array_0 (ref), l_Object_0 (ref)
        local v29 = v24:getTestPaths(v23, v26, v28):expect();
        local v31 = v6.all(l_Array_0.map(v29.tests, function(_) --[[ Line: 121 ]]
            -- upvalues: v6 (ref)
            return v6.resolve(true);
        end)):expect();
        local v34 = l_Array_0.filter(v29.tests, function(_, v33) --[[ Line: 132 ]]
            -- upvalues: v31 (copy)
            return v31[v33];
        end);
        return l_Object_0.assign({}, v29, {
            allTests = #v34, 
            tests = v34
        });
    end);
end;
local _ = function(v36, v37) --[[ Line: 158 ]] --[[ Name: processResults ]]
    -- upvalues: v6 (copy), l_process_0 (copy), l_JSON_0 (copy), l_formatTestResults_0 (copy)
    return v6.resolve():andThen(function() --[[ Line: 159 ]]
        -- upvalues: v37 (copy), v36 (copy), l_process_0 (ref), l_JSON_0 (ref), l_formatTestResults_0 (ref)
        local _ = v37.outputFile;
        local l_json_0 = v37.json;
        local l_onComplete_0 = v37.onComplete;
        v36.openHandles = {};
        if l_json_0 then
            l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v36)));
        end;
        if l_onComplete_0 ~= nil then
            l_onComplete_0(v36);
        end;
    end);
end;
local v42 = {
    firstRun = true, 
    previousSuccess = true
};
v7.default = function(v43) --[[ Line: 205 ]] --[[ Name: runJest ]]
    -- upvalues: v6 (copy), l_Array_0 (copy), l_default_0 (copy), l_Object_0 (copy), l_Set_0 (copy), l_console_0 (copy), l_JSON_0 (copy), l_makeEmptyAggregatedTestResult_0 (copy), l_default_1 (copy), l_CustomConsole_0 (copy), l_exit_0 (copy), l_createTestScheduler_0 (copy), v42 (copy), l_process_0 (copy), l_formatTestResults_0 (copy)
    local l_contexts_0 = v43.contexts;
    local l_globalConfig_0 = v43.globalConfig;
    local l_outputStream_0 = v43.outputStream;
    local l_testWatcher_0 = v43.testWatcher;
    local _ = nil;
    local l_startRun_0 = v43.startRun;
    local _ = v43.changedFilesPromise;
    local l_onComplete_1 = v43.onComplete;
    local _ = v43.failedTestsCache;
    local l_filter_0 = v43.filter;
    return v6.resolve():andThen(function() --[[ Line: 233 ]]
        -- upvalues: l_Array_0 (ref), l_contexts_0 (copy), l_default_0 (ref), v6 (ref), l_globalConfig_0 (ref), l_outputStream_0 (copy), l_filter_0 (copy), l_Object_0 (ref), l_Set_0 (ref), l_console_0 (ref), l_JSON_0 (ref), l_onComplete_1 (copy), l_makeEmptyAggregatedTestResult_0 (ref), l_default_1 (ref), l_CustomConsole_0 (ref), l_exit_0 (ref), l_createTestScheduler_0 (ref), l_startRun_0 (copy), v42 (ref), l_testWatcher_0 (copy), l_process_0 (ref), l_formatTestResults_0 (ref)
        local v54 = {};
        local v56 = l_Array_0.map(l_contexts_0, function(v55) --[[ Line: 262 ]]
            -- upvalues: l_default_0 (ref)
            return l_default_0.new(v55);
        end);
        local v72 = v6.all(l_Array_0.map(l_contexts_0, function(v57, v58) --[[ Line: 266 ]]
            -- upvalues: v6 (ref), v56 (copy), l_globalConfig_0 (ref), l_outputStream_0 (ref), l_filter_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v54 (ref)
            return v6.resolve():andThen(function() --[[ Line: 267 ]]
                -- upvalues: v56 (ref), v58 (copy), l_globalConfig_0 (ref), l_outputStream_0 (ref), l_filter_0 (ref), v6 (ref), l_Array_0 (ref), l_Object_0 (ref), v54 (ref), v57 (copy)
                local v59 = v56[v58];
                local l_l_globalConfig_0_0 = l_globalConfig_0;
                local _ = l_outputStream_0;
                local l_l_filter_0_0 = l_filter_0;
                local v63 = v6.resolve();
                local v64 = nil;
                local v71 = v63:andThen(function() --[[ Line: 106 ]]
                    -- upvalues: v59 (copy), l_l_globalConfig_0_0 (copy), v64 (copy), l_l_filter_0_0 (copy), v6 (ref), l_Array_0 (ref), l_Object_0 (ref)
                    local v65 = v59:getTestPaths(l_l_globalConfig_0_0, v64, l_l_filter_0_0):expect();
                    local v67 = v6.all(l_Array_0.map(v65.tests, function(_) --[[ Line: 121 ]]
                        -- upvalues: v6 (ref)
                        return v6.resolve(true);
                    end)):expect();
                    local v70 = l_Array_0.filter(v65.tests, function(_, v69) --[[ Line: 132 ]]
                        -- upvalues: v67 (copy)
                        return v67[v69];
                    end);
                    return l_Object_0.assign({}, v65, {
                        allTests = #v70, 
                        tests = v70
                    });
                end):expect();
                v54 = l_Array_0.concat(v54, v71.tests);
                return {
                    context = v57, 
                    matches = v71
                };
            end);
        end)):expect();
        if l_globalConfig_0.listTests then
            local v74 = l_Array_0.from(l_Set_0.new(l_Array_0.map(v54, function(v73) --[[ Line: 292 ]]
                return v73.path;
            end)));
            if l_globalConfig_0.json then
                l_console_0.log(l_JSON_0.stringify(v74));
            else
                l_console_0.log(l_Array_0.join(v74, "\n"));
            end;
            if l_onComplete_1 ~= nil then
                l_onComplete_1(l_makeEmptyAggregatedTestResult_0());
            end;
            return;
        else
            if not (#v54 > 0) then
                local v75 = l_default_1(v72, l_globalConfig_0);
                if l_globalConfig_0.passWithNoTests then
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):log(v75);
                else
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):error(v75);
                    l_exit_0(1);
                end;
            elseif #v54 == 1 and l_globalConfig_0.silent ~= true and l_globalConfig_0.verbose ~= false then
                local v76 = l_Object_0.assign({}, l_globalConfig_0, {
                    verbose = true
                });
                l_globalConfig_0 = l_Object_0.freeze(v76);
            end;
            local v77 = l_createTestScheduler_0(l_globalConfig_0, l_Object_0.assign({}, {
                startRun = l_startRun_0
            }, v42)):expect():scheduleTests(v54, l_testWatcher_0):expect();
            local v78 = {
                collectHandles = nil, 
                json = l_globalConfig_0.json, 
                onComplete = l_onComplete_1, 
                outputFile = l_globalConfig_0.outputFile, 
                outputStream = l_outputStream_0
            };
            v6.resolve():andThen(function() --[[ Line: 159 ]]
                -- upvalues: v78 (copy), v77 (copy), l_process_0 (ref), l_JSON_0 (ref), l_formatTestResults_0 (ref)
                local _ = v78.outputFile;
                local l_json_1 = v78.json;
                local l_onComplete_2 = v78.onComplete;
                v77.openHandles = {};
                if l_json_1 then
                    l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v77)));
                end;
                if l_onComplete_2 ~= nil then
                    l_onComplete_2(v77);
                end;
            end):expect();
            return;
        end;
    end);
end;
return v7;