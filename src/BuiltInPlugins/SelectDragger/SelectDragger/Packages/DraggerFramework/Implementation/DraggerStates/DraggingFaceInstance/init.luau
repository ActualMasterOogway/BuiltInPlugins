local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Implementation.DraggerStateType);
local v2 = require(l_Parent_0.Utility.DragHelper);
local v3 = require(l_Parent_0.Utility.StandardCursor);
local v4 = table.freeze({
    TopSurface = "Top", 
    BottomSurface = "Bottom", 
    LeftSurface = "Left", 
    RightSurface = "Right", 
    FrontSurface = "Front", 
    BackSurface = "Back"
});
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _draggerToolModel = v6, 
        _connectionToBreak = v7
    }, v5));
end;
v5.enter = function(_) --[[ Line: 31 ]] --[[ Name: enter ]]

end;
v5.leave = function(v9) --[[ Line: 33 ]] --[[ Name: leave ]]
    v9._draggerToolModel._draggerSchema.addUndoWaypoint(v9._draggerToolModel._draggerContext, "Drag Face Instance");
    if v9._connectionToBreak then
        v9._connectionToBreak:Disconnect();
    end;
end;
v5.render = function(v10) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    v10._draggerToolModel:setMouseCursor(v3.getClosedHand());
end;
v5.processSelectionChanged = function(_) --[[ Line: 45 ]] --[[ Name: processSelectionChanged ]]

end;
v5.processMouseDown = function(_) --[[ Line: 50 ]] --[[ Name: processMouseDown ]]

end;
v5.processViewChanged = function(v13) --[[ Line: 52 ]] --[[ Name: processViewChanged ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v14, v15 = v2.getPartAndSurface(v13._draggerToolModel._draggerContext:getMouseRay());
    local l_instancesWithConfigurableFace_0 = v13._draggerToolModel._selectionInfo.instancesWithConfigurableFace;
    if l_instancesWithConfigurableFace_0 then
        for _, v18 in pairs(l_instancesWithConfigurableFace_0) do
            if v14 and v15 then
                v18.Parent = v14;
                v18.Face = v4[v15];
            end;
        end;
    end;
end;
v5.processMouseUp = function(v19) --[[ Line: 66 ]] --[[ Name: processMouseUp ]]
    v19:_endDrag();
end;
v5.processMouseEnter = function(_) --[[ Line: 70 ]] --[[ Name: processMouseEnter ]]

end;
v5.processMouseLeave = function(_) --[[ Line: 74 ]] --[[ Name: processMouseLeave ]]

end;
v5.processKeyDown = function(_, _) --[[ Line: 78 ]] --[[ Name: processKeyDown ]]

end;
v5.processKeyUp = function(_, _) --[[ Line: 80 ]] --[[ Name: processKeyUp ]]

end;
v5._endDrag = function(v26) --[[ Line: 82 ]] --[[ Name: _endDrag ]]
    -- upvalues: v1 (copy)
    v26._draggerToolModel:transitionToState(v1.Ready);
end;
return v5;