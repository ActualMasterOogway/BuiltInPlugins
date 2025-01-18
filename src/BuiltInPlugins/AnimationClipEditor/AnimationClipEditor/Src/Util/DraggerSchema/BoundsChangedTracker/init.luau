local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _handler = v2, 
        _draggerContext = v1, 
        _boundsChanged = v2
    }, v0));
end;
v0.install = function(v3) --[[ Line: 18 ]] --[[ Name: install ]]
    v3._scrubberChangedConnection = v3._draggerContext.ScrubberSignal:Connect(v3._boundsChanged);
end;
v0.uninstall = function(v4) --[[ Line: 23 ]] --[[ Name: uninstall ]]
    v4._scrubberChangedConnection:Disconnect();
end;
v0.setSelection = function(_, _) --[[ Line: 27 ]] --[[ Name: setSelection ]]

end;
return v0;