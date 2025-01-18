local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_console_0 = v1.console;
local v7 = require(l_Parent_0.Promise);
local v8 = {};
local l_default_0 = require(l_Parent_0.Emittery).default;
local l_default_1 = require(l_Parent_0.Throat).default;
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local l_deepCyclicCopy_0 = require(l_Parent_0.JestUtil).deepCyclicCopy;
local l_default_2 = require(script.runTest).default;
local _ = require(script.types);
local v16 = nil;
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_default_0 (copy), l_Boolean_0 (copy), l_Map_0 (copy)
    local v20 = setmetatable({}, v17);
    v20.eventEmitter = l_default_0.new();
    v20.__PRIVATE_UNSTABLE_API_supportsEventEmitters__ = true;
    v20._globalConfig = v18;
    v20._context = l_Boolean_0.toJSBoolean(v19) and v19 or {};
    v20._loadedModuleFns = l_Map_0.new();
    return v20;
end;
v17.runTests = function(v21, v22, v23, v24, v25, v26, v27) --[[ Line: 150 ]] --[[ Name: runTests ]]
    -- upvalues: v7 (copy), l_Boolean_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 158 ]]
        -- upvalues: l_Boolean_0 (ref), v27 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy)
        if l_Boolean_0.toJSBoolean(v27.serial) then
            return (v21:_createInBandTestRun(v22, v23, v24, v25, v26):expect());
        else
            return (v21:_createParallelTestRun(v22, v23, v24, v25, v26):expect());
        end;
    end);
end;
v17._createInBandTestRun = function(v28, v29, v30, v31, v32, v33) --[[ Line: 166 ]] --[[ Name: _createInBandTestRun ]]
    -- upvalues: v7 (copy), l_default_1 (copy), l_Array_0 (copy), v16 (ref), l_default_2 (copy), l_deepCyclicCopy_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 173 ]]
        -- upvalues: l_default_1 (ref), l_Array_0 (ref), v29 (copy), v7 (ref), v30 (copy), v16 (ref), v31 (copy), l_default_2 (ref), v28 (copy), l_deepCyclicCopy_0 (ref), v32 (copy), v33 (copy)
        local v34 = l_default_1(1);
        return l_Array_0.reduce(v29, function(v35, v36) --[[ Line: 177 ]]
            -- upvalues: v34 (copy), v7 (ref), v30 (ref), v16 (ref), v31 (ref), l_default_2 (ref), v28 (ref), l_deepCyclicCopy_0 (ref), v32 (ref), v33 (ref)
            return v34(function() --[[ Line: 178 ]]
                -- upvalues: v35 (copy), v7 (ref), v30 (ref), v16 (ref), v31 (ref), v36 (copy), l_default_2 (ref), v28 (ref), l_deepCyclicCopy_0 (ref), v32 (ref), v33 (ref)
                return (v35:andThen(function() --[[ Line: 181 ]]
                    -- upvalues: v7 (ref), v30 (ref), v16 (ref), v31 (ref), v36 (ref), l_default_2 (ref), v28 (ref), l_deepCyclicCopy_0 (ref)
                    return v7.resolve():andThen(function() --[[ Line: 182 ]]
                        -- upvalues: v30 (ref), v16 (ref), v31 (ref), v36 (ref), l_default_2 (ref), v28 (ref), l_deepCyclicCopy_0 (ref)
                        if v30:isInterrupted() then
                            error(v16.new());
                        end;
                        local v37 = nil;
                        if v31 ~= nil then
                            v31(v36):expect();
                            return l_default_2(v36.script, v28._globalConfig, v36.context.config, nil, v28._context, nil, v28._loadedModuleFns);
                        else
                            v37 = function(v38, v39) --[[ Line: 208 ]]
                                -- upvalues: v28 (ref), l_deepCyclicCopy_0 (ref)
                                return v28.eventEmitter:emit(v38, l_deepCyclicCopy_0(v39, {
                                    keepPrototype = false
                                }));
                            end;
                            v28.eventEmitter:emit("test-file-start", {
                                v36
                            }):expect();
                            return l_default_2(v36.script, v28._globalConfig, v36.context.config, nil, v28._context, v37, v28._loadedModuleFns);
                        end;
                    end);
                end):andThen(function(v40) --[[ Line: 233 ]]
                    -- upvalues: v32 (ref), v36 (ref), v28 (ref)
                    if v32 ~= nil then
                        return v32(v36, v40);
                    else
                        return v28.eventEmitter:emit("test-file-success", {
                            v36, 
                            v40
                        });
                    end;
                end):catch(function(v41) --[[ Line: 240 ]]
                    -- upvalues: v33 (ref), v36 (ref), v28 (ref)
                    if v33 ~= nil then
                        return v33(v36, v41);
                    else
                        return v28.eventEmitter:emit("test-file-failure", {
                            v36, 
                            v41
                        });
                    end;
                end));
            end);
        end, v7.resolve());
    end);
end;
v17._createParallelTestRun = function(v42, v43, v44, v45, v46, v47) --[[ Line: 253 ]] --[[ Name: _createParallelTestRun ]]
    -- upvalues: v7 (copy), l_console_0 (copy)
    return v7.resolve():andThen(function() --[[ Line: 260 ]]
        -- upvalues: l_console_0 (ref), v42 (copy), v43 (copy), v44 (copy), v45 (copy), v46 (copy), v47 (copy)
        l_console_0.warn("Parallel tests run not implemented yet\nRunning tests in band instead");
        return v42:_createInBandTestRun(v43, v44, v45, v46, v47);
    end);
end;
v17.on = function(v48, v49, v50) --[[ Line: 395 ]] --[[ Name: on ]]
    return v48.eventEmitter:on(v49, v50);
end;
v17.cleanup = function(v51) --[[ Line: 408 ]] --[[ Name: cleanup ]]
    v51._loadedModuleFns:forEach(function(v52) --[[ Line: 409 ]]
        local v53 = v52[3];
        if v53 ~= nil then
            v53();
        end;
    end);
end;
v8.default = v17;
v16 = setmetatable({}, {
    __index = l_Error_0
});
v16.__index = v16;
v16.new = function(v54) --[[ Line: 423 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v16 (ref)
    local v55 = setmetatable(l_Error_0.new(v54), v16);
    v55.name = "CancelRun";
    return v55;
end;
return v8;