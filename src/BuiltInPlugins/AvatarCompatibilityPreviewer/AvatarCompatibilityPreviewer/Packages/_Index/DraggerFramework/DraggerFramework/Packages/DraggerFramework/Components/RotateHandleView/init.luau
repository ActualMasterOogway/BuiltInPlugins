local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Utility.Math);
local v5 = require(l_Parent_0.Components.FloatingValueInput);
local v6 = require(l_Parent_0.Utility.conciseNumberFormat);
local v7 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local l_Never_0 = Enum.AdornCullingMode.Never;
local v9 = v3.PureComponent:extend("RotateHandleView");
local v10 = v7() and 0.1 or 0.15;
local v11 = v7() and 0.6 or v10 * 4;
local function _(v12) --[[ Line: 35 ]] --[[ Name: isMultipleOf90Degrees ]]
    return math.abs(v12 - math.floor(v12 / 1.5707963267948966 + 0.5) * 1.5707963267948966) < 0.001;
end;
v9.render = function(v14) --[[ Line: 40 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v3 (copy), l_Workspace_0 (copy), l_Never_0 (copy), v7 (copy), v5 (copy), v6 (copy)
    local v15 = (4.5 + (v14.props.RadiusOffset or 0)) * v14.props.Scale;
    if v14.props.Hovered then
        v15 = v15 + v14.props.Scale * 0.1;
    end;
    local v16 = v10 * v14.props.Scale;
    local v17 = {};
    if v14.props.Thin then
        v16 = 0 * v16;
    end;
    if v14.props.Hovered then
        v16 = 1.5 * v16;
    end;
    local v18 = 0.5 * v16;
    v17.OnTopHandle = v3.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        CFrame = v14.props.HandleCFrame * CFrame.Angles(v14.props.StartAngle or 0, 1.5707963267948966, 1.5707963267948966), 
        Height = v16, 
        Radius = v15 + v18, 
        InnerRadius = v15 - v18, 
        Color3 = v14.props.Color, 
        AlwaysOnTop = true, 
        Transparency = 0.45, 
        ZIndex = 0, 
        AdornCullingMode = l_Never_0
    });
    v17.BrightHandle = v3.createElement("CylinderHandleAdornment", {
        Adornee = l_Workspace_0.Terrain, 
        CFrame = v14.props.HandleCFrame * CFrame.Angles(v14.props.StartAngle or 0, 1.5707963267948966, 1.5707963267948966), 
        Height = v16, 
        Radius = v15 + v18, 
        InnerRadius = v15 - v18, 
        Color3 = v14.props.Color, 
        AlwaysOnTop = false, 
        ZIndex = 0, 
        AdornCullingMode = l_Never_0
    });
    if v14.props.TickAngle then
        local l_TickAngle_0 = v14.props.TickAngle;
        local v20 = math.ceil(6.283185307179586 / l_TickAngle_0);
        local v21 = 0.05 * v14.props.Scale;
        local v22 = 0.1 * v15;
        local v23 = 0.1 * v14.props.Scale;
        local v24 = 0.3 * v15;
        local v25 = 0;
        local v26 = 0;
        local v27 = false;
        if v14.props.StartAngle then
            v25 = v14.props.EndAngle - v14.props.StartAngle;
            v26 = v14.props.StartAngle;
            v27 = true;
        end;
        for v28 = 1, v20 do
            local v29 = 3.141592653589793 + (v28 - 1) * l_TickAngle_0 - v25;
            local l_v27_0 = v27;
            if l_v27_0 then
                local v31 = v29 - v26;
                l_v27_0 = math.abs(v31 - math.floor(v31 / 1.5707963267948966 + 0.5) * 1.5707963267948966) < 0.001;
            end;
            local v32 = l_v27_0 and v24 or v22;
            local v33 = l_v27_0 and v23 or v21;
            local v34 = v14.props.HandleCFrame * CFrame.Angles(v29, 0, 0) * CFrame.new(0, 0, v15 - 0.5 * v22);
            v17["Tick" .. tostring(v28)] = v3.createElement("BoxHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                AlwaysOnTop = false, 
                CFrame = v34, 
                Color3 = v14.props.Color, 
                Size = Vector3.new(v33, v33, v32), 
                ZIndex = 0, 
                AdornCullingMode = l_Never_0
            });
            v17["OnTopTick" .. tostring(v28)] = v3.createElement("BoxHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                AlwaysOnTop = true, 
                Transparency = 0.45, 
                CFrame = v34, 
                Color3 = v14.props.Color, 
                Size = Vector3.new(v33, v33, v32), 
                ZIndex = 0, 
                AdornCullingMode = l_Never_0
            });
        end;
    end;
    if v14.props.StartAngle and v14.props.EndAngle then
        local v35 = 0.1 * v15;
        local v36 = 0.5 * (0.3 * v15 - v35);
        local v37 = v14.props.EndAngle - v14.props.StartAngle;
        local l_StartAngle_0 = v14.props.StartAngle;
        if v37 > 3.141592653589793 then
            v37 = v37 - 6.283185307179586;
        end;
        if v37 < -3.141592653589793 then
            v37 = v37 + 6.283185307179586;
        end;
        if v37 < 0 then
            l_StartAngle_0 = l_StartAngle_0 + v37;
            v37 = math.abs(v37);
        end;
        if math.abs(v37) > 0.001 then
            v17.AngleSweepElement = v3.createElement("CylinderHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                CFrame = v14.props.HandleCFrame * CFrame.Angles(l_StartAngle_0 - 1.5707963267948966, 1.5707963267948966, 1.5707963267948966), 
                Height = 0, 
                Radius = v15, 
                InnerRadius = 0, 
                Angle = math.deg(v37), 
                Color3 = v14.props.Color, 
                AlwaysOnTop = true, 
                Transparency = 0.6, 
                ZIndex = 0
            });
        end;
        local v39 = 0.08 * v14.props.Scale;
        v17.EndAngleElement = (function(v40) --[[ Line: 172 ]] --[[ Name: createAngleDisplay ]]
            -- upvalues: v15 (ref), v36 (copy), v14 (copy), v3 (ref), l_Workspace_0 (ref), v39 (copy)
            local v41 = CFrame.new(0, 0, -(v15 + v36) / 2);
            local v42 = v14.props.HandleCFrame * CFrame.Angles(v40, 0, 0) * v41;
            return v3.createElement("CylinderHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                AlwaysOnTop = true, 
                CFrame = v42, 
                Color3 = v14.props.Color, 
                Height = v15 + v36, 
                Radius = v39 / 2, 
                ZIndex = 0
            });
        end)(v14.props.EndAngle);
        if v7() and v14.props.DraggerContext:shouldShowPreciseInput() then
            local l_HandleCFrame_0 = v14.props.HandleCFrame;
            local l_Position_0 = l_HandleCFrame_0.Position;
            local v45 = CFrame.new(0, 0, -(v15 + v36) / 2);
            local v46 = l_Position_0 + (l_HandleCFrame_0 * CFrame.Angles(l_StartAngle_0 + v37 * 0.5, 0, 0) * v45).LookVector * (1.2 * v15);
            local v47, v48 = v14.props.DraggerContext:worldToViewportPoint(v46);
            if v48 then
                v17.ValueDisplay = v3.createElement(v5, {
                    DraggerContext = v14.props.DraggerContext, 
                    Position = UDim2.fromOffset(v47.X, v47.Y), 
                    Value = v6((math.deg(v37)))
                });
            end;
        end;
    end;
    return v3.createElement("Folder", {}, v17);
