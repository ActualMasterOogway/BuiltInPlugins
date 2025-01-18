local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.Grid3D);
local v4 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v5 = require(l_Parent_0.Components.SphereMajorLines);
local v6 = require(l_Parent_0.Components.CylinderMajorLines);
local v7 = require(l_Parent_0.Components.LatLonGuide);
local v8 = require(l_Parent_0.Components.RulerView);
local v9 = game:DefineFastFlag("DraggerShowFullCross", false);
local v10 = v2.PureComponent:extend("TargetGridView");
local function v17(v11) --[[ Line: 41 ]] --[[ Name: getBasis ]]
    local l_targetMatrix_0 = v11.targetMatrix;
    local l_Position_0 = l_targetMatrix_0.Position;
    local l_XVector_0 = l_targetMatrix_0.XVector;
    local l_ZVector_0 = l_targetMatrix_0.ZVector;
    local v16 = v11.mouseWorld - l_Position_0;
    if v16:Dot(l_XVector_0) < 0 then
        l_XVector_0 = -l_XVector_0;
    end;
    if v16:Dot(l_ZVector_0) < 0 then
        l_ZVector_0 = -l_ZVector_0;
    end;
    return l_Position_0, l_XVector_0, l_ZVector_0, math.max(0, v16:Dot(l_XVector_0)), (math.max(0, v16:Dot(l_ZVector_0)));
end;
v10._renderRulerSnapToPolygon = function(v18, _) --[[ Line: 60 ]] --[[ Name: _renderRulerSnapToPolygon ]]
    -- upvalues: v17 (copy), v9 (copy), v2 (copy), v8 (copy)
    local l_props_0 = v18.props;
    local l_DragTarget_0 = l_props_0.DragTarget;
    local v22, v23, v24, v25, v26 = v17(l_DragTarget_0);
    local l_GridSize_0 = l_props_0.GridSize;
    local l_targetSize_0 = l_DragTarget_0.targetSize;
    local l_targetPart_0 = l_DragTarget_0.targetPart;
    local v30 = v9 and l_targetPart_0 and l_targetPart_0:IsA("Part");
    local v31 = v25 / l_GridSize_0;
    local v32 = v26 / l_GridSize_0;
    local v33 = math.floor(v31 + 0.5) * l_GridSize_0;
    local v34 = math.floor(v32 + 0.5) * l_GridSize_0;
    return v2.createElement(v8, {
        Color3 = l_props_0.PrimaryColor, 
        MainTransparency = 0, 
        DimTransparency = 0.5, 
        GridSize = l_GridSize_0, 
        MajorStep = l_props_0.MajorStep, 
        CFrame = CFrame.fromMatrix(v22, v23, v24:Cross(v23)), 
        Size = Vector3.new(v33, 0, v34), 
        ExtraSize = if v30 then Vector3.new(l_targetSize_0.X - v33, 0, l_targetSize_0.Z - v34) else nil
    });
end;
v10._renderLattitudeGuide = function(v35) --[[ Line: 90 ]] --[[ Name: _renderLattitudeGuide ]]
    -- upvalues: v2 (copy), v7 (copy)
    local l_props_1 = v35.props;
    local l_DragTarget_1 = l_props_1.DragTarget;
    return v2.createElement(v7, {
        Part = l_DragTarget_1.targetPart, 
        WorldPosition = l_DragTarget_1.targetMatrix.Position, 
        PrimaryColor = l_props_1.PrimaryColor, 
        Color = l_props_1.Color, 
        GridSize = l_props_1.GridSize
    });
