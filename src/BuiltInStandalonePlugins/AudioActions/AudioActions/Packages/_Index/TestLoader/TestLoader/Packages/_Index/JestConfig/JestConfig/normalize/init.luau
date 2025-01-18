local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local v8 = nil;
local v9 = require(l_Parent_0.RobloxShared);
local l_process_0 = v9.nodeUtils.process;
local l_getRelativePath_0 = v9.getRelativePath;
local v12 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local function v15(v14) --[[ Line: 56 ]] --[[ Name: replacePathSepForRegex ]]
    return v14;
end;
local l_clearLine_0 = require(l_Parent_0.JestUtil).clearLine;
local function v18(v17) --[[ Line: 71 ]] --[[ Name: replacePathSepForGlob ]]
    return v17;
end;
local l_ValidationError_0 = require(l_Parent_0.JestValidate).ValidationError;
local l_default_0 = require(script.Parent.Defaults).default;
local l_getDisplayNameColor_0 = require(script.Parent.color).getDisplayNameColor;
local l_default_1 = require(script.Parent.getMaxWorkers).default;
local l_default_2 = require(script.Parent.setFromArgv).default;
local v24 = require(script.Parent.utils);
local l_BULLET_0 = v24.BULLET;
local l_DOCUMENTATION_NOTE_0 = v24.DOCUMENTATION_NOTE;
local l_default_3 = require(script.Parent.validatePattern).default;
local v28 = ("%sValidation Error"):format(l_BULLET_0);
local function v30(v29) --[[ Line: 118 ]] --[[ Name: createConfigError ]]
    -- upvalues: l_ValidationError_0 (copy), v28 (copy), l_DOCUMENTATION_NOTE_0 (copy)
    return l_ValidationError_0.new(v28, v29, l_DOCUMENTATION_NOTE_0);
end;
local function _(v31, v32) --[[ Line: 122 ]] --[[ Name: verifyDirectoryExists ]]
    -- upvalues: v30 (copy), v12 (copy)
    if typeof(v31) ~= "Instance" then
        error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(v31))), v12.bold(v32))));
    end;
end;
local function _(v34) --[[ Line: 446 ]] --[[ Name: normalizePreprocessor ]]
    return v34;
end;
local _ = function(v36, _, _) --[[ Line: 491 ]] --[[ Name: normalizeMissingOptions ]]
    -- upvalues: l_Boolean_0 (copy), l_getRelativePath_0 (copy)
    if not l_Boolean_0.toJSBoolean(v36.id) then
        v36.id = l_getRelativePath_0(v36.rootDir, nil);
    end;
    if v36.setupFiles == nil then
        v36.setupFiles = {};
    end;
    return v36;
end;
local function v42(v40) --[[ Line: 517 ]] --[[ Name: normalizeRootDir ]]
    -- upvalues: l_Boolean_0 (copy), v30 (copy), v12 (copy), l_Object_0 (copy)
    if not l_Boolean_0.toJSBoolean(v40.rootDir) then
        error(v30(("  Configuration option %s must be specified."):format(v12.bold("rootDir"))));
    end;
    local l_rootDir_0 = v40.rootDir;
    if typeof(l_rootDir_0) ~= "Instance" then
        error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(l_rootDir_0))), v12.bold("rootDir"))));
    end;
    return l_Object_0.assign({}, v40, {
        rootDir = v40.rootDir
    });
end;
local function _(v43) --[[ Line: 536 ]] --[[ Name: normalizeReporters ]]
    return v43;
end;
local function v49(v45) --[[ Line: 572 ]] --[[ Name: buildTestPathPattern ]]
    -- upvalues: l_Array_0 (copy), l_default_3 (copy), v8 (ref)
    local v46 = {};
    if v45._ ~= nil then
        v46 = l_Array_0.concat(v46, v45._);
    end;
    if v45.testPathPattern ~= nil then
        v46 = l_Array_0.concat(v46, v45.testPathPattern);
    end;
    local v48 = l_Array_0.join(l_Array_0.map(v46, function(v47) --[[ Line: 581 ]] --[[ Name: replacePosixSep ]]
        return (tostring(v47));
    end), "|");
    if l_default_3(v48) then
        return v48;
    else
        v8(v48);
        return "";
    end;
end;
v8 = function(v50) --[[ Line: 605 ]] --[[ Name: showTestPathPatternError ]]
    -- upvalues: l_clearLine_0 (copy), l_process_0 (copy), l_console_0 (copy), v12 (copy)
    l_clearLine_0(l_process_0.stdout);
    l_console_0.log(v12.red(("  Invalid testPattern %s supplied. "):format((tostring(v50))) .. "Running all tests instead."));