end;
v9.hitTest = function(v49, v50) --[[ Line: 215 ]] --[[ Name: hitTest ]]
    -- upvalues: v11 (copy), v4 (copy)
    local l_HandleCFrame_1 = v49.HandleCFrame;
    local l_Unit_0 = v50.Unit;
    local v53 = (4.5 + (v49.RadiusOffset or 0)) * v49.Scale;
    local v54 = v11 * v49.Scale;
    local l_RightVector_0 = l_HandleCFrame_1.RightVector;
    local l_Position_1 = l_HandleCFrame_1.Position;
    local v57 = 1e999;
    local v58 = false;
    local v59 = nil;
    local v60 = nil;
    local v61 = l_Position_1 + l_RightVector_0 * 0.5 * v54;
    v60 = v4.intersectRayPlane(l_Unit_0.Origin, l_Unit_0.Direction, v61, l_RightVector_0);
    if v60 >= 0 and v60 < v57 and math.abs((l_Unit_0.Origin + l_Unit_0.Direction * v60 - v61).Magnitude - v53) < 0.5 * v54 then
        v58 = true;
        v57 = v60;
    end;
    local v62 = l_Position_1 - l_RightVector_0 * 0.5 * v54;
    v60 = v4.intersectRayPlane(l_Unit_0.Origin, l_Unit_0.Direction, v62, -l_RightVector_0);
    if v60 >= 0 and v60 < v57 and math.abs((l_Unit_0.Origin + l_Unit_0.Direction * v60 - v62).Magnitude - v53) < 0.5 * v54 then
        v58 = true;
        v57 = v60;
    end;
    local v63 = l_HandleCFrame_1:PointToObjectSpace(l_Unit_0.Origin);
    local v64 = l_HandleCFrame_1:VectorToObjectSpace(l_Unit_0.Direction);
    local v65 = v53 - 0.5 * v54;
    local v66, v67 = v4.intersectRayCylinder(v63, v64, v65, v54);
    v59 = v66;
    v60 = v67;
    if v59 and v60 < v57 then
        v58 = true;
        v57 = v60;
    end;
    v66 = v53 + 0.5 * v54;
    local v68;
    v67, v68 = v4.intersectRayCylinder(v63, v64, v66, v54);
    v59 = v67;
    v60 = v68;
    if v59 and v60 < v57 then
        v58 = true;
        v57 = v60;
    end;
    if v58 then
        return v57;
    else
        return nil;
    end;
end;
return v9;