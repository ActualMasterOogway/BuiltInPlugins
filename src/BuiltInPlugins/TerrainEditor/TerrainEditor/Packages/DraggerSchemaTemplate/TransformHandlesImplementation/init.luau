local v0 = {};
v0.__index = v0;
v0.new = function(v1, ...) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _draggerContext = v1
    }, v0));
end;
v0.beginDrag = function(_, _, _) --[[ Line: 28 ]] --[[ Name: beginDrag ]]

end;
v0.updateDrag = function(_, v6) --[[ Line: 36 ]] --[[ Name: updateDrag ]]
    return v6;
end;
v0.endDrag = function(_) --[[ Line: 47 ]] --[[ Name: endDrag ]]

end;
v0.render = function(_, _) --[[ Line: 53 ]] --[[ Name: render ]]
    return nil;
end;
v0.getPriority = function(_) --[[ Line: 64 ]] --[[ Name: getPriority ]]
    return 0;
end;
return v0;