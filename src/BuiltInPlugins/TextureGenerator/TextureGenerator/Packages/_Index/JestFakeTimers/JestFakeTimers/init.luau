local l_Parent_0 = script.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local l_delay_0 = delay;
local l_tick_0 = tick;
local l_time_0 = time;
local l_DateTime_0 = DateTime;
local l_os_0 = os;
local l_task_0 = task;
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 68 ]] --[[ Name: new ]]
    -- upvalues: l_ModuleMocker_0 (copy), l_delay_0 (copy), l_tick_0 (copy), l_time_0 (copy), l_DateTime_0 (copy), l_os_0 (copy), l_task_0 (copy), v9 (copy)
    local v10 = l_ModuleMocker_0.new();
    local v11 = v10:fn(l_delay_0);
    local v12 = v10:fn(l_tick_0);
    local v13 = v10:fn(l_time_0);
    local v14 = {
        now = v10:fn(l_DateTime_0.now), 
        fromUnixTimestamp = l_DateTime_0.fromUnixTimestamp, 
        fromUnixTimestampMillis = l_DateTime_0.fromUnixTimestampMillis, 
        fromUniversalTime = l_DateTime_0.fromUniversalTime, 
        fromLocalTime = l_DateTime_0.fromLocalTime, 
        fromIsoDate = l_DateTime_0.fromIsoDate
    };
    local v15 = {
        time = v10:fn(l_os_0.time), 
        clock = v10:fn(l_os_0.clock)
    };
    setmetatable(v15, {
        __index = l_os_0
    });
    local v16 = {
        delay = v10:fn(l_task_0.delay), 
        cancel = v10:fn(l_task_0.cancel)
    };
    setmetatable(v16, {
        __index = l_task_0
    });
    local v17 = {
        _fakingTime = false, 
        _timeouts = {}, 
        _mock = v10, 
        _mockTimeMs = 0, 
        _mockSystemTime = l_DateTime_0.now().UnixTimestamp, 
        _engineFrameTime = 0, 
        delayOverride = v11, 
        tickOverride = v12, 
        timeOverride = v13, 
        dateTimeOverride = v14, 
        osOverride = v15, 
        taskOverride = v16
    };
    setmetatable(v17, v9);
    return v17;
end;
v9._advanceToTime = function(v18, v19) --[[ Line: 112 ]] --[[ Name: _advanceToTime ]]
    local l_v19_0 = v19;
    if v18._mockTimeMs < v19 then
        if v18._engineFrameTime > 0 then
            l_v19_0 = math.floor(v19 / v18._engineFrameTime) * v18._engineFrameTime;
        end;
        local v21 = l_v19_0 - v18._mockTimeMs;
        v18._mockTimeMs = l_v19_0;
        v18._mockSystemTime = v18._mockSystemTime + v21 / 1000;
    end;
end;
v9.clearAllTimers = function(v22) --[[ Line: 127 ]] --[[ Name: clearAllTimers ]]
    if v22._fakingTime then
        v22._timeouts = {};
    end;
end;
v9.dispose = function(v23) --[[ Line: 133 ]] --[[ Name: dispose ]]
    v23:useRealTimers();
end;
v9.runAllTimers = function(v24) --[[ Line: 137 ]] --[[ Name: runAllTimers ]]
    if v24:_checkFakeTimers() then
        for _, v26 in v24._timeouts do
            v24:_advanceToTime(v26.time + v24._engineFrameTime);
            v26.callback(unpack(v26.args));
        end;
    end;
    v24._timeouts = {};
end;
v9.runOnlyPendingTimers = function(v27) --[[ Line: 147 ]] --[[ Name: runOnlyPendingTimers ]]
    if v27:_checkFakeTimers() then
        local v28 = {};
        for _, v30 in v27._timeouts do
            table.insert(v28, v30);
        end;
        v27._timeouts = {};
        for _, v32 in v28 do
            v27:_advanceToTime(v32.time + v27._engineFrameTime);
            v32.callback(unpack(v32.args));
        end;
    end;
