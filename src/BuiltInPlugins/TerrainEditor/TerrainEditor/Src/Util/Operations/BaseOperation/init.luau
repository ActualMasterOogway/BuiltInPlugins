local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v3 (copy)
    return (setmetatable({
        Started = l_Signal_0.new(), 
        Paused = l_Signal_0.new(), 
        Resumed = l_Signal_0.new(), 
        Canceled = l_Signal_0.new(), 
        Finished = l_Signal_0.new(), 
        ProgressChanged = l_Signal_0.new(), 
        _name = v4.Name, 
        _description = v4.Description, 
        _onStartFunc = v4.OnStart, 
        _onStepFunc = v4.OnStep, 
        _onPauseFunc = v4.OnPause, 
        _onResumeFunc = v4.OnResume, 
        _onCancelFunc = v4.OnCancel, 
        _onFinishFunc = v4.OnFinish, 
        _onErrorFunc = v4.OnError, 
        _budget = v4.Budget, 
        _timeBetweenSteps = v4.TimeBetweenSteps or 0, 
        _timeBetweenPauseChecks = v4.TimeBetweenPauseChecks or 0.1, 
        _options = {}, 
        _canCancel = v4.AllowCancel or false, 
        _canPause = v4.AllowPause or false, 
        _hasStarted = false, 
        _isPaused = false, 
        _wasCanceled = false, 
        _hasFinished = false, 
        _isRunning = false, 
        _operationProgress = 0, 
        _errorMessage = nil, 
        _steps = 0, 
        _startTime = 0, 
        _endTime = 0, 
        _yieldTime = 0
    }, v3));
end;
v3.destroy = function(v5) --[[ Line: 75 ]] --[[ Name: destroy ]]
    if v5._hasStarted and not v5._hasFinished and not v5._wasCanceled then
        v5:cancel();
    end;
end;
v3.start = function(v6, v7) --[[ Line: 83 ]] --[[ Name: start ]]
    assert(typeof(v7) == "table", "Options must be a table.");
    assert(not v6._hasStarted, "Cannot start an operation that was already started.");
    if v7 then
        v6._options = v7;
    end;
    v6._hasStarted = true;
    v6._isRunning = true;
    v6._startTime = os.clock();
    v6._cycles = v7.cycles;
    v6._Synchronous = v7.Synchronous;
    v6.Started:Fire();
    if v6._cycles or v6._Synchronous then
        v6:_runOperation();
        return;
    else
        task.spawn(function() --[[ Line: 101 ]]
            -- upvalues: v6 (copy)
            v6:_runOperation();
        end);
        return;
    end;
end;
v3.pause = function(v8) --[[ Line: 107 ]] --[[ Name: pause ]]
    if not v8._hasStarted or v8._hasFinished or v8._wasCanceled then
        return;
    else
        assert(not v8._isPaused, "Operation already paused.");
        v8._isPaused = true;
        v8.Paused:Fire();
        return;
    end;
end;
v3.resume = function(v9) --[[ Line: 118 ]] --[[ Name: resume ]]
    if not v9._hasStarted or v9._hasFinished or v9._wasCanceled then
        return;
    else
        assert(v9._isPaused, "Operation already running.");
        v9._isPaused = false;
        v9.Resumed:Fire();
        return;
    end;
end;
v3.togglePause = function(v10) --[[ Line: 129 ]] --[[ Name: togglePause ]]
    if not v10._hasStarted or v10._hasFinished or v10._wasCanceled then
        return;
    elseif v10._isPaused then
        v10:resume();
        return;
    else
        v10:pause();
        return;
    end;
end;
v3.cancel = function(v11) --[[ Line: 141 ]] --[[ Name: cancel ]]
    if not v11._hasStarted or v11._hasFinished or v11._wasCanceled then
        return;
    else
        v11._wasCanceled = true;
        v11.Canceled:Fire();
        return;
    end;
