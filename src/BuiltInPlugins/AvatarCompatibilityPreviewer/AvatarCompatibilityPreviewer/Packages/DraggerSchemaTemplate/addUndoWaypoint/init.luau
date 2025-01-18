return function(v0, v1, v2) --[[ Line: 9 ]]
    assert(v0.getMouseTarget == nil, "You accidentally called schema:addUndoWaypoint intead of schema.addUndoWaypoint");
    v0:addUndoWaypoint(v1, v2);
end;