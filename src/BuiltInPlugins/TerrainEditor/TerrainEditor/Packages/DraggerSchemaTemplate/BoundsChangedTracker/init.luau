local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _handler = v2, 
        _draggerContext = v1
    }, v0));
end;
v0.install = function(_) --[[ Line: 29 ]] --[[ Name: install ]]

end;
v0.uninstall = function(_) --[[ Line: 33 ]] --[[ Name: uninstall ]]

end;
v0.setSelection = function(_, _) --[[ Line: 37 ]] --[[ Name: setSelection ]]

end;
return v0;