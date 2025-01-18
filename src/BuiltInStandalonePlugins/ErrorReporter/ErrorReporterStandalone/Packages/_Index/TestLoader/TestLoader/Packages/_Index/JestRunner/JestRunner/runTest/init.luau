local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = v1.console;
local l_setTimeout_0 = v1.setTimeout;
local v4 = require(l_Parent_0.Promise);
local l_getRelativePath_0 = require(l_Parent_0.RobloxShared).getRelativePath;
local v6 = require(l_Parent_0.RobloxShared).getDataModelService("CoreScriptSyncService");
local v7 = {};
local v8 = require(l_Parent_0.ChalkLua);
local v9 = require(l_Parent_0.JestConsole);
local l_BufferedConsole_0 = v9.BufferedConsole;
local l_CustomConsole_0 = v9.CustomConsole;
local l_NullConsole_0 = v9.NullConsole;
local l_getConsoleOutput_0 = v9.getConsoleOutput;
local _ = require(l_Parent_0.JestEnvironment);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v17 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v17.ErrorWithStack;
local l_setGlobal_0 = v17.setGlobal;
local _ = require(script.Parent.types);
local l_Writeable_0 = require(l_Parent_0.RobloxShared).Writeable;
local _ = function(v22, _) --[[ Line: 81 ]] --[[ Name: freezeConsole ]]
    -- upvalues: l_ErrorWithStack_0 (copy), v8 (copy)
    local function v24(_, _, v27) --[[ Line: 83 ]] --[[ Name: fakeConsolePush ]]
        -- upvalues: l_ErrorWithStack_0 (ref), v8 (ref), v24 (copy)
        local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v8.red(("%s Did you forget to wait for something async in your test?"):format(v8.bold("Cannot log after tests are done."))), v27), v24);
    end;
    v22._log = v24;
