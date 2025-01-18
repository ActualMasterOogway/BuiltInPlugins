local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v3 = l_t_0.tuple(l_t_0.callback, l_t_0.optional(l_t_0.strictInterface({
    queueTimeLimit = l_t_0.optional(l_t_0.numberPositive), 
    queueErrorLimit = l_t_0.optional(l_t_0.numberPositive), 
    queueKeyLimit = l_t_0.optional(l_t_0.numberPositive)
})));
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy)
    assert(v3(v5, v6));
    v6 = v6 or {};
    local v7 = {
        _reportMethod = v5, 
        _queueTimeLimit = v6.queueTimeLimit or 30, 
        _queueErrorLimit = v6.queueErrorLimit or 30, 
        _queueKeyLimit = v6.queueKeyLimit or 10, 
        _errors = {}, 
        _totalErrorCount = 0, 
        _totalKeyCount = 0, 
        _runningTime = 0, 
        _renderSteppedConnection = nil
    };
    setmetatable(v7, v4);
    return v7;
end;
v4.hasError = function(v8, v9) --[[ Line: 49 ]] --[[ Name: hasError ]]
    -- upvalues: l_t_0 (copy)
    if not l_t_0.string(v9) or v9 == "" then
        return false;
    else
        return v8._errors[v9] ~= nil;
    end;
end;
v4.addError = function(v10, v11, v12) --[[ Line: 57 ]] --[[ Name: addError ]]
    -- upvalues: l_t_0 (copy)
    assert(l_t_0.string(v11), "Expected errorKey to be a string");
    assert(l_t_0.any(v12), "Expected errorData to not be nil");
    if not v10._errors[v11] then
        v10._errors[v11] = {
            data = v12, 
            count = 1
        };
        v10._totalKeyCount = v10._totalKeyCount + 1;
    else
        v10._errors[v11].count = v10._errors[v11].count + 1;
    end;
    v10._totalErrorCount = v10._totalErrorCount + 1;
    if v10:isReadyToReport() then
        v10:reportAllErrors();
    end;
end;
v4.isReadyToReport = function(v13) --[[ Line: 80 ]] --[[ Name: isReadyToReport ]]
    local v14 = v13._totalKeyCount >= v13._queueKeyLimit;
    local v15 = v13._totalErrorCount >= v13._queueErrorLimit;
    local v16 = v13._totalErrorCount > 0;
    local v17 = v13._runningTime >= v13._queueTimeLimit;
    return v14 or v15 or v16 and v17;
end;
v4.reportAllErrors = function(v18) --[[ Line: 89 ]] --[[ Name: reportAllErrors ]]
    local v19 = v18._errors or {};
    v18._errors = {};
    v18._totalErrorCount = 0;
    v18._totalKeyCount = 0;
    v18._runningTime = 0;
    for v20, v21 in pairs(v19) do
        v18._reportMethod(v20, v21.data, v21.count);
    end;
end;
v4._onQueueTimerTick = function(v22, v23) --[[ Line: 104 ]] --[[ Name: _onQueueTimerTick ]]
    v22._runningTime = v22._runningTime + v23;
    if v22:isReadyToReport() then
        v22:reportAllErrors();
    end;
end;
v4.startTimer = function(v24) --[[ Line: 112 ]] --[[ Name: startTimer ]]
    -- upvalues: l_RunService_0 (copy)
    if v24._renderSteppedConnection == nil then
        v24._runningTime = 0;
        v24._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 116 ]]
            -- upvalues: v24 (copy)
            v24:_onQueueTimerTick(v25);
        end);
    end;
end;
v4.stopTimer = function(v26) --[[ Line: 122 ]] --[[ Name: stopTimer ]]
    if v26._renderSteppedConnection ~= nil then
        v26._renderSteppedConnection:Disconnect();
        v26._runningTime = 0;
        v26._renderSteppedConnection = nil;
    end;
    v26:reportAllErrors();
end;
return v4;