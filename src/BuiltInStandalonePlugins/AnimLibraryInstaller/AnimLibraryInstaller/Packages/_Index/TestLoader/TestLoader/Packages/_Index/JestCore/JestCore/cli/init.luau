local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.Promise);
local v7 = {};
local v8 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local l_readConfigs_0 = require(l_Parent_0.JestConfig).readConfigs;
local _ = require(l_Parent_0.JestRuntime);
local l_preRunMessage_0 = require(l_Parent_0.JestUtil).preRunMessage;
local l_default_0 = require(script.Parent.TestWatcher).default;
local l_formatHandleErrors_0 = require(script.Parent.collectHandles).formatHandleErrors;
local l_default_1 = require(script.Parent.getChangedFilesPromise).default;
local l_default_2 = require(script.Parent.getProjectNamesMissingWarning).default;
local l_default_3 = require(script.Parent.getSelectProjectsMessage).default;
local l_default_4 = require(script.Parent.lib.createContext).default;
local l_default_5 = require(script.Parent.lib.logDebugMessages).default;
local l_default_6 = require(script.Parent.pluralize).default;
local l_default_7 = require(script.Parent.runJest).default;
local _ = require(script.Parent.types);
local l_print_0 = l_preRunMessage_0.print;
local l_nodeUtils_0 = require(l_Parent_0.RobloxShared).nodeUtils;
local l_process_0 = l_nodeUtils_0.process;
local l_exit_0 = l_nodeUtils_0.exit;
local v28 = nil;
local v29 = nil;
v7.runCLI = function(v30, v31, v32) --[[ Line: 84 ]] --[[ Name: runCLI ]]
    -- upvalues: v6 (copy), l_Boolean_0 (copy), l_process_0 (copy), l_readConfigs_0 (copy), l_default_5 (copy), l_exit_0 (copy), l_default_2 (copy), l_default_3 (copy), v28 (ref), l_Error_0 (copy), l_formatHandleErrors_0 (copy), l_default_6 (copy), v8 (copy), l_Array_0 (copy), l_console_0 (copy)
    return v6.resolve():andThen(function() --[[ Line: 90 ]]
        -- upvalues: l_Boolean_0 (ref), v31 (copy), l_process_0 (ref), l_readConfigs_0 (ref), v30 (copy), v32 (copy), l_default_5 (ref), l_exit_0 (ref), l_default_2 (ref), l_default_3 (ref), v28 (ref), v6 (ref), l_Error_0 (ref), l_formatHandleErrors_0 (ref), l_default_6 (ref), v8 (ref), l_Array_0 (ref), l_console_0 (ref)
        local v33 = nil;
        local v34 = if not not l_Boolean_0.toJSBoolean(v31.json) or l_Boolean_0.toJSBoolean(v31.useStderr) then l_process_0.stderr else l_process_0.stdout;
        local v35 = l_readConfigs_0(v30, v31, v32):expect();
        local l_globalConfig_0 = v35.globalConfig;
        local l_configs_0 = v35.configs;
        local l_hasDeprecationWarnings_0 = v35.hasDeprecationWarnings;
        if v31.debug then
            l_default_5(l_globalConfig_0, l_configs_0, v34);
        end;
        if v31.showConfig then
            l_default_5(l_globalConfig_0, l_configs_0, l_process_0.stdout);
            l_exit_0(0);
        end;
        if l_Boolean_0.toJSBoolean(v31.selectProjects) then
            local v39 = l_default_2(l_configs_0, {
                ignoreProjects = v31.ignoreProjects, 
                selectProjects = v31.selectProjects
            });
            if l_Boolean_0.toJSBoolean(v39) and v39 then
                v34:write(v39);
            end;
            v34:write(l_default_3(l_configs_0, {
                ignoreProjects = v31.ignoreProjects, 
                selectProjects = v31.selectProjects
            }));
        end;
        v28(l_globalConfig_0, l_configs_0, l_hasDeprecationWarnings_0, v34, function(v40) --[[ Line: 139 ]]
            -- upvalues: v33 (ref)
            v33 = v40;
        end):expect();
        if v31.watch or v31.watchAll then
            return v6.new(function() --[[ Line: 147 ]]

            end);
        else
            if not l_Boolean_0.toJSBoolean(v33) then
                error(l_Error_0.new("AggregatedResult must be present after test run is complete"));
            end;
            local l_openHandles_0 = v33.openHandles;
            if l_openHandles_0 ~= nil and #l_openHandles_0 > 0 then
                local v42 = l_formatHandleErrors_0(l_openHandles_0, l_configs_0[1]);
                local v43 = l_default_6("open handle", #v42, "s");
                local v44 = v8.red(("\nJest has detected the following %s potentially keeping Jest from exiting:\n\n"):format(v43)) .. l_Array_0.join(v42, "\n\n");
                l_console_0.error(v44);
            end;
            return {
                globalConfig = l_globalConfig_0, 
                results = v33
            };
        end;
    end);
end;
local _ = function(v45, _, _) --[[ Line: 175 ]] --[[ Name: buildContextsAndHasteMaps ]]
    -- upvalues: v6 (copy), l_Array_0 (copy), l_default_4 (copy)
    return v6.resolve():andThen(function() --[[ Line: 180 ]]
        -- upvalues: v6 (ref), l_Array_0 (ref), v45 (copy), l_default_4 (ref)
        return {
            contexts = v6.all(l_Array_0.map(v45, function(v48, _) --[[ Line: 183 ]]
                -- upvalues: v6 (ref), l_default_4 (ref)
                return v6.resolve():andThen(function() --[[ Line: 184 ]]
                    -- upvalues: l_default_4 (ref), v48 (copy)
                    return l_default_4(v48, nil);
                end);
            end)):expect()
        };
    end);
end;
v28 = function(v51, v52, _, v54, v55) --[[ Line: 205 ]] --[[ Name: _run10000 ]]
    -- upvalues: v6 (copy), l_default_1 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_default_4 (copy), v29 (ref)
    return v6.resolve():andThen(function() --[[ Line: 212 ]]
        -- upvalues: l_default_1 (ref), v51 (copy), v52 (copy), l_Boolean_0 (ref), v6 (ref), v54 (copy), l_Array_0 (ref), l_default_4 (ref), v29 (ref), v55 (copy)
        local v56 = l_default_1(v51, v52);
        local v57 = nil;
        if l_Boolean_0.toJSBoolean(v51.filter) and not v51.skipFilter then
            local v58 = require(v51.filter);
            local v59 = nil;
            if l_Boolean_0.toJSBoolean(v58.setup) then
                v59 = v6.resolve():andThen(function() --[[ Line: 228 ]]
                    -- upvalues: v58 (copy)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 229 ]]
                        -- upvalues: v58 (ref)
                        v58:setup():expect();
                    end);
                    if not l_status_0 then
                        return l_result_0;
                    else
                        return nil;
                    end;
                end);
            end;
            do
                local l_v59_0 = v59;
                v57 = function(v63) --[[ Line: 239 ]]
                    -- upvalues: v6 (ref), l_v59_0 (ref), l_Boolean_0 (ref), v58 (copy)
                    return v6.resolve():andThen(function() --[[ Line: 240 ]]
                        -- upvalues: l_v59_0 (ref), l_Boolean_0 (ref), v58 (ref), v63 (copy)
                        if l_v59_0 ~= nil then
                            local v64 = l_v59_0:expect();
                            if l_Boolean_0.toJSBoolean(v64) then
                                error(v64);
                            end;
                        end;
                        return v58(v63);
                    end);
                end;
            end;
        end;
        local l_v52_0 = v52;
        local _ = v51;
        local _ = v54;
        l_v52_0 = v6.resolve():andThen(function() --[[ Line: 180 ]]
            -- upvalues: v6 (ref), l_Array_0 (ref), l_v52_0 (copy), l_default_4 (ref)
            return {
                contexts = v6.all(l_Array_0.map(l_v52_0, function(v68, _) --[[ Line: 183 ]]
                    -- upvalues: v6 (ref), l_default_4 (ref)
                    return v6.resolve():andThen(function() --[[ Line: 184 ]]
                        -- upvalues: l_default_4 (ref), v68 (copy)
                        return l_default_4(v68, nil);
                    end);
                end)):expect()
            };
        end):expect().contexts;
        v29(v51, l_v52_0, v54, v55, v56, v57):expect();
    end);