end;
v3.getName = function(v12) --[[ Line: 150 ]] --[[ Name: getName ]]
    return v12._name;
end;
v3.setName = function(v13, v14) --[[ Line: 154 ]] --[[ Name: setName ]]
    v13._name = v14;
end;
v3.getDescription = function(v15) --[[ Line: 158 ]] --[[ Name: getDescription ]]
    return v15._description;
end;
v3.setDescription = function(v16, v17) --[[ Line: 162 ]] --[[ Name: setDescription ]]
    v16._description = v17;
end;
v3.getOptions = function(v18) --[[ Line: 166 ]] --[[ Name: getOptions ]]
    return v18._options;
end;
v3.setOptions = function(v19, v20) --[[ Line: 170 ]] --[[ Name: setOptions ]]
    v19._options = v20;
end;
v3.updateOptions = function(v21, v22) --[[ Line: 174 ]] --[[ Name: updateOptions ]]
    -- upvalues: v1 (copy)
    v21._options = v1.join(v21._options, v22);
end;
v3.updatePayload = function(v23, v24) --[[ Line: 178 ]] --[[ Name: updatePayload ]]
    v23._options.Payload = v24;
end;
v3.canCancel = function(v25) --[[ Line: 182 ]] --[[ Name: canCancel ]]
    return v25._canCancel;
end;
v3.canPause = function(v26) --[[ Line: 186 ]] --[[ Name: canPause ]]
    return v26._canPause;
end;
v3.canResume = function(v27) --[[ Line: 190 ]] --[[ Name: canResume ]]
    return v27._canPause;
end;
v3.hasStarted = function(v28) --[[ Line: 194 ]] --[[ Name: hasStarted ]]
    return v28._hasStarted;
end;
v3.isPaused = function(v29) --[[ Line: 198 ]] --[[ Name: isPaused ]]
    return v29._isPaused;
end;
v3.wasCanceled = function(v30) --[[ Line: 202 ]] --[[ Name: wasCanceled ]]
    return v30._wasCanceled;
end;
v3.hasFinished = function(v31) --[[ Line: 206 ]] --[[ Name: hasFinished ]]
    return v31._hasFinished;
end;
v3.isRunning = function(v32) --[[ Line: 210 ]] --[[ Name: isRunning ]]
    return v32._isRunning;
end;
v3.didError = function(v33) --[[ Line: 214 ]] --[[ Name: didError ]]
    return v33._errorMessage ~= nil;
end;
v3.getErrorMessage = function(v34) --[[ Line: 218 ]] --[[ Name: getErrorMessage ]]
    return v34._errorMessage;
end;
v3.getProgress = function(v35) --[[ Line: 222 ]] --[[ Name: getProgress ]]
    return v35._operationProgress;
end;
v3._setProgress = function(v36, v37) --[[ Line: 226 ]] --[[ Name: _setProgress ]]
    if v36._operationProgress ~= v37 then
        v36._operationProgress = v37;
        v36._runningTime = os.clock() - v36._startTime;
        v36.ProgressChanged:Fire(v37, if v37 > 0 then v36._runningTime / v37 - v36._runningTime else nil);
    end;
end;
v3.getStepsTaken = function(v38) --[[ Line: 237 ]] --[[ Name: getStepsTaken ]]
    if v38._steps == 0 then
        return 1;
    else
        return v38._steps;
    end;
end;
v3.getCurrentTimeTaken = function(v39) --[[ Line: 241 ]] --[[ Name: getCurrentTimeTaken ]]
    return os.clock() - v39._startTime;
end;
v3.getTimeTaken = function(v40) --[[ Line: 245 ]] --[[ Name: getTimeTaken ]]
    if not v40._hasFinished then
        return 0;
    else
        return v40._endTime - v40._startTime;
    end;
end;
v3.getYieldTime = function(v41) --[[ Line: 252 ]] --[[ Name: getYieldTime ]]
    return v41._yieldTime;
