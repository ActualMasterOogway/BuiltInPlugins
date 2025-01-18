local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local v7 = require(l_Parent_0.Promise);
local v8 = {};
local v9 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local v11 = require(script.constants);
local l_default_0 = require(script.normalize).default;
local l_default_1 = require(script.readConfigFileAndSetRootDir).default;
local l_default_2 = require(script.resolveConfigPath).default;
local l_isJSONString_0 = require(script.utils).isJSONString;
v8.isJSONString = require(script.utils).isJSONString;
v8.normalize = require(script.normalize).default;
v8.defaults = require(script.Defaults).default;
v8.constants = v11;
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
local v17 = nil;
local v18 = nil;
local function v36(v19, v20, v21, v22, _, v24, v25) --[[ Line: 83 ]] --[[ Name: readConfig ]]
    -- upvalues: v7 (copy), l_Error_0 (copy), l_isJSONString_0 (copy), l_JSON_0 (copy), l_Boolean_0 (copy), l_default_2 (copy), l_default_1 (copy), l_default_0 (copy), v17 (ref)
    if v24 == nil then
        v24 = 1e999;
    end;
    if v25 == nil then
        v25 = false;
    end;
    return v7.resolve():andThen(function() --[[ Line: 106 ]]
        -- upvalues: v21 (copy), l_Error_0 (ref), l_isJSONString_0 (ref), v20 (copy), l_JSON_0 (ref), l_Boolean_0 (ref), v22 (copy), l_default_2 (ref), v19 (copy), v25 (ref), l_default_1 (ref), l_default_0 (ref), v24 (ref), v17 (ref)
        local v26 = nil;
        local v27 = nil;
        if typeof(v21) ~= "Instance" and typeof(v21) ~= "string" then
            error(l_Error_0.new("Jest: configuration as an object not supported yet"));
        elseif l_isJSONString_0(v20.config) then
            local v28 = nil;
            do
                local l_v28_0 = v28;
                if not pcall(function() --[[ Line: 131 ]]
                    -- upvalues: l_v28_0 (ref), l_JSON_0 (ref), v20 (ref)
                    l_v28_0 = l_JSON_0.parse(v20.config);
                end) then
                    error(l_Error_0.new("There was an error while parsing the `--config` argument as a JSON string."));
                end;
                l_v28_0.rootDir = l_Boolean_0.toJSBoolean(l_v28_0.rootDir) and l_v28_0.rootDir or v21;
                v26 = l_v28_0;
            end;
        elseif not v22 and typeof(v20.config) == "string" then
            v27 = l_default_2(v20.config, v19, v25);
            v26 = l_default_1(v27):expect();
        else
            v27 = l_default_2(v21, v19, v25);
            v26 = l_default_1(v27):expect();
        end;
        local v30 = l_default_0(v26, v20, v27, v24):expect();
        local l_options_0 = v30.options;
        local l_hasDeprecationWarnings_0 = v30.hasDeprecationWarnings;
        local v33 = v17(l_options_0);
        local l_globalConfig_0 = v33.globalConfig;
        local l_projectConfig_0 = v33.projectConfig;
        return {
            configPath = v27, 
            globalConfig = l_globalConfig_0, 
            hasDeprecationWarnings = l_hasDeprecationWarnings_0, 
            projectConfig = l_projectConfig_0
        };
    end);
end;
v8.readConfig = v36;
v17 = function(v37) --[[ Line: 165 ]] --[[ Name: groupOptions ]]
    -- upvalues: l_Object_0 (copy)
    return {
        globalConfig = l_Object_0.freeze({
            bail = v37.bail, 
            changedSince = v37.changedSince, 
            expand = v37.expand, 
            filter = v37.filter, 
            json = v37.json, 
            listTests = v37.listTests, 
            maxConcurrency = v37.maxConcurrency, 
            maxWorkers = v37.maxWorkers, 
            noStackTrace = v37.noStackTrace, 
            nonFlagArgs = v37.nonFlagArgs, 
            outputFile = v37.outputFile, 
            passWithNoTests = v37.passWithNoTests, 
            projects = v37.projects, 
            rootDir = v37.rootDir, 
            runTestsByPath = v37.runTestsByPath, 
            silent = v37.silent, 
            skipFilter = v37.skipFilter, 
            snapshotFormat = v37.snapshotFormat, 
            testFailureExitCode = v37.testFailureExitCode, 
            testNamePattern = v37.testNamePattern, 
            testPathPattern = v37.testPathPattern, 
            testTimeout = v37.testTimeout, 
            updateSnapshot = v37.updateSnapshot, 
            verbose = v37.verbose
        }), 
        projectConfig = l_Object_0.freeze({
            automock = v37.automock, 
            clearMocks = v37.clearMocks, 
            displayName = v37.displayName, 
            id = v37.id, 
            injectGlobals = v37.injectGlobals, 
            resetMocks = v37.resetMocks, 
            resetModules = v37.resetModules, 
            restoreMocks = v37.restoreMocks, 
            rootDir = v37.rootDir, 
            roots = v37.roots, 
            runner = v37.runner, 
            runtime = v37.runtime, 
            sandboxInjectedGlobals = v37.sandboxInjectedGlobals, 
            setupFiles = v37.setupFiles, 
            setupFilesAfterEnv = v37.setupFilesAfterEnv, 
            slowTestThreshold = v37.slowTestThreshold, 
            snapshotFormat = v37.snapshotFormat, 
            snapshotSerializers = v37.snapshotSerializers, 
            testEnvironment = v37.testEnvironment, 
            testEnvironmentOptions = v37.testEnvironmentOptions, 
            testLocationInResults = v37.testLocationInResults, 
            testMatch = v37.testMatch, 
            testPathIgnorePatterns = v37.testPathIgnorePatterns, 
            testRegex = v37.testRegex, 
            timers = v37.timers
        })
    };
