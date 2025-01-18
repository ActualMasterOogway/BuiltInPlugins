local l_Workspace_0 = game:GetService("Workspace");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Utility.Math);
local v4 = require(l_Parent_0.Utility.isGoodRaycastResult);
local v5 = require(l_Parent_0.Utility.getGeometry);
local v6 = require(l_Parent_0.Utility.roundRotation);
local v7 = require(l_Parent_0.Utility.snapRotationToPrimaryDirection);
local v8 = require(l_Parent_0.Utility.blackboxFindClosestMeshEdge);
local v9 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v10 = require(l_Parent_0.Flags.getFFlagDraggerBetterCylinderSnap);
local v11 = require(l_Parent_0.Flags.getFFlagDraggerIndependentSnap);
local v12 = require(l_Parent_0.Utility.CursorGroupName);
local v13 = table.freeze({
    Vector3.new(1, 0, 0, 0), 
    Vector3.new(-1, 0, 0, 0), 
    Vector3.new(0, 1, 0, 0), 
    Vector3.new(0, -1, 0, 0), 
    Vector3.new(0, 0, 1, 0), 
    (Vector3.new(0, 0, -1, 0))
});
local v14 = table.freeze({
    Terrain = "Terrain", 
    Polygon = "Polygon", 
    Sphere = "Sphere", 
    Cylinder = "Cylinder", 
    Nothing = "Nothing"
});
local v15 = {};
local function _(v16) --[[ Line: 51 ]] --[[ Name: roundToTerrainGrid ]]
    return 4 * math.floor(v16 / 4 + 0.5);
end;
local function v25(v18) --[[ Line: 55 ]] --[[ Name: findClosestBasis ]]
    -- upvalues: v13 (copy)
    local v19 = nil;
    local v20 = 1e999;
    for _, v22 in ipairs(v13) do
        local v23 = math.abs((v22:Dot(v18)));
        if v23 < v20 then
            v20 = v23;
            v19 = v22;
        end;
    end;
    local l_Unit_0 = v19:Cross(v18).Unit;
    return -v19:Cross(l_Unit_0), v19, l_Unit_0;
end;
v15.getSizeInSpace = function(v26, v27) --[[ Line: 72 ]] --[[ Name: getSizeInSpace ]]
    local _, _, _, v31, v32, v33, v34, v35, v36, v37, v38, v39 = v27:GetComponents();
    local l_X_0 = v26.X;
    local l_Y_0 = v26.Y;
    local l_Z_0 = v26.Z;
    return (Vector3.new(math.abs(l_X_0 * v31) + math.abs(l_Y_0 * v32) + math.abs(l_Z_0 * v33), math.abs(l_X_0 * v34) + math.abs(l_Y_0 * v35) + math.abs(l_Z_0 * v36), math.abs(l_X_0 * v37) + math.abs(l_Y_0 * v38) + math.abs(l_Z_0 * v39)));
end;
v15.getClosestFace = function(v43, v44) --[[ Line: 81 ]] --[[ Name: getClosestFace ]]
    -- upvalues: v5 (copy)
    local v45 = v5(v43, v44);
    local v46 = nil;
    local v47 = 1e999;
    for _, v49 in ipairs(v45.faces) do
        local v50 = math.abs(((v44 - v49.point):Dot(v49.normal)));
        if v50 < v47 then
            v46 = v49;
            v47 = v50;
        end;
    end;
    return v46, v45;
end;
v15.getPartAndSurface = function(v51) --[[ Line: 95 ]] --[[ Name: getPartAndSurface ]]
    -- upvalues: v12 (copy), l_Workspace_0 (copy), v15 (copy)
    local v52 = RaycastParams.new();
    v52.BruteForceAllSlow = true;
    v52.CollisionGroup = v12;
    local v53 = l_Workspace_0:Raycast(v51.Origin, v51.Direction, v52);
    if not v53 then
        return nil, nil;
    elseif v53.Instance:IsA("Terrain") then
        return v53.Instance, nil;
    else
        local v54, _ = v15.getClosestFace(v53.Instance, v53.Position);
        if v54 then
            return v53.Instance, v54.surface;
        else
            return v53.Instance, nil;
        end;
    end;
end;
v15.raycast = function(v56, v57) --[[ Line: 118 ]] --[[ Name: raycast ]]
    -- upvalues: v12 (copy), l_Workspace_0 (copy)
    local v58 = RaycastParams.new();
    v58.BruteForceAllSlow = true;
    v58.CollisionGroup = v12;
    v58.FilterDescendantsInstances = v57;
    return l_Workspace_0:Raycast(v56.Origin, v56.Direction, v58);
end;
v15.getSizeInSurface = function(v59, v60) --[[ Line: 126 ]] --[[ Name: getSizeInSurface ]]
    local v61 = v60:Inverse();
    local l_ExtentsCFrame_0 = v59.ExtentsCFrame;
    local l_ExtentsSize_0 = v59.ExtentsSize;
    local l_X_1 = l_ExtentsSize_0.X;
    local l_Y_1 = l_ExtentsSize_0.Y;
    local l_Z_1 = l_ExtentsSize_0.Z;
    local _, _, _, v70, v71, v72, _, _, _, v76, v77, v78 = (v61 * l_ExtentsCFrame_0):GetComponents();
    return (Vector3.new(math.abs(l_X_1 * v70) + math.abs(l_Y_1 * v71) + math.abs(l_Z_1 * v72), 0, math.abs(l_X_1 * v76) + math.abs(l_Y_1 * v77) + math.abs(l_Z_1 * v78)));
