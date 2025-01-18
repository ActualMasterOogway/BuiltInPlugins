local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(script.Parent.FreeformDragger);
local v3 = require(l_Parent_0.Src.Components.PivotRing);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        _dragging = false, 
        _draggerContext = v5
    }, v4));
end;
v4.update = function(v6, v7, v8) --[[ Line: 20 ]] --[[ Name: update ]]
    if not v6._dragging then
        v6._originalPivot = v8:getBoundingBox();
        v6._pivotOwner = v8:getPrimaryObject();
        v6._draggerToolModel = v7;
        v6._schema = v7:getSchema();
    end;
end;
v4.shouldBiasTowardsObjects = function(_) --[[ Line: 29 ]] --[[ Name: shouldBiasTowardsObjects ]]
    return false;
end;
v4.hitTest = function(v10, _, _) --[[ Line: 33 ]] --[[ Name: hitTest ]]
    -- upvalues: v3 (copy)
    local v13, v14 = v10._draggerContext:worldToViewportPoint(v10._originalPivot.Position);
    if v14 then
        local v15 = v10._draggerContext:getMouseLocation();
        if (Vector2.new(v13.X, v13.Y) - v15).Magnitude < v3.HitTestRadius then
            return "Pivot", 0, true;
        end;
    end;
    return nil;
end;
v4._selectedIsActive = function(v16) --[[ Line: 46 ]] --[[ Name: _selectedIsActive ]]
    if v16._draggerContext:shouldShowActiveInstanceHighlight() then
        return v16._draggerToolModel:getSelectionWrapper():getActiveSelectable() == v16._pivotOwner;
    else
        return false;
    end;
end;
v4._renderPivotAdorn = function(v17, v18) --[[ Line: 55 ]] --[[ Name: _renderPivotAdorn ]]
    -- upvalues: v1 (copy), v3 (copy)
    if not v17._pivotOwner then
        return;
    else
        return v1.createElement(v3, {
            DraggerContext = v17._draggerContext, 
            Hovered = v18, 
            Pivot = v17._originalPivot, 
            IsActive = v17:_selectedIsActive()
        });
    end;
end;
v4.render = function(v19, v20) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v21 = {};
    if v19._freeformDrag then
        v21.DragUI = v19._freeformDrag:render();
    elseif v20 then
        v21.PivotAdorn = v19:_renderPivotAdorn(true);
    else
        v21.PivotAdorn = v19:_renderPivotAdorn(false);
    end;
    return v1.createFragment(v21);
end;
v4.mouseDown = function(v22, _, _) --[[ Line: 80 ]] --[[ Name: mouseDown ]]
    -- upvalues: v2 (copy)
    if v22._pivotOwner then
        local v25 = {
            ClickedSelectable = v22._pivotOwner, 
            HandleId = "Pivot"
        };
        v22._freeformDrag = v2.new(v22._draggerContext, v22._draggerToolModel, v25);
        v22._freeformDrag:update();
    end;
end;
local function _(v26) --[[ Line: 93 ]] --[[ Name: isAlt ]]
    local v27 = true;
    if v26 ~= Enum.KeyCode.LeftAlt then
        v27 = v26 == Enum.KeyCode.RightAlt;
    end;
    return v27;
end;
v4.keyDown = function(v29, v30) --[[ Line: 97 ]] --[[ Name: keyDown ]]
    if v29._freeformDrag then
        if v30 == Enum.KeyCode.R then
            v29._freeformDrag:rotate((Vector3.new(0, 1, 0, 0)));
            return true;
        elseif v30 == Enum.KeyCode.T then
            v29._freeformDrag:rotate((Vector3.new(1, 0, 0, 0)));
            return true;
        else
            local v31 = true;
            if v30 ~= Enum.KeyCode.LeftAlt then
                v31 = v30 == Enum.KeyCode.RightAlt;
            end;
            if v31 then
                v29._freeformDrag:update();
                return true;
            end;
        end;
    end;
    return false;
end;
v4.keyUp = function(v32, _) --[[ Line: 113 ]] --[[ Name: keyUp ]]
    if v32._freeformDrag then
        v32._freeformDrag:update();
        return true;
    else
        return false;
    end;
end;
v4.mouseDrag = function(v34, _) --[[ Line: 121 ]] --[[ Name: mouseDrag ]]
    if v34._freeformDrag then
        v34._freeformDrag:update();
    end;
end;
v4.mouseUp = function(v36, _) --[[ Line: 127 ]] --[[ Name: mouseUp ]]
    if v36._freeformDrag then
        v36._freeformDrag:destroy();
        v36._freeformDrag = nil;
        v36._schema.addUndoWaypoint(v36._draggerContext, "Modify Pivot");
    end;
end;
return v4;