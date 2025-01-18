local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = game:DefineFastFlag("AvatarPreviewerEditingToolsDraggerClosestPoint", false);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = if #v6.selectedPoints == 1 then v6.createUpdatePointPosition(v6.selectedPoints[1]) else nil;
    return (setmetatable({
        _draggerContext = v6, 
        _selectedPoint = v6.selectedPoints[1], 
        _updatePointPosition = v7
    }, v5));
end;
v5.render = function(_) --[[ Line: 42 ]] --[[ Name: render ]]
    return nil;
end;
v5.rotate = function(_) --[[ Line: 46 ]] --[[ Name: rotate ]]

end;
v5.update = function(v10) --[[ Line: 48 ]] --[[ Name: update ]]
    -- upvalues: v3 (copy), l_Workspace_0 (copy), v4 (copy)
    if v10._updatePointPosition == nil then
        return;
    else
        assert(v10._updatePointPosition ~= nil, v3.LUAU_ANALYZE_ERROR);
        local v11 = v10._draggerContext:getMouseRay();
        local v12 = RaycastParams.new();
        v12.FilterType = Enum.RaycastFilterType.Include;
        v12.FilterDescendantsInstances = {
            v10._selectedPoint.limb
        };
        local v13 = l_Workspace_0:Raycast(v11.Origin, v11.Direction, v12);
        local v14 = nil;
        if v4 then
            if v13 == nil then
                local l_limb_0 = v10._selectedPoint.limb;
                v14 = l_limb_0:GetClosestPointOnSurface(v11.Origin + v11.Direction.Unit * (l_limb_0.Position - v11.Origin).Magnitude);
            else
                v14 = v13.Position;
            end;
        elseif v13 == nil then
            return;
        else
            assert(v13 ~= nil, v3.LUAU_ANALYZE_ERROR);
            v14 = v13.Position;
        end;
        if v10._draggerContext.projectionEnabled then
            v10._updatePointPosition(CFrame.new(v10._draggerContext.worldModel.PrimaryPart.CFrame:PointToObjectSpace(v14)) * v10._selectedPoint.getCFrame().Rotation);
            return;
        else
            local _ = nil;
            local v17;
            repeat
                v17 = l_Workspace_0:Raycast(v11.Origin + v11.Direction * 0.05, -v11.Direction, v12);
            until v17 ~= nil;
            assert(v17 ~= nil, v3.LUAU_ANALYZE_ERROR);
            v17 = v14:Lerp(v17.Position, 0.5);
            v10._updatePointPosition(CFrame.new(v10._draggerContext.worldModel.PrimaryPart.CFrame:PointToObjectSpace(v17)) * v10._selectedPoint.getCFrame().Rotation);
            return;
        end;
    end;
end;
v5.destroy = function(_) --[[ Line: 121 ]] --[[ Name: destroy ]]

end;
return v5;