local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_DraggerFramework_0 = l_Packages_0.DraggerFramework;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_DraggerFramework_0.Utility.DragHelper);
local v6 = require(l_DraggerFramework_0.Utility.Colors);
local v7 = require(l_DraggerFramework_0.Components.MoveHandleView);
local v8 = require(l_DraggerFramework_0.Components.TargetGridView);
local v9 = require(l_DraggerFramework_0.Components.TargetSoftSnapView);
local v10 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v11 = require(l_Parent_0.Src.Utility.computeSnapPointsForInstance);
local v12 = require(l_Parent_0.Src.Components.SnapPoints);
local v13 = require(l_DraggerFramework_0.Components.DraggedPivot);
local v14 = require(l_Parent_0.Src.Utility.classifyInstancePivot);
local v15 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v16 = Vector3.new();
local v17 = {
    MinusZ = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(1, 0, 0, 0), (Vector3.new(0, 1, 0, 0))), 
        Color = v6.Z_AXIS
    }, 
    PlusZ = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(1, 0, 0, 0), (Vector3.new(0, -1, 0, 0))), 
        Color = v6.Z_AXIS
    }, 
    MinusY = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(0, 0, 1, 0), (Vector3.new(1, 0, 0, 0))), 
        Color = v6.Y_AXIS
    }, 
    PlusY = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(0, 0, 1, 0), (Vector3.new(-1, 0, 0, 0))), 
        Color = v6.Y_AXIS
    }, 
    MinusX = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, 1, 0))), 
        Color = v6.X_AXIS
    }, 
    PlusX = {
        Offset = CFrame.fromMatrix(v16, Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, -1, 0))), 
        Color = v6.X_AXIS
    }
};
local v18 = {};
v18.__index = v18;
v18.new = function(v19, v20, v21) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v11 (copy)
    local v22 = setmetatable({
        _draggerContext = v19, 
        _draggerToolModel = v20, 
        _dragInfo = v21, 
        _snapPoints = {}, 
        _originalPivot = v21.ClickedSelectable:GetPivot(), 
        _tiltRotate = CFrame.new()
    }, v18);
    v22._snapPoints = v11(v21.ClickedSelectable);
    v22._pivotOwner = v21.ClickedSelectable;
    v22._originalPivotSnapPoints = v22._snapPoints;
    v22:update();
    return v22;
end;
v18._selectedIsActive = function(v23) --[[ Line: 75 ]] --[[ Name: _selectedIsActive ]]
    if v23._draggerContext:shouldShowActiveInstanceHighlight() then
        return v23._draggerToolModel:getSelectionWrapper():getActiveSelectable() == v23._pivotOwner;
    else
        return false;
    end;
end;
v18.render = function(v24) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v4 (copy), v7 (copy), v13 (copy), v12 (copy), v15 (copy), v8 (copy), v9 (copy)
    if v24._lastDragTarget == nil then
        return;
    else
        local v25 = {};
        for v26, v27 in pairs(v17) do
            local v28 = v24._lastDragTarget.mainCFrame * v27.Offset;
            v25[v26] = v4.createElement(v7, {
                Axis = v28, 
                Color = v27.Color, 
                Outset = 0.5, 
                Scale = v24._draggerContext:getHandleScale(v28.Position), 
                AlwaysOnTop = true, 
                Thin = true
            });
        end;
        v25.DraggedPivot = v4.createElement(v13, {
            DraggerContext = v24._draggerContext, 
            CFrame = v24._lastDragTarget.mainCFrame, 
            IsActive = v24:_selectedIsActive()
        });
        if v24._draggerContext:shouldSnapPivotToGeometry() and v24._snapPoints then
            v25.SnapPoints = v4.createElement(v12, {
                Focus = v24._lastDragTarget.mainCFrame.Position, 
                SnapPoints = v24._snapPoints, 
                DraggerContext = v24._draggerContext
            });
        end;
        if v15() and not v24._draggerContext:shouldSnapPivotToGeometry() then
            local l_Position_0 = v24._lastDragTarget.targetMatrix.Position;
            local v30 = v24._draggerContext:getHandleScale(l_Position_0);
            if #v24._lastDragTarget.softSnaps == 0 then
                v25.TargetGrid = v4.createElement(v8, {
                    DragTarget = v24._lastDragTarget, 
                    SourceSize = Vector3.one * 4, 
                    Scale = v30, 
                    GridSize = if v24._draggerContext:getGridSnapEnabled() then v24._draggerContext:getGridSize() else nil, 
                    MajorStep = v24._draggerContext:getMajorGridIncrement(), 
                    Color = v24._draggerContext:getGridColor(), 
                    PrimaryColor = v24._draggerContext:getChosenColor()
                });
            else
                v25.TargetSoftSnapView = v4.createElement(v9, {
                    DragTarget = v24._lastDragTarget, 
                    DraggerContext = v24._draggerContext
                });
            end;
        end;
        return v4.createFragment(v25);
    end;
