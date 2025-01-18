local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local v7 = require(l_Parent_0.JestMockGenv);
local l_GlobalMocker_0 = v7.GlobalMocker;
local _ = require(script.types);
local _ = require(script._types);
local _ = require(l_Parent_0.Expect);
local v12 = require(l_Parent_0.JestFakeTimers);
local v13 = {};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 639 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v12 (copy), l_Map_0 (copy), l_ModuleMocker_0 (copy), l_GlobalMocker_0 (copy), v7 (copy)
    local v15 = setmetatable({}, v13);
    v15.isTornDown = false;
    v15._environment = {
        fakeTimersModern = v12.new()
    };
    v15._explicitShouldMock = l_Map_0.new();
    v15._explicitShouldMockModule = l_Map_0.new();
    v15._internalModuleRegistry = l_Map_0.new();
    v15._mockFactories = l_Map_0.new();
    v15._mockRegistry = l_Map_0.new();
    v15._loadedModuleFns = v14;
    v15._moduleMocker = l_ModuleMocker_0.new();
    v15._globalMocker = l_GlobalMocker_0.new(v7.MOCKABLE_GLOBALS);
    v15._moduleMocker:mockGlobals(v15._globalMocker, getfenv(0));
    v15._isolatedModuleRegistry = nil;
    v15._isolatedMockRegistry = nil;
    v15._moduleRegistry = l_Map_0.new();
    v15._shouldAutoMock = false;
    v15._shouldMockModuleCache = l_Map_0.new();
    v15._fakeTimersImplementation = v15._environment.fakeTimersModern;
    v15._jestObject = v15:_createJestObjectFor(script);
    v15._cleanupFns = {};
    return v15;
end;
v13.requireModule = function(v16, v17, v18, v19, _, v21) --[[ Line: 1136 ]] --[[ Name: requireModule ]]
    local v22 = if v18 == nil then v17 else v18;
    if string.find(v22.Name, ".global$") then
        return require(v22);
    else
        local v23 = typeof(v19) == "table" and v19.isInternalModule ~= nil and v19.isInternalModule;
        local v24 = nil;
        v24 = if v23 then v16._internalModuleRegistry else if v16._isolatedModuleRegistry ~= nil then v16._isolatedModuleRegistry else v16._moduleRegistry;
        local v25 = v24:get(v22);
        if v25 then
            return v25.exports;
        else
            local v26 = {
                exports = {}, 
                filename = v22, 
                id = v22, 
                loaded = false
            };
            v24:set(v22, v26);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1259 ]]
                -- upvalues: v16 (copy), v26 (copy), v17 (copy), v22 (copy), v22 (copy), v19 (copy), v24 (ref), v21 (copy)
                v16:_loadModule(v26, v17, v22, v22, v19, v24, v21);
            end);
            if not l_status_0 then
                v24:delete(v22);
                error(l_result_0);
            end;
            return v26.exports;
        end;
    end;
end;
v13.requireInternalModule = function(v29, v30, v31) --[[ Line: 1271 ]] --[[ Name: requireInternalModule ]]
    return v29:requireModule(v30, v31, {
        isInternalModule = true
    });
end;
v13.requireActual = function(v32, v33, v34) --[[ Line: 1299 ]] --[[ Name: requireActual ]]
    return v32:requireModule(v33, v34, nil, true);
end;
v13.requireMock = function(v35, _, v37) --[[ Line: 1306 ]] --[[ Name: requireMock ]]
    if v35._isolatedMockRegistry ~= nil and v35._isolatedMockRegistry:has(v37) then
        return (v35._isolatedMockRegistry:get(v37));
    elseif v35._mockRegistry:has(v37) then
        return (v35._mockRegistry:get(v37));
    else
        local v38 = v35._isolatedMockRegistry or v35._mockRegistry;
        if v35._mockFactories:has(v37) then
            local v39 = v35._mockFactories:get(v37)();
            v38:set(v37, v39);
            return v39;
        else
            error("manual mocks not implemented yet");
            return;
        end;
    end;
