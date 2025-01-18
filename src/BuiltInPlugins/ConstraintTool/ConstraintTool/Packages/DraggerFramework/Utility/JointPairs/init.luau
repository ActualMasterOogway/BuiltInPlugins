local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_0.Utility.Colors);
local v5 = require(l_Parent_0.Utility.Math);
local v6 = {};
v6.__index = v6;
local v7 = {
    Rotate = v4.RotatingJoint, 
    RotateV = v4.RotatingJoint, 
    RotateP = v4.RotatingJoint, 
    Weld = v4.WeldJoint, 
    None = v4.InvalidJoint
};
local function v14(v8, v9, v10) --[[ Line: 39 ]] --[[ Name: isVertexInFace ]]
    for v11 = 1, #v9 do
        local v12 = nil;
        local v13 = nil;
        if v11 == 1 then
            v12 = v9[#v9];
            v13 = v9[1];
        else
            v12 = v9[v11 - 1];
            v13 = v9[v11];
        end;
        if (v13 - v12):Cross(v8 - v12):Dot(v10) < 0.01 then
            return false;
        end;
    end;
    return true;
end;
local function v20(v15, v16, v17) --[[ Line: 61 ]] --[[ Name: faceHasVertsInFace ]]
    -- upvalues: v14 (copy)
    for _, v19 in ipairs(v15) do
        if v14(v19, v16, v17) then
            return true;
        end;
    end;
    return false;
end;
local function v40(v21, v22, v23, v24, _) --[[ Line: 70 ]] --[[ Name: edgeIntersectsEdge ]]
    -- upvalues: v5 (copy)
    local v26 = v22 - v21;
    local v27 = v24 - v23;
    local l_Magnitude_0 = v26.Magnitude;
    local l_Magnitude_1 = v27.Magnitude;
    local v30 = v26:Dot(v27) / l_Magnitude_0 / l_Magnitude_1;
    local v31 = 0.01 / l_Magnitude_0;
    local v32 = 0.01 / l_Magnitude_1;
    if math.abs(math.abs(v30) - 1) < 1.0E-4 then
        if v30 > 0 then
            return false;
        else
            local v33 = (v21 - v23):Dot(v27) / l_Magnitude_1 / l_Magnitude_1;
            if (v21 - (v23 + v33 * v27)).Magnitude > 0.001 then
                return false;
            else
                local v34 = (v22 - v23):Dot(v27) / l_Magnitude_1 / l_Magnitude_1;
                return math.clamp(v33, 0, 1) - math.clamp(v34, 0, 1) > 0.001;
            end;
        end;
    else
        local v35, v36 = v5.intersectRayRay(v21, v26, v23, v27);
        if not v35 or v36 < v31 or 1 - v31 < v36 then
            return false;
        else
            local v37, v38 = v5.intersectRayRay(v23, v27, v21, v26);
            assert(v37);
            local v39 = false;
            if v32 <= v38 then
                v39 = v38 <= 1 - v32;
            end;
            return v39;
        end;
    end;
end;
local function v50(v41, v42, v43) --[[ Line: 123 ]] --[[ Name: edgesIntersectsEdges ]]
    -- upvalues: v40 (copy)
    for v44 = 1, #v41 do
        local v45 = nil;
        local v46 = nil;
        if v44 == 1 then
            v45 = v41[#v41];
            v46 = v41[1];
        else
            v45 = v41[v44 - 1];
            v46 = v41[v44];
        end;
        for v47 = 1, #v42 do
            local v48 = nil;
            local v49 = nil;
            if v47 == 1 then
                v48 = v42[#v42];
                v49 = v42[1];
            else
                v48 = v42[v47 - 1];
                v49 = v42[v47];
            end;
            if v40(v45, v46, v48, v49, v43) then
                return true;
            end;
        end;
    end;
    return false;
end;
local _ = function(_, v52, _, v54, v55) --[[ Line: 146 ]] --[[ Name: canMakeJointBetweenFaces ]]
    -- upvalues: v20 (copy), v50 (copy)
    return v20(v52.vertices, v54.vertices, v55) or v20(v54.vertices, v52.vertices, -v55) or v50(v52.vertices, v54.vertices, v55);
end;
local _ = function(v57) --[[ Line: 156 ]] --[[ Name: getFaceCenter ]]
    if not v57.center then
        local v58 = Vector3.new();
        for _, v60 in ipairs(v57.vertices) do
            v58 = v58 + v60;
        end;
        v57.center = v58 / #v57.vertices;
    end;
    return v57.center;
end;
local function v70(v62, v63, v64, v65) --[[ Line: 167 ]] --[[ Name: buildJoint ]]
    local l_fromMatrix_0 = CFrame.fromMatrix;
    if not v63.center then
        local v67 = Vector3.new();
        for _, v69 in ipairs(v63.vertices) do
            v67 = v67 + v69;
        end;
        v63.center = v67 / #v63.vertices;
    end;
    l_fromMatrix_0 = l_fromMatrix_0(v63.center, v63.direction, v63.normal:Cross(v63.direction));
    return {
        ClassName = v65, 
        Part0 = v62, 
        C0 = v62.CFrame:Inverse() * l_fromMatrix_0, 
        Part1 = v64, 
        C1 = v64.CFrame:Inverse() * l_fromMatrix_0
    };
end;
local function _() --[[ Line: 180 ]] --[[ Name: buildInvalidJoint ]]
    return {
        ClassName = "None"
    };
end;
local function v80(v72, v73, v74, v75, v76, v77) --[[ Line: 194 ]] --[[ Name: buildAppropriateJoint ]]
    -- upvalues: v70 (copy)
    local v78 = true;
    if v74 ~= "Mesh" then
        v78 = false;
        if v74 == "Cylinder" then
            v78 = true;
            if v76.surface ~= "RightSurface" then
                v78 = v76.surface == "LeftSurface";
            end;
        end;
    end;
    local v79 = true;
    if v75 ~= "Mesh" then
        v79 = false;
        if v75 == "Cylinder" then
            v79 = true;
            if v77.surface ~= "RightSurface" then
                v79 = v77.surface == "LeftSurface";
            end;
        end;
    end;
    if v78 and v79 then
        return (v70(v72, v76, v73, "Weld"));
    else
        return nil;
    end;
end;
local function v102(v81, v82, v83, v84, v85, v86) --[[ Line: 216 ]] --[[ Name: tryToCreateJointPair ]]
    -- upvalues: v20 (copy), v50 (copy), v80 (copy)
    local v87 = v85(v82);
    local v88 = v85(v83);
    local v89 = {};
    for _, v91 in ipairs(v87.faces) do
        for _, v93 in ipairs(v88.faces) do
            local v94 = v81:VectorToWorldSpace(v91.normal);
            local v95 = v81:VectorToWorldSpace(v91.direction);
            if v94:Dot(v93.normal) < -0.999 and math.abs(((v81:PointToWorldSpace(v91.point) - v93.point):Dot(v93.normal))) < 0.05 then
                local v96 = v89[v91];
                if not v96 then
                    local v97 = {};
                    for _, v99 in ipairs(v91.vertices) do
                        table.insert(v97, v81 * v99);
                    end;
                    v96 = {
                        id = v91.id, 
                        vertices = v97, 
                        normal = v94, 
                        direction = v95, 
                        surface = v91.surface
                    };
                    v89[v91] = v96;
                end;
                local l_v96_0 = v96;
                local l_normal_0 = v93.normal;
                if v20(l_v96_0.vertices, v93.vertices, l_normal_0) or v20(v93.vertices, l_v96_0.vertices, -l_normal_0) or v50(l_v96_0.vertices, v93.vertices, l_normal_0) then
                    l_v96_0 = v80(v82, v83, v87.shape, v88.shape, v96, v93);
                    if l_v96_0 and not v86(v82.Parent) and not v86(v83.Parent) then
                        v84[v96] = l_v96_0;
                        v84[v93] = l_v96_0;
                        return true, l_v96_0;
                    else
                        l_v96_0 = {
                            ClassName = "None"
                        };
                        v84[v96] = l_v96_0;
                        v84[v93] = l_v96_0;
                        return false;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
v6.new = function(v103, v104, v105, v106, v107, v108) --[[ Line: 315 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), l_Workspace_0 (copy), v102 (copy)
    local v109 = setmetatable({}, v6);
    local v110 = {};
    local function v111(v112) --[[ Line: 319 ]] --[[ Name: isAHumanoidModelFunction ]]
        -- upvalues: v110 (copy), v111 (copy)
        if not v112 then
            return false;
        else
            local v113 = v110[v112];
            if not v113 then
                local v114 = true;
                if v112:FindFirstChildWhichIsA("Humanoid") == nil then
                    v114 = v111(v112.Parent);
                end;
                v113 = v114;
                v110[v112] = v113;
            end;
            return v113;
        end;
    end;
    local l_Terrain_0 = l_Workspace_0.Terrain;
    local v116 = {};
    local v117 = {};
    for _, v119 in ipairs(v103) do
        local v120 = v119.Size.Magnitude / 2;
        local v121 = Vector3.new(v120 + 0.1, v120 + 0.1, v120 + 0.1);
        local l_l_Workspace_0_PartsInRegion3WithIgnoreList_0 = l_Workspace_0:FindPartsInRegion3WithIgnoreList(Region3.new(v119.Position - v121, v119.Position + v121), {}, 10000);
        if v119 ~= l_Terrain_0 then
            for _, v124 in ipairs(v119:GetTouchingParts()) do
                if v124 == l_Terrain_0 then
                    if not v107[v119][l_Terrain_0] then
                        table.insert(v117, {
                            ClassName = "Weld", 
                            C0 = CFrame.new(), 
                            C1 = v119.CFrame, 
                            Part0 = v119, 
                            Part1 = l_Terrain_0
                        });
                        break;
                    else
                        break;
                    end;
                end;
            end;
        end;
        for _, v126 in ipairs(l_l_Workspace_0_PartsInRegion3WithIgnoreList_0) do
            if not v104[v126] and not v105[v126:GetRootPart()] and v126 ~= l_Terrain_0 then
                local v127 = v126.Size.Magnitude / 2;
                if (v126.Position - v119.Position).Magnitude <= v120 + v127 + 0.05 and not v107[v119][v126] then
                    local v128, v129 = v102(v106, v119, v126, v116, v108, v111);
                    if v128 then
                        table.insert(v117, v129);
                    end;
                end;
            end;
        end;
    end;
    v109._jointPairs = v117;
    v109._facesToHighlightSet = v116;
    return v109;
end;
v6.renderJoints = function(v130, v131) --[[ Line: 400 ]] --[[ Name: renderJoints ]]
    -- upvalues: v3 (copy), v7 (copy), l_Workspace_0 (copy)
    local v132 = {};
    for v133, v134 in pairs(v130._facesToHighlightSet) do
        local v135 = {};
        for v136 = 1, #v133.vertices do
            local v137 = nil;
            local v138 = nil;
            if v136 == 1 then
                v137 = v133.vertices[#v133.vertices];
                v138 = v133.vertices[1];
            else
                v137 = v133.vertices[v136 - 1];
                v138 = v133.vertices[v136];
            end;
            local l_Magnitude_2 = (v137 - v138).Magnitude;
            v135[v136] = v3.createElement("CylinderHandleAdornment", {
                CFrame = CFrame.new(v137, v138) * CFrame.new(0, 0, -l_Magnitude_2 / 2) * CFrame.Angles(0, 0, 1.5707963267948966), 
                Color3 = v7[v134.ClassName], 
                Radius = 0.05 + 0.05 * v131, 
                Height = l_Magnitude_2, 
                Adornee = l_Workspace_0.Terrain
            });
        end;
        v132[tostring(v133)] = v3.createElement("Folder", {}, v135);
    end;
    return v3.createFragment(v132);
end;
v6.createJoints = function(v140) --[[ Line: 432 ]] --[[ Name: createJoints ]]
    for _, v142 in ipairs(v140._jointPairs) do
        local v143 = Instance.new(v142.ClassName);
        v143.Part0 = v142.Part0;
        v143.C0 = v142.C0;
        v143.Part1 = v142.Part1;
        v143.C1 = v142.C1;
        v143.Parent = v142.Part0;
    end;
end;
return v6;