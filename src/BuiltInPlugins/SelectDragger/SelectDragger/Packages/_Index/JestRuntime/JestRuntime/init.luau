local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local _ = require(script.types);
local _ = require(script._types);
local _ = require(l_Parent_0.Expect);
local v10 = require(l_Parent_0.JestFakeTimers);
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 632 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v10 (copy), l_Map_0 (copy), l_ModuleMocker_0 (copy)
    local v13 = setmetatable({}, v11);
    v13.isTornDown = false;
    v13._environment = {
        fakeTimersModern = v10.new()
    };
    v13._explicitShouldMock = l_Map_0.new();
    v13._explicitShouldMockModule = l_Map_0.new();
    v13._internalModuleRegistry = l_Map_0.new();
    v13._mockFactories = l_Map_0.new();
    v13._mockRegistry = l_Map_0.new();
    v13._loadedModuleFns = v12;
    v13._moduleMocker = l_ModuleMocker_0.new();
    v13._isolatedModuleRegistry = nil;
    v13._isolatedMockRegistry = nil;
    v13._moduleRegistry = l_Map_0.new();
    v13._shouldAutoMock = false;
    v13._shouldMockModuleCache = l_Map_0.new();
    v13._fakeTimersImplementation = v13._environment.fakeTimersModern;
    v13._jestObject = v13:_createJestObjectFor(script);
    v13._cleanupFns = {};
    return v13;
end;
v11.requireModule = function(v14, v15, v16, v17, _, v19) --[[ Line: 1122 ]] --[[ Name: requireModule ]]
    local v20 = if v16 == nil then v15 else v16;
    if string.find(v20.Name, ".global$") then
        return require(v20);
    else
        local v21 = typeof(v17) == "table" and v17.isInternalModule ~= nil and v17.isInternalModule;
        local v22 = nil;
        v22 = if v21 then v14._internalModuleRegistry else if v14._isolatedModuleRegistry ~= nil then v14._isolatedModuleRegistry else v14._moduleRegistry;
        local v23 = v22:get(v20);
        if v23 then
            return v23.exports;
        else
            local v24 = {
                exports = {}, 
                filename = v20, 
                id = v20, 
                loaded = false
            };
            v22:set(v20, v24);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1245 ]]
                -- upvalues: v14 (copy), v24 (copy), v15 (copy), v20 (copy), v20 (copy), v17 (copy), v22 (ref), v19 (copy)
                v14:_loadModule(v24, v15, v20, v20, v17, v22, v19);
            end);
            if not l_status_0 then
                v22:delete(v20);
                error(l_result_0);
            end;
            return v24.exports;
        end;
    end;
end;
v11.requireInternalModule = function(v27, v28, v29) --[[ Line: 1257 ]] --[[ Name: requireInternalModule ]]
    return v27:requireModule(v28, v29, {
        isInternalModule = true
    });
end;
v11.requireActual = function(v30, v31, v32) --[[ Line: 1285 ]] --[[ Name: requireActual ]]
    return v30:requireModule(v31, v32, nil, true);
end;
v11.requireMock = function(v33, _, v35) --[[ Line: 1292 ]] --[[ Name: requireMock ]]
    if v33._isolatedMockRegistry ~= nil and v33._isolatedMockRegistry:has(v35) then
        return (v33._isolatedMockRegistry:get(v35));
    elseif v33._mockRegistry:has(v35) then
        return (v33._mockRegistry:get(v35));
    else
        local v36 = v33._isolatedMockRegistry or v33._mockRegistry;
        if v33._mockFactories:has(v35) then
            local v37 = v33._mockFactories:get(v35)();
            v36:set(v35, v37);
            return v37;
        else
            error("manual mocks not implemented yet");
            return;
        end;
    end;
end;
v11._loadModule = function(v38, v39, v40, v41, _, v43, v44, v45) --[[ Line: 1372 ]] --[[ Name: _loadModule ]]
    -- upvalues: l_Boolean_0 (copy)
    v38:_execModule(v39, v43, v44, if l_Boolean_0.toJSBoolean(v41) then v40 else nil, v45);
    v39.loaded = true;
