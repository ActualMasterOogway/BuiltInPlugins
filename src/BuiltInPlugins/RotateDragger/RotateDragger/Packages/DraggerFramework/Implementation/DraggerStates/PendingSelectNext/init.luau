local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Implementation.DraggerStateType);
local v2 = require(l_Parent_0.Utility.StandardCursor);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        _draggerToolModel = v4, 
        _dragInfo = v6, 
        _initialMouseLocation = v4._draggerContext:getMouseLocation(), 
        _wasDoubleClick = v5
    }, v3));
end;
v3.enter = function(_) --[[ Line: 25 ]] --[[ Name: enter ]]

end;
v3.leave = function(_) --[[ Line: 27 ]] --[[ Name: leave ]]

end;
v3.render = function(v9) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    v9._draggerToolModel:setMouseCursor(v2.getOpenHand());
end;
v3.processSelectionChanged = function(v10) --[[ Line: 33 ]] --[[ Name: processSelectionChanged ]]
    v10:_transitionBack();
end;
v3.processMouseDown = function(_) --[[ Line: 37 ]] --[[ Name: processMouseDown ]]

end;
v3.processViewChanged = function(_) --[[ Line: 39 ]] --[[ Name: processViewChanged ]]

end;
v3.processMouseUp = function(v13) --[[ Line: 41 ]] --[[ Name: processMouseUp ]]
    if v13._initialMouseLocation == v13._draggerToolModel._draggerContext:getMouseLocation() then
        v13._draggerToolModel:selectNextSelectables(v13._dragInfo, v13._wasDoubleClick);
    end;
    v13:_transitionBack();
end;
v3.processMouseEnter = function(_) --[[ Line: 49 ]] --[[ Name: processMouseEnter ]]

end;
v3.processMouseLeave = function(_) --[[ Line: 51 ]] --[[ Name: processMouseLeave ]]

end;
v3.processKeyDown = function(_, _) --[[ Line: 53 ]] --[[ Name: processKeyDown ]]

end;
v3.processKeyUp = function(_, _) --[[ Line: 55 ]] --[[ Name: processKeyUp ]]

end;
v3._transitionBack = function(v20) --[[ Line: 57 ]] --[[ Name: _transitionBack ]]
    -- upvalues: v1 (copy)
    v20._draggerToolModel:transitionToState(v1.Ready);
end;
return v3;