end;
local function _(v79, v80, v81) --[[ Line: 142 ]] --[[ Name: slerp90 ]]
    return v79 * math.sin((1 - v81) * 1.5707963267948966) + v80 * math.sin(v81 * 1.5707963267948966);
end;
local v83 = Color3.new(0.329411, 0.662745, 1);
local function v85(v84) --[[ Line: 148 ]] --[[ Name: identityFunction ]]
    return v84;
end;
local function _(v86) --[[ Line: 152 ]] --[[ Name: getSnapFunction ]]
    -- upvalues: v85 (copy)
    if v86 then
        return function(v87) --[[ Line: 154 ]]
            -- upvalues: v86 (copy)
            return math.floor(v87 / v86 + 0.5) * v86;
        end;
    else
        return v85;
    end;
end;
local function v97(v89, v90, v91, v92, v93, v94, v95) --[[ Line: 170 ]] --[[ Name: buildSurfaceMatrix ]]
    -- upvalues: v15 (copy)
    local v96 = CFrame.fromMatrix(v92, -v95:Cross(v94), v94);
    if not v93 then
        v93 = v15.getSizeInSurface(v89, v96);
    end;
    return table.freeze({
        matrix = v96, 
        size = v93, 
        hit = v90, 
        type = v91, 
        color = v89.Color
    });
end;
local function v128(v98, v99, v100) --[[ Line: 194 ]] --[[ Name: getSurfaceMatrixForSphere ]]
    -- upvalues: v85 (copy), v97 (copy), v14 (copy)
    local l_Position_0 = v99.Position;
    local l_CFrame_0 = v98.CFrame;
    local v103 = l_CFrame_0:PointToObjectSpace(l_Position_0);
    local l_Size_0 = v98.Size;
    local v105 = 0.5 * math.min(l_Size_0.X, l_Size_0.Y, l_Size_0.Z);
    local v107 = v100 and function(v106) --[[ Line: 154 ]]
        -- upvalues: v100 (copy)
        return math.floor(v106 / v100 + 0.5) * v100;
    end or v85;
    local v108 = v107(v103.Y);
    local v109 = math.sqrt(v103.X * v103.X + v103.Z * v103.Z);
    local v110 = v105 < math.abs(v108) and 0 or math.sqrt(v105 * v105 - v108 * v108);
    local v111 = 0.25 * v105;
    local v112 = true;
    if v110 >= v111 then
        v112 = v109 < v111;
    end;
    if v112 then
        v110 = 0;
        v108 = math.sign(v103.Y) * v105;
    end;
    local l_Unit_1 = Vector3.new(v103.X, 0, v103.Z).Unit;
    local v114 = 0;
    local v115 = math.sign(v103.Z) * v110;
    local v116 = math.sign(v103.X) * v110;
    local v117 = 0;
    if math.abs(v103.X) > math.abs(v103.Z) then
        local l_v116_0 = v116;
        v116 = v114;
        v114 = l_v116_0;
        l_v116_0 = v117;
        v117 = v115;
        v115 = l_v116_0;
    end;
    local v119 = nil;
    v119 = v112 and 0 or v107(math.acos((math.clamp((v114 * l_Unit_1.X + v115 * l_Unit_1.Z) / v110, -1, 1))) * v105) / (1.5707963267948966 * v105);
    local l_v114_0 = v114;
    local l_v116_1 = v116;
    local l_v119_0 = v119;
    local v123 = l_v114_0 * math.sin((1 - l_v119_0) * 1.5707963267948966) + l_v116_1 * math.sin(l_v119_0 * 1.5707963267948966);
    l_v116_1 = v115;
    l_v119_0 = v117;
    local l_v119_1 = v119;
    l_v116_1 = Vector3.new(v123, v108, l_v116_1 * math.sin((1 - l_v119_1) * 1.5707963267948966) + l_v119_0 * math.sin(l_v119_1 * 1.5707963267948966));
    l_v119_0 = nil;
    l_v119_1 = nil;
    l_v119_0 = l_CFrame_0:VectorToWorldSpace(l_v116_1).Unit;
    local l_YVector_0 = v98.CFrame.YVector;
    l_v119_1 = if math.abs((l_v119_0:Dot(l_YVector_0))) > 0.99 then l_v119_0:Cross(v98.CFrame.XVector).Unit else l_v119_0:Cross(l_YVector_0).Unit;
    local l_zero_0 = Vector3.zero;
    local v127 = l_CFrame_0:PointToWorldSpace(l_v116_1);
    if v112 then
        return v97(v98, l_Position_0, v14.Polygon, v127, l_zero_0, l_v119_0, l_v119_1);
    else
        return v97(v98, l_Position_0, v14.Sphere, v127, l_zero_0, l_v119_0, l_v119_1);
    end;