end;
v18 = function(v38, v39) --[[ Line: 332 ]] --[[ Name: ensureNoDuplicateConfigs ]]
    -- upvalues: l_Map_0 (copy), v9 (copy), l_Array_0 (copy), l_Error_0 (copy)
    if #v39 <= 1 then
        return;
    else
        local v40 = l_Map_0.new();
        for _, v42 in v38 do
            local l_configPath_0 = v42.configPath;
            if v40:has(l_configPath_0) then
                local v46 = ("Whoops! Two projects resolved to the same config path: %s:\n\n  Project 1: %s\n  Project 2: %s\n\nThis usually means that your %s config includes a directory that doesn't have any configuration recognizable by Jest. Please fix it.\n"):format(v9.bold((tostring(l_configPath_0))), v9.bold((tostring(v39[l_Array_0.findIndex(v38, function(v44) --[[ Line: 352 ]]
                    -- upvalues: v42 (copy)
                    return v44 == v42;
                end)]))), tostring(v9.bold((tostring(v39[l_Array_0.findIndex(v38, function(v45) --[[ Line: 356 ]]
                    -- upvalues: v40 (copy), l_configPath_0 (copy)
                    return v45 == v40:get(l_configPath_0);
                end)])))), (tostring(v9.bold("\"projects\""))));
                error(l_Error_0.new(v46));
            end;
            if l_configPath_0 ~= nil then
                v40:set(l_configPath_0, v42);
            end;
        end;
        return;
    end;
