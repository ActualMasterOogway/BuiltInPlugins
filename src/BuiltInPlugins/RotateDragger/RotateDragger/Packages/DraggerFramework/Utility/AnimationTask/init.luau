local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _tweenFunction = v1, 
        _startedAt = nil, 
        _duration = nil, 
        _task = nil
    }, v0));
end;
v0._taskBodyAsync = function(v2) --[[ Line: 15 ]] --[[ Name: _taskBodyAsync ]]
    v2._tweenFunction(0);
    while true do
        local v3 = (os.clock() - v2._startedAt) / v2._duration;
        if v3 < 1 then
            v2._tweenFunction(v3, false);
            task.wait();
        else
            break;
        end;
    end;
    v2._tweenFunction(1, true);
    v2._task = nil;
end;
v0._startTask = function(v4) --[[ Line: 30 ]] --[[ Name: _startTask ]]
    if not v4._task then
        v4._task = task.defer(v4._taskBodyAsync, v4);
    end;
end;
v0.animate = function(v5, v6) --[[ Line: 36 ]] --[[ Name: animate ]]
    v5._startedAt = os.clock();
    v5._duration = v6;
    v5:_startTask();
end;
v0.inProgress = function(v7) --[[ Line: 42 ]] --[[ Name: inProgress ]]
    return v7._task ~= nil;
end;
v0.commit = function(v8) --[[ Line: 46 ]] --[[ Name: commit ]]
    if v8._task then
        task.cancel(v8._task);
        v8._tweenFunction(1, true);
    end;
end;
return v0;