end;
local function v158(v129, v130, v131) --[[ Line: 279 ]] --[[ Name: getSurfaceMatrixForCylinder ]]
    -- upvalues: v10 (copy), v97 (copy), v14 (copy), v85 (copy)
    local l_Position_1 = v130.Position;
    local l_Normal_0 = v130.Normal;
    local l_CFrame_1 = v129.CFrame;
    local v135 = l_CFrame_1:PointToObjectSpace(l_Position_1);
    local l_Size_1 = v129.Size;
    local v137 = math.min(l_Size_1.Y, l_Size_1.Z);
    local v138 = 0.5 * v137;
    local v139 = l_Size_1.X * 0.5;
    if math.abs(v135.X - v139) < 0.001 then
        local v140 = nil;
        local v141 = nil;
        if v10() then
            v140 = if math.abs(v135.Y) > 0.5 * v138 then math.sign(v135.Y) * v138 else 0;
            v141 = if math.abs(v135.Z) > 0.5 * v138 then math.sign(v135.Z) * v138 else 0;
        else
            v140 = 0;
            v141 = 0;
        end;
        local v142 = 0.5 * Vector3.new(v137, 0, v137);
        return v97(v129, l_Position_1, v14.Polygon, l_CFrame_1:PointToWorldSpace((Vector3.new(v139, v140, v141))), v142, l_Normal_0, l_CFrame_1.YVector);
    elseif math.abs(v135.X + v139) < 0.001 then
        local v143 = nil;
        local v144 = nil;
        if v10() then
            v143 = if math.abs(v135.Y) > 0.5 * v138 then math.sign(v135.Y) * v138 else 0;
            v144 = if math.abs(v135.Z) > 0.5 * v138 then math.sign(v135.Z) * v138 else 0;
        else
            v143 = 0;
            v144 = 0;
        end;
        local v145 = 0.5 * Vector3.new(v137, 0, v137);
        return v97(v129, l_Position_1, v14.Polygon, l_CFrame_1:PointToWorldSpace((Vector3.new(-v139, v143, v144))), v145, l_Normal_0, -l_CFrame_1.YVector);
    else
        local v146 = 0;
        local v147 = math.sign(v135.Z) * v138;
        local v148 = math.sign(v135.Y) * v138;
        local v149 = 0;
        if math.abs(v135.Y) > math.abs(v135.Z) then
            local l_v148_0 = v148;
            v148 = v146;
            v146 = l_v148_0;
            l_v148_0 = v149;
            v149 = v147;
            v147 = l_v148_0;
        end;
        local v151 = math.acos((v146 * v135.Y + v147 * v135.Z) / (v138 * v138)) * v138;
        local v153 = (v131 and function(v152) --[[ Line: 154 ]]
            -- upvalues: v131 (copy)
            return math.floor(v152 / v131 + 0.5) * v131;
        end or v85)(v151) / (1.5707963267948966 * v138);
        local v154 = v146 * math.sin((1 - v153) * 1.5707963267948966) + v148 * math.sin(v153 * 1.5707963267948966);
        local v155 = v147 * math.sin((1 - v153) * 1.5707963267948966) + v149 * math.sin(v153 * 1.5707963267948966);
        l_Normal_0 = l_CFrame_1:VectorToWorldSpace((Vector3.new(0, v154, v155))).Unit;
        local v156 = l_CFrame_1:PointToWorldSpace((Vector3.new(v139 * math.sign(v135.X), v154, v155)));
        local v157 = Vector3.new(0, 0, l_Size_1.X);
        return v97(v129, l_Position_1, v14.Cylinder, v156, v157, l_Normal_0, l_CFrame_1.XVector);
    end;
end;
local function v169(v159, v160, v161, v162) --[[ Line: 365 ]] --[[ Name: snapToSurfaceInSpace ]]
    -- upvalues: v3 (copy)
    local v163 = v162:PointToObjectSpace(v159);
    local v164 = (v163 / v161 + Vector3.one * 0.5):Floor() * v161;
    local v165 = v162:VectorToObjectSpace(v160);
    local v166 = v3.intersectRayPlane(v164, Vector3.xAxis, v163, v165);
    local v167 = v3.intersectRayPlane(v164, Vector3.yAxis, v163, v165);
    local v168 = v3.intersectRayPlane(v164, Vector3.zAxis, v163, v165);
    if v166 ~= v166 then
        v166 = 1e999;
    end;
    if v167 ~= v167 then
        v167 = 1e999;
    end;
    if v168 ~= v168 then
        v168 = 1e999;
    end;
    return v162:PointToWorldSpace(if math.abs(v166) < math.abs(v167) and math.abs(v166) < math.abs(v168) then v164 + Vector3.xAxis * v166 else if math.abs(v167) < math.abs(v168) then v164 + Vector3.yAxis * v167 else v164 + Vector3.zAxis * v168);
end;
local function v177(v170, v171, v172) --[[ Line: 403 ]] --[[ Name: getSurfaceMatrixFallback ]]
    -- upvalues: v169 (copy), v14 (copy)
    local l_Position_2 = v171.Position;
    local l_Normal_1 = v171.Normal;
    if v172 then
        l_Position_2 = v169(l_Position_2, l_Normal_1, v172, v170:GetPivot());
    end;
    local l_XVector_0 = v170.CFrame.XVector;
    if math.abs((l_XVector_0:Dot(l_Normal_1))) > 0.9 then
        l_XVector_0 = v170.CFrame.ZVector;
    end;
    local v176 = l_XVector_0:Cross(l_Normal_1).Unit:Cross(l_Normal_1);
    return table.freeze({
        matrix = CFrame.fromMatrix(l_Position_2, v176, l_Normal_1), 
        size = Vector3.zero, 
        hit = l_Position_2, 
        type = v14.Round, 
        color = v170.Color
    });
