local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Components.HotkeyUsageInfo);
local v4 = require(l_Parent_0.Implementation.DraggerStateType);
local v5 = require(l_Parent_0.Utility.StandardCursor);
local v6 = require(l_Parent_0.Utility.HotkeyHelpBuilder);
local v7 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v8 = require(l_Parent_0.Flags.getFFlagDraggerFinalShortcuts);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v13 = tick();
    v10._boundsChangedTracker:uninstall();
    local v14 = setmetatable({
        _keyForcingStateTransition = v12, 
        _dragInfo = v11, 
        _draggerToolModel = v10, 
        _freeformDragger = v10:getSchema().FreeformDragger.new(v10._draggerContext, v10, v11)
    }, v9);
    v10:_analyticsRecordFreeformDragBegin(tick() - v13);
    return v14;
end;
v9.enter = function(v15) --[[ Line: 33 ]] --[[ Name: enter ]]
    v15:_updateFreeformSelectionDrag();
    if v15._keyForcingStateTransition then
        v15:processKeyDown(v15._keyForcingStateTransition);
    end;
end;
v9.leave = function(_) --[[ Line: 40 ]] --[[ Name: leave ]]

end;
local v17 = table.freeze({
    Hotkey = "T", 
    LabelLocEntry = "DragTilt"
});
local v18 = table.freeze({
    Hotkey = "R", 
    LabelLocEntry = "DragRotate"
});
local v19 = table.freeze({
    Hotkey = v8() and "\226\172\135Alt" or "\226\172\135Shift", 
    LabelLocEntry = "HoldOrientation"
});
local v20 = table.freeze({
    Hotkey = v8() and "\226\172\134Alt" or "\226\172\134Shift", 
    LabelLocEntry = "UnholdOrientation"
});
v9._getHotkeyList = function(v21) --[[ Line: 61 ]] --[[ Name: _getHotkeyList ]]
    -- upvalues: v17 (copy), v18 (copy), v8 (copy), v20 (copy), v19 (copy), v6 (copy)
    local l__draggerContext_0 = v21._draggerToolModel._draggerContext;
    local v23 = {
        v17, 
        v18
    };
    if if v8() then l__draggerContext_0:isAltKeyDown() else l__draggerContext_0:isShiftKeyDown() then
        table.insert(v23, v20);
    else
        table.insert(v23, v19);
    end;
    v6.addGridSnap(v23, l__draggerContext_0);
    v6.addHelp(v23);
    return v23;
end;
v9.render = function(v24) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v7 (copy), v2 (copy), v3 (copy)
    v24._draggerToolModel:setMouseCursor(v5.getClosedHand());
    if v7() then
        local v25 = v24._freeformDragger:render();
        if v24._draggerToolModel._draggerContext:getSetting("HotkeyUsageHidden") then
            return v25;
        else
            return v2.createFragment({
                DraggerElements = v25, 
                HotkeyUsageInfo = v2.createElement(v3, {
                    DraggerContext = v24._draggerToolModel._draggerContext, 
                    HotkeyList = v24:_getHotkeyList()
                })
            });
        end;
    else
        return v24._freeformDragger:render();
    end;
end;
v9.processSelectionChanged = function(v26) --[[ Line: 98 ]] --[[ Name: processSelectionChanged ]]
    v26._freeformDragger:destroy();
    v26._draggerToolModel:_updateSelectionInfo();
    v26._freeformDragger = v26._draggerToolModel:getSchema().FreeformDragger.new(v26._draggerToolModel._draggerContext, v26._draggerToolModel, v26._dragInfo);
end;
v9.processMouseDown = function(_) --[[ Line: 108 ]] --[[ Name: processMouseDown ]]
    error("Mouse should already be down while dragging parts.");
end;
v9.processViewChanged = function(v28) --[[ Line: 112 ]] --[[ Name: processViewChanged ]]
    v28:_updateFreeformSelectionDrag();
end;
v9.processMouseUp = function(v29) --[[ Line: 116 ]] --[[ Name: processMouseUp ]]
    v29:_endFreeformSelectionDrag();
end;
v9.processMouseEnter = function(_) --[[ Line: 120 ]] --[[ Name: processMouseEnter ]]

end;
v9.processMouseLeave = function(_) --[[ Line: 124 ]] --[[ Name: processMouseLeave ]]

end;
local v32 = table.freeze({
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true, 
    [Enum.KeyCode.RightControl] = true, 
    [Enum.KeyCode.LeftControl] = true, 
    [Enum.KeyCode.RightAlt] = true, 
    [Enum.KeyCode.LeftAlt] = true
});
v9.processKeyDown = function(v33, v34) --[[ Line: 137 ]] --[[ Name: processKeyDown ]]
    -- upvalues: v7 (copy), v32 (copy)
    if v34 == Enum.KeyCode.R then
        v33._draggerToolModel._sessionAnalytics.dragRotates = v33._draggerToolModel._sessionAnalytics.dragRotates + 1;
        v33:_tiltRotateFreeformSelectionDrag((Vector3.new(0, 1, 0, 0)));
        return;
    elseif v34 == Enum.KeyCode.T then
        v33._draggerToolModel._sessionAnalytics.dragTilts = v33._draggerToolModel._sessionAnalytics.dragTilts + 1;
        v33:_tiltRotateFreeformSelectionDrag((Vector3.new(1, 0, 0, 0)));
        return;
    elseif v7() and v34 == Enum.KeyCode.H then
        local l__draggerContext_1 = v33._draggerToolModel._draggerContext;
        l__draggerContext_1:setSetting("HotkeyUsageHidden", not l__draggerContext_1:getSetting("HotkeyUsageHidden"));
        v33._draggerToolModel:_scheduleRender();
        return;
    else
        if v7() and v32[v34] then
            v33:_updateFreeformSelectionDrag();
            v33._draggerToolModel:_scheduleRender();
        end;
        return;
    end;
end;
v9.processKeyUp = function(v36, v37) --[[ Line: 157 ]] --[[ Name: processKeyUp ]]
    -- upvalues: v7 (copy), v32 (copy)
    if v7() and v32[v37] then
        v36:_updateFreeformSelectionDrag();
        v36._draggerToolModel:_scheduleRender();
    end;
end;
v9._tiltRotateFreeformSelectionDrag = function(v38, v39) --[[ Line: 164 ]] --[[ Name: _tiltRotateFreeformSelectionDrag ]]
    v38._freeformDragger:rotate(v39);
    v38:_updateFreeformSelectionDrag();
    v38._draggerToolModel:_scheduleRender();
end;
v9._updateFreeformSelectionDrag = function(v40) --[[ Line: 171 ]] --[[ Name: _updateFreeformSelectionDrag ]]
    v40._freeformDragger:update();
end;
v9._endFreeformSelectionDrag = function(v41) --[[ Line: 179 ]] --[[ Name: _endFreeformSelectionDrag ]]
    -- upvalues: v4 (copy)
    local v42 = v41._freeformDragger:destroy();
    v41._draggerToolModel._boundsChangedTracker:install();
    v41._draggerToolModel:_updateSelectionInfo(v42);
    v41._draggerToolModel:transitionToState(v4.Ready);
    v41._draggerToolModel:getSchema().addUndoWaypoint(v41._draggerToolModel._draggerContext, "End Freeform Drag");
    v41._draggerToolModel:getSchema().setActivePoint(v41._draggerToolModel._draggerContext, v41._draggerToolModel._selectionInfo);
end;
return v9;