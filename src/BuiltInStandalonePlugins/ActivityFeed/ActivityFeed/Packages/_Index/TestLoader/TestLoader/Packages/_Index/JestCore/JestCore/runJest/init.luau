local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = v1.console;
local l_Boolean_0 = v1.Boolean;
local v7 = require(l_Parent_0.Promise);
local v8 = {};
local l_CustomConsole_0 = require(l_Parent_0.JestConsole).CustomConsole;
local v10 = require(l_Parent_0.JestTestResult);
local l_formatTestResults_0 = v10.formatTestResults;
local l_makeEmptyAggregatedTestResult_0 = v10.makeEmptyAggregatedTestResult;
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.JestRuntime);
local l_default_0 = require(script.Parent.SearchSource).default;
local l_createTestScheduler_0 = require(script.Parent.TestScheduler).createTestScheduler;
local _ = require(script.Parent.TestWatcher);
local l_default_1 = require(script.Parent.getNoTestsFoundMessage).default;
local _ = require(script.Parent.types);
local v20 = require(l_Parent_0.RobloxShared);
local l_nodeUtils_0 = v20.nodeUtils;
local l_process_0 = l_nodeUtils_0.process;
local l_exit_0 = l_nodeUtils_0.exit;
local l_JSON_0 = l_nodeUtils_0.JSON;
local l_ensureDirectoryExists_0 = v20.ensureDirectoryExists;
local l_getDataModelService_0 = v20.getDataModelService;
local v27 = l_getDataModelService_0("FileSystemService");
local v28 = l_getDataModelService_0("CoreScriptSyncService");
local _ = function(v29, v30, _, v32, _, v34) --[[ Line: 103 ]] --[[ Name: getTestPaths ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_Object_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 111 ]]
        -- upvalues: v30 (copy), v29 (copy), v32 (copy), v34 (copy), v7 (ref), l_Array_0 (ref), l_Object_0 (ref)
        local v35 = v30:getTestPaths(v29, v32, v34):expect();
        local v37 = v7.all(l_Array_0.map(v35.tests, function(_) --[[ Line: 126 ]]
            -- upvalues: v7 (ref)
            return v7.resolve(true);
        end)):expect();
        local v40 = l_Array_0.filter(v35.tests, function(_, v39) --[[ Line: 137 ]]
            -- upvalues: v37 (copy)
            return v37[v39];
        end);
        return l_Object_0.assign({}, v35, {
            allTests = #v40, 
            tests = v40
        });
    end);
end;
local function _(v42, v43) --[[ Line: 163 ]] --[[ Name: processResults ]]
    -- upvalues: v7 (copy), v27 (copy), l_Boolean_0 (copy), l_ensureDirectoryExists_0 (copy), l_JSON_0 (copy), l_formatTestResults_0 (copy), l_process_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 164 ]]
        -- upvalues: v43 (copy), v42 (copy), v27 (ref), l_Boolean_0 (ref), l_ensureDirectoryExists_0 (ref), l_JSON_0 (ref), l_formatTestResults_0 (ref), l_process_0 (ref)
        local l_outputFile_0 = v43.outputFile;
        local l_json_0 = v43.json;
        local l_onComplete_0 = v43.onComplete;
        v42.openHandles = {};
        if l_json_0 then
            if l_outputFile_0 and v27 and l_Boolean_0.toJSBoolean(l_outputFile_0) then
                l_ensureDirectoryExists_0(l_outputFile_0);
                v27:WriteFile(l_outputFile_0, l_JSON_0.stringify(l_formatTestResults_0(v42)));
                l_process_0.stdout:write(("Test results written to: %s\n"):format((tostring(l_outputFile_0))));
            else
                l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v42)));
            end;
        end;
        if l_onComplete_0 ~= nil then
            l_onComplete_0(v42);
        end;
    end);
