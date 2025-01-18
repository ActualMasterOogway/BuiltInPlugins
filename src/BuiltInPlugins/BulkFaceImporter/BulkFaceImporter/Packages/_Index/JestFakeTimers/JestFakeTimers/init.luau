local l_Parent_0 = script.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local l_delay_0 = delay;
local l_tick_0 = tick;
local l_DateTime_0 = DateTime;
local l_os_0 = os;
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: l_ModuleMocker_0 (copy), l_delay_0 (copy), l_tick_0 (copy), l_DateTime_0 (copy), l_os_0 (copy), v7 (copy)
    local v8 = l_ModuleMocker_0.new();
    local v9 = v8:fn(l_delay_0);
    local v10 = v8:fn(l_tick_0);
    local v11 = {
        now = v8:fn(l_DateTime_0.now), 
        fromUnixTimestamp = l_DateTime_0.fromUnixTimestamp, 
        fromUnixTimestampMillis = l_DateTime_0.fromUnixTimestampMillis, 
        fromUniversalTime = l_DateTime_0.fromUniversalTime, 
        fromLocalTime = l_DateTime_0.fromLocalTime, 
        fromIsoDate = l_DateTime_0.fromIsoDate
    };
    local v12 = {
        time = v8:fn(l_os_0.time), 
        clock = v8:fn(l_os_0.clock)
    };
    setmetatable(v12, {
        __index = l_os_0
    });
    local v13 = {
        _fakingTime = false, 
        _timeouts = {}, 
        _mock = v8, 
        _mockTime = 0, 
        _mockSystemTime = l_DateTime_0.now().UnixTimestamp, 
        delayOverride = v9, 
        tickOverride = v10, 
        dateTimeOverride = v11, 
        osOverride = v12
    };
    setmetatable(v13, v7);
    return v13;
end;
v7._advanceToTime = function(v14, v15) --[[ Line: 77 ]] --[[ Name: _advanceToTime ]]
    if v14._mockTime < v15 then
        local v16 = v15 - v14._mockTime;
        v14._mockTime = v15;
        v14._mockSystemTime = v14._mockSystemTime + v16;
    end;
end;
v7.clearAllTimers = function(v17) --[[ Line: 87 ]] --[[ Name: clearAllTimers ]]
    if v17._fakingTime then
        v17._timeouts = {};
    end;
end;
v7.dispose = function(v18) --[[ Line: 93 ]] --[[ Name: dispose ]]
    v18:useRealTimers();
end;
v7.runAllTimers = function(v19) --[[ Line: 97 ]] --[[ Name: runAllTimers ]]
    if v19:_checkFakeTimers() then
        for _, v21 in ipairs(v19._timeouts) do
            v19:_advanceToTime(v21.time);
            v21.callback();
        end;
    end;
    v19._timeouts = {};
end;
v7.runOnlyPendingTimers = function(v22) --[[ Line: 107 ]] --[[ Name: runOnlyPendingTimers ]]
    if v22:_checkFakeTimers() then
        local v23 = {};
        for _, v25 in ipairs(v22._timeouts) do
            table.insert(v23, v25);
        end;
        v22._timeouts = {};
        for _, v27 in ipairs(v23) do
            v22:_advanceToTime(v27.time);
            v27.callback();
        end;
    end;
end;
v7.advanceTimersToNextTimer = function(v28, v29) --[[ Line: 123 ]] --[[ Name: advanceTimersToNextTimer ]]
    local v30 = v29 or 1;
    if v28:_checkFakeTimers() then
        local v31 = {};
        local v32 = -1;
        for _, v34 in ipairs(v28._timeouts) do
            if v32 < v34.time and v30 > 0 then
                v32 = v34.time;
                v28:_advanceToTime(v32);
                v30 = v30 - 1;
            end;
            if v28._mockTime >= v34.time then
                v34.callback();
            else
                table.insert(v31, v34);
            end;
        end;
        v28._timeouts = v31;
    end;
end;
v7.advanceTimersByTime = function(v35, v36) --[[ Line: 146 ]] --[[ Name: advanceTimersByTime ]]
    if v35:_checkFakeTimers() then
        local v37 = v35._mockTime + v36;
        local v38 = {};
        for _, v40 in ipairs(v35._timeouts) do
            if v40.time <= v37 then
                v35:_advanceToTime(v40.time);
                v40.callback();
            else
                table.insert(v38, v40);
            end;
        end;
        v35:_advanceToTime(v37);
        v35._timeouts = v38;
    end;
