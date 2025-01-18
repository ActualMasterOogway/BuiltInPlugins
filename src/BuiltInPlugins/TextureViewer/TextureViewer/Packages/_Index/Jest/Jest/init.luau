local l_Parent_0 = script.Parent;
local l_ModuleMocker_0 = require(l_Parent_0.JestMock).ModuleMocker;
local v2 = require(l_Parent_0.JestFakeTimers).new();
local v3 = l_ModuleMocker_0.new();
return {
    fn = function(...) --[[ Line: 64 ]] --[[ Name: fn ]]
        -- upvalues: v3 (copy)
        return v3:fn(...);
    end, 
    clearAllMocks = function() --[[ Line: 67 ]] --[[ Name: clearAllMocks ]]
        -- upvalues: v3 (copy)
        return v3:clearAllMocks();
    end, 
    resetAllMocks = function() --[[ Line: 70 ]] --[[ Name: resetAllMocks ]]
        -- upvalues: v3 (copy)
        return v3:resetAllMocks();
    end, 
    _mock = v3, 
    useFakeTimers = function() --[[ Line: 75 ]] --[[ Name: useFakeTimers ]]
        -- upvalues: v2 (copy)
        return v2:useFakeTimers();
    end, 
    useRealTimers = function() --[[ Line: 78 ]] --[[ Name: useRealTimers ]]
        -- upvalues: v2 (copy)
        return v2:useRealTimers();
    end, 
    runAllTicks = function() --[[ Line: 81 ]] --[[ Name: runAllTicks ]]
        -- upvalues: v2 (copy)
        return v2:runAllTicks();
    end, 
    runAllTimers = function() --[[ Line: 84 ]] --[[ Name: runAllTimers ]]
        -- upvalues: v2 (copy)
        return v2:runAllTimers();
    end, 
    advanceTimersByTime = function(v4) --[[ Line: 87 ]] --[[ Name: advanceTimersByTime ]]
        -- upvalues: v2 (copy)
        v2:advanceTimersByTime(v4);
    end, 
    runTimersToTime = function(v5) --[[ Line: 90 ]] --[[ Name: runTimersToTime ]]
        -- upvalues: v2 (copy)
        v2:advanceTimersByTime(v5);
    end, 
    runOnlyPendingTimers = function() --[[ Line: 93 ]] --[[ Name: runOnlyPendingTimers ]]
        -- upvalues: v2 (copy)
        v2:runOnlyPendingTimers();
    end, 
    advanceTimerstoNextTimer = function(v6) --[[ Line: 96 ]] --[[ Name: advanceTimerstoNextTimer ]]
        -- upvalues: v2 (copy)
        v2:advanceTimerstoNextTimer(v6);
    end, 
    clearAllTimers = function() --[[ Line: 99 ]] --[[ Name: clearAllTimers ]]
        -- upvalues: v2 (copy)
        v2:clearAllTimers();
    end, 
    getTimerCount = function() --[[ Line: 102 ]] --[[ Name: getTimerCount ]]
        -- upvalues: v2 (copy)
        v2:getTimerCount();
    end, 
    setSystemTime = function(v7) --[[ Line: 105 ]] --[[ Name: setSystemTime ]]
        -- upvalues: v2 (copy)
        v2:setSystemTime(v7);
    end, 
    getRealSystemTime = function() --[[ Line: 108 ]] --[[ Name: getRealSystemTime ]]
        -- upvalues: v2 (copy)
        v2:getRealSystemTime();
    end, 
    testEnv = {
        delay = v2.delayOverride, 
        tick = v2.tickOverride, 
        DateTime = v2.dateTimeOverride, 
        os = v2.osOverride
    }, 
    _fakeTimers = v2
};