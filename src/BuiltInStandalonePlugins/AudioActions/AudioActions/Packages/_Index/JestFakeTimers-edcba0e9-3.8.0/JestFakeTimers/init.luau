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
        cancel = v10:fn(l_task_0.cancel), 
        wait = v10:fn(l_task_0.wait)
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
v9._advanceToTime = function(v18, v19) --[[ Line: 113 ]] --[[ Name: _advanceToTime ]]
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
v9.clearAllTimers = function(v22) --[[ Line: 128 ]] --[[ Name: clearAllTimers ]]
    if v22._fakingTime then
        v22._timeouts = {};
    end;
end;
v9.dispose = function(v23) --[[ Line: 134 ]] --[[ Name: dispose ]]
    v23:useRealTimers();
end;
v9.runAllTimers = function(v24) --[[ Line: 138 ]] --[[ Name: runAllTimers ]]
    if v24:_checkFakeTimers() then
        for _, v26 in v24._timeouts do
            v24:_advanceToTime(v26.time + v24._engineFrameTime);
            v26.callback(unpack(v26.args));
        end;
    end;
    v24._timeouts = {};
end;
v9.runOnlyPendingTimers = function(v27) --[[ Line: 148 ]] --[[ Name: runOnlyPendingTimers ]]
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
v9.advanceTimersToNextTimer = function(v33, v34) --[[ Line: 164 ]] --[[ Name: advanceTimersToNextTimer ]]
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
v9.advanceTimersByTime = function(v40, v41) --[[ Line: 191 ]] --[[ Name: advanceTimersByTime ]]
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
v9.runAllTicks = function(v46) --[[ Line: 211 ]] --[[ Name: runAllTicks ]]
    if v46:_checkFakeTimers() then
        error("not implemented");
    end;
end;
v9.useRealTimers = function(v47) --[[ Line: 217 ]] --[[ Name: useRealTimers ]]
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
        v47.taskOverride.wait.mockImplementation(l_task_0.wait);
        v47._fakingTime = false;
    end;
end;
local function _(v48) --[[ Line: 232 ]] --[[ Name: fakeClock ]]
    return v48._mockTimeMs / 1000;
end;
local function v59(v50, v51, v52, ...) --[[ Line: 236 ]] --[[ Name: fakeDelay ]]
    local v53 = v50._engineFrameTime / 1000 + v51 * 1000;
    local v54 = v50._mockTimeMs + v53;
    local v55 = {
        time = v54, 
        callback = v52, 
        args = {
            ...
        }
    };
    local v56 = #v50._timeouts + 1;
    for v57, v58 in v50._timeouts do
        if v54 < v58.time then
            v56 = v57;
            break;
        end;
    end;
    table.insert(v50._timeouts, v56, v55);
    return v55;
end;
local function v64(v60, v61) --[[ Line: 260 ]] --[[ Name: fakeCancel ]]
    for v62, v63 in v60._timeouts do
        if v63 == v61 then
            table.remove(v60._timeouts, v62);
            return;
        end;
    end;
end;
local function v69(v65, v66) --[[ Line: 269 ]] --[[ Name: fakeWait ]]
    -- upvalues: v59 (copy)
    local v67 = coroutine.running();
    local v68 = v65._mockTimeMs / 1000;
    v59(v65, v66 or 0, function() --[[ Line: 272 ]]
        -- upvalues: v67 (copy), v65 (copy), v68 (copy)
        task.spawn(v67, v65._mockTimeMs / 1000 - v68);
    end);
    return coroutine.yield();
