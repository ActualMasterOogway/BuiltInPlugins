local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Implementation.DraggerStateType);
local v2 = require(l_Parent_0.Utility.StandardCursor);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v7 = setmetatable({
        _draggerToolModel = v4
    }, v3);
    v7:_init(v5, v6);
    return v7;
end;
v3.enter = function(_) --[[ Line: 16 ]] --[[ Name: enter ]]

end;
v3.leave = function(_) --[[ Line: 18 ]] --[[ Name: leave ]]

end;
v3._init = function(v10, v11, v12) --[[ Line: 20 ]] --[[ Name: _init ]]
    assert(v12, "Missing draggingHandleId");
    v10._draggerToolModel._sessionAnalytics.handleDrags = v10._draggerToolModel._sessionAnalytics.handleDrags + 1;
    v10._draggerToolModel._boundsChangedTracker:uninstall();
    v11:mouseDown(v10._draggerToolModel._draggerContext:getMouseRay(), v12);
    v10._draggingHandleId = v12;
    v10._draggingHandles = v11;
end;
v3.render = function(v13) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    v13._draggerToolModel:setMouseCursor(v2.getClosedHand());
    return v13._draggingHandles:render(v13._draggingHandleId);
end;
v3.processSelectionChanged = function(v14) --[[ Line: 36 ]] --[[ Name: processSelectionChanged ]]
    v14:_endHandleDrag(true);
    v14:_init(v14._draggingHandles, v14._draggingHandleId);
end;
v3.processMouseDown = function(_) --[[ Line: 43 ]] --[[ Name: processMouseDown ]]
    error("Mouse should already be down while dragging handle.");
end;
v3.processViewChanged = function(v16) --[[ Line: 47 ]] --[[ Name: processViewChanged ]]
    v16._draggingHandles:mouseDrag(v16._draggerToolModel._draggerContext:getMouseRay());
end;
v3.processMouseUp = function(v17) --[[ Line: 51 ]] --[[ Name: processMouseUp ]]
    -- upvalues: v1 (copy)
    v17:_endHandleDrag(false);
    v17._draggerToolModel:transitionToState(v1.Ready);
end;
v3.processMouseEnter = function(_) --[[ Line: 57 ]] --[[ Name: processMouseEnter ]]

end;
v3.processMouseLeave = function(_) --[[ Line: 61 ]] --[[ Name: processMouseLeave ]]

end;
v3.processKeyDown = function(v20, v21) --[[ Line: 65 ]] --[[ Name: processKeyDown ]]
    for _, v23 in pairs(v20._draggerToolModel:getHandlesList()) do
        if v23.keyDown and v23:keyDown(v21) then
            v20:processViewChanged();
            v20._draggerToolModel:_scheduleRender();
        end;
    end;
end;
v3.processKeyUp = function(v24, v25) --[[ Line: 76 ]] --[[ Name: processKeyUp ]]
    for _, v27 in pairs(v24._draggerToolModel:getHandlesList()) do
        if v27.keyUp and v27:keyUp(v25) then
            v24:processViewChanged();
            v24._draggerToolModel:_scheduleRender();
        end;
    end;
end;
v3._endHandleDrag = function(v28, v29) --[[ Line: 87 ]] --[[ Name: _endHandleDrag ]]
    local v30 = v28._draggingHandles:mouseUp(v28._draggerToolModel._draggerContext:getMouseRay());
    if v29 then
        v28._draggerToolModel:_updateSelectionInfo(nil);
    else
        v28._draggerToolModel:_updateSelectionInfo(v30);
    end;
    v28._draggerToolModel._boundsChangedTracker:install();
    v28._draggerToolModel:getSchema().setActivePoint(v28._draggerToolModel._draggerContext, v28._draggerToolModel._selectionInfo);
    v28._draggerToolModel:_analyticsSendHandleDragged(v28._draggingHandleId);
end;
return v3;