end;
v11.requireModuleOrMock = function(v46, v47) --[[ Line: 1413 ]] --[[ Name: requireModuleOrMock ]]
    -- upvalues: l_Object_0 (copy)
    if v47 == script or v47 == script.Parent then
        return require(v47);
    elseif string.find(v47.Name, ".global$") then
        return require(v47);
    elseif v47.Name == "JestGlobals" then
        local v48 = v46:getGlobalsFromEnvironment();
        return (l_Object_0.assign({}, v48, {
            jest = v46._jestObject
        }));
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 1477 ]]
            -- upvalues: v46 (copy), v47 (copy), v47 (copy)
            if v46:_shouldMock(v47, v47, v46._explicitShouldMock, {
                conditions = nil
            }) then
                return v46:requireMock(v47, v47);
            else
                return v46:requireModule(v47, v47);
            end;
        end);
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end;
end;
v11.isolateModules = function(v51, v52) --[[ Line: 1494 ]] --[[ Name: isolateModules ]]
    -- upvalues: l_Error_0 (copy), l_Map_0 (copy)
    if v51._isolatedModuleRegistry ~= nil or v51._isolatedMockRegistry ~= nil then
        error(l_Error_0.new("isolateModules cannot be nested inside another isolateModules."));
    end;
    v51._isolatedModuleRegistry = l_Map_0.new();
    v51._isolatedMockRegistry = l_Map_0.new();
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 1513 ]]
        -- upvalues: v52 (copy)
        v52();
    end);
    if v51._isolatedModuleRegistry then
        v51._isolatedModuleRegistry:clear();
    end;
    if v51._isolatedMockRegistry then
        v51._isolatedMockRegistry:clear();
    end;
    v51._isolatedModuleRegistry = nil;
    v51._isolatedMockRegistry = nil;
    if not l_status_2 then
        error(l_result_2);
    end;
end;
v11.resetModules = function(v55) --[[ Line: 1550 ]] --[[ Name: resetModules ]]
    if v55._isolatedModuleRegistry then
        v55._isolatedModuleRegistry:clear();
    end;
    if v55._isolatedMockRegistry then
        v55._isolatedMockRegistry:clear();
    end;
    v55._isolatedModuleRegistry = nil;
    v55._isolatedMockRegistry = nil;
    v55._mockRegistry:clear();
    v55._moduleRegistry:clear();