end;
v9.useFakeTimers = function(v70) --[[ Line: 278 ]] --[[ Name: useFakeTimers ]]
    -- upvalues: v59 (copy), l_DateTime_0 (copy), v64 (copy), v69 (copy)
    if not v70._fakingTime then
        v70.delayOverride.mockImplementation(function(v71, v72) --[[ Line: 280 ]]
            -- upvalues: v59 (ref), v70 (copy)
            return v59(v70, v71, v72);
        end);
        v70.tickOverride.mockImplementation(function() --[[ Line: 284 ]]
            -- upvalues: v70 (copy)
            return v70._mockSystemTime;
        end);
        v70.timeOverride.mockImplementation(function() --[[ Line: 288 ]]
            -- upvalues: v70 (copy)
            return v70._mockTimeMs / 1000;
        end);
        v70.dateTimeOverride.now.mockImplementation(function() --[[ Line: 292 ]]
            -- upvalues: l_DateTime_0 (ref), v70 (copy)
            return l_DateTime_0.fromUnixTimestamp(v70._mockSystemTime);
        end);
        v70.osOverride.time.mockImplementation(function(v73) --[[ Line: 296 ]]
            -- upvalues: l_DateTime_0 (ref), v70 (copy)
            if typeof(v73) == "table" then
                local l_UnixTimestamp_0 = l_DateTime_0.fromUniversalTime(v73.year or 1970, v73.month or 1, v73.day or 1, v73.hour or 0, v73.min or 0, v73.sec or 0).UnixTimestamp;
                return v70._mockSystemTime - l_UnixTimestamp_0;
            else
                return v70._mockSystemTime;
            end;
        end);
        v70.osOverride.clock.mockImplementation(function() --[[ Line: 311 ]]
            -- upvalues: v70 (copy)
            return v70._mockTimeMs / 1000;
        end);
        v70.taskOverride.delay.mockImplementation(function(v75, v76, ...) --[[ Line: 315 ]]
            -- upvalues: v59 (ref), v70 (copy)
            return v59(v70, v75, v76, ...);
        end);
        v70.taskOverride.cancel.mockImplementation(function(v77) --[[ Line: 319 ]]
            -- upvalues: v64 (ref), v70 (copy)
            v64(v70, v77);
        end);
        v70.taskOverride.wait.mockImplementation(function(v78) --[[ Line: 323 ]]
            -- upvalues: v69 (ref), v70 (copy)
            return v69(v70, v78);
        end);
        v70._fakingTime = true;
        v70:reset();
    end;
end;
v9.reset = function(v79) --[[ Line: 332 ]] --[[ Name: reset ]]
    -- upvalues: l_DateTime_0 (copy)
    if v79:_checkFakeTimers() then
        v79._mock:clearAllMocks();
        v79._timeouts = {};
        v79._mockTimeMs = 0;
        v79._mockSystemTime = l_DateTime_0.now().UnixTimestamp;
        v79._engineFrameTime = 0;
    end;
end;
v9.setSystemTime = function(v80, v81) --[[ Line: 342 ]] --[[ Name: setSystemTime ]]
    -- upvalues: l_DateTime_0 (copy), l_getType_0 (copy)
    if v80:_checkFakeTimers() then
        if not v81 then
            v81 = l_DateTime_0.now();
        end;
        if l_getType_0(v81) == "DateTime" then
            v81 = v81.UnixTimestamp;
        end;
        v80._mockSystemTime = v81;
    end;
end;
v9.setEngineFrameTime = function(v82, v83) --[[ Line: 354 ]] --[[ Name: setEngineFrameTime ]]
    if v82:_checkFakeTimers() then
        if v83 < 0 then
            error("Frame Time should be greater than 0");
        end;
        v82._engineFrameTime = v83;
    end;
end;
v9.getEngineFrameTime = function(v84) --[[ Line: 364 ]] --[[ Name: getEngineFrameTime ]]
    if v84:_checkFakeTimers() then
        return v84._engineFrameTime;
    else
        return 0;
    end;
end;
v9.getRealSystemTime = function(_) --[[ Line: 371 ]] --[[ Name: getRealSystemTime ]]
    -- upvalues: l_DateTime_0 (copy)
    return l_DateTime_0.now();
end;
v9.getTimerCount = function(v86) --[[ Line: 375 ]] --[[ Name: getTimerCount ]]
    if v86:_checkFakeTimers() then
        return #v86._timeouts;
    else
        return 0;
    end;
end;
v9._checkFakeTimers = function(v87) --[[ Line: 383 ]] --[[ Name: _checkFakeTimers ]]
    if not v87._fakingTime then
        error("A function to advance timers was called but the timers API is not " .. "mocked with fake timers. Call `jest.useFakeTimers()` in this test.");
    end;
    return v87._fakingTime;
end;
return v9;