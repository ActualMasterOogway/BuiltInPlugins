local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Components.DragSelectionView);
local v4 = require(l_Parent_0.Implementation.DraggerStateType);
local v5 = require(l_Parent_0.Utility.DragSelector);
local v6 = require(l_Parent_0.Utility.StandardCursor);
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v9 = setmetatable({
        _dragSelector = v5.new(v8:getSelectionWrapper(), v8:getSchema().beginBoxSelect, v8:getSchema().updateBoxSelect or function() --[[ Line: 18 ]]

        end, v8:getSchema().endBoxSelect), 
        _draggerToolModel = v8
    }, v7);
    v9:_init();
    return v9;
end;
v7.enter = function(v10) --[[ Line: 27 ]] --[[ Name: enter ]]
    v10._mouseStartLocation = v10._draggerToolModel._draggerContext:getMouseLocation();
end;
v7.leave = function(_) --[[ Line: 31 ]] --[[ Name: leave ]]

end;
v7._init = function(v12) --[[ Line: 33 ]] --[[ Name: _init ]]
    v12._draggerToolModel._sessionAnalytics.dragSelects = v12._draggerToolModel._sessionAnalytics.dragSelects + 1;
    v12._hasMovedMouse = false;
end;
v7.render = function(v13) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy)
    v13._draggerToolModel:setMouseCursor(v6.getArrow());
    local v14 = v13._hasMovedMouse and v13._dragSelector:getStartLocation() or v13._draggerToolModel._draggerContext:getMouseLocation();
    if v13._draggerToolModel:shouldShowDragSelect() then
        return v2.createElement(v3, {
            DragStartLocation = v14, 
            DragEndLocation = v13._draggerToolModel._draggerContext:getMouseLocation()
        });
    else
        return nil;
    end;
end;
v7.processSelectionChanged = function(_) --[[ Line: 53 ]] --[[ Name: processSelectionChanged ]]

end;
v7.processMouseDown = function(_) --[[ Line: 58 ]] --[[ Name: processMouseDown ]]
    error("Mouse should already be down while drag selecting.");
end;
v7.processViewChanged = function(v17) --[[ Line: 62 ]] --[[ Name: processViewChanged ]]
    if not v17._hasMovedMouse then
        v17._dragSelector:beginDrag(v17._draggerToolModel._draggerContext, v17._mouseStartLocation);
        v17._hasMovedMouse = true;
    end;
    v17._dragSelector:updateDrag(v17._draggerToolModel._draggerContext);
end;
v7.processMouseUp = function(v18) --[[ Line: 70 ]] --[[ Name: processMouseUp ]]
    -- upvalues: v4 (copy)
    if v18._hasMovedMouse then
        v18._dragSelector:commitDrag(v18._draggerToolModel._draggerContext);
        v18._draggerToolModel:_updateSelectionInfo();
        v18._hasMovedMouse = false;
    end;
    v18._draggerToolModel:_analyticsSendBoxSelect();
    v18._draggerToolModel:transitionToState(v4.Ready);
end;
v7.processMouseEnter = function(_) --[[ Line: 80 ]] --[[ Name: processMouseEnter ]]

end;
v7.processMouseLeave = function(_) --[[ Line: 84 ]] --[[ Name: processMouseLeave ]]

end;
v7.processKeyDown = function(_, _) --[[ Line: 88 ]] --[[ Name: processKeyDown ]]

end;
v7.processKeyUp = function(_, _) --[[ Line: 92 ]] --[[ Name: processKeyUp ]]

end;
return v7;