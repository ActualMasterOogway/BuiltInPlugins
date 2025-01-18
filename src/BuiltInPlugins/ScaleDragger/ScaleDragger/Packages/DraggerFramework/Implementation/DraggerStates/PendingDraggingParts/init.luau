local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Implementation.DraggerStateType);
local v4 = require(l_Parent_0.Utility.StandardCursor);
local v5 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v6 = require(l_Parent_0.Flags.getFFlagDraggerSelectionChangeFix);
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10, v11) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        _isDoubleClick = v9, 
        _dragStartLocation = v8._draggerContext:getMouseLocation(), 
        _dragInfo = v10, 
        _clickedMetadata = v11, 
        _draggerToolModel = v8
    }, v7));
end;
v7.enter = function(_) --[[ Line: 26 ]] --[[ Name: enter ]]

end;
v7.leave = function(_) --[[ Line: 28 ]] --[[ Name: leave ]]

end;
v7.render = function(v14) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy)
    v14._draggerToolModel:setMouseCursor(v4.getClosedHand());
    if v5() then
        local l_getHoverComponent_0 = v14._draggerToolModel:getSchema().getHoverComponent;
        if l_getHoverComponent_0 then
            local v16 = l_getHoverComponent_0(v14._draggerToolModel._draggerContext);
            if v16 then
                return v2.createElement(v16, {
                    DraggerContext = v14._draggerToolModel._draggerContext, 
                    HoverMetadata = v14._clickedMetadata, 
                    Pending = true
                });
            end;
        end;
    end;
end;
v7.processSelectionChanged = function(_) --[[ Line: 48 ]] --[[ Name: processSelectionChanged ]]

end;
v7.processMouseDown = function(_) --[[ Line: 55 ]] --[[ Name: processMouseDown ]]
    error("Mouse should already be down while pending part drag.");
end;
v7.processViewChanged = function(v19) --[[ Line: 59 ]] --[[ Name: processViewChanged ]]
    -- upvalues: v3 (copy)
    if (v19._draggerToolModel._draggerContext:getMouseLocation() - v19._dragStartLocation).Magnitude > 4 then
        v19._draggerToolModel:transitionToState(v3.DraggingParts, v19._dragInfo);
    end;
end;
v7.processMouseUp = function(v20) --[[ Line: 68 ]] --[[ Name: processMouseUp ]]
    -- upvalues: v6 (copy), v3 (copy)
    local l__draggerToolModel_0 = v20._draggerToolModel;
    local l__draggerContext_0 = l__draggerToolModel_0._draggerContext;
    local v23 = l__draggerContext_0:shouldExtendSelection();
    if l__draggerContext_0:isAltKeyDown() and not v23 then
        local l__selectionCycleCache_0 = l__draggerToolModel_0._selectionCycleCache;
        local v25 = {};
        local v26 = l__selectionCycleCache_0:getNextSelectable(true);
        if v26 then
            table.insert(v25, v26);
            l__draggerToolModel_0._selectionWrapper:set(v25);
            if v6() and not l__draggerToolModel_0:isSelected() then
                return;
            else
                l__draggerToolModel_0:_updateSelectionInfo();
            end;
        end;
    else
        l__draggerToolModel_0:selectNextSelectables(v20._dragInfo, v20._isDoubleClick);
    end;
    v20._draggerToolModel:transitionToState(v3.Ready);
end;
v7.processMouseEnter = function(_) --[[ Line: 101 ]] --[[ Name: processMouseEnter ]]

end;
v7.processMouseLeave = function(_) --[[ Line: 105 ]] --[[ Name: processMouseLeave ]]

end;
v7.processKeyDown = function(v29, v30) --[[ Line: 109 ]] --[[ Name: processKeyDown ]]
    -- upvalues: v5 (copy), v3 (copy)
    if v5() then
        v29._draggerToolModel:transitionToState(v3.DraggingParts, v29._dragInfo, v30);
    end;
end;
v7.processKeyUp = function(_, _) --[[ Line: 117 ]] --[[ Name: processKeyUp ]]

end;
return v7;