end;
v13._loadModule = function(v40, v41, v42, v43, _, v45, v46, v47) --[[ Line: 1386 ]] --[[ Name: _loadModule ]]
    -- upvalues: l_Boolean_0 (copy)
    v40:_execModule(v41, v45, v46, if l_Boolean_0.toJSBoolean(v43) then v42 else nil, v47);
    v41.loaded = true;
end;
v13.requireModuleOrMock = function(v48, v49) --[[ Line: 1427 ]] --[[ Name: requireModuleOrMock ]]
    -- upvalues: l_Object_0 (copy)
    if v49 == script or typeof(script.Parent) == "ModuleScript" and v49 == script.Parent then
        return require(v49);
    elseif string.find(v49.Name, ".global$") then
        return require(v49);
    elseif v49.Name == "JestGlobals" then
        local v50 = v48:getGlobalsFromEnvironment();
        return (l_Object_0.assign({}, v50, {
            jest = v48._jestObject
        }));
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 1491 ]]
            -- upvalues: v48 (copy), v49 (copy), v49 (copy)
            if v48:_shouldMock(v49, v49, v48._explicitShouldMock, {
                conditions = nil
            }) then
                return v48:requireMock(v49, v49);
            else
                return v48:requireModule(v49, v49);
            end;
        end);
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end;
end;
v13.isolateModules = function(v53, v54) --[[ Line: 1508 ]] --[[ Name: isolateModules ]]
    -- upvalues: l_Error_0 (copy), l_Map_0 (copy)
    if v53._isolatedModuleRegistry ~= nil or v53._isolatedMockRegistry ~= nil then
        error(l_Error_0.new("isolateModules cannot be nested inside another isolateModules."));
    end;
    v53._isolatedModuleRegistry = l_Map_0.new();
    v53._isolatedMockRegistry = l_Map_0.new();
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 1527 ]]
        -- upvalues: v54 (copy)
        v54();
    end);
    if v53._isolatedModuleRegistry then
        v53._isolatedModuleRegistry:clear();
    end;
    if v53._isolatedMockRegistry then
        v53._isolatedMockRegistry:clear();
    end;
    v53._isolatedModuleRegistry = nil;
    v53._isolatedMockRegistry = nil;
    if not l_status_2 then
        error(l_result_2);
    end;
end;
v13.resetModules = function(v57) --[[ Line: 1564 ]] --[[ Name: resetModules ]]
    if v57._isolatedModuleRegistry then
        v57._isolatedModuleRegistry:clear();
    end;
    if v57._isolatedMockRegistry then
        v57._isolatedMockRegistry:clear();
    end;
    v57._isolatedModuleRegistry = nil;
    v57._isolatedMockRegistry = nil;
    v57._mockRegistry:clear();
    v57._moduleRegistry:clear();