end;
local v48 = {
    firstRun = true, 
    previousSuccess = true
};
v8.default = function(v49) --[[ Line: 207 ]] --[[ Name: runJest ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_default_0 (copy), l_Object_0 (copy), l_Set_0 (copy), v28 (copy), l_console_0 (copy), l_JSON_0 (copy), l_makeEmptyAggregatedTestResult_0 (copy), l_default_1 (copy), l_CustomConsole_0 (copy), l_exit_0 (copy), l_createTestScheduler_0 (copy), v48 (copy), v27 (copy), l_Boolean_0 (copy), l_ensureDirectoryExists_0 (copy), l_formatTestResults_0 (copy), l_process_0 (copy)
    local l_contexts_0 = v49.contexts;
    local l_globalConfig_0 = v49.globalConfig;
    local l_outputStream_0 = v49.outputStream;
    local l_testWatcher_0 = v49.testWatcher;
    local _ = nil;
    local l_startRun_0 = v49.startRun;
    local _ = v49.changedFilesPromise;
    local l_onComplete_1 = v49.onComplete;
    local _ = v49.failedTestsCache;
    local l_filter_0 = v49.filter;
    return v7.resolve():andThen(function() --[[ Line: 235 ]]
        -- upvalues: l_Array_0 (ref), l_contexts_0 (copy), l_default_0 (ref), v7 (ref), l_globalConfig_0 (ref), l_outputStream_0 (copy), l_filter_0 (copy), l_Object_0 (ref), l_Set_0 (ref), v28 (ref), l_console_0 (ref), l_JSON_0 (ref), l_onComplete_1 (copy), l_makeEmptyAggregatedTestResult_0 (ref), l_default_1 (ref), l_CustomConsole_0 (ref), l_exit_0 (ref), l_createTestScheduler_0 (ref), l_startRun_0 (copy), v48 (ref), l_testWatcher_0 (copy), v27 (ref), l_Boolean_0 (ref), l_ensureDirectoryExists_0 (ref), l_formatTestResults_0 (ref), l_process_0 (ref)
        local v60 = {};
        local v62 = l_Array_0.map(l_contexts_0, function(v61) --[[ Line: 264 ]]
            -- upvalues: l_default_0 (ref)
            return l_default_0.new(v61);
        end);
        local v78 = v7.all(l_Array_0.map(l_contexts_0, function(v63, v64) --[[ Line: 268 ]]
            -- upvalues: v7 (ref), v62 (copy), l_globalConfig_0 (ref), l_outputStream_0 (ref), l_filter_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v60 (ref)
            return v7.resolve():andThen(function() --[[ Line: 269 ]]
                -- upvalues: v62 (ref), v64 (copy), l_globalConfig_0 (ref), l_outputStream_0 (ref), l_filter_0 (ref), v7 (ref), l_Array_0 (ref), l_Object_0 (ref), v60 (ref), v63 (copy)
                local v65 = v62[v64];
                local l_l_globalConfig_0_0 = l_globalConfig_0;
                local _ = l_outputStream_0;
                local l_l_filter_0_0 = l_filter_0;
                local v69 = v7.resolve();
                local v70 = nil;
                local v77 = v69:andThen(function() --[[ Line: 111 ]]
                    -- upvalues: v65 (copy), l_l_globalConfig_0_0 (copy), v70 (copy), l_l_filter_0_0 (copy), v7 (ref), l_Array_0 (ref), l_Object_0 (ref)
                    local v71 = v65:getTestPaths(l_l_globalConfig_0_0, v70, l_l_filter_0_0):expect();
                    local v73 = v7.all(l_Array_0.map(v71.tests, function(_) --[[ Line: 126 ]]
                        -- upvalues: v7 (ref)
                        return v7.resolve(true);
                    end)):expect();
                    local v76 = l_Array_0.filter(v71.tests, function(_, v75) --[[ Line: 137 ]]
                        -- upvalues: v73 (copy)
                        return v73[v75];
                    end);
                    return l_Object_0.assign({}, v71, {
                        allTests = #v76, 
                        tests = v76
                    });
                end):expect();
                v60 = l_Array_0.concat(v60, v77.tests);
                return {
                    context = v63, 
                    matches = v77
                };
            end);
        end)):expect();
        if l_globalConfig_0.listTests then
            local v80 = l_Array_0.from(l_Set_0.new(l_Array_0.map(v60, function(v79) --[[ Line: 294 ]]
                -- upvalues: v28 (ref)
                if v28 then
                    return v28:GetScriptFilePath(v79.script);
                else
                    return v79.path;
                end;
            end)));
            if l_globalConfig_0.json then
                l_console_0.log(l_JSON_0.stringify(v80));
            else
                l_console_0.log(l_Array_0.join(v80, "\n"));
            end;
            if l_onComplete_1 ~= nil then
                l_onComplete_1(l_makeEmptyAggregatedTestResult_0());
            end;
            return;
        else
            if not (#v60 > 0) then
                local v81 = l_default_1(v78, l_globalConfig_0);
                if l_globalConfig_0.passWithNoTests then
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):log(v81);
                else
                    l_CustomConsole_0.new(l_outputStream_0, l_outputStream_0):error(v81);
                    l_exit_0(1);
                end;
            elseif #v60 == 1 and l_globalConfig_0.silent ~= true and l_globalConfig_0.verbose ~= false then
                local v82 = l_Object_0.assign({}, l_globalConfig_0, {
                    verbose = true
                });
                l_globalConfig_0 = l_Object_0.freeze(v82);
            end;
            local v83 = l_createTestScheduler_0(l_globalConfig_0, l_Object_0.assign({}, {
                startRun = l_startRun_0
            }, v48)):expect():scheduleTests(v60, l_testWatcher_0):expect();
            local v84 = {
                collectHandles = nil, 
                json = l_globalConfig_0.json, 
                onComplete = l_onComplete_1, 
                outputFile = l_globalConfig_0.outputFile, 
                outputStream = l_outputStream_0
            };
            v7.resolve():andThen(function() --[[ Line: 164 ]]
                -- upvalues: v84 (copy), v83 (copy), v27 (ref), l_Boolean_0 (ref), l_ensureDirectoryExists_0 (ref), l_JSON_0 (ref), l_formatTestResults_0 (ref), l_process_0 (ref)
                local l_outputFile_1 = v84.outputFile;
                local l_json_1 = v84.json;
                local l_onComplete_2 = v84.onComplete;
                v83.openHandles = {};
                if l_json_1 then
                    if l_outputFile_1 and v27 and l_Boolean_0.toJSBoolean(l_outputFile_1) then
                        l_ensureDirectoryExists_0(l_outputFile_1);
                        v27:WriteFile(l_outputFile_1, l_JSON_0.stringify(l_formatTestResults_0(v83)));
                        l_process_0.stdout:write(("Test results written to: %s\n"):format((tostring(l_outputFile_1))));
                    else
                        l_process_0.stdout:write(l_JSON_0.stringify(l_formatTestResults_0(v83)));
                    end;
                end;
                if l_onComplete_2 ~= nil then
                    l_onComplete_2(v83);
                end;
            end):expect();
            return;
        end;
    end);
end;
return v8;