end;
v11.setMock = function(v56, _, v58, v59, v60) --[[ Line: 1649 ]] --[[ Name: setMock ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(if typeof(v60) == "table" then v60.virtual else nil) then
        error("virtual mocks not supported");
    end;
    v56._explicitShouldMock:set(v58, true);
    v56._mockFactories:set(v58, v59);
end;
v11.restoreAllMocks = function(v61) --[[ Line: 1689 ]] --[[ Name: restoreAllMocks ]]
    v61._moduleMocker:restoreAllMocks();
end;
v11.resetAllMocks = function(v62) --[[ Line: 1692 ]] --[[ Name: resetAllMocks ]]
    v62._moduleMocker:resetAllMocks();
end;
v11.clearAllMocks = function(v63) --[[ Line: 1695 ]] --[[ Name: clearAllMocks ]]
    v63._moduleMocker:clearAllMocks();
end;
v11.teardown = function(v64) --[[ Line: 1698 ]] --[[ Name: teardown ]]
    v64:restoreAllMocks();
    v64:resetAllMocks();
    v64:resetModules();
    v64._internalModuleRegistry:clear();
    v64._mockFactories:clear();
    v64._shouldMockModuleCache:clear();
    v64._explicitShouldMock:clear();
    v64._explicitShouldMockModule:clear();
    for _, v66 in ipairs(v64._cleanupFns) do
        v66();
    end;
    v64.isTornDown = true;
end;
v11._execModule = function(v67, v68, v69, _, _, v72) --[[ Line: 1821 ]] --[[ Name: _execModule ]]
    -- upvalues: l_Error_0 (copy), l_Object_0 (copy)
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local l_filename_0 = v68.filename;
    if v67._loadedModuleFns and v67._loadedModuleFns:has(l_filename_0) then
        local v78 = v67._loadedModuleFns:get(l_filename_0);
        v73 = v78[1];
        v74 = v78[2];
    else
        local v79, v80, v81 = debug.loadmodule(l_filename_0);
        v73 = v79;
        v75 = v80;
        v76 = v81;
        if v73 == nil then
            error(l_Error_0.new(v75));
        end;
        v74 = getfenv(v73);
        if v67._loadedModuleFns then
            v67._loadedModuleFns:set(l_filename_0, {
                v73, 
                v74, 
                v76
            });
        elseif v76 ~= nil then
            table.insert(v67._cleanupFns, v76);
        end;
    end;
    local v82 = v69 ~= nil and if v69.isInternalModule then v69.isInternalModule else false;
    setfenv(v73, (setmetatable(l_Object_0.assign({
        script = v74.script, 
        require = v82 and function(v83) --[[ Line: 1977 ]]
            -- upvalues: v67 (copy)
            return v67:requireInternalModule(v83);
        end or function(v84) --[[ Line: 1980 ]]
            -- upvalues: v67 (copy)
            return v67:requireModuleOrMock(v84);
        end
    }, if v82 then {} else {
        delay = v67._fakeTimersImplementation.delayOverride, 
        tick = v67._fakeTimersImplementation.tickOverride, 
        time = v67._fakeTimersImplementation.timeOverride, 
        DateTime = v67._fakeTimersImplementation.dateTimeOverride, 
        os = v67._fakeTimersImplementation.osOverride, 
        task = v67._fakeTimersImplementation.taskOverride
    }), {
        __index = v74
    })));
    local v85 = table.pack(v73());
    if v85.n ~= 1 and v72 ~= true then
        error(string.format("[Module Error]: %s did not return a valid result\n" .. "\tModuleScripts must return exactly one value", (tostring(l_filename_0))));
    end;
    v68.exports = v85[1];
end;
v11._shouldMock = function(v86, _, v88, v89, _) --[[ Line: 2221 ]] --[[ Name: _shouldMock ]]
    if v89:has(v88) then
        return (v89:get(v88));
    elseif not v86._shouldAutoMock then
        return false;
    elseif v86._shouldMockModuleCache:has(v88) then
        return (v86._shouldMockModuleCache:get(v88));
    else
        return true;
    end;
end;
v11._createJestObjectFor = function(v91, v92) --[[ Line: 2367 ]] --[[ Name: _createJestObjectFor ]]
    -- upvalues: l_Error_0 (copy)
    local v93 = nil;
    local v94 = nil;
    local function v96(v95) --[[ Line: 2384 ]] --[[ Name: unmock ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91._explicitShouldMock:set(v95, false);
        return v94;
    end;
    local function v100(v97, v98, v99) --[[ Line: 2406 ]] --[[ Name: mock ]]
        -- upvalues: v93 (ref), v91 (copy), v94 (ref)
        if v98 ~= nil then
            return v93(v97, v98, v99);
        else
            v91._explicitShouldMock:set(v97, true);
            return v94;
        end;
    end;
    v93 = function(v101, v102, v103) --[[ Line: 2420 ]] --[[ Name: setMockFactory ]]
        -- upvalues: v91 (copy), v92 (copy), v94 (ref)
        v91:setMock(v92, v101, v102, v103);
        return v94;
    end;
    local function v104() --[[ Line: 2435 ]] --[[ Name: clearAllMocks ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91:clearAllMocks();
        return v94;
    end;
    local function v105() --[[ Line: 2439 ]] --[[ Name: resetAllMocks ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91:resetAllMocks();
        return v94;
    end;
    local function v106() --[[ Line: 2443 ]] --[[ Name: restoreAllMocks ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91:restoreAllMocks();
        return v94;
    end;
    local function v107() --[[ Line: 2447 ]] --[[ Name: _getFakeTimers ]]
        -- upvalues: v91 (copy)
        return v91._fakeTimersImplementation;
    end;
    local function v108() --[[ Line: 2470 ]] --[[ Name: useFakeTimers ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91._fakeTimersImplementation:useFakeTimers();
        return v94;
    end;
    local function v109() --[[ Line: 2484 ]] --[[ Name: useRealTimers ]]
        -- upvalues: v107 (copy), v94 (ref)
        v107():useRealTimers();
        return v94;
    end;
    local function v110() --[[ Line: 2488 ]] --[[ Name: resetModules ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91:resetModules();
        return v94;
    end;
    local function v112(v111) --[[ Line: 2492 ]] --[[ Name: isolateModules ]]
        -- upvalues: v91 (copy), v94 (ref)
        v91:isolateModules(v111);
        return v94;
    end;
    v94 = {
        advanceTimersByTime = function(v113) --[[ Line: 2534 ]] --[[ Name: advanceTimersByTime ]]
            -- upvalues: v107 (copy)
            return v107():advanceTimersByTime(v113);
        end, 
        advanceTimersToNextTimer = function(v114) --[[ Line: 2537 ]] --[[ Name: advanceTimersToNextTimer ]]
            -- upvalues: v107 (copy)
            return v107():advanceTimersToNextTimer(v114);
        end, 
        getEngineFrameTime = function() --[[ Line: 2541 ]] --[[ Name: getEngineFrameTime ]]
            -- upvalues: v107 (copy)
            return v107():getEngineFrameTime();
        end, 
        setEngineFrameTime = function(v115) --[[ Line: 2544 ]] --[[ Name: setEngineFrameTime ]]
            -- upvalues: v107 (copy)
            return v107():setEngineFrameTime(v115);
        end, 
        clearAllMocks = v104, 
        clearAllTimers = function() --[[ Line: 2553 ]] --[[ Name: clearAllTimers ]]
            -- upvalues: v107 (copy)
            return v107():clearAllTimers();
        end, 
        doMock = v100, 
        dontMock = v96, 
        fn = function(...) --[[ Line: 2497 ]]
            -- upvalues: v91 (copy)
            return v91._moduleMocker:fn(...);
        end, 
        getRealSystemTime = function() --[[ Line: 2574 ]] --[[ Name: getRealSystemTime ]]
            -- upvalues: v107 (copy), v91 (copy), l_Error_0 (ref)
            local v116 = v107();
            if v116 == v91._environment.fakeTimersModern then
                return v116:getRealSystemTime();
            else
                error(l_Error_0.new("getRealSystemTime is not available when not using modern timers"));
                return;
            end;
        end, 
        getTimerCount = function() --[[ Line: 2582 ]] --[[ Name: getTimerCount ]]
            -- upvalues: v107 (copy)
            return v107():getTimerCount();
        end, 
        isMockFunction = v91._moduleMocker.isMockFunction, 
        isolateModules = v112, 
        mock = v100, 
        requireActual = function(v117) --[[ Line: 2593 ]] --[[ Name: requireActual ]]
            -- upvalues: v91 (copy), v92 (copy)
            return v91:requireActual(v92, v117);
        end, 
        resetAllMocks = v105, 
        resetModules = v110, 
        restoreAllMocks = v106, 
        runAllTicks = function() --[[ Line: 2614 ]] --[[ Name: runAllTicks ]]
            -- upvalues: v107 (copy)
            return v107():runAllTicks();
        end, 
        runAllTimers = function() --[[ Line: 2617 ]] --[[ Name: runAllTimers ]]
            -- upvalues: v107 (copy)
            return v107():runAllTimers();
        end, 
        runOnlyPendingTimers = function() --[[ Line: 2620 ]] --[[ Name: runOnlyPendingTimers ]]
            -- upvalues: v107 (copy)
            return v107():runOnlyPendingTimers();
        end, 
        jestTimers = v107(), 
        setMock = function(v118, v119) --[[ Line: 2628 ]] --[[ Name: setMock ]]
            -- upvalues: v93 (ref)
            return v93(v118, function() --[[ Line: 2630 ]]
                -- upvalues: v119 (copy)
                return v119;
            end);
        end, 
        setSystemTime = function(v120) --[[ Line: 2634 ]] --[[ Name: setSystemTime ]]
            -- upvalues: v107 (copy), v91 (copy), l_Error_0 (ref)
            local v121 = v107();
            if v121 == v91._environment.fakeTimersModern then
                v121:setSystemTime(v120);
                return;
            else
                error(l_Error_0.new("setSystemTime is not available when not using modern timers"));
                return;
            end;
        end, 
        spyOn = function(...) --[[ Line: 2500 ]]
            -- upvalues: v91 (copy)
            return v91._moduleMocker:spyOn(...);
        end, 
        unmock = v96, 
        useFakeTimers = v108, 
        useRealTimers = v109
    };
    return v94;
end;
v11.getGlobalsFromEnvironment = function(v122) --[[ Line: 2748 ]] --[[ Name: getGlobalsFromEnvironment ]]
    -- upvalues: l_Parent_0 (copy)
    if v122.jestGlobals then
        return table.clone(v122.jestGlobals);
    else
        local v123 = v122:requireModuleOrMock(l_Parent_0.JestSnapshot);
        local v124 = v122:requireModuleOrMock(l_Parent_0.Expect);
        return {
            expect = v124, 
            expectExtended = v124, 
            jestSnapshot = {
                toMatchSnapshot = v123.toMatchSnapshot, 
                toThrowErrorMatchingSnapshot = v123.toThrowErrorMatchingSnapshot
            }
        };
    end;
end;
v11.setGlobalsForRuntime = function(v125, v126) --[[ Line: 2803 ]] --[[ Name: setGlobalsForRuntime ]]
    v125.jestGlobals = v126;
end;
return v11;