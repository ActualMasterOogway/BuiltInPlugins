local v0 = {};
v0.__index = v0;
v0.new = function(v1, _, _) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.destroy = function(_) --[[ Line: 33 ]] --[[ Name: destroy ]]

end;
return v0;