end;
local function v188(v178, v179, v180) --[[ Line: 431 ]] --[[ Name: getSurfaceMatrixForMesh ]]
    -- upvalues: v8 (copy), v15 (copy), v14 (copy), v177 (copy)
    local v181 = v8(v179);
    if v181 then
        local l_Position_3 = v179.Position;
        local l_Normal_2 = v179.Normal;
        local v184 = if (v181.a - l_Position_3).Magnitude < (v181.b - l_Position_3).Magnitude then v181.a else v181.b;
        local v185 = CFrame.fromMatrix(v184, -v181.direction:Cross(l_Normal_2), l_Normal_2);
        local v186 = v15.getSizeInSurface(v178, v185);
        local v187 = Vector3.new(v181.length, v181.length, v181.length);
        return table.freeze({
            matrix = v185, 
            size = v186:Min(v187), 
            hit = l_Position_3, 
            type = v14.Polygon, 
            color = v178.Color
        });
    else
        return v177(v178, v179, v180);
    end;
end;
local function v197(v189, v190, v191) --[[ Line: 458 ]] --[[ Name: getSurfaceMatrixForTerrain ]]
    -- upvalues: v25 (copy), v169 (copy), v14 (copy), v83 (copy)
    local l_Position_4 = v190.Position;
    local l_Normal_3 = v190.Normal;
    local _, v195, _ = v25(l_Normal_3);
    if v191 then
        l_Position_4 = v169(l_Position_4, l_Normal_3, v191, CFrame.new());
    end;
    return table.freeze({
        matrix = CFrame.fromMatrix(l_Position_4, l_Normal_3:Cross(v195).Unit, l_Normal_3), 
        size = Vector3.zero, 
        hit = l_Position_4, 
        type = v14.Terrain, 
        color = if v190.Material == Enum.Material.Water then v83 else v189:GetMaterialColor(v190.Material)
    });
end;
local function _() --[[ Line: 482 ]] --[[ Name: warnAboutUnhandledGeometry ]]
    -- upvalues: l_StudioService_0 (copy)
    if l_StudioService_0 and l_StudioService_0:HasInternalPermission() then
        warn("Dragger encountered unhandled geometry type, report this to the Studio Builder Tools team.");
    end;
end;
local function v213(v199, v200, _) --[[ Line: 493 ]] --[[ Name: getSurfaceMatrixForPrimitiveMesh ]]
    -- upvalues: v15 (copy), v97 (copy), v14 (copy), l_StudioService_0 (copy), v177 (copy)
    local l_Position_5 = v200.Position;
    local l_Normal_4 = v200.Normal;
    local v204, v205 = v15.getClosestFace(v199, l_Position_5);
    local v206 = nil;
    local v207 = 1e999;
    for _, v209 in v205.edges do
        if (v209.a - v204.point):Dot(l_Normal_4) < 0.001 and (v209.b - v204.point):Dot(l_Normal_4) < 0.001 then
            local v210 = (l_Position_5 - v209.a):Dot(v209.direction);
            local l_Magnitude_0 = (l_Position_5 - (v209.a + v209.direction * v210)).Magnitude;
            if l_Magnitude_0 < v207 then
                v207 = l_Magnitude_0;
                v206 = v209;
            end;
        end;
    end;
    if v206 then
        local v212 = nil;
        v212 = if (v206.a - l_Position_5).Magnitude < (v206.b - l_Position_5).Magnitude then v206.a else v206.b;
        return v97(v199, l_Position_5, v14.Polygon, v212, nil, l_Normal_4, v206.direction);
    else
        if l_StudioService_0 and l_StudioService_0:HasInternalPermission() then
            warn("Dragger encountered unhandled geometry type, report this to the Studio Builder Tools team.");
        end;
        return v177(v199, v200);
    end;
end;
local function v217(v214, v215) --[[ Line: 541 ]] --[[ Name: getSurfaceMatrixForSurfaceExtension ]]
    -- upvalues: v3 (copy), v14 (copy)
    local v216 = v3.intersectRayPlane(v215.Origin, v215.Direction, v214.Position, v214.UpVector);
    return table.freeze({
        matrix = v214, 
        size = Vector3.zero, 
        hit = v215.Origin + v215.Direction * v216, 
        type = v14.Nothing, 
        color = Color3.new(1, 1, 1)
    });
