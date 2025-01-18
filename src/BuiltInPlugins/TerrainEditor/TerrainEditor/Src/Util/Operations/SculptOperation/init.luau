local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v2 = require(l_Util_0.AnalyticsHelper);
local v3 = require(l_Util_0.CalculateAutoMaterial);
local v4 = require(l_Util_0.CalculateBrushOccupancy);
local v5 = require(l_Util_0.CalculateMagnitudePercent);
local v6 = require(l_Util_0.ClampVoxelBoundaries);
local v7 = require(l_Util_0.ConvertForPivot);
local v8 = require(l_Util_0.getDraggedPositions);
local v9 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v9.VoxelResolution;
local v11 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v13.BrushMode;
local l_BrushSettings_0 = v13.BrushSettings;
local l_BrushShape_0 = v13.BrushShape;
local l_Category_0 = v13.Category;
local l_PivotPosition_0 = v13.PivotPosition;
local l_PlaneLock_0 = v13.PlaneLock;
local l_MaterialSettings_0 = v13.MaterialSettings;
local v21 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v22 = {
    Vector3.new(-1, 0, 0, 0), 
    Vector3.new(1, 0, 0, 0), 
    Vector3.new(0, -1, 0, 0), 
    Vector3.new(0, 1, 0, 0), 
    Vector3.new(0, 0, -1, 0), 
    (Vector3.new(0, 0, 1, 0))
};
return function(v23, v24) --[[ Line: 53 ]] --[[ Name: SculptOperation ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_BrushShape_0 (copy), l_VoxelResolution_0 (copy), v7 (copy), v21 (copy), v11 (copy), l_MaterialSettings_0 (copy), v8 (copy), v6 (copy), l_PivotPosition_0 (copy), l_PlaneLock_0 (copy), v4 (copy), v5 (copy), v22 (copy), v9 (copy), v3 (copy), l_BrushMode_0 (copy), v2 (copy), v12 (copy)
    local function v34(v25, _) --[[ Line: 54 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), l_VoxelResolution_0 (ref), v7 (ref)
        local v27 = v25.Payload[l_Category_0.BrushSettings];
        local v28 = v27[l_BrushSettings_0.BrushSize];
        local l_Height_0 = v28.Height;
        local l_Size_0 = v28.Size;
        local v31 = v27[l_BrushSettings_0.BrushShape];
        local v32 = v27[l_BrushSettings_0.State];
        local v33 = (if v31 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0) * l_VoxelResolution_0;
        v25.State = {
            Position = v7(v27[l_BrushSettings_0.PivotPosition], v32.Position, v33)
        };
    end;
    local function v170(v35, v36) --[[ Line: 70 ]] --[[ Name: onStep ]]
        -- upvalues: v21 (ref), l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), v11 (ref), v24 (copy), l_MaterialSettings_0 (ref), l_VoxelResolution_0 (ref), v7 (ref), v8 (ref), v6 (ref), l_PivotPosition_0 (ref), l_PlaneLock_0 (ref), v4 (ref), v5 (ref), v22 (ref), v9 (ref), v3 (ref), l_BrushMode_0 (ref), v2 (ref)
        assert(v35.State, "Tried to step without starting first.");
        if v21.ProfileTools() then
            debug.profilebegin("Sculpt");
        end;
        local l_State_0 = v35.State;
        local v38 = v35.Payload[l_Category_0.BrushSettings];
        local v39 = v38[l_BrushSettings_0.BrushSize];
        local l_Height_1 = v39.Height;
        local l_Size_1 = v39.Size;
        local v42 = v38[l_BrushSettings_0.BrushMode];
        local v43 = v38[l_BrushSettings_0.BrushShape];
        local v44 = v38[l_BrushSettings_0.IgnoreParts];
        local v45 = v38[l_BrushSettings_0.IgnoreWater];
        local v46 = v38[l_BrushSettings_0.PivotPosition];
        local v47 = v38[l_BrushSettings_0.PlaneLock];
        local v48 = v38[l_BrushSettings_0.Strength];
        local v49 = v38[l_BrushSettings_0.State];
        local v50 = v38[l_BrushSettings_0.TemporarySmooth];
        local v51 = false;
        if v43 == l_BrushShape_0.Sphere then
            v51 = l_Size_1 > 2;
        end;
        local v52 = v43 == l_BrushShape_0.Cylinder and l_Size_1 > 2 or v51;
        if v50 then
            if not l_State_0.Smooth then
                local v53 = v11("Smooth", v24);
                v53:start({
                    Payload = v35.Payload
                });
                l_State_0.Smooth = v53;
            else
                l_State_0.Smooth:updatePayload(v35.Payload);
            end;
            return true, 0;
        else
            if l_State_0.Smooth then
                l_State_0.Smooth:cancel();
                l_State_0.Smooth = nil;
                l_State_0.Position = v49.Position;
            end;
            local v54 = v35.Payload[l_Category_0.MaterialSettings];
            local v55 = v54[l_MaterialSettings_0.AutoMaterial];
            local v56 = v54[l_MaterialSettings_0.SourceMaterial];
            local v57 = (if v43 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1) * l_VoxelResolution_0;
            local v58 = l_Size_1 * l_VoxelResolution_0 * 0.5;
            local v59 = v7(v38[l_BrushSettings_0.PivotPosition], v49.Position, v57);
            local v60 = v8(l_State_0.Position, v59, v58);
            l_State_0.Position = v60[#v60];
            for _, v62 in v60 do
                local v63 = (v48 + 0.08) * (math.log(l_Size_1) / 14 + 0.025);
                local v64 = (v48 + 0.08) * (math.log(l_Size_1) / 28 + 0.025);
                local v65, v66 = v6(v62, v58, v57);
                local v67 = Region3.new(v65, v66);
                local v68 = (v66.X - v65.X) * 0.5;
                local v69 = false;
                if v46 == l_PivotPosition_0.Center then
                    v69 = false;
                    if v47 == l_PlaneLock_0.Off then
                        v69 = v44 == true;
                    end;
                end;
                local v70 = {};
                local v71, v72 = v24.Terrain:ReadVoxels(v67, l_VoxelResolution_0);
                local v73, v74 = v24.Terrain:ReadVoxels(v67, l_VoxelResolution_0);
                local v75 = os.clock();
                v71.Size = nil;
                v72.Size = nil;
                local v76 = #v71;
                local v77 = #v71[1];
                local v78 = #v71[1][1];
                local v79 = table.create(v76 * v77 * v78, false);
                local v80 = 0;
                local v81 = Vector3.new(v76, v77, v78);
                local l_v69_0 = v69;
                local v83 = nil;
                v83 = if not v69 and l_State_0.NextStartPosition and v4((l_State_0.NextStartPosition - v62).Magnitude, v68) > 0.5 then l_State_0.NextStartPosition else v62;
                local v84 = Vector3.new(math.round((v83.X - v65.X) / l_VoxelResolution_0), math.round((v83.Y - v65.Y) / l_VoxelResolution_0), (math.round((v83.Z - v65.Z) / l_VoxelResolution_0)));
                l_State_0.NextMagnitude = l_Size_1 * l_VoxelResolution_0;
                local v85 = false;
                local v86 = false;
                for v87 = -1, 1 do
                    for v88 = -1, 1 do
                        for v89 = -1, 1 do
                            local v90 = v84 + Vector3.new(v87, v88, v89);
                            local v91 = false;
                            if v90.X > 0 then
                                v91 = v90.X <= v81.X;
                            end;
                            local v92 = false;
                            if v90.Y > 0 then
                                v92 = v90.Y <= v81.Y;
                            end;
                            local v93 = false;
                            if v90.Z > 0 then
                                v93 = v90.Z <= v81.Z;
                            end;
                            if v91 and v92 and v93 then
                                v79[v90.X + v81.X * (v90.Y + v81.X * v90.Z)] = true;
                                v80 = v80 + 1;
                                if v72[v90.X][v90.Y][v90.Z] == 0 then
                                    v85 = true;
                                elseif v72[v90.X][v90.Y][v90.Z] == 1 then
                                    v86 = true;
                                else
                                    l_v69_0 = true;
                                end;
                                table.insert(v70, v90);
                            end;
                        end;
                    end;
                end;
                if v85 and v86 then
                    l_v69_0 = true;
                end;
                local function v111(v94, v95, v96, _) --[[ Line: 209 ]] --[[ Name: erode ]]
                    -- upvalues: v52 (copy), v4 (ref), v68 (copy), v5 (ref), v22 (ref), v81 (copy), v72 (copy), v71 (copy), v45 (copy), v63 (copy), v9 (ref), v74 (copy), v73 (copy), v69 (copy), l_State_0 (copy), v62 (copy)
                    local v98 = 1;
                    local v99 = 1;
                    if v52 then
                        v98 = v4(v95.Magnitude, v68);
                    end;
                    if v96 == 0 or v98 <= 0.5 then
                        return;
                    else
                        if v52 then
                            v99 = v5(v95.Magnitude, v68);
                        end;
                        local v100 = false;
                        local v101 = #v22;
                        for _, v103 in v22 do
                            local v104 = v94 + v103;
                            local v105 = false;
                            if v104.X > 0 then
                                v105 = v104.X <= v81.X;
                            end;
                            local v106 = false;
                            if v104.Y > 0 then
                                v106 = v104.Y <= v81.Y;
                            end;
                            local v107 = false;
                            if v104.Z > 0 then
                                v107 = v104.Z <= v81.Z;
                            end;
                            if v105 and v106 and v107 then
                                local v108 = v72[v104.X][v104.Y][v104.Z];
                                local v109 = v71[v104.X][v104.Y][v104.Z];
                                if v45 and v109 == Enum.Material.Water then
                                    v108 = 0;
                                end;
                                if v108 <= 0 then
                                    v100 = true;
                                end;
                                v101 = v101 - v108;
                            end;
                        end;
                        local v110 = math.max(if not (v96 >= 1) or v100 then v96 - v101 / #v22 * v63 * v98 * v99 else v96, 0);
                        if v110 <= v9.MinimumOccupancy then
                            v74[v94.X][v94.Y][v94.Z] = 0;
                            v73[v94.X][v94.Y][v94.Z] = Enum.Material.Air;
                            if not v69 and v95.Magnitude < l_State_0.NextMagnitude then
                                l_State_0.NextMagnitude = v95.Magnitude;
                                l_State_0.NextStartPosition = v95 + v62;
                                return;
                            end;
                        elseif v110 ~= v96 then
                            v74[v94.X][v94.Y][v94.Z] = v110;
                            if not v69 and v95.Magnitude < l_State_0.NextMagnitude then
                                l_State_0.NextMagnitude = v95.Magnitude;
                                l_State_0.NextStartPosition = v95 + v62;
                            end;
                        end;
                        return;
                    end;
                end;
                local function v131(v112, v113, v114, v115) --[[ Line: 271 ]] --[[ Name: grow ]]
                    -- upvalues: v52 (copy), v4 (ref), v68 (copy), v5 (ref), v22 (ref), v81 (copy), v72 (copy), v71 (copy), v45 (copy), v64 (copy), v9 (ref), v55 (copy), v3 (ref), v56 (copy), v73 (copy), v74 (copy), v69 (copy), l_State_0 (copy), v62 (copy)
                    local v116 = 1;
                    local v117 = 1;
                    if v52 then
                        v116 = v4(v113.Magnitude, v68);
                    end;
                    if v114 == 1 or v116 < 0.5 then
                        return;
                    else
                        if v52 then
                            v117 = v5(v113.Magnitude, v68);
                        end;
                        local v118 = false;
                        local v119 = #v22;
                        local v120 = 0;
                        for _, v122 in v22 do
                            local v123 = v112 + v122;
                            local v124 = false;
                            if v123.X > 0 then
                                v124 = v123.X < v81.X;
                            end;
                            local v125 = false;
                            if v123.Y > 0 then
                                v125 = v123.Y < v81.Y;
                            end;
                            local v126 = false;
                            if v123.Z > 0 then
                                v126 = v123.Z < v81.Z;
                            end;
                            if v124 and v125 and v126 then
                                local v127 = v72[v123.X][v123.Y][v123.Z];
                                local v128 = v71[v123.X][v123.Y][v123.Z];
                                if v45 and v128 == Enum.Material.Water then
                                    v127 = 0;
                                end;
                                if v127 >= 1 then
                                    v118 = true;
                                end;
                                v120 = v120 + 1;
                                v119 = v119 + v127;
                            end;
                        end;
                        v119 = v120 == 0 and 0 or v119 / v120;
                        local v129 = math.min(if not (v114 <= 0) or v118 then v114 + v119 * v64 * v116 * v117 else v114, v9.MaximumOccupancy);
                        if v115 == Enum.Material.Air and v129 > 0 then
                            local v130 = if v55 then v3(v112.X, v112.Y, v112.Z, v71, v81) else v56;
                            if v45 and v130 == Enum.Material.Water then
                                v130 = Enum.Material.Air;
                            end;
                            v73[v112.X][v112.Y][v112.Z] = v130;
                        end;
                        if v129 ~= v114 then
                            v74[v112.X][v112.Y][v112.Z] = v129;
                            if not v69 and v113.Magnitude < l_State_0.NextMagnitude then
                                l_State_0.NextMagnitude = v113.Magnitude;
                                l_State_0.NextStartPosition = v113 + v62;
                            end;
                        end;
                        return;
                    end;
                end;
                local function v144(v132) --[[ Line: 339 ]] --[[ Name: checkNeighbors ]]
                    -- upvalues: v81 (copy), v72 (copy), v71 (copy), v45 (copy)
                    local v133 = true;
                    local v134 = true;
                    for v135 = -1, 1 do
                        for v136 = -1, 1 do
                            for v137 = -1, 1 do
                                local v138 = v132 + Vector3.new(v135, v136, v137);
                                local v139 = false;
                                if v138.X > 0 then
                                    v139 = v138.X <= v81.X;
                                end;
                                local v140 = false;
                                if v138.Y > 0 then
                                    v140 = v138.Y <= v81.Y;
                                end;
                                local v141 = false;
                                if v138.Z > 0 then
                                    v141 = v138.Z <= v81.Z;
                                end;
                                if v139 and v140 and v141 and (v135 ~= 0 or v136 ~= 0 or v137 ~= 0) then
                                    local v142 = v72[v138.X][v138.Y][v138.Z];
                                    local v143 = v71[v138.X][v138.Y][v138.Z] == Enum.Material.Water;
                                    if v45 and v143 then
                                        v142 = 0;
                                    end;
                                    if v142 > 0 then
                                        v133 = false;
                                    end;
                                    if v142 < 1 then
                                        v134 = false;
                                    end;
                                    if not v134 and not v133 then
                                        return false, false;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return v133, v134;
                end;
                do
                    local l_v79_0, l_v80_0, l_l_v69_0_0 = v79, v80, l_v69_0;
                    local function v164(v148, v149) --[[ Line: 379 ]] --[[ Name: addNeighbors ]]
                        -- upvalues: v144 (copy), v72 (copy), l_l_v69_0_0 (ref), v42 (copy), l_BrushMode_0 (ref), v81 (copy), l_v79_0 (ref), l_v80_0 (ref), v70 (copy), v71 (copy), v45 (copy)
                        local v150, v151 = v144(v148);
                        local v152 = v72[v148.X][v148.Y][v148.Z];
                        if not (l_l_v69_0_0 and if v42 == l_BrushMode_0.Add then v151 or (not (v152 ~= 0) or v149) and v150 else v150 or v152 == 1 and not v149 and v151) then
                            for v153 = -1, 1 do
                                for v154 = -1, 1 do
                                    for v155 = -1, 1 do
                                        local v156 = v148 + Vector3.new(v153, v154, v155);
                                        local v157 = false;
                                        if v156.X > 0 then
                                            v157 = v156.X <= v81.X;
                                        end;
                                        local v158 = false;
                                        if v156.Y > 0 then
                                            v158 = v156.Y <= v81.Y;
                                        end;
                                        local v159 = false;
                                        if v156.Z > 0 then
                                            v159 = v156.Z <= v81.Z;
                                        end;
                                        if v157 and v158 and v159 and (v153 ~= 0 or v154 ~= 0 or v155 ~= 0) then
                                            if not l_l_v69_0_0 and not l_v79_0[v156.X + v81.X * (v156.Y + v81.X * v156.Z)] then
                                                l_v79_0[v156.X + v81.X * (v156.Y + v81.X * v156.Z)] = true;
                                                l_v80_0 = l_v80_0 + 1;
                                                table.insert(v70, v156);
                                            else
                                                local v160 = v72[v156.X][v156.Y][v156.Z];
                                                local v161 = v71[v156.X][v156.Y][v156.Z];
                                                if v45 and v161 == Enum.Material.Water then
                                                    v160 = 0;
                                                end;
                                                local v162 = false;
                                                local v163 = false;
                                                if v42 == l_BrushMode_0.Add then
                                                    v163 = v160 < 1;
                                                    if (v152 == 0 or v149) and v160 == 0 then
                                                        v163 = false;
                                                    end;
                                                elseif v42 == l_BrushMode_0.Subtract then
                                                    v162 = v160 > 0;
                                                    if v152 == 1 and not v149 and v160 == 1 then
                                                        v162 = false;
                                                    end;
                                                end;
                                                if (v163 or v162) and not l_v79_0[v156.X + v81.X * (v156.Y + v81.X * v156.Z)] then
                                                    l_v79_0[v156.X + v81.X * (v156.Y + v81.X * v156.Z)] = true;
                                                    l_v80_0 = l_v80_0 + 1;
                                                    table.insert(v70, v156);
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    while #v70 > 0 do
                        local v165 = table.remove(v70);
                        local v166 = v72[v165.X][v165.Y][v165.Z];
                        local v167 = v71[v165.X][v165.Y][v165.Z];
                        local v168 = v45 and v167 == Enum.Material.Water or v167 == Enum.Material.Air;
                        if not l_l_v69_0_0 then
                            if v45 and v167 == Enum.Material.Water then
                                v166 = 0;
                            end;
                            if v85 and v166 ~= 0 or v86 and v166 ~= 1 then
                                l_l_v69_0_0 = true;
                            end;
                            if l_l_v69_0_0 then
                                l_v80_0 = 0;
                                l_v79_0 = {};
                            else
                                v164(v165, v168);
                                continue;
                            end;
                        end;
                        local v169 = v65 + (v165 - Vector3.new(0.5, 0.5, 0.5, 0)) * l_VoxelResolution_0 - v62;
                        if l_l_v69_0_0 then
                            if v42 == l_BrushMode_0.Subtract and v166 > 0 and not v168 then
                                if v45 and v167 == Enum.Material.Water then
                                    v166 = 0;
                                end;
                                v111(v165, v169, v166, v167);
                            elseif v42 == l_BrushMode_0.Add and (v166 < 1 or v168) then
                                if v45 and v167 == Enum.Material.Water then
                                    v167 = Enum.Material.Air;
                                    v166 = 0;
                                end;
                                v131(v165, v169, v166, v167);
                            end;
                        end;
                        v164(v165, v168);
                    end;
                    v36:addTimeStatistic(v2.NormalizeDepthFirstSearch(v75, l_v80_0));
                    v24.Terrain:WriteVoxels(v67, l_VoxelResolution_0, v73, v74);
                end;
            end;
            if v21.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        end;
    end;
    return v12.new({
        Name = v23, 
        OnFinish = function(v171, _) --[[ Line: 515 ]] --[[ Name: onFinish ]]
            -- upvalues: v24 (copy)
            v24.ChangeHistoryService:SetWaypoint("Sculpt");
            assert(v171.State, "Tried to step without starting first.");
            if v171.State.Smooth then
                v171.State.Smooth:cancel();
            end;
        end, 
        OnStart = v34, 
        OnStep = v170
    });
end;