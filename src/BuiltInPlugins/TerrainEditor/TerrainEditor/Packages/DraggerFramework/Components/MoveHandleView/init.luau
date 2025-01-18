local l_Workspace_0 = game:GetService("Workspace");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v4 = require(l_Parent_0.Utility.Math);
local v5 = require(l_Parent_1.Packages.Roact);
local l_Never_0 = Enum.AdornCullingMode.Never;
local v7 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v8 = v5.PureComponent:extend("MoveHandleView");
local v9 = v7() and 0.4 or 0.34;
v8.init = function(_) --[[ Line: 27 ]] --[[ Name: init ]]

end;
v8.render = function(v11) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), l_Workspace_0 (copy), v7 (copy), v5 (copy), l_Never_0 (copy), l_CoreGui_0 (copy)
    local l_Scale_0 = v11.props.Scale;
    local v13 = l_Scale_0 * 4;
    local v14 = l_Scale_0 * 0.1;
    local v15 = l_Scale_0 * 0.6 + v13 * (v11.props.Outset or 0);
    local v16 = l_Scale_0 * 0.2;
    local v17 = v13 * 0.25;
    if v11.props.Thin then
        v14 = v14 * v9;
    end;
    if v11.props.Hovered then
        v14 = v14 * 1.5;
        v17 = v17 * 1.5;
    end;
    local v18 = v11.props.Axis * CFrame.new(0, 0, -(v15 + v13));
    local v19 = v18 * Vector3.new(0, 0, -v16);
    local v20, _ = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v19);
    local v22 = {};
    if v7() then
        local l_Tail_0 = v11.props.Tail;
        if l_Tail_0 then
            v13 = v13 + v15;
            v15 = 0;
            local v24 = math.min(l_Scale_0, v11.props.TailScale);
            v22.ExtraShaft = v5.createElement("CylinderHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                ZIndex = 0, 
                Radius = v24 * 0.1 * 0.65, 
                Height = l_Tail_0, 
                CFrame = v11.props.Axis * CFrame.new(0, 0, 0 + l_Tail_0 * 0.5), 
                Color3 = v11.props.Color, 
                AlwaysOnTop = true, 
                Transparency = 0.5, 
                AdornCullingMode = l_Never_0
            });
        end;
    end;
    if not v11.props.Hovered then
        v22.Shaft = v5.createElement("CylinderHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            ZIndex = 0, 
            Radius = v14, 
            Height = v13, 
            CFrame = v11.props.Axis * CFrame.new(0, 0, -(v15 + v13 * 0.5)), 
            Color3 = v11.props.Color, 
            AlwaysOnTop = false, 
            AdornCullingMode = l_Never_0
        });
        if not v11.props.Thin then
            v22.Head = v5.createElement("ConeHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                ZIndex = 0, 
                Radius = 3 * v14, 
                Height = v17, 
                CFrame = v18, 
                Color3 = v11.props.Color, 
                AlwaysOnTop = false, 
                AdornCullingMode = l_Never_0
            });
        end;
    end;
    if v11.props.AlwaysOnTop then
        v22.DimmedShaft = v5.createElement("CylinderHandleAdornment", {
            Adornee = l_Workspace_0.Terrain, 
            ZIndex = 0, 
            Radius = v14, 
            Height = v13, 
            CFrame = v11.props.Axis * CFrame.new(0, 0, -(v15 + v13 * 0.5)), 
            Color3 = v11.props.Color, 
            AlwaysOnTop = true, 
            Transparency = v11.props.Hovered and 0 or 0.45, 
            AdornCullingMode = l_Never_0
        });
        if not v11.props.Thin then
            v22.DimmedHead = v5.createElement("ConeHandleAdornment", {
                Adornee = l_Workspace_0.Terrain, 
                ZIndex = 0, 
                Radius = 3 * v14, 
                Height = v17, 
                CFrame = v18, 
                Color3 = v11.props.Color, 
                AlwaysOnTop = true, 
                Transparency = v11.props.Hovered and 0 or 0.45, 
                AdornCullingMode = l_Never_0
            });
        end;
    elseif not v11.props.Thin then
        v22.ScreenBox = v5.createElement(v5.Portal, {
            target = l_CoreGui_0
        }, {
            MoveToolScreenspaceHandle = v5.createElement("ScreenGui", {}, {
                Frame = v5.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v11.props.Color, 
                    Position = UDim2.new(0, v20.X - 3, 0, v20.Y - 3), 
                    Size = UDim2.new(0, 6, 0, 6), 
                    AdornCullingMode = l_Never_0
                })
            })
        });
    end;
    return v5.createElement("Folder", {}, v22);
end;
v8.hitTest = function(v25, v26) --[[ Line: 143 ]] --[[ Name: hitTest ]]
    -- upvalues: l_Workspace_0 (copy), v4 (copy)
    local l_Scale_1 = v25.Scale;
    local v28 = l_Scale_1 * 4;
    local v29 = l_Scale_1 * 0.4;
    local v30 = v29 * 3;
    local v31 = l_Scale_1 * 0.6 + v28 * (v25.Outset or 0);
    local v32 = l_Scale_1 * 0.2;
    local v33 = v28 * 0.25;
    local v34 = v31 + v28;
    if not v25.AlwaysOnTop then
        local v35 = v25.Axis * Vector3.new(0, 0, -(v31 + v28 + v32));
        local v36, _ = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v35);
        local v38 = l_Workspace_0.CurrentCamera:WorldToScreenPoint(v26.Origin);
        if v38.X > v36.X - 3 and v38.Y > v36.Y - 3 and v38.X < v36.X + 3 and v38.Y < v36.Y + 3 then
            return 0;
        end;
    end;
    local v39, v40 = v4.intersectRayRay(v25.Axis.Position, v25.Axis.LookVector, v26.Origin, v26.Direction.Unit);
    if not v39 then
        return nil;
    else
        local _, v42 = v4.intersectRayRay(v26.Origin, v26.Direction.Unit, v25.Axis.Position, v25.Axis.LookVector);
        local l_Magnitude_0 = (v25.Axis.Position + v25.Axis.LookVector * v40 - (v26.Origin + v26.Direction.Unit * v42)).Magnitude;
        if l_Magnitude_0 < v29 and v31 < v40 and v40 < v34 then
            return v42;
        elseif l_Magnitude_0 < v30 and v34 < v40 and v40 < v34 + v33 then
            return v42;
        else
            return nil;
        end;
    end;
end;
v8.getHandleDimensionForScale = function(v44, v45) --[[ Line: 201 ]] --[[ Name: getHandleDimensionForScale ]]
    local v46 = v44 * 4;
    return v44 * 0.6 + v46 * (v45 or 0), v46 + v46 * 0.25;
end;
return v8;