end;
v15.getSurfaceMatrixNEW = function(v218, v219, v220, v221) --[[ Line: 559 ]] --[[ Name: getSurfaceMatrixNEW ]]
    -- upvalues: v4 (copy), v197 (copy), v188 (copy), v213 (copy), v128 (copy), v158 (copy), l_StudioService_0 (copy), v177 (copy), v217 (copy)
    local v222 = if v219 then v219.Instance else nil;
    if not v4(v219) then
        return nil;
    elseif v222 and v222:IsA("Terrain") then
        return v197(v222, v219, v221);
    elseif v222 then
        if v222:IsA("TriangleMeshPart") then
            return v188(v222, v219, v221);
        elseif v222:IsA("FormFactorPart") then
            if v222:IsA("WedgePart") then
                return v213(v222, v219, v221);
            elseif v222.Shape == Enum.PartType.Ball then
                return v128(v222, v219, v221);
            elseif v222.Shape == Enum.PartType.Cylinder then
                return v158(v222, v219, v221);
            else
                return v213(v222, v219, v221);
            end;
        elseif v222:IsA("CornerWedgePart") or v222:IsA("TrussPart") or v222:IsA("VehicleSeat") then
            return v213(v222, v219, v221);
        else
            if l_StudioService_0 and l_StudioService_0:HasInternalPermission() then
                warn("Dragger encountered unhandled geometry type, report this to the Studio Builder Tools team.");
            end;
            return v177(v222, v219);
        end;
    elseif v220 then
        return v217(v220, v218);
    else
        return nil;
    end;
end;
v15.getSurfaceMatrixOLD = function(v223, v224, v225) --[[ Line: 609 ]] --[[ Name: getSurfaceMatrixOLD ]]
    -- upvalues: v12 (copy), l_Workspace_0 (copy), v25 (copy), v14 (copy), v9 (copy), v15 (copy), v3 (copy)
    local v226 = nil;
    local v227 = nil;
    local v228 = nil;
    local v229 = RaycastParams.new();
    v229.BruteForceAllSlow = true;
    v229.CollisionGroup = v12;
    v229.FilterDescendantsInstances = v224;
    local v230 = l_Workspace_0:Raycast(v223.Origin, v223.Direction, v229);
    if v230 then
        v226 = v230.Instance;
        v227 = v230.Position;
        v228 = v230.Normal;
    end;
    if v226 and v226:IsA("Terrain") then
        local v231, v232, v233 = v25(v228);
        local v234 = v227:Dot(v232);
        local v235 = v227:Dot(v233);
        local v236 = v232 * (4 * math.floor(v234 / 4 + 0.5)) + v233 * (4 * math.floor(v235 / 4 + 0.5));
        local v237 = v236 + v231 * ((v227:Dot(v228) - v236:Dot(v228)) / v231:Dot(v228));
        local v238 = CFrame.fromMatrix(v237, v228:Cross(v232).Unit, v228);
        local l_v227_0 = v227;
        local l_Terrain_0 = v14.Terrain;
        if v9() then
            return v238, l_v227_0, l_Terrain_0, (v226:GetMaterialColor(v230.Material));
        else
            return v238, l_v227_0, l_Terrain_0, nil;
        end;
    elseif v226 then
        local v241, v242 = v15.getClosestFace(v226, v227);
        local l_normal_0 = v241.normal;
        local v244 = nil;
        local v245 = 1e999;
        for _, v247 in ipairs(v242.edges) do
            if (v247.a - v241.point):Dot(l_normal_0) < 0.001 and (v247.b - v241.point):Dot(l_normal_0) < 0.001 then
                local v248 = (v227 - v247.a):Dot(v247.direction);
                local l_Magnitude_1 = (v227 - (v247.a + v247.direction * v248)).Magnitude;
                if l_Magnitude_1 < v245 then
                    v245 = l_Magnitude_1;
                    v244 = v247.direction;
                end;
            end;
        end;
        local v250 = nil;
        local v251 = 1e999;
        for _, v253 in ipairs(v241.vertices) do
            local l_Magnitude_2 = (v253 - v227).Magnitude;
            if l_Magnitude_2 < v251 then
                v251 = l_Magnitude_2;
                v250 = v253;
            end;
        end;
        local l_Polygon_0 = v14.Polygon;
        if not v244 then
            l_Polygon_0 = v14.Round;
            v244 = l_normal_0:Cross((Vector3.new(1, 1, 1, 0))).Unit;
        end;
        if not v250 then
            v250 = v227;
        end;
        return CFrame.fromMatrix(v250, -v244:Cross(l_normal_0), l_normal_0), v227, l_Polygon_0, v226.Color;
    elseif v225 then
        local v256 = v3.intersectRayPlane(v223.Origin, v223.Direction, v225.Position, v225.UpVector);
        return v225, v223.Origin + v223.Direction * v256, v14.Nothing, Color3.new(1, 1, 1);
    else
        return nil;
    end;
end;
v15.getSurfaceMatrix = function(...) --[[ Line: 716 ]] --[[ Name: getSurfaceMatrix ]]
    -- upvalues: v9 (copy), v15 (copy)
    if v9() then
        return v15.getSurfaceMatrixNEW(...);
    else
        return v15.getSurfaceMatrixOLD(...);
    end;
