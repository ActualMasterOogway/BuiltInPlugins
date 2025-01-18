local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1, 
        _draggerToolModel = v2, 
        _dragInfo = v3
    }, v0));
end;
v0.render = function(_) --[[ Line: 25 ]] --[[ Name: render ]]
    return nil;
end;
v0.rotate = function(_, _) --[[ Line: 32 ]] --[[ Name: rotate ]]

end;
v0.update = function(_) --[[ Line: 35 ]] --[[ Name: update ]]

end;
v0.destroy = function(_) --[[ Line: 38 ]] --[[ Name: destroy ]]

end;
return v0;