end;
v7.runAllTicks = function(v41) --[[ Line: 163 ]] --[[ Name: runAllTicks ]]
    if v41:_checkFakeTimers() then
        error("not implemented");
    end;
end;
v7.useRealTimers = function(v42) --[[ Line: 169 ]] --[[ Name: useRealTimers ]]
    -- upvalues: l_delay_0 (copy), l_tick_0 (copy), l_DateTime_0 (copy), l_os_0 (copy)
    if v42._fakingTime then
        v42.delayOverride.mockImplementation(l_delay_0);
        v42.tickOverride.mockImplementation(l_tick_0);
        v42.dateTimeOverride.now.mockImplementation(l_DateTime_0.now);
        v42.osOverride.time.mockImplementation(l_os_0.time);
        v42.osOverride.clock.mockImplementation(l_os_0.clock);
        v42._fakingTime = false;
    end;
end;
v7.useFakeTimers = function(v43) --[[ Line: 180 ]] --[[ Name: useFakeTimers ]]
    -- upvalues: l_DateTime_0 (copy)
    if not v43._fakingTime then
        v43.delayOverride.mockImplementation(function(v44, v45) --[[ Line: 182 ]]
            -- upvalues: v43 (copy)
            local v46 = v43._mockTime + v44;
            local v47 = {
                time = v46, 
                callback = v45
            };
            local v48 = #v43._timeouts + 1;
            for v49, v50 in ipairs(v43._timeouts) do
                if v46 < v50.time then
                    v48 = v49;
                    break;
                end;
            end;
            table.insert(v43._timeouts, v48, v47);
        end);
        v43.tickOverride.mockImplementation(function() --[[ Line: 201 ]]
            -- upvalues: v43 (copy)
            return v43._mockSystemTime;
        end);
        v43.dateTimeOverride.now.mockImplementation(function() --[[ Line: 204 ]]
            -- upvalues: l_DateTime_0 (ref), v43 (copy)
            return l_DateTime_0.fromUnixTimestamp(v43._mockSystemTime);
        end);
        v43.osOverride.time.mockImplementation(function(v51) --[[ Line: 207 ]]
            -- upvalues: l_DateTime_0 (ref), v43 (copy)
            if typeof(v51) == "table" then
                local l_UnixTimestamp_0 = l_DateTime_0.fromUniversalTime(v51.year or 1970, v51.month or 1, v51.day or 1, v51.hour or 0, v51.min or 0, v51.sec or 0).UnixTimestamp;
                return v43._mockSystemTime - l_UnixTimestamp_0;
            else
                return v43._mockSystemTime;
            end;
        end);
        v43.osOverride.clock.mockImplementation(function() --[[ Line: 221 ]]
            -- upvalues: v43 (copy)
            return v43._mockTime;
        end);
        v43._fakingTime = true;
        v43:reset();
    end;
end;
v7.reset = function(v53) --[[ Line: 229 ]] --[[ Name: reset ]]
    -- upvalues: l_DateTime_0 (copy)
    if v53:_checkFakeTimers() then
        v53._mock:clearAllMocks();
        v53._timeouts = {};
        v53._mockTime = 0;
        v53._mockSystemTime = l_DateTime_0.now().UnixTimestamp;
    end;
end;
v7.setSystemTime = function(v54, v55) --[[ Line: 238 ]] --[[ Name: setSystemTime ]]
    -- upvalues: l_DateTime_0 (copy), l_getType_0 (copy)
    if v54:_checkFakeTimers() then
        if not v55 then
            v55 = l_DateTime_0.now();
        end;
        if l_getType_0(v55) == "DateTime" then
            v55 = v55.UnixTimestamp;
        end;
        v54._mockSystemTime = v55;
    end;
end;
v7.getRealSystemTime = function(_) --[[ Line: 250 ]] --[[ Name: getRealSystemTime ]]
    -- upvalues: l_DateTime_0 (copy)
    return l_DateTime_0.now();
end;
v7.getTimerCount = function(v57) --[[ Line: 254 ]] --[[ Name: getTimerCount ]]
    if v57:_checkFakeTimers() then
        return #v57._timeouts;
    else
        return 0;
    end;
end;
v7._checkFakeTimers = function(v58) --[[ Line: 262 ]] --[[ Name: _checkFakeTimers ]]
    if not v58._fakingTime then
        error("A function to advance timers was called but the timers API is not " .. "mocked with fake timers. Call `jest.useFakeTimers()` in this test.");
    end;
    return v58._fakingTime;
end;
return v7;