end;
v15.updateTiltRotate = function(v257, v258, v259, v260, v261, v262, v263, v264, v265, v266) --[[ Line: 728 ]] --[[ Name: updateTiltRotate ]]
    -- upvalues: v9 (copy), v15 (copy), v7 (copy), v13 (copy), v6 (copy)
    local v267 = nil;
    local v268 = nil;
    local v269 = nil;
    if v9() then
        local v270 = v15.getSurfaceMatrix(v258, v15.raycast(v258, v259), v261, v265);
        if v270 then
            v267 = v270.matrix;
            v269 = v270.type;
        end;
    else
        local v271, v272, v273 = v15.getSurfaceMatrix(v258, v259, v261);
        v267 = v271;
        v268 = v272;
        v269 = v273;
    end;
    if not v267 then
        return v262;
    else
        local l_identity_0 = CFrame.identity;
        if not v266 then
            l_identity_0 = v267:Inverse() * v260;
            l_identity_0 = if v264 then v7(l_identity_0) else l_identity_0.Rotation;
        end;
        local v275 = v267 * l_identity_0;
        local v276 = nil;
        v276 = if v263 == Vector3.new(0, 1, 0, 0) then v267.UpVector else v257:VectorToWorldSpace(v263);
        local v277 = nil;
        local v278 = -1e999;
        for _, v280 in ipairs(v13) do
            local v281 = v275:VectorToWorldSpace(v280):Dot(v276);
            if v278 < v281 then
                v277 = v280;
                v278 = v281;
            end;
        end;
        v277 = v277 or Vector3.new(0, 1, 0, 0);
        return v6(CFrame.fromAxisAngle(v277, 1.5707963267948966)) * v262, v269;
    end;
end;
local function v293(v282, v283, v284, v285) --[[ Line: 810 ]] --[[ Name: softSnapIntervals ]]
    local v286 = 1e999;
    local v287 = nil;
    for v288 = -1, 1 do
        local v289 = v282 + v288 * v283;
        for v290 = -1, 1 do
            local v291 = v284 + v290 * v285;
            local v292 = v289 - v291;
            if math.abs(v292) < math.abs(v286) then
                v286 = v292;
                v287 = v291;
            end;
        end;
    end;
    return v286, v287;
end;
local function v308(v294, v295, v296, v297, v298, v299, v300) --[[ Line: 828 ]] --[[ Name: DEPRECATED_computeSoftSnap ]]
    -- upvalues: v11 (copy), v293 (copy)
    assert(not v11(), "FFlagDraggerIndependentSnap should be false here");
    local v301, v302 = v293(v297.X, 0.5 * v298.X, v299.X, 0.5 * v300.X);
    local v303 = math.abs(v301) < v295;
    if v303 then
        table.insert(v294, {
            a = Vector3.new(v302, 0, v299.Z), 
            b = Vector3.new(v302, 0, v299.Z + v296.Z * v300.Z)
        });
    else
        v301 = 0;
    end;
    local v304, v305 = v293(v297.Z, 0.5 * v298.Z, v299.Z, 0.5 * v300.Z);
    local v306 = math.abs(v304) < v295;
    if v306 then
        table.insert(v294, {
            a = Vector3.new(v299.X, 0, v305), 
            b = Vector3.new(v299.X + v296.X * v300.X, 0, v305)
        });
    else
        v304 = 0;
    end;
    if v303 and v306 then
        local v307 = Vector3.new(v302, 0, v305);
        table.insert(v294, {
            a = v307, 
            b = v307
        });
    end;
    return (Vector3.new(-v301, 0, -v304));