end;
v3.getWorkTime = function(v42) --[[ Line: 256 ]] --[[ Name: getWorkTime ]]
    if not v42._hasFinished then
        return 0;
    else
        return v42:getTimeTaken() - v42:getYieldTime();
    end;
end;
v3.addTimeStatistic = function(v43, v44) --[[ Line: 263 ]] --[[ Name: addTimeStatistic ]]
    if not v44 then
        return;
    elseif not v43._time then
        v43._time = v44;
        v43._timeTotals = 1;
        return;
    else
        v43._time = v43._time + v44;
        v43._timeTotals = v43._timeTotals + 1;
        return;
    end;
end;
v3.skipBudget = function(v45) --[[ Line: 277 ]] --[[ Name: skipBudget ]]
    v45._skipBudget = true;
end;
v3.getTimeStatistic = function(v46) --[[ Line: 281 ]] --[[ Name: getTimeStatistic ]]
    if v46._time and v46._timeTotals then
        return v46._time / v46._timeTotals;
    else
        return nil;
    end;
end;
v3._yield = function(v47, ...) --[[ Line: 289 ]] --[[ Name: _yield ]]
    if v47._cycles or v47._Synchronous then
        return;
    else
        local v48 = os.clock();
        task.wait(...);
        local v49 = os.clock();
        v47._yieldTime = v47._yieldTime + (v49 - v48);
        return;
    end;
end;
v3._handleError = function(v50, v51) --[[ Line: 299 ]] --[[ Name: _handleError ]]
    if v50:didError() then
        return;
    else
        v50._errorMessage = tostring(v51);
        if v50._onErrorFunc then
            v50:_runCallback(v50._onErrorFunc);
            return;
        else
            error(v50._errorMessage);
            return;
        end;
    end;
end;
v3._runCallback = function(v52, v53) --[[ Line: 312 ]] --[[ Name: _runCallback ]]
    if not v53 then
        return false;
    else
        local v54 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 318 ]]
            -- upvalues: v54 (ref), v53 (copy), v52 (copy)
            v54 = table.pack(v53(v52._options, v52));
        end);
        if l_status_0 then
            return true, unpack(v54);
        else
            v52:_handleError(l_result_0);
            return false;
        end;
    end;
end;
v3._runOperation = function(v57) --[[ Line: 330 ]] --[[ Name: _runOperation ]]
    v57:_runCallback(v57._onStartFunc);
    v57:_yield(v57._timeBetweenSteps);
    local v58 = false;
    local v59 = os.clock();
    while not v57:didError() do
        if v57._wasCanceled then
            v57:_runCallback(v57._onCancelFunc);
            break;
        elseif v57._isPaused then
            if v58 or not v57._onPauseFunc or v57:_runCallback(v57._onPauseFunc) then
                v58 = true;
                v57:_yield(v57._timeBetweenPauseChecks);
            else
                break;
            end;
        elseif not v58 or not v57._onResumeFunc or v57:_runCallback(v57._onResumeFunc) then
            v58 = false;
            local v60, v61, v62 = v57:_runCallback(v57._onStepFunc);
            v57._steps = v57._steps + 1;
            if v60 then
                if v62 then
                    v57:_setProgress(v62);
                end;
                if v57._cycles then
                    v57._cycles = v57._cycles - 1;
                end;
                if v61 and v57._cycles ~= 0 then
                    if not v57._budget or os.clock() - v59 > v57._budget or v57._skipBudget then
                        v57:_yield(v57._timeBetweenSteps);
                        v57._skipBudget = false;
                        v59 = os.clock();
                    end;
                else
                    break;
                end;
            else
                break;
            end;
        else
            break;
        end;
    end;
    v57._hasFinished = true;
    v57._isRunning = false;
    v57._endTime = os.clock();
    v57:_runCallback(v57._onFinishFunc);
    v57.Finished:Fire();
end;
return v3;