end;
v7.default = function(v51, v52, v53, v54) --[[ Line: 694 ]] --[[ Name: normalize ]]
    -- upvalues: v6 (copy), v42 (copy), l_default_2 (copy), l_Boolean_0 (copy), l_getRelativePath_0 (copy), l_default_0 (copy), l_Object_0 (copy), l_Array_0 (copy), v18 (copy), v15 (copy), v12 (copy), v30 (copy), l_getDisplayNameColor_0 (copy), v49 (copy), l_default_1 (copy)
    local v55 = if v54 ~= nil then v54 else 1e999;
    return v6.resolve():andThen(function() --[[ Line: 703 ]]
        -- upvalues: v42 (ref), l_default_2 (ref), v51 (copy), v52 (copy), v53 (copy), v55 (copy), l_Boolean_0 (ref), l_getRelativePath_0 (ref), l_default_0 (ref), l_Object_0 (ref), l_Array_0 (ref), v18 (ref), v15 (ref), v12 (ref), v30 (ref), l_getDisplayNameColor_0 (ref), v49 (ref), l_default_1 (ref)
        local v56 = v42(l_default_2(v51, v52));
        local _ = v53;
        local _ = v55;
        if not l_Boolean_0.toJSBoolean(v56.id) then
            v56.id = l_getRelativePath_0(v56.rootDir, nil);
        end;
        if v56.setupFiles == nil then
            v56.setupFiles = {};
        end;
        local l_v56_0 = v56;
        l_v56_0.testEnvironment = l_v56_0.testEnvironment or l_default_0.testEnvironment;
        if l_v56_0.roots == nil and l_v56_0.testPathDirs ~= nil then
            l_v56_0.roots = l_v56_0.testPathDirs;
            l_v56_0.testPathDirs = nil;
        end;
        if l_v56_0.roots == nil then
            l_v56_0.roots = {
                l_v56_0.rootDir
            };
        end;
        local v60 = l_Object_0.assign({}, l_default_0);
        local v61 = l_Object_0.keys(l_v56_0);
        l_Array_0.reduce(v61, function(v62, v63) --[[ Line: 812 ]]
            -- upvalues: l_v56_0 (copy), l_Array_0 (ref), l_Boolean_0 (ref), v18 (ref), v15 (ref), v52 (ref), v12 (ref), v30 (ref), l_getDisplayNameColor_0 (ref)
            if v63 == "resolver" then
                return v62;
            else
                local l_l_v56_0_0 = l_v56_0;
                local v65 = nil;
                if v63 == "setupFiles" or v63 == "setupFilesAfterEnv" or v63 == "snapshotSerializers" then
                    local v66 = l_l_v56_0_0[v63];
                    if v66 ~= nil then
                        v65 = l_Array_0.map(v66, function(v67) --[[ Line: 841 ]]
                            -- upvalues: l_v56_0 (ref)
                            if v67 == "<rootDir>" then
                                return l_v56_0.rootDir;
                            else
                                return v67;
                            end;
                        end);
                    end;
                elseif v63 == "modulePaths" or v63 == "roots" then
                    local v68 = l_l_v56_0_0[v63];
                    if v68 ~= nil then
                        v65 = l_Array_0.map(v68, function(v69) --[[ Line: 859 ]]
                            -- upvalues: l_v56_0 (ref)
                            if v69 == "<rootDir>" then
                                return l_v56_0.rootDir;
                            else
                                return v69;
                            end;
                        end);
                    end;
                elseif v63 == "testPathIgnorePatterns" then
                    v65 = l_l_v56_0_0[v63];
                elseif v63 == "projects" then
                    v65 = l_Array_0.reduce(l_Array_0.map(l_Boolean_0.toJSBoolean(l_l_v56_0_0[v63]) and l_l_v56_0_0[v63] or {}, function(v70) --[[ Line: 1003 ]]
                        return v70;
                    end), function(v71, v72) --[[ Line: 1011 ]]
                        -- upvalues: l_Array_0 (ref)
                        local v73 = {};
                        return l_Array_0.concat(v71, if #v73 > 0 then v73 else {
                            v72
                        });
                    end, {});
                elseif v63 == "moduleDirectories" or v63 == "testMatch" then
                    local v74 = l_l_v56_0_0[v63];
                    v65 = if v74 ~= nil then if l_Array_0.isArray(v74) then l_Array_0.map(v74, v18) else v74 else v74;
                elseif v63 == "testRegex" then
                    local v75 = l_l_v56_0_0[v63];
                    v65 = if v75 ~= nil and l_Boolean_0.toJSBoolean(v75) then l_Array_0.map(if l_Array_0.isArray(v75) then v75 else {
                        v75
                    }, v15) else {};
                elseif v63 == "bail" then
                    local v76 = l_l_v56_0_0[v63];
                    if typeof(v76) == "boolean" then
                        v65 = v76 and 1 or 0;
                    elseif typeof(v76) == "string" then
                        v65 = 1;
                        table.insert(v52._, v76);
                    else
                        v65 = l_l_v56_0_0[v63];
                    end;
                elseif v63 == "displayName" then
                    local v77 = l_l_v56_0_0[v63];
                    if typeof(v77) == "table" then
                        local l_name_0 = v77.name;
                        local l_color_0 = v77.color;
                        if not l_Boolean_0.toJSBoolean(l_name_0) or not l_Boolean_0.toJSBoolean(l_color_0) or typeof(l_name_0) ~= "string" or typeof(l_color_0) ~= "string" then
                            local v80 = ("  Option \"%s\" must be of type:\n\n"):format(v12.bold("displayName")) .. "  {\n" .. "    name: string;\n" .. "    color: string;\n" .. "  }\n";
                            error(v30(v80));
                        end;
                        v65 = l_l_v56_0_0[v63];
                    else
                        v65 = {
                            color = l_getDisplayNameColor_0(l_v56_0.runner), 
                            name = v77
                        };
                    end;
                elseif v63 == "testTimeout" then
                    if l_l_v56_0_0[v63] < 0 then
                        error(v30(("  Option \"%s\" must be a natural number."):format(v12.bold("testTimeout"))));
                    end;
                    v65 = l_l_v56_0_0[v63];
                elseif v63 == "automock" or v63 == "cache" or v63 == "changedSince" or v63 == "changedFilesWithAncestor" or v63 == "clearMocks" or v63 == "collectCoverage" or v63 == "coverageProvider" or v63 == "coverageReporters" or v63 == "coverageThreshold" or v63 == "detectLeaks" or v63 == "detectOpenHandles" or v63 == "errorOnDeprecated" or v63 == "expand" or v63 == "extensionsToTreatAsEsm" or v63 == "extraGlobals" or v63 == "globals" or v63 == "findRelatedTests" or v63 == "forceCoverageMatch" or v63 == "forceExit" or v63 == "injectGlobals" or v63 == "lastCommit" or v63 == "listTests" or v63 == "logHeapUsage" or v63 == "maxConcurrency" or v63 == "id" or v63 == "noStackTrace" or v63 == "notify" or v63 == "notifyMode" or v63 == "onlyChanged" or v63 == "onlyFailures" or v63 == "outputFile" or v63 == "passWithNoTests" or v63 == "replname" or v63 == "reporters" or v63 == "resetMocks" or v63 == "resetModules" or v63 == "restoreMocks" or v63 == "rootDir" or v63 == "runTestsByPath" or v63 == "silent" or v63 == "skipFilter" or v63 == "skipNodeResolution" or v63 == "slowTestThreshold" or v63 == "snapshotFormat" or v63 == "testEnvironment" or v63 == "testEnvironmentOptions" or v63 == "testFailureExitCode" or v63 == "testLocationInResults" or v63 == "testNamePattern" or v63 == "testURL" or v63 == "timers" or v63 == "useStderr" or v63 == "verbose" or v63 == "watch" or v63 == "watchAll" or v63 == "watchman" then
                    v65 = l_l_v56_0_0[v63];
                end;
                v62[v63] = v65;
                return v62;
            end;
        end, v60);
        l_Array_0.forEach(v60.roots, function(v81, v82) --[[ Line: 1252 ]]
            -- upvalues: v30 (ref), v12 (ref)
            local v83 = ("roots[%s]"):format((tostring(v82)));
            if typeof(v81) ~= "Instance" then
                error(v30(("  Directory %s in the %s option was not found."):format(v12.bold((tostring(v81))), v12.bold(v83))));
            end;
        end);
        v60.testPathPattern = v49(v52);
        v60.json = l_Boolean_0.toJSBoolean(v52.json);
        v60.testFailureExitCode = tonumber(v60.testFailureExitCode, 10) or 0;
        v60.updateSnapshot = if not l_Boolean_0.toJSBoolean(v52.ci) or v52.updateSnapshot then v52.updateSnapshot and "all" or "new" else "none";
        v60.maxConcurrency = tonumber(v60.maxConcurrency, 10) or 0;
        v60.maxWorkers = l_default_1(v52, l_v56_0);
        if #v60.testRegex > 0 and l_v56_0.testMatch ~= nil then
            error(v30(("  Configuration options %s and"):format(v12.bold("testMatch")) .. (" %s cannot be used together."):format(v12.bold("testRegex"))));
        end;
        if #v60.testRegex > 0 and l_v56_0.testMatch == nil then
            v60.testMatch = {};
        end;
        if not l_Boolean_0.toJSBoolean(v60.projects) then
            v60.projects = {};
        end;
        return {
            hasDeprecationWarnings = false, 
            options = v60
        };
    end);
end;
return v7;