end;
v10._renderCylinderRingGuide = function(v38, v39, v40, v41) --[[ Line: 102 ]] --[[ Name: _renderCylinderRingGuide ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_targetPart_1 = v38.props.DragTarget.targetPart;
    local l_CFrame_0 = l_targetPart_1.CFrame;
    local l_Size_0 = l_targetPart_1.Size;
    local v45 = 0.5 * math.min(l_Size_0.Y, l_Size_0.Z);
    local l_X_0 = l_CFrame_0:PointToObjectSpace(v39).X;
    return v2.createElement(v4, {
        Color3 = v40, 
        AlwaysOnTop = v41, 
        Adornee = l_targetPart_1, 
        Render = function(v47) --[[ Line: 114 ]] --[[ Name: Render ]]
            -- upvalues: v45 (copy), l_X_0 (copy)
            local v48 = {};
            for v49 = -3, 3 do
                local v50 = Vector2.new(-3, v49).Unit * v45;
                table.insert(v48, (Vector3.new(l_X_0, v50.X, v50.Y)));
            end;
            for v51 = -3, 3 do
                local v52 = Vector2.new(v51, 3).Unit * v45;
                table.insert(v48, (Vector3.new(l_X_0, v52.X, v52.Y)));
            end;
            for v53 = 3, -3, -1 do
                local v54 = Vector2.new(3, v53).Unit * v45;
                table.insert(v48, (Vector3.new(l_X_0, v54.X, v54.Y)));
            end;
            for v55 = 3, -3, -1 do
                local v56 = Vector2.new(v55, -3).Unit * v45;
                table.insert(v48, (Vector3.new(l_X_0, v56.X, v56.Y)));
            end;
            v47:AddPath(v48, true);
        end
    });
end;
local function v58(v57) --[[ Line: 139 ]] --[[ Name: CenterPoint ]]
    -- upvalues: v2 (copy)
    return v2.createElement("SphereHandleAdornment", {
        Color3 = v57.Color, 
        AlwaysOnTop = true, 
        Adornee = workspace.Terrain, 
        CFrame = CFrame.new(v57.Position), 
        ZIndex = 0, 
        Radius = 0.15 * v57.Scale
    });
end;
v10._renderGridSnapToSphere = function(v59) --[[ Line: 152 ]] --[[ Name: _renderGridSnapToSphere ]]
    -- upvalues: v2 (copy), v5 (copy), v17 (copy), v4 (copy), v58 (copy), v3 (copy)
    local l_props_2 = v59.props;
    local l_GridSize_1 = l_props_2.GridSize;
    local l_DragTarget_2 = l_props_2.DragTarget;
    local l_targetPart_2 = l_DragTarget_2.targetPart;
    local v64 = {
        MajorLines = v2.createElement(v5, {
            Part = l_targetPart_2, 
            Color3 = l_props_2.Color, 
            GridSnap = l_GridSize_1
        })
    };
    local v65 = 0.5 * math.min(l_targetPart_2.Size.X, l_targetPart_2.Size.Y, l_targetPart_2.Size.Z);
    local v66 = v65 * 0.25;
    local v67 = math.floor((math.sqrt(v65 * v65 - v66 * v66)));
    local v68 = math.max(v66, (math.sqrt(v65 * v65 - v67 * v67)));
    if l_DragTarget_2.dragTargetType == "Polygon" then
        local v69, v70, v71, v72, v73 = v17(l_DragTarget_2);
        local v74 = v68 / l_GridSize_1;
        v64.LinearGuides = v2.createElement(v4, {
            Color3 = l_props_2.PrimaryColor, 
            AlwaysOnTop = true, 
            Render = function(v75) --[[ Line: 175 ]] --[[ Name: Render ]]
                -- upvalues: l_GridSize_1 (copy), v72 (copy), v73 (copy), v69 (copy), v71 (copy), v70 (copy), v68 (copy)
                local l_l_GridSize_1_0 = l_GridSize_1;
                local v77 = math.floor(v72 / l_l_GridSize_1_0 + 0.5) * l_l_GridSize_1_0;
                local v78 = math.floor(v73 / l_l_GridSize_1_0 + 0.5) * l_l_GridSize_1_0;
                local v79 = v69 + v71 * v78;
                v75:AddLine(v79 - v70 * v68, v79 + v70 * v68);
                local v80 = v69 + v70 * v77;
                v75:AddLine(v80 - v71 * v68, v80 + v71 * v68);
            end
        });
        v64.CenterPoint = v2.createElement(v58, {
            Color = l_props_2.Color, 
            Scale = l_props_2.Scale, 
            Position = v69
        });
        v64.Grid = v2.createElement(v3, {
            Position = v69, 
            Radius = v74, 
            UnitA = v70 * l_GridSize_1, 
            UnitB = v71 * l_GridSize_1, 
            MinA = -v74, 
            MaxA = v74, 
            MinB = -v74, 
            MaxB = v74, 
            ExcludeA = 0, 
            ExcludeB = 0, 
            Color3 = l_props_2.Color
        });
    else
        v64.LattitudeGuide = v59:_renderLattitudeGuide();
    end;
    return v2.createFragment(v64);
end;
v10._renderGridSnapToCylinder = function(v81) --[[ Line: 209 ]] --[[ Name: _renderGridSnapToCylinder ]]
    -- upvalues: v17 (copy), v2 (copy), v6 (copy), v58 (copy), v3 (copy), v4 (copy)
    local l_props_3 = v81.props;
    local l_DragTarget_3 = l_props_3.DragTarget;
    local v84, v85, v86, _, v88 = v17(l_DragTarget_3);
    local l_GridSize_2 = l_props_3.GridSize;
    local v90 = 0.5 * l_DragTarget_3.targetSize.Z;
    local v91 = math.floor(v88 / l_GridSize_2 + 0.5);
    local l_targetPart_3 = l_DragTarget_3.targetPart;
    local l_Size_1 = l_targetPart_3.Size;
    local v94 = 0.5 * math.min(l_Size_1.Y, l_Size_1.Z);
    local v95 = {
        MajorLines = v2.createElement(v6, {
            Part = l_targetPart_3, 
            Color3 = l_props_3.Color
        })
    };
    if l_DragTarget_3.dragTargetType == "Polygon" then
        v95.CenterPoint = v2.createElement(v58, {
            Color = l_props_3.Color, 
            Scale = l_props_3.Scale, 
            Position = v84
        });
        v95.PolygonGrid = v81:_renderRulerSnapToPolygon(v94);
    else
        v95.CylinderGrid = v2.createElement(v3, {
            Position = v84, 
            UnitA = v85 * l_GridSize_2, 
            UnitB = v86 * l_GridSize_2, 
            MinA = -1, 
            MaxA = 1, 
            MinB = 0, 
            MaxB = v90 / l_GridSize_2, 
            ExcludeA = 0, 
            ExcludeB = v91, 
            Color3 = l_props_3.Color
        });
        v95.LinearGuide = v2.createElement(v4, {
            Color3 = l_props_3.PrimaryColor, 
            AlwaysOnTop = true, 
            Render = function(v96) --[[ Line: 253 ]] --[[ Name: Render ]]
                -- upvalues: v84 (copy), v90 (copy), v86 (copy)
                v96:AddLine(v84, v84 + v90 * v86);
            end
        });
        v95.RadialGuide = v81:_renderCylinderRingGuide(v84 + v86 * v91 * l_GridSize_2, l_props_3.PrimaryColor);
    end;
    return v2.createFragment(v95);
end;
v10._renderGridSnap = function(v97) --[[ Line: 264 ]] --[[ Name: _renderGridSnap ]]
    local l_targetPart_4 = v97.props.DragTarget.targetPart;
    if l_targetPart_4 and l_targetPart_4:IsA("Part") then
        if l_targetPart_4.Shape == Enum.PartType.Ball then
            return v97:_renderGridSnapToSphere();
        elseif l_targetPart_4.Shape == Enum.PartType.Cylinder then
            return v97:_renderGridSnapToCylinder();
        end;
    end;
    return v97:_renderRulerSnapToPolygon(nil);
end;
local function _(v99) --[[ Line: 279 ]] --[[ Name: getSpecialPartShape ]]
    if v99 and v99:IsA("Part") then
        if v99.Shape == Enum.PartType.Ball then
            return Enum.PartType.Ball;
        elseif v99.Shape == Enum.PartType.Cylinder then
            return Enum.PartType.Cylinder;
        end;
    end;
    return nil;
end;
v10._renderGridNoSnap = function(v101) --[[ Line: 290 ]] --[[ Name: _renderGridNoSnap ]]
    -- upvalues: v17 (copy), v2 (copy), v5 (copy), v6 (copy), v4 (copy)
    local l_props_4 = v101.props;
    local l_DragTarget_4 = l_props_4.DragTarget;
    local v104, _, v106, _, v108 = v17(l_DragTarget_4);
    local l_Z_0 = l_DragTarget_4.targetSize.Z;
    local v110 = {};
    if l_DragTarget_4.dragTargetType == "Sphere" then
        v110.MajorLines = v2.createElement(v5, {
            Part = l_DragTarget_4.targetPart, 
            Color3 = l_props_4.Color
        });
        v110.LattitudeGuide = v101:_renderLattitudeGuide();
    elseif l_DragTarget_4.dragTargetType == "Cylinder" then
        v110.MajorLines = v2.createElement(v6, {
            Part = l_DragTarget_4.targetPart, 
            Color3 = l_props_4.Color
        });
        v110.RadialGuide = v101:_renderCylinderRingGuide(v104 + v106 * v108, l_props_4.PrimaryColor, true);
        v110.LinearGuide = v2.createElement(v4, {
            Color3 = l_props_4.PrimaryColor, 
            AlwaysOnTop = true, 
            Render = function(v111) --[[ Line: 314 ]] --[[ Name: Render ]]
                -- upvalues: v104 (copy), l_Z_0 (copy), v106 (copy)
                v111:AddLine(v104, v104 + l_Z_0 * v106);
            end
        });
    else
        local l_targetPart_5 = l_DragTarget_4.targetPart;
        local v113 = if l_targetPart_5 and l_targetPart_5:IsA("Part") then if l_targetPart_5.Shape == Enum.PartType.Ball then Enum.PartType.Ball else if l_targetPart_5.Shape == Enum.PartType.Cylinder then Enum.PartType.Cylinder else nil else nil;
        if v113 == Enum.PartType.Ball then
            v110.MajorLines = v2.createElement(v5, {
                Part = l_DragTarget_4.targetPart, 
                Color3 = l_props_4.Color
            });
        elseif v113 == Enum.PartType.Cylinder then
            v110.MajorLines = v2.createElement(v6, {
                Part = l_DragTarget_4.targetPart, 
                Color3 = l_props_4.Color
            });
        end;
    end;
    return v2.createFragment(v110);
end;
v10.render = function(v114) --[[ Line: 337 ]] --[[ Name: render ]]
    if v114.props.GridSize then
        return v114:_renderGridSnap();
    else
        return v114:_renderGridNoSnap();
    end;
end;
return v10;