end;
v18.rotate = function(v31, v32) --[[ Line: 147 ]] --[[ Name: rotate ]]
    -- upvalues: v5 (copy)
    local l__originalPivot_0 = v31._originalPivot;
    local v34 = nil;
    if v31._lastDragTarget then
        v34 = v31._lastDragTarget.targetMatrix;
    end;
    v31._tiltRotate = v5.updateTiltRotate(v31._draggerToolModel._draggerContext:getCameraCFrame(), v31._draggerToolModel._draggerContext:getMouseRay(), {}, l__originalPivot_0, v34, v31._tiltRotate, v32, true);
end;
v18._updateNoSnap = function(v35) --[[ Line: 167 ]] --[[ Name: _updateNoSnap ]]
    -- upvalues: v15 (copy), v5 (copy), v16 (copy), v10 (copy)
    local v36 = nil;
    if v35._lastDragTarget then
        v36 = v35._lastDragTarget.targetMatrix;
    end;
    if v15() then
        local v37 = v5.getDragTarget({}, v35._originalPivot, v16, v16, v16, v35._draggerToolModel._draggerContext:getMouseRay(), if v35._draggerContext:shouldGridSnap() then v35._draggerContext:getGridSize() else nil, v35._tiltRotate, v36, true, false, v35._draggerContext:getSoftSnapMarginFactor(), v35._draggerContext:shouldPartSnap());
        if v37 then
            v35._lastDragTarget = v37;
            v10(v35._dragInfo.ClickedSelectable, v37.mainCFrame);
            return;
        end;
    else
        local v39 = v5.getDragTarget(v35._draggerToolModel._draggerContext:getMouseRay(), function(v38) --[[ Line: 197 ]] --[[ Name: snapFunction ]]
            -- upvalues: v35 (copy)
            return v35._draggerContext:snapToGridSize(v38);
        end, v16, {}, v35._originalPivot, v16, v16, v16, v35._tiltRotate, v36, true);
        if v39 then
            v35._lastDragTarget = v39;
            v10(v35._dragInfo.ClickedSelectable, v39.mainCFrame);
        end;
    end;
end;
v18._recomputeSnapPoints = function(v40) --[[ Line: 223 ]] --[[ Name: _recomputeSnapPoints ]]
    -- upvalues: v15 (copy), l_Workspace_0 (copy), v11 (copy)
    local v41 = v40._draggerContext:getMouseRay();
    local v42 = v40._draggerToolModel:getSchema();
    local v43 = v40._draggerToolModel:getSelectionWrapper():get();
    if v15() then
        local v44, v45, _, _ = v42.getMouseTarget(v40._draggerContext, v41, v43, true, false);
        if v44 then
            if v44 == v40._pivotOwner or v45 == v40._pivotOwner then
                v40._snapPoints = v40._originalPivotSnapPoints;
                return;
            elseif v44 ~= l_Workspace_0.Terrain then
                v40._snapPoints = v11(v44);
                return;
            end;
        end;
    else
        local v48 = v42.getMouseTarget(v40._draggerContext, v41, v43, true);
        if v48 then
            if v48 == v40._pivotOwner then
                v40._snapPoints = v40._originalPivotSnapPoints;
                return;
            elseif v48 ~= l_Workspace_0.Terrain then
                v40._snapPoints = v11(v48);
            end;
        end;
    end;
end;
v18._snapToSnapPoints = function(v49) --[[ Line: 268 ]] --[[ Name: _snapToSnapPoints ]]
    -- upvalues: v10 (copy)
    if not v49._snapPoints then
        return;
    else
        local v50 = v49._draggerContext:getMouseLocation();
        local v51 = nil;
        local v52 = 1e999;
        for _, v54 in ipairs(v49._snapPoints) do
            local v55, v56 = v49._draggerContext:worldToViewportPoint(v54.Position);
            if v56 then
                local l_Magnitude_0 = (Vector2.new(v55.X, v55.Y) - v50).Magnitude;
                if l_Magnitude_0 < v52 then
                    v52 = l_Magnitude_0;
                    v51 = v54;
                end;
            end;
        end;
        local v58 = v51 or v49._originalPivot;
        v49._lastDragTarget = {
            mainCFrame = v58
        };
        v10(v49._dragInfo.ClickedSelectable, v58);
        return;
    end;
end;
v18._updateSnap = function(v59) --[[ Line: 297 ]] --[[ Name: _updateSnap ]]
    v59:_recomputeSnapPoints();
    v59:_snapToSnapPoints();
end;
v18.update = function(v60) --[[ Line: 302 ]] --[[ Name: update ]]
    if v60._draggerContext:shouldSnapPivotToGeometry() then
        v60:_updateSnap();
        return;
    else
        v60:_updateNoSnap();
        return;
    end;
end;
v18.destroy = function(v61) --[[ Line: 310 ]] --[[ Name: destroy ]]
    -- upvalues: v14 (copy)
    v61._draggerContext:getAnalytics():sendEvent("setPivot", {
        gridSize = v61._draggerContext:getGridSize(), 
        rotateIncrement = v61._draggerContext:getRotateIncrement(), 
        handleId = v61._dragInfo.HandleId, 
        pivotType = v14(v61._dragInfo.ClickedSelectable)
    });
end;
return v18;