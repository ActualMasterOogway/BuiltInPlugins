local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Implementation.DraggerToolModel);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    v5 = v5 or {};
    local v6 = setmetatable({
        _draggerContext = v3, 
        _viewBoundsDirty = true, 
        _selectionBoundsDirty = true
    }, v2);
    v6._draggerToolModel = v1.new(v3, v4, v5, function() --[[ Line: 26 ]]

    end, function() --[[ Line: 27 ]]
        -- upvalues: v6 (copy)
        v6._viewBoundsDirty = true;
    end, function() --[[ Line: 30 ]]
        -- upvalues: v6 (copy)
        v6._selectionBoundsDirty = true;
    end);
    return v6;
end;
v2.getModel = function(v7) --[[ Line: 38 ]] --[[ Name: getModel ]]
    return v7._draggerToolModel;
end;
v2._update = function(v8) --[[ Line: 42 ]] --[[ Name: _update ]]
    if v8._selectionBoundsDirty then
        v8._selectionBoundsDirty = false;
        v8._draggerToolModel:_processSelectionChanged();
    end;
    if v8._viewBoundsDirty then
        v8._viewBoundsDirty = false;
        v8._draggerToolModel:_processViewChanged();
    end;
end;
v2.select = function(v9) --[[ Line: 53 ]] --[[ Name: select ]]
    assert(not v9._selected, "select called while already selected");
    v9._selected = true;
    v9._draggerToolModel:_processSelected();
    v9:_update();
end;
v2.mouseDown = function(v10) --[[ Line: 60 ]] --[[ Name: mouseDown ]]
    assert(v10._selected, "must call select before beginDrag");
    v10._draggerToolModel:_processMouseDown();
    v10:_update();
end;
v2.mouseMove = function(v11, v12, v13) --[[ Line: 66 ]] --[[ Name: mouseMove ]]
    assert(v11._selected, "must call select before moveMouse");
    local v14 = v11._draggerContext:getViewportSize();
    v11._draggerContext:setMouseLocation(Vector2.new(v14.X * v12, v14.Y * v13));
    v11._draggerToolModel:_processViewChanged();
    v11:_update();
end;
v2.mouseUp = function(v15) --[[ Line: 74 ]] --[[ Name: mouseUp ]]
    assert(v15._selected, "must call select before endDrag");
    v15._draggerToolModel:_processMouseUp();
    v15:_update();
end;
v2.keyPress = function(v16, v17) --[[ Line: 80 ]] --[[ Name: keyPress ]]
    assert(typeof(v17) == "EnumItem", "keyPress takes an Enum.KeyCode");
    assert(v16._selected, "must call select before keyPress");
    v16._draggerToolModel:_processKeyDown(v17);
    v16:_update();
    v16._draggerToolModel:_processKeyUp(v17);
    v16:_update();
end;
v2.deselect = function(v18) --[[ Line: 89 ]] --[[ Name: deselect ]]
    assert(v18._selected, "deselect called while not selected");
    v18._selected = false;
    v18._draggerToolModel:_processDeselected();
    v18:_update();
end;
return v2;