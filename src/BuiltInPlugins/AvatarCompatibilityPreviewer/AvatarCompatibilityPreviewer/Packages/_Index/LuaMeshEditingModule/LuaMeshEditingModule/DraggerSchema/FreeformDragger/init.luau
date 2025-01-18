local l_Parent_0 = script:FindFirstAncestor("LuaMeshEditingModule").Parent;
local l_Math_0 = require(l_Parent_0.DraggerFramework).Utility.Math;
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v5 = setmetatable({
        _draggerContext = v3, 
        _draggerToolModel = v4, 
        _initialSelectionInfo = v4._selectionInfo
    }, v2);
    v5:update();
    return v5;
end;
local function v16(v6, v7, v8) --[[ Line: 21 ]] --[[ Name: computeGlobalTransform ]]
    -- upvalues: l_Math_0 (copy)
    local l_CurrentCamera_0 = Workspace.CurrentCamera;
    local v10 = l_CurrentCamera_0:WorldToScreenPoint(v6);
    local v11 = l_CurrentCamera_0:ScreenPointToRay(v10.X, v10.Y);
    local v12 = v11.Origin + (v7.Origin - v8.Origin);
    local l_Unit_0 = (v11.Direction.Unit + v7.Direction.Unit - v8.Direction.Unit).Unit;
    local l_Unit_1 = (v12 - v6).Unit;
    local v15 = l_Math_0.intersectRayPlanePoint(v12, l_Unit_0, v6, l_Unit_1);
    return CFrame.new(v15);
end;
v2._selectedIsActive = function(_) --[[ Line: 36 ]] --[[ Name: _selectedIsActive ]]

end;
v2.render = function(_) --[[ Line: 38 ]] --[[ Name: render ]]

end;
v2.update = function(v19) --[[ Line: 40 ]] --[[ Name: update ]]
    -- upvalues: v16 (copy)
    if v19._mouseStartRay == nil then
        v19._mouseStartRay = v19._draggerContext.vertexEditingTool:getMouseStartPosition();
    end;
    local v20 = v19._draggerToolModel._draggerContext:getMouseRay();
    local v21 = v19._draggerToolModel._selectionInfo:getBoundingBox();
    local v22 = v16(v21.Position, v20, v19._mouseStartRay) * v21:Inverse();
    local v23, v24 = v19._initialSelectionInfo:getBoundingBox();
    v19._baseBoundingBoxCenter = v23.p + v24;
    local v25, v26 = v22:ToAxisAngle();
    v19._axis = v25;
    v19._totalAngle = v26;
    v19._draggerContext.vertexEditingTool:transformSelected(v22, v19._baseBoundingBoxCenter, v19._axis, v19._totalAngle);
    v19._lastAppliedTransform = v22;
end;
v2.destroy = function(v27) --[[ Line: 64 ]] --[[ Name: destroy ]]
    v27._draggerContext.vertexEditingTool:setMouseStartPosition();
    v27._draggerContext.vertexEditingTool:updateCurrentToolStateData();
    v27._draggerContext.vertexEditingTool:addWaypoint();
end;
return v2;