end;
v8.readConfigs = function(v47, v48, v49) --[[ Line: 378 ]] --[[ Name: readConfigs ]]
    -- upvalues: v7 (copy), l_Error_0 (copy), l_isJSONString_0 (copy), l_JSON_0 (copy), l_Boolean_0 (copy), l_default_2 (copy), l_default_1 (copy), l_default_0 (copy), v17 (ref), l_Array_0 (copy), v36 (copy), v18 (ref)
    return v7.resolve():andThen(function() --[[ Line: 388 ]]
        -- upvalues: v49 (copy), v47 (copy), v48 (copy), v7 (ref), l_Error_0 (ref), l_isJSONString_0 (ref), l_JSON_0 (ref), l_Boolean_0 (ref), l_default_2 (ref), l_default_1 (ref), l_default_0 (ref), v17 (ref), l_Array_0 (ref), v36 (ref), v18 (ref)
        local v50 = nil;
        local v51 = nil;
        local v52 = {};
        local l_v49_0 = v49;
        local v54 = nil;
        if #v49 == 1 then
            local l_v47_0 = v47;
            local l_v48_0 = v48;
            local v57 = l_v49_0[1];
            local v58 = nil;
            local v59 = nil;
            if v58 == nil then
                v58 = 1e999;
            end;
            if v59 == nil then
                v59 = false;
            end;
            local v60 = v7.resolve();
            local v61 = nil;
            local l_l_v48_0_0 = l_v48_0 --[[ copy: 7 -> 15 ]];
            local l_l_v47_0_0 = l_v47_0 --[[ copy: 6 -> 16 ]];
            local v64;
            do
                local l_v58_0, l_v59_0 = v58, v59;
                v64 = v60:andThen(function() --[[ Line: 106 ]]
                    -- upvalues: v57 (copy), l_Error_0 (ref), l_isJSONString_0 (ref), l_l_v48_0_0 (copy), l_JSON_0 (ref), l_Boolean_0 (ref), v61 (copy), l_default_2 (ref), l_l_v47_0_0 (copy), l_v59_0 (ref), l_default_1 (ref), l_default_0 (ref), l_v58_0 (ref), v17 (ref)
                    local v67 = nil;
                    local v68 = nil;
                    if typeof(v57) ~= "Instance" and typeof(v57) ~= "string" then
                        error(l_Error_0.new("Jest: configuration as an object not supported yet"));
                    elseif l_isJSONString_0(l_l_v48_0_0.config) then
                        local v69 = nil;
                        do
                            local l_v69_0 = v69;
                            if not pcall(function() --[[ Line: 131 ]]
                                -- upvalues: l_v69_0 (ref), l_JSON_0 (ref), l_l_v48_0_0 (ref)
                                l_v69_0 = l_JSON_0.parse(l_l_v48_0_0.config);
                            end) then
                                error(l_Error_0.new("There was an error while parsing the `--config` argument as a JSON string."));
                            end;
                            l_v69_0.rootDir = l_Boolean_0.toJSBoolean(l_v69_0.rootDir) and l_v69_0.rootDir or v57;
                            v67 = l_v69_0;
                        end;
                    elseif not v61 and typeof(l_l_v48_0_0.config) == "string" then
                        v68 = l_default_2(l_l_v48_0_0.config, l_l_v47_0_0, l_v59_0);
                        v67 = l_default_1(v68):expect();
                    else
                        v68 = l_default_2(v57, l_l_v47_0_0, l_v59_0);
                        v67 = l_default_1(v68):expect();
                    end;
                    local v71 = l_default_0(v67, l_l_v48_0_0, v68, l_v58_0):expect();
                    local l_options_1 = v71.options;
                    local l_hasDeprecationWarnings_1 = v71.hasDeprecationWarnings;
                    local v74 = v17(l_options_1);
                    local l_globalConfig_1 = v74.globalConfig;
                    local l_projectConfig_1 = v74.projectConfig;
                    return {
                        configPath = v68, 
                        globalConfig = l_globalConfig_1, 
                        hasDeprecationWarnings = l_hasDeprecationWarnings_1, 
                        projectConfig = l_projectConfig_1
                    };
                end);
            end;
            v64 = v64:expect();
            v54 = v64.configPath;
            v51 = v64.hasDeprecationWarnings;
            v50 = v64.globalConfig;
            v52 = {
                v64.projectConfig
            };
            if l_Boolean_0.toJSBoolean(if v50.projects ~= nil then #v50.projects else nil) then
                l_v49_0 = v50.projects;
            end;
        end;
        if #l_v49_0 > 0 then
            local l_v47_1 = v47;
            local v78 = l_v49_0[1] == l_v47_1;
            local v84 = v7.all(l_Array_0.map(l_Array_0.filter(l_v49_0, function(v79) --[[ Line: 414 ]]
                if typeof(v79) == "Instance" and #v79:GetChildren() == 0 and not v79:isA("ModuleScript") then
                    return false;
                else
                    return true;
                end;
            end), function(v80, v81) --[[ Line: 421 ]]
                -- upvalues: l_v49_0 (ref), v78 (copy), v36 (ref), v47 (ref), v48 (ref), v54 (ref), l_v47_1 (copy)
                local v82 = false;
                if v81 == 1 then
                    v82 = #l_v49_0 == 1;
                end;
                local v83 = not if v82 then v78 else v82;
                return v36(v47, v48, v80, v83, if v54 ~= nil then v54.Parent else l_v47_1, v81, v78);
            end)):expect();
            v18(v84, l_v49_0);
            v52 = l_Array_0.map(v84, function(v85) --[[ Line: 439 ]]
                return v85.projectConfig;
            end);
            if not v51 then
                v51 = l_Array_0.some(v84, function(v86) --[[ Line: 444 ]]
                    -- upvalues: l_Boolean_0 (ref)
                    local l_hasDeprecationWarnings_2 = v86.hasDeprecationWarnings;
                    return l_Boolean_0.toJSBoolean(l_hasDeprecationWarnings_2);
                end);
            end;
            if not l_Boolean_0.toJSBoolean(v50) then
                v50 = v84[1].globalConfig;
            end;
        end;
        if not l_Boolean_0.toJSBoolean(v50) or not l_Boolean_0.toJSBoolean(#v52) then
            error(l_Error_0.new("jest: No configuration found for any project."));
        end;
        return {
            configs = v52, 
            globalConfig = v50, 
            hasDeprecationWarnings = l_Boolean_0.toJSBoolean(v51)
        };
    end);
end;
return v8;