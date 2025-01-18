local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _handler = v2, 
        _draggerContext = v1
    }, v0));
end;
v0.install = function(v3) --[[ Line: 31 ]] --[[ Name: install ]]
    v3._boundsChangedConnection = v3._draggerContext.vertexEditingTool:getBoundsChangedSignal():Connect(function() --[[ Line: 33 ]]
        -- upvalues: v3 (copy)
        v3._handler();
    end);
end;
v0.uninstall = function(v4) --[[ Line: 38 ]] --[[ Name: uninstall ]]
    if v4._boundsChangedConnection then
        v4._boundsChangedConnection:Disconnect();
    end;
end;
v0.setSelection = function(_, _) --[[ Line: 44 ]] --[[ Name: setSelection ]]

end;
return v0;