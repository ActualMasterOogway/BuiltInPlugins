local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_console_0 = v1.console;
local v7 = require(l_Parent_0.Promise);
local v8 = require(l_Parent_0.RobloxShared).getDataModelService("CoreScriptSyncService");
local v9 = {};
local l_default_0 = require(l_Parent_0.Emittery).default;
local l_default_1 = require(l_Parent_0.Throat).default;
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local l_deepCyclicCopy_0 = require(l_Parent_0.JestUtil).deepCyclicCopy;
local l_default_2 = require(script.runTest).default;
local _ = require(script.types);
local v17 = nil;
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20) --[[ Line: 143 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_default_0 (copy), l_Boolean_0 (copy), l_Map_0 (copy)
    local v21 = setmetatable({}, v18);
    v21.eventEmitter = l_default_0.new();
    v21.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ = true;
    v21._globalConfig = v19;
    v21._context = l_Boolean_0.toJSBoolean(v20) and v20 or {};
    v21._loadedModuleFns = l_Map_0.new();
    return v21;
end;
v18.runTests = function(v22, v23, v24, v25, v26, v27, v28) --[[ Line: 155 ]] --[[ Name: runTests ]]
    -- upvalues: v7 (copy), l_Boolean_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 163 ]]
        -- upvalues: l_Boolean_0 (ref), v28 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy)
        if l_Boolean_0.toJSBoolean(v28.serial) then
            return (v22:_createInBandTestRun(v23, v24, v25, v26, v27):expect());
        else
            return (v22:_createParallelTestRun(v23, v24, v25, v26, v27):expect());
        end;
    end);
end;
v18._createInBandTestRun = function(v29, v30, v31, v32, v33, v34) --[[ Line: 171 ]] --[[ Name: _createInBandTestRun ]]
    -- upvalues: v7 (copy), l_default_1 (copy), l_Array_0 (copy), v8 (copy), v17 (ref), l_default_2 (copy), l_deepCyclicCopy_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 178 ]]
        -- upvalues: l_default_1 (ref), l_Array_0 (ref), v30 (copy), v8 (ref), v7 (ref), v31 (copy), v17 (ref), v32 (copy), l_default_2 (ref), v29 (copy), l_deepCyclicCopy_0 (ref), v33 (copy), v34 (copy)
        local v35 = l_default_1(1);
        return l_Array_0.reduce(v30, function(v36, v37) --[[ Line: 182 ]]
            -- upvalues: v8 (ref), v35 (copy), v7 (ref), v31 (ref), v17 (ref), v32 (ref), l_default_2 (ref), v29 (ref), l_deepCyclicCopy_0 (ref), v33 (ref), v34 (ref)
            if v8 then
                v37.path = v8:GetScriptFilePath(v37.script);
            end;
            return v35(function() --[[ Line: 186 ]]
                -- upvalues: v36 (copy), v7 (ref), v31 (ref), v17 (ref), v32 (ref), v37 (copy), l_default_2 (ref), v29 (ref), l_deepCyclicCopy_0 (ref), v33 (ref), v34 (ref)
                return (v36:andThen(function() --[[ Line: 189 ]]
                    -- upvalues: v7 (ref), v31 (ref), v17 (ref), v32 (ref), v37 (ref), l_default_2 (ref), v29 (ref), l_deepCyclicCopy_0 (ref)
                    return v7.resolve():andThen(function() --[[ Line: 190 ]]
                        -- upvalues: v31 (ref), v17 (ref), v32 (ref), v37 (ref), l_default_2 (ref), v29 (ref), l_deepCyclicCopy_0 (ref)
                        if v31:isInterrupted() then
                            error(v17.new());
                        end;
                        local v38 = nil;
                        if v32 ~= nil then
                            v32(v37):expect();
                            return l_default_2(v37.script, v29._globalConfig, v37.context.config, nil, v29._context, nil, v29._loadedModuleFns);
                        else
                            v38 = function(v39, v40) --[[ Line: 216 ]]
                                -- upvalues: v29 (ref), l_deepCyclicCopy_0 (ref)
                                return v29.eventEmitter:emit(v39, l_deepCyclicCopy_0(v40, {
                                    keepPrototype = false
                                }));
                            end;
                            v29.eventEmitter:emit("test-file-start", {
                                v37
                            }):expect();
                            return l_default_2(v37.script, v29._globalConfig, v37.context.config, nil, v29._context, v38, v29._loadedModuleFns);
                        end;
                    end);
                end):andThen(function(v41) --[[ Line: 241 ]]
                    -- upvalues: v33 (ref), v37 (ref), v29 (ref)
                    if v33 ~= nil then
                        return v33(v37, v41);
                    else
                        return v29.eventEmitter:emit("test-file-success", {
                            v37, 
                            v41
                        });
                    end;
                end):catch(function(v42) --[[ Line: 248 ]]
                    -- upvalues: v34 (ref), v37 (ref), v29 (ref)
                    if v34 ~= nil then
                        return v34(v37, v42);
                    else
                        return v29.eventEmitter:emit("test-file-failure", {
                            v37, 
                            v42
                        });
                    end;
                end));
            end);
        end, v7.resolve());
    end);
end;
v18._createParallelTestRun = function(v43, v44, v45, v46, v47, v48) --[[ Line: 261 ]] --[[ Name: _createParallelTestRun ]]
    -- upvalues: v7 (copy), l_console_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 268 ]]
        -- upvalues: l_console_0 (ref), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy), v48 (copy)
        l_console_0.warn("Parallel tests run not implemented yet\nRunning tests in band instead");
        return v43:_createInBandTestRun(v44, v45, v46, v47, v48);
    end);
end;
v18.on = function(v49, v50, v51) --[[ Line: 403 ]] --[[ Name: on ]]
    return v49.eventEmitter:on(v50, v51);
end;
v18.cleanup = function(v52) --[[ Line: 416 ]] --[[ Name: cleanup ]]
    v52._loadedModuleFns:forEach(function(v53) --[[ Line: 417 ]]
        local v54 = v53[3];
        if v54 ~= nil then
            v54();
        end;
    end);
end;
v9.default = v18;
v17 = setmetatable({}, {
    __index = l_Error_0
});
v17.__index = v17;
v17.new = function(v55) --[[ Line: 431 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v17 (ref)
    local v56 = setmetatable(l_Error_0.new(v55), v17);
    v56.name = "CancelRun";
    return v56;
end;
return v9;