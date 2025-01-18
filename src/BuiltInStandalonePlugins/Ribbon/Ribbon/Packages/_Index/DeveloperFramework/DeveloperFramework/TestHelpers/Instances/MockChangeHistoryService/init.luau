local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _undoWaypoints = {}, 
        _redoWaypoints = {}
    }, v0));
end;
v0.Destroy = function(_) --[[ Line: 12 ]] --[[ Name: Destroy ]]

end;
v0.SetWaypoint = function(v2, v3) --[[ Line: 14 ]] --[[ Name: SetWaypoint ]]
    table.insert(v2._undoWaypoints, v3);
end;
v0.Undo = function(v4) --[[ Line: 18 ]] --[[ Name: Undo ]]
    table.insert(v4._redoWaypoints, v4._undoWaypoints[#v4._undoWaypoints]);
    table.remove(v4._undoWaypoints, #v4._undoWaypoints);
end;
v0.Redo = function(v5) --[[ Line: 23 ]] --[[ Name: Redo ]]
    table.insert(v5._undoWaypoints, v5._redoWaypoints[#v5._redoWaypoints]);
    table.remove(v5._redoWaypoints, #v5._redoWaypoints);
end;
return v0;