end;
v9.advanceTimersToNextTimer = function(v33, v34) --[[ Line: 163 ]] --[[ Name: advanceTimersToNextTimer ]]
    local v35 = v34 or 1;
    if v33:_checkFakeTimers() then
        local v36 = {};
        local v37 = -1;
        for _, v39 in v33._timeouts do
            if v37 < v39.time and v35 > 0 then
                v37 = if v33._engineFrameTime > 0 then math.floor(v39.time / v33._engineFrameTime + 1) * v33._engineFrameTime else v39.time;
                v33:_advanceToTime(v37);
                v35 = v35 - 1;
            end;
            if v33._mockTimeMs >= v39.time then
                v39.callback(unpack(v39.args));
            else
                table.insert(v36, v39);
            end;
        end;
        v33._timeouts = v36;
    end;
end;
v9.advanceTimersByTime = function(v40, v41) --[[ Line: 190 ]] --[[ Name: advanceTimersByTime ]]
    if v40:_checkFakeTimers() then
        local v42 = v40._mockTimeMs + v41;
        if v40._engineFrameTime > 0 then
            v42 = (math.floor(v42 / v40._engineFrameTime) + 1) * v40._engineFrameTime;
        end;
        local v43 = {};
        for _, v45 in v40._timeouts do
            if v45.time <= v42 then
                v40:_advanceToTime(v45.time + v40._engineFrameTime);
                v45.callback(unpack(v45.args));
            else
                table.insert(v43, v45);
            end;
        end;
        v40:_advanceToTime(v42);
        v40._timeouts = v43;
    end;
end;
v9.runAllTicks = function(v46) --[[ Line: 210 ]] --[[ Name: runAllTicks ]]
    if v46:_checkFakeTimers() then
        error("not implemented");
    end;
end;
v9.useRealTimers = function(v47) --[[ Line: 216 ]] --[[ Name: useRealTimers ]]
    -- upvalues: l_delay_0 (copy), l_tick_0 (copy), l_time_0 (copy), l_DateTime_0 (copy), l_os_0 (copy), l_task_0 (copy)
    if v47._fakingTime then
        v47.delayOverride.mockImplementation(l_delay_0);
        v47.tickOverride.mockImplementation(l_tick_0);
        v47.timeOverride.mockImplementation(l_time_0);
        v47.dateTimeOverride.now.mockImplementation(l_DateTime_0.now);
        v47.osOverride.time.mockImplementation(l_os_0.time);
        v47.osOverride.clock.mockImplementation(l_os_0.clock);
        v47.taskOverride.delay.mockImplementation(l_task_0.delay);
        v47.taskOverride.cancel.mockImplementation(l_task_0.cancel);
        v47._fakingTime = false;
    end;
end;
local function v57(v48, v49, v50, ...) --[[ Line: 230 ]] --[[ Name: fakeDelay ]]
    local v51 = v48._engineFrameTime / 1000 + v49 * 1000;
    local v52 = v48._mockTimeMs + v51;
    local v53 = {
        time = v52, 
        callback = v50, 
        args = {
            ...
        }
    };
    local v54 = #v48._timeouts + 1;
    for v55, v56 in v48._timeouts do
        if v52 < v56.time then
            v54 = v55;
            break;
        end;
    end;
    table.insert(v48._timeouts, v54, v53);
    return v53;
end;
local function v62(v58, v59) --[[ Line: 254 ]] --[[ Name: fakeCancel ]]
    for v60, v61 in v58._timeouts do
        if v61 == v59 then
            table.remove(v58._timeouts, v60);
            return;
        end;
    end;