end;
local function _(v309) --[[ Line: 871 ]] --[[ Name: getSoftsnapThreshold ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v311 = l_CurrentCamera_0.CFrame:PointToObjectSpace(v309);
    return math.sin((math.rad(l_CurrentCamera_0.FieldOfView))) * -v311.Z * 0.02;
end;
local function _(v313, v314) --[[ Line: 883 ]] --[[ Name: chooseBetterSnap ]]
    -- upvalues: v11 (copy)
    assert(v11(), "FFlagDraggerIndependentSnap should be true here");
    if v313 and v314 then
        if math.abs(math.abs(v313) - math.abs(v314)) < 0.01 then
            return v313, "grid";
        elseif math.abs(v313) < math.abs(v314) then
            return v313, "grid";
        else
            return v314, "soft";
        end;
    elseif v313 then
        return v313, "grid";
    elseif v314 then
        return v314, "soft";
    else
        return 0, "none";
    end;
end;
local function v352(v316, v317, v318, v319, v320, v321, v322, v323, v324) --[[ Line: 905 ]] --[[ Name: computeDragSnapping ]]
    -- upvalues: v11 (copy), v14 (copy), v293 (copy)
    assert(v11(), "FFlagDraggerIndependentSnap should be true here");
    local v325 = nil;
    local v326 = nil;
    if v322 and v318 ~= v14.Sphere then
        v325 = math.floor(v320.X / v322 + 0.5) * v322 - v320.X;
        v326 = math.floor(v320.Z / v322 + 0.5) * v322 - v320.Z;
    end;
    local v327 = nil;
    local v328 = nil;
    local v329 = nil;
    local v330 = nil;
    if v323 then
        if v318 == v14.Polygon then
            local v331 = Vector3.new(math.sign(v320.X), 0, (math.sign(v320.Z)));
            local v332 = v331 * 0.5 * v319.size;
            local l_size_0 = v319.size;
            local v334 = v320 + v321;
            local v335 = Vector3.new(v334.X, 0, v334.Z);
            local v336 = Vector3.new(v317.X, 0, v317.Z);
            local l_hit_0 = v319.hit;
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            local v339 = l_CurrentCamera_1.CFrame:PointToObjectSpace(l_hit_0);
            local v340 = math.sin((math.rad(l_CurrentCamera_1.FieldOfView))) * -v339.Z * 0.02 * v324;
            local v341;
            v341, l_hit_0 = v293(v335.X, 0.5 * v336.X, v332.X, 0.5 * l_size_0.X);
            if math.abs(v341) < v340 then
                v327 = -v341;
                v329 = {
                    a = Vector3.new(l_hit_0, 0, 0), 
                    b = Vector3.new(l_hit_0, 0, v331.Z * l_size_0.Z)
                };
            end;
            l_CurrentCamera_1, v339 = v293(v335.Z, 0.5 * v336.Z, v332.Z, 0.5 * l_size_0.Z);
            if math.abs(l_CurrentCamera_1) < v340 then
                v328 = -l_CurrentCamera_1;
                v330 = {
                    a = Vector3.new(0, 0, v339), 
                    b = Vector3.new(v331.X * l_size_0.X, 0, v339)
                };
            end;
        elseif v318 == v14.Cylinder then

        end;
    end;
    local l_v325_0 = v325;
    local l_v327_0 = v327;
    assert(v11(), "FFlagDraggerIndependentSnap should be true here");
    local v344, v345;
    if l_v325_0 and l_v327_0 then
        if math.abs(math.abs(l_v325_0) - math.abs(l_v327_0)) < 0.01 then
            v345 = l_v325_0;
            v344 = "grid";
        elseif math.abs(l_v325_0) < math.abs(l_v327_0) then
            v345 = l_v325_0;
            v344 = "grid";
        else
            v345 = l_v327_0;
            v344 = "soft";
        end;
    elseif l_v325_0 then
        v345 = l_v325_0;
        v344 = "grid";
    elseif l_v327_0 then
        v345 = l_v327_0;
        v344 = "soft";
    else
        v345 = 0;
        v344 = "none";
    end;
    local l_v326_0 = v326;
    local l_v328_0 = v328;
    assert(v11(), "FFlagDraggerIndependentSnap should be true here");
    if l_v326_0 and l_v328_0 then
        if math.abs(math.abs(l_v326_0) - math.abs(l_v328_0)) < 0.01 then
            l_v325_0 = l_v326_0;
            l_v327_0 = "grid";
        elseif math.abs(l_v326_0) < math.abs(l_v328_0) then
            l_v325_0 = l_v326_0;
            l_v327_0 = "grid";
        else
            l_v325_0 = l_v328_0;
            l_v327_0 = "soft";
        end;
    elseif l_v326_0 then
        l_v325_0 = l_v326_0;
        l_v327_0 = "grid";
    elseif l_v328_0 then
        l_v325_0 = l_v328_0;
        l_v327_0 = "soft";
    else
        l_v325_0 = 0;
        l_v327_0 = "none";
    end;
    l_v326_0 = {};
    if v344 == "soft" then
        table.insert(l_v326_0, v329);
    end;
    if l_v327_0 == "soft" then
        table.insert(l_v326_0, v330);
    end;
    for _, v349 in l_v326_0 do
        local v350, v351 = v316:PointToWorldSpace(v349.a, v349.b);
        v349.a = v350;
        v349.b = v351;
    end;
    return CFrame.new(v345, 0, l_v325_0), l_v326_0;
end;
v15.getDragTargetNEW = function(v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366) --[[ Line: 995 ]] --[[ Name: getDragTargetNEW ]]
    -- upvalues: v15 (copy), v14 (copy), v7 (copy), v11 (copy), v352 (copy), v308 (copy)
    local v367 = v15.raycast(v358, v353);
    local v368 = v15.getSurfaceMatrix(v358, v367, v361, v359);
    if not v368 then
        return;
    else
        local l_matrix_0 = v368.matrix;
        local l_type_0 = v368.type;
        if l_type_0 == v14.Terrain and v363 then
            v362 = false;
        end;
        local l_identity_1 = CFrame.identity;
        if not v366 then
            l_identity_1 = l_matrix_0:Inverse() * v354;
            l_identity_1 = if v362 then v7(l_identity_1) else l_identity_1.Rotation;
        end;
        local v372 = v15.getSizeInSpace(v356, l_identity_1 * v360);
        local v373 = l_matrix_0:PointToObjectSpace(v368.hit);
        local v374 = nil;
        v374 = if l_type_0 == v14.Sphere then l_matrix_0 else l_matrix_0 * CFrame.new(v373.X, 0, v373.Z);
        local v375 = CFrame.new(-v357);
        local v376 = {};
        if v11() then
            local l_Position_6 = (l_identity_1 * v360 * (v375 * CFrame.new(v355))).Position;
            local v378 = nil;
            local v379, v380 = v352(l_matrix_0, v372, l_type_0, v368, v373, l_Position_6, v359, v365, v364);
            v378 = v379;
            v376 = v380;
            v374 = v374 * v378;
        else
            if v365 then
                if l_type_0 == v14.Polygon then
                    local v381 = Vector3.new(math.sign(v373.X), 0, (math.sign(v373.Z)));
                    local v382 = Vector3.new(v381 * 0.5 * v368.size);
                    local v383 = v373 + (l_identity_1 * v360 * v375).Position;
                    local v384 = Vector3.new(v383.X, 0, v383.Z);
                    local v385 = Vector3.new(v372.X, 0, v372.Z);
                    local l_new_0 = CFrame.new;
                    local l_v308_0 = v308;
                    local l_v376_0 = v376;
                    local l_hit_1 = v368.hit;
                    local l_CurrentCamera_2 = workspace.CurrentCamera;
                    local v391 = l_CurrentCamera_2.CFrame:PointToObjectSpace(l_hit_1);
                    v374 = v374 * l_new_0((l_v308_0(l_v376_0, math.sin((math.rad(l_CurrentCamera_2.FieldOfView))) * -v391.Z * 0.02 * v364, v381, v384, v385, v382, v368.size)));
                    for _, v393 in v376 do
                        l_hit_1, l_CurrentCamera_2 = l_matrix_0:PointToWorldSpace(v393.a, v393.b);
                        v393.a = l_hit_1;
                        v393.b = l_CurrentCamera_2;
                    end;
                elseif l_type_0 == v14.Cylinder then

                end;
            end;
            if v359 and l_type_0 ~= v14.Sphere and #v376 == 0 then
                local v394 = math.floor(v373.X / v359 + 0.5) * v359 - v373.X;
                local v395 = math.floor(v373.Z / v359 + 0.5) * v359 - v373.Z;
                v374 = v374 * CFrame.new(v394, 0, v395);
            end;
        end;
        local v396 = not v363;
        local v397 = nil;
        if v396 then
            local v398 = v355 - v357;
            local v399 = (l_identity_1 * v360):VectorToWorldSpace(v398);
            local v400 = 0.5 * v372.Y - v399.Y;
            v397 = v374 * CFrame.new(0, v400, 0) * l_identity_1;
        else
            v397 = v374 * l_identity_1;
        end;
        return table.freeze({
            baseCFrame = v397, 
            offsetCFrame = v375, 
            mainCFrame = v397 * v360 * v375, 
            targetMatrix = l_matrix_0, 
            targetPart = if v367 then v367.Instance else nil, 
            targetSize = v368.size, 
            targetColor = v368.color, 
            dragTargetType = l_type_0, 
            mouseWorld = v368.hit, 
            softSnaps = v376
        });
    end;
end;
v15.getDragTargetOLD = function(v401, v402, v403, v404, v405, v406, v407, v408, v409, v410, v411) --[[ Line: 1153 ]] --[[ Name: getDragTargetOLD ]]
    -- upvalues: v15 (copy), v7 (copy)
    if not v403 then
        return;
    else
        local v412, v413, v414 = v15.getSurfaceMatrix(v401, v404, v410);
        if not v412 then
            return;
        else
            local v415 = v412:Inverse() * v405;
            v415 = if v411 then v7(v415) else v415 - v415.Position;
            local v416 = Vector3.new(v402(v406.X) - v406.X, v402(v406.Y) - v406.Y, v402(v406.Z) - v406.Z);
            local v417 = CFrame.new(v416);
            local v418 = v408 + v416;
            local v419 = v15.getSizeInSpace(v407, v415 * v409);
            local v420 = (v415 * v409):VectorToWorldSpace(v418);
            local v421 = 0.5 * v419.Y - v420.Y;
            local v422 = CFrame.new(0, v421, 0);
            local v423 = CFrame.new(v403);
            local v424 = (v412 - v412.Position) * v415 * v409 + v413;
            local v425 = v412:Inverse() * v424 * (v422 * v415 * v409 * v423 * v417):inverse();
            local v426 = CFrame.new(v402(v425.X), 0, v402(v425.Z));
            local v427 = v412 * v426 * v422 * v415 * v409 * v417;
            local l_Position_7 = (v412 * v426).Position;
            return {
                mainCFrame = v427, 
                snapPoint = l_Position_7, 
                targetMatrix = v412, 
                dragTargetType = v414, 
                mouseWorld = v413
            };
        end;
    end;
end;
v15.getDragTarget = function(...) --[[ Line: 1248 ]] --[[ Name: getDragTarget ]]
    -- upvalues: v9 (copy), v15 (copy)
    if v9() then
        return v15.getDragTargetNEW(...);
    else
        return v15.getDragTargetOLD(...);
    end;
end;
v15.getCameraPlaneDragTarget = function(v429, v430, v431) --[[ Line: 1257 ]] --[[ Name: getCameraPlaneDragTarget ]]
    -- upvalues: v3 (copy), v14 (copy)
    if not v431 then
        return nil;
    else
        local l_Unit_2 = v429.Unit;
        local v433 = -1 * v430.Unit;
        local v434 = v3.intersectRayPlane(l_Unit_2.Origin, l_Unit_2.Direction, v431, v433);
        if v434 >= 0 then
            local v435 = l_Unit_2.Origin + v434 * l_Unit_2.Direction - v431;
            return {
                mainCFrame = CFrame.new(v435), 
                snapPoint = nil, 
                targetMatrix = nil, 
                dragTargetType = v14.Nothing
            };
        else
            return nil;
        end;
    end;
end;
return v15;