end;
v13.setMock = function(v58, _, v60, v61, v62) --[[ Line: 1663 ]] --[[ Name: setMock ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(if typeof(v62) == "table" then v62.virtual else nil) then
        error("virtual mocks not supported");
    end;
    v58._explicitShouldMock:set(v60, true);
    v58._mockFactories:set(v60, v61);
end;
v13.restoreAllMocks = function(v63) --[[ Line: 1703 ]] --[[ Name: restoreAllMocks ]]
    v63._moduleMocker:restoreAllMocks();
end;
v13.resetAllMocks = function(v64) --[[ Line: 1706 ]] --[[ Name: resetAllMocks ]]
    v64._moduleMocker:resetAllMocks();
end;
v13.clearAllMocks = function(v65) --[[ Line: 1709 ]] --[[ Name: clearAllMocks ]]
    v65._moduleMocker:clearAllMocks();
end;
v13.teardown = function(v66) --[[ Line: 1712 ]] --[[ Name: teardown ]]
    v66._moduleMocker:unmockGlobals(v66._globalMocker);
    v66:restoreAllMocks();
    v66:resetAllMocks();
    v66:resetModules();
    v66._internalModuleRegistry:clear();
    v66._mockFactories:clear();
    v66._shouldMockModuleCache:clear();
    v66._explicitShouldMock:clear();
    v66._explicitShouldMockModule:clear();
    for _, v68 in ipairs(v66._cleanupFns) do
        v68();
    end;
    v66.isTornDown = true;
end;
v13._execModule = function(v69, v70, v71, _, _, v74) --[[ Line: 1837 ]] --[[ Name: _execModule ]]
    -- upvalues: l_Error_0 (copy), l_Object_0 (copy)
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local l_filename_0 = v70.filename;
    local v80 = pcall(debug.loadmodule, Instance.new("ModuleScript"));
    if v69._loadedModuleFns and v69._loadedModuleFns:has(l_filename_0) then
        local v81 = v69._loadedModuleFns:get(l_filename_0);
        v75 = v81[1];
        v76 = v81[2];
    else
        if v80 then
            local v82, v83, v84 = debug.loadmodule(l_filename_0);
            v75 = v82;
            v77 = v83;
            v78 = v84;
        else
            v75 = loadstring(l_filename_0.Source, l_filename_0:GetFullName());
        end;
        if v75 == nil then
            error(l_Error_0.new(v77));
        end;
        v76 = getfenv(v75);
        if v69._loadedModuleFns then
            v69._loadedModuleFns:set(l_filename_0, {
                v75, 
                v76, 
                v78
            });
        elseif v78 ~= nil then
            table.insert(v69._cleanupFns, v78);
        end;
    end;
    local v85 = v71 ~= nil and if v71.isInternalModule then v71.isInternalModule else false;
    local v88 = setmetatable({
        script = if v80 then v76.script else l_filename_0, 
        require = v85 and function(v86) --[[ Line: 2000 ]]
            -- upvalues: v69 (copy)
            return v69:requireInternalModule(v86);
        end or function(v87) --[[ Line: 2003 ]]
            -- upvalues: v69 (copy)
            return v69:requireModuleOrMock(v87);
        end
    }, {
        __index = v76
    });
    if not v85 then
        l_Object_0.assign(v88, {
            delay = v69._fakeTimersImplementation.delayOverride, 
            tick = v69._fakeTimersImplementation.tickOverride, 
            time = v69._fakeTimersImplementation.timeOverride, 
            DateTime = v69._fakeTimersImplementation.dateTimeOverride, 
            os = v69._fakeTimersImplementation.osOverride, 
            task = v69._fakeTimersImplementation.taskOverride
        });
    end;
    local v89 = setmetatable({}, {
        __index = v88
    });
    local function v90(v91, v92, v93) --[[ Line: 2025 ]] --[[ Name: setupAutomocks ]]
        -- upvalues: l_Error_0 (ref), v90 (copy)
        for v94, v95 in v91 do
            if v95._isGlobalAutomockFn then
                local _ = v92[v94];
                v93[v94] = function(...) --[[ Line: 2032 ]]
                    -- upvalues: v95 (copy), l_Error_0 (ref)
                    if v95._maybeMock == nil then
                        error(l_Error_0.new("Code should not be running when globalEnv is uninitialised"));
                    end;
                    return v95._maybeMock(...);
                end;
            else
                local v97 = v92[v94];
                local v98 = setmetatable({}, {
                    __index = v97
                });
                v93[v94] = v98;
                v90(v95, v97, v98);
            end;
        end;
    end;
    v90(v69._globalMocker.automocks, v88, v89);
    setfenv(v75, v89);
    local v99 = table.pack(v75());
    if v99.n ~= 1 and v74 ~= true then
        error(string.format("[Module Error]: %s did not return a valid result\n" .. "\tModuleScripts must return exactly one value", (tostring(l_filename_0))));
    end;
    v70.exports = v99[1];
end;
v13._shouldMock = function(v100, _, v102, v103, _) --[[ Line: 2274 ]] --[[ Name: _shouldMock ]]
    if v103:has(v102) then
        return (v103:get(v102));
    elseif not v100._shouldAutoMock then
        return false;
    elseif v100._shouldMockModuleCache:has(v102) then
        return (v100._shouldMockModuleCache:get(v102));
    else
        return true;
    end;
end;
v13._createJestObjectFor = function(v105, v106) --[[ Line: 2421 ]] --[[ Name: _createJestObjectFor ]]
    -- upvalues: l_Error_0 (copy)
    local v107 = nil;
    local v108 = nil;
    local function v110(v109) --[[ Line: 2438 ]] --[[ Name: unmock ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105._explicitShouldMock:set(v109, false);
        return v108;
    end;
    local function v114(v111, v112, v113) --[[ Line: 2460 ]] --[[ Name: mock ]]
        -- upvalues: v107 (ref), v105 (copy), v108 (ref)
        if v112 ~= nil then
            return v107(v111, v112, v113);
        else
            v105._explicitShouldMock:set(v111, true);
            return v108;
        end;
    end;
    v107 = function(v115, v116, v117) --[[ Line: 2474 ]] --[[ Name: setMockFactory ]]
        -- upvalues: v105 (copy), v106 (copy), v108 (ref)
        v105:setMock(v106, v115, v116, v117);
        return v108;
    end;
    local function v118() --[[ Line: 2489 ]] --[[ Name: clearAllMocks ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105:clearAllMocks();
        return v108;
    end;
    local function v119() --[[ Line: 2493 ]] --[[ Name: resetAllMocks ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105:resetAllMocks();
        return v108;
    end;
    local function v120() --[[ Line: 2497 ]] --[[ Name: restoreAllMocks ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105:restoreAllMocks();
        return v108;
    end;
    local function v121() --[[ Line: 2501 ]] --[[ Name: _getFakeTimers ]]
        -- upvalues: v105 (copy)
        return v105._fakeTimersImplementation;
    end;
    local function v122() --[[ Line: 2524 ]] --[[ Name: useFakeTimers ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105._fakeTimersImplementation:useFakeTimers();
        return v108;
    end;
    local function v123() --[[ Line: 2538 ]] --[[ Name: useRealTimers ]]
        -- upvalues: v121 (copy), v108 (ref)
        v121():useRealTimers();
        return v108;
    end;
    local function v124() --[[ Line: 2542 ]] --[[ Name: resetModules ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105:resetModules();
        return v108;
    end;
    local function v126(v125) --[[ Line: 2546 ]] --[[ Name: isolateModules ]]
        -- upvalues: v105 (copy), v108 (ref)
        v105:isolateModules(v125);
        return v108;
    end;
    v108 = {
        advanceTimersByTime = function(v127) --[[ Line: 2589 ]] --[[ Name: advanceTimersByTime ]]
            -- upvalues: v121 (copy)
            return v121():advanceTimersByTime(v127);
        end, 
        advanceTimersToNextTimer = function(v128) --[[ Line: 2592 ]] --[[ Name: advanceTimersToNextTimer ]]
            -- upvalues: v121 (copy)
            return v121():advanceTimersToNextTimer(v128);
        end, 
        getEngineFrameTime = function() --[[ Line: 2596 ]] --[[ Name: getEngineFrameTime ]]
            -- upvalues: v121 (copy)
            return v121():getEngineFrameTime();
        end, 
        setEngineFrameTime = function(v129) --[[ Line: 2599 ]] --[[ Name: setEngineFrameTime ]]
            -- upvalues: v121 (copy)
            return v121():setEngineFrameTime(v129);
        end, 
        clearAllMocks = v118, 
        clearAllTimers = function() --[[ Line: 2608 ]] --[[ Name: clearAllTimers ]]
            -- upvalues: v121 (copy)
            return v121():clearAllTimers();
        end, 
        doMock = v114, 
        dontMock = v110, 
        fn = function(...) --[[ Line: 2551 ]]
            -- upvalues: v105 (copy)
            return v105._moduleMocker:fn(...);
        end, 
        getRealSystemTime = function() --[[ Line: 2629 ]] --[[ Name: getRealSystemTime ]]
            -- upvalues: v121 (copy), v105 (copy), l_Error_0 (ref)
            local v130 = v121();
            if v130 == v105._environment.fakeTimersModern then
                return v130:getRealSystemTime();
            else
                error(l_Error_0.new("getRealSystemTime is not available when not using modern timers"));
                return;
            end;
        end, 
        getTimerCount = function() --[[ Line: 2637 ]] --[[ Name: getTimerCount ]]
            -- upvalues: v121 (copy)
            return v121():getTimerCount();
        end, 
        globalEnv = v105._globalMocker.envObject, 
        isMockFunction = v105._moduleMocker.isMockFunction, 
        isolateModules = v126, 
        mock = v114, 
        requireActual = function(v131) --[[ Line: 2650 ]] --[[ Name: requireActual ]]
            -- upvalues: v105 (copy), v106 (copy)
            return v105:requireActual(v106, v131);
        end, 
        resetAllMocks = v119, 
        resetModules = v124, 
        restoreAllMocks = v120, 
        runAllTicks = function() --[[ Line: 2671 ]] --[[ Name: runAllTicks ]]
            -- upvalues: v121 (copy)
            return v121():runAllTicks();
        end, 
        runAllTimers = function() --[[ Line: 2674 ]] --[[ Name: runAllTimers ]]
            -- upvalues: v121 (copy)
            return v121():runAllTimers();
        end, 
        runOnlyPendingTimers = function() --[[ Line: 2677 ]] --[[ Name: runOnlyPendingTimers ]]
            -- upvalues: v121 (copy)
            return v121():runOnlyPendingTimers();
        end, 
        jestTimers = v121(), 
        setMock = function(v132, v133) --[[ Line: 2685 ]] --[[ Name: setMock ]]
            -- upvalues: v107 (ref)
            return v107(v132, function() --[[ Line: 2687 ]]
                -- upvalues: v133 (copy)
                return v133;
            end);
        end, 
        setSystemTime = function(v134) --[[ Line: 2691 ]] --[[ Name: setSystemTime ]]
            -- upvalues: v121 (copy), v105 (copy), l_Error_0 (ref)
            local v135 = v121();
            if v135 == v105._environment.fakeTimersModern then
                v135:setSystemTime(v134);
                return;
            else
                error(l_Error_0.new("setSystemTime is not available when not using modern timers"));
                return;
            end;
        end, 
        spyOn = function(...) --[[ Line: 2554 ]]
            -- upvalues: v105 (copy)
            return v105._moduleMocker:spyOn(...);
        end, 
        unmock = v110, 
        useFakeTimers = v122, 
        useRealTimers = v123
    };
    return v108;
end;
v13.getGlobalsFromEnvironment = function(v136) --[[ Line: 2805 ]] --[[ Name: getGlobalsFromEnvironment ]]
    -- upvalues: l_Parent_0 (copy)
    if v136.jestGlobals then
        return table.clone(v136.jestGlobals);
    else
        local v137 = v136:requireModuleOrMock(l_Parent_0.JestSnapshot);
        local v138 = v136:requireModuleOrMock(l_Parent_0.Expect);
        return {
            expect = v138, 
            expectExtended = v138, 
            jestSnapshot = {
                toMatchSnapshot = v137.toMatchSnapshot, 
                toThrowErrorMatchingSnapshot = v137.toThrowErrorMatchingSnapshot
            }
        };
    end;
end;
v13.setGlobalsForRuntime = function(v139, v140) --[[ Line: 2860 ]] --[[ Name: setGlobalsForRuntime ]]
    v139.jestGlobals = v140;
end;
return v13;