end;
v9.useFakeTimers = function(v63) --[[ Line: 263 ]] --[[ Name: useFakeTimers ]]
    -- upvalues: v57 (copy), l_DateTime_0 (copy), v62 (copy)
    if not v63._fakingTime then
        v63.delayOverride.mockImplementation(function(v64, v65) --[[ Line: 265 ]]
            -- upvalues: v57 (ref), v63 (copy)
            return v57(v63, v64, v65);
        end);
        v63.tickOverride.mockImplementation(function() --[[ Line: 268 ]]
            -- upvalues: v63 (copy)
            return v63._mockSystemTime;
        end);
        v63.timeOverride.mockImplementation(function() --[[ Line: 271 ]]
            -- upvalues: v63 (copy)
            return v63._mockTimeMs / 1000;
        end);
        v63.dateTimeOverride.now.mockImplementation(function() --[[ Line: 274 ]]
            -- upvalues: l_DateTime_0 (ref), v63 (copy)
            return l_DateTime_0.fromUnixTimestamp(v63._mockSystemTime);
        end);
        v63.osOverride.time.mockImplementation(function(v66) --[[ Line: 277 ]]
            -- upvalues: l_DateTime_0 (ref), v63 (copy)
            if typeof(v66) == "table" then
                local l_UnixTimestamp_0 = l_DateTime_0.fromUniversalTime(v66.year or 1970, v66.month or 1, v66.day or 1, v66.hour or 0, v66.min or 0, v66.sec or 0).UnixTimestamp;
                return v63._mockSystemTime - l_UnixTimestamp_0;
            else
                return v63._mockSystemTime;
            end;
        end);
        v63.osOverride.clock.mockImplementation(function() --[[ Line: 291 ]]
            -- upvalues: v63 (copy)
            return v63._mockTimeMs / 1000;
        end);
        v63.taskOverride.delay.mockImplementation(function(v68, v69, ...) --[[ Line: 294 ]]
            -- upvalues: v57 (ref), v63 (copy)
            return v57(v63, v68, v69, ...);
        end);
        v63.taskOverride.cancel.mockImplementation(function(v70) --[[ Line: 298 ]]
            -- upvalues: v62 (ref), v63 (copy)
            v62(v63, v70);
        end);
        v63._fakingTime = true;
        v63:reset();
    end;
end;
v9.reset = function(v71) --[[ Line: 307 ]] --[[ Name: reset ]]
    -- upvalues: l_DateTime_0 (copy)
    if v71:_checkFakeTimers() then
        v71._mock:clearAllMocks();
        v71._timeouts = {};
        v71._mockTimeMs = 0;
        v71._mockSystemTime = l_DateTime_0.now().UnixTimestamp;
        v71._engineFrameTime = 0;
    end;
end;
v9.setSystemTime = function(v72, v73) --[[ Line: 317 ]] --[[ Name: setSystemTime ]]
    -- upvalues: l_DateTime_0 (copy), l_getType_0 (copy)
    if v72:_checkFakeTimers() then
        if not v73 then
            v73 = l_DateTime_0.now();
        end;
        if l_getType_0(v73) == "DateTime" then
            v73 = v73.UnixTimestamp;
        end;
        v72._mockSystemTime = v73;
    end;
end;
v9.setEngineFrameTime = function(v74, v75) --[[ Line: 329 ]] --[[ Name: setEngineFrameTime ]]
    if v74:_checkFakeTimers() then
        if v75 < 0 then
            error("Frame Time should be greater than 0");
        end;
        v74._engineFrameTime = v75;
    end;
end;
v9.getEngineFrameTime = function(v76) --[[ Line: 339 ]] --[[ Name: getEngineFrameTime ]]
    if v76:_checkFakeTimers() then
        return v76._engineFrameTime;
    else
        return 0;
    end;
end;
v9.getRealSystemTime = function(_) --[[ Line: 346 ]] --[[ Name: getRealSystemTime ]]
    -- upvalues: l_DateTime_0 (copy)
    return l_DateTime_0.now();
end;
v9.getTimerCount = function(v78) --[[ Line: 350 ]] --[[ Name: getTimerCount ]]
    if v78:_checkFakeTimers() then
        return #v78._timeouts;
    else
        return 0;
    end;
end;
v9._checkFakeTimers = function(v79) --[[ Line: 358 ]] --[[ Name: _checkFakeTimers ]]
    if not v79._fakingTime then
        error("A function to advance timers was called but the timers API is not " .. "mocked with fake timers. Call `jest.useFakeTimers()` in this test.");
    end;
    return v79._fakingTime;
end;
return v9;