local v0 = {};
v0.__index = v0;
v0.new = function(_, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _handler = v2, 
        _installed = false
    }, v0));
end;
v0.install = function(v3) --[[ Line: 11 ]] --[[ Name: install ]]
    v3:_connect();
    v3._installed = true;
end;
v0.uninstall = function(v4) --[[ Line: 16 ]] --[[ Name: uninstall ]]
    v4:_disconnect();
    v4._installed = false;
end;
v0.setSelection = function(v5, v6) --[[ Line: 21 ]] --[[ Name: setSelection ]]
    if v5._installed then
        v5:_disconnect();
        v5._instance = v6:getPrimaryObject();
        v5:_connect();
    end;
end;
v0._connect = function(v7) --[[ Line: 29 ]] --[[ Name: _connect ]]
    if not v7._instance then
        v7:_setPart(nil);
        return;
    elseif v7._instance:IsA("Model") then
        v7._primaryConnection = v7._instance:GetPropertyChangedSignal("PrimaryPart"):Connect(function() --[[ Line: 33 ]]
            -- upvalues: v7 (copy)
            v7:_setPart(v7._instance.PrimaryPart);
        end);
        v7._pivotChangedConnection = v7._instance:GetPropertyChangedSignal("WorldPivot"):Connect(function() --[[ Line: 36 ]]
            -- upvalues: v7 (copy)
            v7._handler();
        end);
        v7:_setPart(v7._instance.PrimaryPart);
        return;
    elseif v7._instance:IsA("BasePart") then
        v7:_setPart(v7._instance);
        return;
    else
        v7:_setPart(nil);
        return;
    end;
end;
v0._disconnect = function(v8) --[[ Line: 47 ]] --[[ Name: _disconnect ]]
    if v8._primaryConnection then
        v8._primaryConnection:Disconnect();
        v8._primaryConnection = nil;
    end;
    if v8._pivotChangedConnection then
        v8._pivotChangedConnection:Disconnect();
        v8._pivotChangedConnection = nil;
    end;
    v8:_setPart(nil);
end;
v0._setPart = function(v9, v10) --[[ Line: 59 ]] --[[ Name: _setPart ]]
    if v9._movedConnection then
        v9._movedConnection:Disconnect();
        v9._movedConnection = nil;
    end;
    if v9._partPivotChangedConnection then
        v9._partPivotChangedConnection:Disconnect();
        v9._partPivotChangedConnection = nil;
    end;
    if v10 then
        local function v11() --[[ Line: 69 ]] --[[ Name: handlerTrampoline ]]
            -- upvalues: v9 (copy)
            v9._handler();
        end;
        v9._partPivotChangedConnection = v10:GetPropertyChangedSignal("PivotOffset"):Connect(v11);
        v9._movedConnection = (v10 or v10:GetRootPart()):GetPropertyChangedSignal("CFrame"):Connect(v11);
    end;
end;
return v0;