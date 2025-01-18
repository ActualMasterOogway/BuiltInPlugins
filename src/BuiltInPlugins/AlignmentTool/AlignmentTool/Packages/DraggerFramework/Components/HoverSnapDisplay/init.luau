local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Components.SphereMajorLines);
local v4 = require(l_Parent_0.Components.CylinderMajorLines);
local v5 = require(l_Parent_0.Components.PivotRing);
local v6 = require(l_Parent_0.Components.RulerView);
local v7 = v2.Component:extend("HoverSnapDisplay");
local function _(v8, v9) --[[ Line: 21 ]] --[[ Name: snapVector3 ]]
    return (Vector3.new(math.floor(v8.X / v9 + 0.5) * v9, math.floor(v8.Y / v9 + 0.5) * v9, math.floor(v8.Z / v9 + 0.5) * v9));
end;
v7.render = function(v11) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v6 (copy), v3 (copy), v4 (copy)
    local l_props_0 = v11.props;
    local l_DraggerContext_0 = l_props_0.DraggerContext;
    local l_HoverMetadata_0 = l_props_0.HoverMetadata;
    local v15 = {};
    if not l_HoverMetadata_0 then
        return;
    else
        local l_TargetMatrix_0 = l_HoverMetadata_0.TargetMatrix;
        local l_RaycastResult_0 = l_HoverMetadata_0.RaycastResult;
        if not l_RaycastResult_0 then
            return;
        else
            local l_Position_0 = l_RaycastResult_0.Position;
            local v19 = l_DraggerContext_0:getGridColor();
            local v20 = nil;
            if l_HoverMetadata_0.IsPivot then
                v20 = l_TargetMatrix_0.Position;
                v15.PivotRing = v2.createElement(v5, {
                    DraggerContext = l_DraggerContext_0, 
                    Position = l_TargetMatrix_0.Position, 
                    Hovered = true, 
                    IsActive = l_DraggerContext_0:shouldShowActiveInstanceHighlight() and l_HoverMetadata_0.IsActivePivot
                });
            elseif l_TargetMatrix_0 and l_DraggerContext_0:getGridSnapEnabled() then
                local v21 = l_TargetMatrix_0:PointToObjectSpace(l_Position_0);
                local v22 = if v21.X > 0 then l_TargetMatrix_0.XVector else -l_TargetMatrix_0.XVector;
                local v23 = if v21.Z > 0 then l_TargetMatrix_0.ZVector else -l_TargetMatrix_0.ZVector;
                local v24 = l_DraggerContext_0:getGridSize();
                local v25 = Vector3.new(v21.X, 0, v21.Z);
                local v26 = Vector3.new(math.floor(v25.X / v24 + 0.5) * v24, math.floor(v25.Y / v24 + 0.5) * v24, math.floor(v25.Z / v24 + 0.5) * v24);
                v20 = l_TargetMatrix_0:PointToWorldSpace(v26);
                if l_DraggerContext_0:shouldShowHoverGrids() then
                    v25 = math.abs(v26.X);
                    local v27 = math.abs(v26.Z);
                    local v28 = CFrame.fromMatrix(l_TargetMatrix_0.Position, v22, v23:Cross(v22));
                    v15.TargetRulerView = v2.createElement(v6, {
                        MainTransparency = 0.4, 
                        DimTransparency = 0.85, 
                        Color3 = v19, 
                        CFrame = v28, 
                        Size = Vector3.new(v25, 0, v27), 
                        GridSize = v24, 
                        MajorStep = l_DraggerContext_0:getMajorGridIncrement()
                    });
                end;
            else
                v20 = l_Position_0;
            end;
            if l_DraggerContext_0:shouldShowHoverGrids() then
                local l_Instance_0 = l_HoverMetadata_0.RaycastResult.Instance;
                if l_Instance_0 and l_Instance_0:IsA("Part") then
                    if l_Instance_0.Shape == Enum.PartType.Ball then
                        v15.MajorLines = v2.createElement(v3, {
                            Part = l_Instance_0, 
                            Color3 = v19
                        });
                    elseif l_Instance_0.Shape == Enum.PartType.Cylinder then
                        v15.MajorLines = v2.createElement(v4, {
                            Part = l_Instance_0, 
                            Color3 = v19
                        });
                    end;
                end;
                if l_TargetMatrix_0 and l_DraggerContext_0:shouldGridSnap() then
                    v15.SnapTo = v2.createElement("SphereHandleAdornment", {
                        Radius = l_DraggerContext_0:getHandleScale(v20) * 0.15, 
                        CFrame = l_TargetMatrix_0.Rotation + v20, 
                        Color3 = if l_props_0.Pending then l_DraggerContext_0:getChosenColor() else l_DraggerContext_0:getGridColor(), 
                        AlwaysOnTop = true, 
                        AdornCullingMode = Enum.AdornCullingMode.Never, 
                        Adornee = workspace.Terrain, 
                        ZIndex = 0
                    });
                end;
            end;
            return v2.createFragment(v15);
        end;
    end;
end;
return v7;