end;
local _ = function(v30, v31, v32, _, _, v35, v36) --[[ Line: 111 ]] --[[ Name: runTestInternal ]]
    -- upvalues: v4 (copy), l_Parent_0 (copy), l_Writeable_0 (copy), l_getConsoleOutput_0 (copy), l_BufferedConsole_0 (copy), l_NullConsole_0 (copy), l_CustomConsole_0 (copy), l_console_0 (copy), l_setGlobal_0 (copy), l_ErrorWithStack_0 (copy), v8 (copy), v6 (copy), l_getRelativePath_0 (copy), l_setTimeout_0 (copy)
    return v4.resolve():andThen(function() --[[ Line: 121 ]]
        -- upvalues: v32 (copy), l_Parent_0 (ref), l_Writeable_0 (ref), l_getConsoleOutput_0 (ref), l_BufferedConsole_0 (ref), v31 (copy), l_NullConsole_0 (ref), l_CustomConsole_0 (ref), v30 (copy), l_console_0 (ref), l_setGlobal_0 (ref), v36 (copy), v35 (copy), l_ErrorWithStack_0 (ref), v8 (ref), v6 (ref), l_getRelativePath_0 (ref), v4 (ref), l_setTimeout_0 (ref)
        local l_testEnvironment_0 = v32.testEnvironment;
        local v38 = require(l_testEnvironment_0);
        local l_runner_0 = require(l_Parent_0.JestCircus).runner;
        local v40 = require(l_Parent_0.JestRuntime);
        local v41 = l_Writeable_0.new();
        local function v44(v42, v43) --[[ Line: 172 ]] --[[ Name: consoleFormatter ]]
            -- upvalues: l_getConsoleOutput_0 (ref), l_BufferedConsole_0 (ref), v32 (ref), v31 (ref)
            return l_getConsoleOutput_0(l_BufferedConsole_0.write({}, v42, v43, 4), v32, v31);
        end;
        local v45 = nil;
        v45 = if v31.silent then l_NullConsole_0.new(v41, v41, v44) else if v31.verbose then l_CustomConsole_0.new(v41, v41, v44) else l_BufferedConsole_0.new();
        local v46 = v38.new(v32, {
            console = v45, 
            testPath = v30
        });
        if typeof(v46.getVmContext) ~= "function" then
            l_console_0.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(l_testEnvironment_0))));
            error(1);
        end;
        l_setGlobal_0(v46.global, "console", v45);
        local v47 = v40.new(v36);
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        for _, v50 in v32.setupFiles do
            v47:requireModule(v50);
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 308 ]]
            -- upvalues: v46 (copy), l_runner_0 (copy), v31 (ref), v32 (ref), v47 (copy), v30 (ref), v35 (ref), v45 (ref), l_ErrorWithStack_0 (ref), v8 (ref), l_UnixTimestampMillis_0 (copy), v6 (ref), l_getRelativePath_0 (ref), v4 (ref), l_setTimeout_0 (ref)
            v46:setup():expect();
            local v51 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 312 ]]
                -- upvalues: v51 (ref), l_runner_0 (ref), v31 (ref), v32 (ref), v46 (ref), v47 (ref), v30 (ref), v35 (ref)
                v51 = l_runner_0(v31, v32, v46, v47, v30, v35):expect();
            end);
            if not l_status_0 then
                local _ = l_result_0.stack;
            end;
            if not l_status_0 then
                error(l_result_0);
            end;
            local l_v45_0 = v45;
            local l_v32_0 = v32;
            local function v57(_, _, v60) --[[ Line: 83 ]] --[[ Name: fakeConsolePush ]]
                -- upvalues: l_ErrorWithStack_0 (ref), v8 (ref), v57 (copy)
                local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v8.red(("%s Did you forget to wait for something async in your test?"):format(v8.bold("Cannot log after tests are done."))), v60), v57);
            end;
            l_v45_0._log = v57;
            l_v45_0 = v51.numPassingTests + v51.numFailingTests + v51.numPendingTests + v51.numTodoTests;
            l_v32_0 = DateTime.now().UnixTimestampMillis;
            v57 = l_v32_0 - l_UnixTimestampMillis_0;
            v51.perfStats = {
                ["end"] = l_v32_0, 
                runtime = v57, 
                slow = v57 / 1000 > v32.slowTestThreshold, 
                start = l_UnixTimestampMillis_0
            };
            if v6 then
                v51.testFilePath = v6:GetScriptFilePath(v30);
            else
                v51.testFilePath = l_getRelativePath_0(v30, v32.rootDir);
            end;
            v51.console = v45:getBuffer();
            v51.skipped = l_v45_0 == v51.numPendingTests;
            v51.displayName = v32.displayName;
            return v4.new(function(v62) --[[ Line: 392 ]]
                -- upvalues: l_setTimeout_0 (ref), v51 (ref)
                l_setTimeout_0(function() --[[ Line: 393 ]]
                    -- upvalues: v62 (copy), v51 (ref)
                    return v62({
                        leakDetector = nil, 
                        result = v51
                    });
                end);
            end);
        end);
        v47:teardown();
        v46:teardown():expect();
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end);
end;
v7.default = function(v66, v67, v68, v69, v70, v71, v72) --[[ Line: 411 ]] --[[ Name: runTest ]]
    -- upvalues: v4 (copy), l_Parent_0 (copy), l_Writeable_0 (copy), l_getConsoleOutput_0 (copy), l_BufferedConsole_0 (copy), l_NullConsole_0 (copy), l_CustomConsole_0 (copy), l_console_0 (copy), l_setGlobal_0 (copy), l_ErrorWithStack_0 (copy), v8 (copy), v6 (copy), l_getRelativePath_0 (copy), l_setTimeout_0 (copy), l_setTimeout_0 (copy)
    return v4.resolve():andThen(function() --[[ Line: 420 ]]
        -- upvalues: v66 (copy), v67 (copy), v68 (copy), v69 (copy), v70 (copy), v71 (copy), v72 (copy), v4 (ref), l_Parent_0 (ref), l_Writeable_0 (ref), l_getConsoleOutput_0 (ref), l_BufferedConsole_0 (ref), l_NullConsole_0 (ref), l_CustomConsole_0 (ref), l_console_0 (ref), l_setGlobal_0 (ref), l_ErrorWithStack_0 (ref), v8 (ref), v6 (ref), l_getRelativePath_0 (ref), l_setTimeout_0 (ref), l_setTimeout_0 (ref)
        local l_v66_0 = v66;
        local l_v67_0 = v67;
        local l_v68_0 = v68;
        local _ = v69;
        local _ = v70;
        local l_v71_0 = v71;
        local l_v72_0 = v72;
        local l_l_v67_0_0 = l_v67_0 --[[ copy: 2 -> 8 ]];
        local l_l_v66_0_0 = l_v66_0 --[[ copy: 1 -> 9 ]];
        local v110 = v4.resolve():andThen(function() --[[ Line: 121 ]]
            -- upvalues: l_v68_0 (copy), l_Parent_0 (ref), l_Writeable_0 (ref), l_getConsoleOutput_0 (ref), l_BufferedConsole_0 (ref), l_l_v67_0_0 (copy), l_NullConsole_0 (ref), l_CustomConsole_0 (ref), l_l_v66_0_0 (copy), l_console_0 (ref), l_setGlobal_0 (ref), l_v72_0 (copy), l_v71_0 (copy), l_ErrorWithStack_0 (ref), v8 (ref), v6 (ref), l_getRelativePath_0 (ref), v4 (ref), l_setTimeout_0 (ref)
            local l_testEnvironment_1 = l_v68_0.testEnvironment;
            local v83 = require(l_testEnvironment_1);
            local l_runner_1 = require(l_Parent_0.JestCircus).runner;
            local v85 = require(l_Parent_0.JestRuntime);
            local v86 = l_Writeable_0.new();
            local function v89(v87, v88) --[[ Line: 172 ]] --[[ Name: consoleFormatter ]]
                -- upvalues: l_getConsoleOutput_0 (ref), l_BufferedConsole_0 (ref), l_v68_0 (ref), l_l_v67_0_0 (ref)
                return l_getConsoleOutput_0(l_BufferedConsole_0.write({}, v87, v88, 4), l_v68_0, l_l_v67_0_0);
            end;
            local v90 = nil;
            v90 = if l_l_v67_0_0.silent then l_NullConsole_0.new(v86, v86, v89) else if l_l_v67_0_0.verbose then l_CustomConsole_0.new(v86, v86, v89) else l_BufferedConsole_0.new();
            local v91 = v83.new(l_v68_0, {
                console = v90, 
                testPath = l_l_v66_0_0
            });
            if typeof(v91.getVmContext) ~= "function" then
                l_console_0.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(l_testEnvironment_1))));
                error(1);
            end;
            l_setGlobal_0(v91.global, "console", v90);
            local v92 = v85.new(l_v72_0);
            local l_UnixTimestampMillis_1 = DateTime.now().UnixTimestampMillis;
            for _, v95 in l_v68_0.setupFiles do
                v92:requireModule(v95);
            end;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 308 ]]
                -- upvalues: v91 (copy), l_runner_1 (copy), l_l_v67_0_0 (ref), l_v68_0 (ref), v92 (copy), l_l_v66_0_0 (ref), l_v71_0 (ref), v90 (ref), l_ErrorWithStack_0 (ref), v8 (ref), l_UnixTimestampMillis_1 (copy), v6 (ref), l_getRelativePath_0 (ref), v4 (ref), l_setTimeout_0 (ref)
                v91:setup():expect();
                local v96 = nil;
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 312 ]]
                    -- upvalues: v96 (ref), l_runner_1 (ref), l_l_v67_0_0 (ref), l_v68_0 (ref), v91 (ref), v92 (ref), l_l_v66_0_0 (ref), l_v71_0 (ref)
                    v96 = l_runner_1(l_l_v67_0_0, l_v68_0, v91, v92, l_l_v66_0_0, l_v71_0):expect();
                end);
                if not l_status_2 then
                    local _ = l_result_2.stack;
                end;
                if not l_status_2 then
                    error(l_result_2);
                end;
                local l_v90_0 = v90;
                local l_l_v68_0_0 = l_v68_0;
                local function v102(_, _, v105) --[[ Line: 83 ]] --[[ Name: fakeConsolePush ]]
                    -- upvalues: l_ErrorWithStack_0 (ref), v8 (ref), v102 (copy)
                    local _ = l_ErrorWithStack_0.new(("%s\nAttempted to log \"%s\"."):format(v8.red(("%s Did you forget to wait for something async in your test?"):format(v8.bold("Cannot log after tests are done."))), v105), v102);
                end;
                l_v90_0._log = v102;
                l_v90_0 = v96.numPassingTests + v96.numFailingTests + v96.numPendingTests + v96.numTodoTests;
                l_l_v68_0_0 = DateTime.now().UnixTimestampMillis;
                v102 = l_l_v68_0_0 - l_UnixTimestampMillis_1;
                v96.perfStats = {
                    ["end"] = l_l_v68_0_0, 
                    runtime = v102, 
                    slow = v102 / 1000 > l_v68_0.slowTestThreshold, 
                    start = l_UnixTimestampMillis_1
                };
                if v6 then
                    v96.testFilePath = v6:GetScriptFilePath(l_l_v66_0_0);
                else
                    v96.testFilePath = l_getRelativePath_0(l_l_v66_0_0, l_v68_0.rootDir);
                end;
                v96.console = v90:getBuffer();
                v96.skipped = l_v90_0 == v96.numPendingTests;
                v96.displayName = l_v68_0.displayName;
                return v4.new(function(v107) --[[ Line: 392 ]]
                    -- upvalues: l_setTimeout_0 (ref), v96 (ref)
                    l_setTimeout_0(function() --[[ Line: 393 ]]
                        -- upvalues: v107 (copy), v96 (ref)
                        return v107({
                            leakDetector = nil, 
                            result = v96
                        });
                    end);
                end);
            end);
            v92:teardown();
            v91:teardown():expect();
            if not l_status_3 then
                error(l_result_3);
            end;
            return l_result_3;
        end):expect();
        l_v66_0 = v110.leakDetector;
        l_v67_0 = v110.result;
        if l_v66_0 ~= nil then
            v4.new(function(v111) --[[ Line: 426 ]]
                -- upvalues: l_setTimeout_0 (ref)
                return l_setTimeout_0(v111, 100);
            end):expect();
            l_v67_0.leaks = l_v66_0:isLeaking():expect();
            return l_v67_0;
        else
            l_v67_0.leaks = false;
            return l_v67_0;
        end;
    end);
end;
return v7;