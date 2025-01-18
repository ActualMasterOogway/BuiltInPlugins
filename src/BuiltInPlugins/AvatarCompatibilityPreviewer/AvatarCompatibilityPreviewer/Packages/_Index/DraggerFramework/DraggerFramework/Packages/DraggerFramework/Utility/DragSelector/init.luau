local _ = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Utility.SelectionHelper);
local v3 = require(l_Parent_0.Flags.getFFlagDraggerShouldBufferSelectionSignals);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7, v8) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v5 ~= nil);
    assert(v6 ~= nil);
    assert(v7 ~= nil);
    assert(v8 ~= nil);
    return (setmetatable({
        _isDragging = false, 
        _selectionBeforeDrag = {}, 
        _dragStartLocation = nil, 
        _dragCandidates = {}, 
        _selectionWrapper = v5, 
        _beginBoxSelect = v6, 
        _updateBoxSelect = v7, 
        _endBoxSelect = v8, 
        _insertionOrder = {}, 
        _insertionOrderNext = 1
    }, v4));
end;
local function v25(v9, v10, v11) --[[ Line: 38 ]] --[[ Name: getSelectionFrustum ]]
    local v12 = Rect.new(v10, v11);
    local v13 = v9:viewportPointToRay(Vector2.new(v12.Min.X, v12.Min.Y));
    local v14 = v9:viewportPointToRay(Vector2.new(v12.Max.X, v12.Min.Y));
    local v15 = v9:viewportPointToRay(Vector2.new(v12.Max.X, v12.Max.Y));
    local v16 = v9:viewportPointToRay(Vector2.new(v12.Min.X, v12.Max.Y));
    if v14.Direction:FuzzyEq(v13.Direction) then
        local v17 = (v14.Origin - v13.Origin):Cross(v14.Direction);
        local v18 = (v15.Origin - v14.Origin):Cross(v15.Direction);
        local v19 = (v16.Origin - v15.Origin):Cross(v16.Direction);
        local v20 = (v13.Origin - v16.Origin):Cross(v13.Direction);
        return {
            {
                origin = v13.Origin, 
                normal = v17
            }, 
            {
                origin = v14.Origin, 
                normal = v18
            }, 
            {
                origin = v15.Origin, 
                normal = v19
            }, 
            {
                origin = v16.Origin, 
                normal = v20
            }
        };
    else
        local v21 = v16.Direction:Cross(v13.Direction);
        local v22 = v13.Direction:Cross(v14.Direction);
        local v23 = v14.Direction:Cross(v15.Direction);
        local v24 = v15.Direction:Cross(v16.Direction);
        return {
            {
                origin = v13.Origin, 
                normal = v22
            }, 
            {
                origin = v14.Origin, 
                normal = v23
            }, 
            {
                origin = v15.Origin, 
                normal = v24
            }, 
            {
                origin = v16.Origin, 
                normal = v21
            }
        };
    end;
end;
v4.getStartLocation = function(v26) --[[ Line: 75 ]] --[[ Name: getStartLocation ]]
    return v26._dragStartLocation;
end;
v4.beginDrag = function(v27, v28, v29) --[[ Line: 82 ]] --[[ Name: beginDrag ]]
    assert(not v27._isDragging, "Cannot begin drag when already dragging.");
    v27._isDragging = true;
    v27._dragCandidates = v27._beginBoxSelect(v28);
    v27._selectionBeforeDrag = v27._selectionWrapper:get();
    v27._dragStartLocation = v29 or v28:getMouseLocation();
end;
v4.updateDrag = function(v30, v31) --[[ Line: 96 ]] --[[ Name: updateDrag ]]
    -- upvalues: v25 (copy), v2 (copy)
    assert(v30._isDragging, "Cannot update drag when no drag in progress.");
    local v32 = v31:shouldExtendSelection();
    local v33 = v31:getMouseLocation();
    local v34 = nil;
    v34 = if not v32 then v30._selectionWrapper:get() else v30._selectionBeforeDrag;
    v30._updateBoxSelect(v31, v30._dragStartLocation, v33);
    if (v33 - v30._dragStartLocation).Magnitude < 3 then
        return;
    else
        local v35 = v25(v31, v30._dragStartLocation, v33);
        if not v35 then
            return;
        else
            local v36 = {};
            local v37 = false;
            local l__insertionOrder_0 = v30._insertionOrder;
            for _, v40 in ipairs(v30._dragCandidates) do
                local v41 = true;
                for _, v43 in ipairs(v35) do
                    if (v40.Center - v43.origin):Dot(v43.normal) < 0 then
                        v41 = false;
                        break;
                    end;
                end;
                if v41 ~= v40.Selected then
                    v40.Selected = v41;
                    v37 = true;
                    if v41 then
                        l__insertionOrder_0[v40.Selectable] = v30._insertionOrderNext;
                        v30._insertionOrderNext = v30._insertionOrderNext + 1;
                    end;
                end;
                if v41 then
                    table.insert(v36, v40.Selectable);
                end;
            end;
            if v37 then
                table.sort(v36, function(v44, v45) --[[ Line: 146 ]]
                    -- upvalues: l__insertionOrder_0 (copy)
                    return (l__insertionOrder_0[v44] or 0) < (l__insertionOrder_0[v45] or 0);
                end);
                local _ = nil;
                local v47, v48 = v2.updateSelectionWithMultipleSelectables(v36, v34, v32);
                v30._selectionWrapper:set(v47, v48);
            end;
            return;
        end;
    end;
end;
v4.commitDrag = function(v49, v50) --[[ Line: 164 ]] --[[ Name: commitDrag ]]
    -- upvalues: v3 (copy)
    v49:updateDrag(v50);
    v49._endBoxSelect(v50);
    if v3() then
        v49._selectionWrapper:flush();
    end;
    v49._selectionBeforeDrag = {};
    v49._dragStartLocation = nil;
    v49._isDragging = false;
end;
return v4;