end;
v29 = function(v70, v71, v72, v73, v74, v75) --[[ Line: 297 ]] --[[ Name: runWithoutWatch ]]
    -- upvalues: v6 (copy), l_print_0 (copy), l_default_7 (copy), l_default_0 (copy)
    return v6.resolve():andThen(function() --[[ Line: 305 ]]
        -- upvalues: v6 (ref), v70 (copy), l_print_0 (ref), v72 (copy), l_default_7 (ref), v74 (copy), v71 (copy), v75 (copy), v73 (copy), l_default_0 (ref)
        local function v76() --[[ Line: 306 ]] --[[ Name: startRun ]]
            -- upvalues: v6 (ref), v70 (ref), l_print_0 (ref), v72 (ref), l_default_7 (ref), v74 (ref), v71 (ref), v75 (ref), v73 (ref), v76 (copy), l_default_0 (ref)
            return v6.resolve():andThen(function() --[[ Line: 307 ]]
                -- upvalues: v70 (ref), l_print_0 (ref), v72 (ref), l_default_7 (ref), v74 (ref), v71 (ref), v75 (ref), v73 (ref), v76 (ref), l_default_0 (ref)
                if not v70.listTests then
                    l_print_0(v72);
                end;
                return l_default_7({
                    changedFilesPromise = v74, 
                    contexts = v71, 
                    failedTestsCache = nil, 
                    filter = v75, 
                    globalConfig = v70, 
                    onComplete = v73, 
                    outputStream = v72, 
                    startRun = v76, 
                    testWatcher = l_default_0.new({
                        isWatchMode = false
                    })
                });
            end);
        end;
        return v76();
    end);
end;
return v7;