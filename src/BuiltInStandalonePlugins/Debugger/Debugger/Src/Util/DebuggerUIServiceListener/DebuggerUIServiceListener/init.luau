local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v1 = require(l_Actions_0.Watch.ClearAllExpressions);
local v2 = {};
v2.__index = v2;
v2.OnExpressionsCleared = function(v3) --[[ Line: 8 ]] --[[ Name: OnExpressionsCleared ]]
    -- upvalues: v1 (copy)
    v3.store:dispatch(v1());
end;
local function _(v4, v5) --[[ Line: 12 ]] --[[ Name: setUpConnections ]]
    v4._expressionsClearedConnection = (v5 or game:GetService("DebuggerUIService")).ExpressionsCleared:Connect(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy)
        v4:OnExpressionsCleared();
    end);
end;
v2.destroy = function(v7) --[[ Line: 19 ]] --[[ Name: destroy ]]
    if v7._expressionsClearedConnection then
        v7._expressionsClearedConnection:Disconnect();
        v7._expressionsClearedConnection = nil;
    end;
end;
v2.new = function(v8, v9) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v10 = {
        store = v8
    };
    v10._expressionsClearedConnection = (v9 or game:GetService("DebuggerUIService")).ExpressionsCleared:Connect(function() --[[ Line: 14 ]]
        -- upvalues: v10 (copy)
        v10:OnExpressionsCleared();
    end);
    setmetatable(v10, v2);
    return v10;
end;
return v2;