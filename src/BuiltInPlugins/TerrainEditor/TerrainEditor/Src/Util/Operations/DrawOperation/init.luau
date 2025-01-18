local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.Operations.BaseOperation);
local v5 = require(l_Util_0.CalculateAutoMaterial);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.ClampVoxelBoundaries);
local v8 = require(l_Util_0.ConvertForPivot);
local v9 = require(l_Util_0.getDraggedPositions);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v11.BrushMode;
local l_BrushShape_0 = v11.BrushShape;
local l_BrushSettings_0 = v11.BrushSettings;
local l_Category_0 = v11.Category;
local l_MaterialSettings_0 = v11.MaterialSettings;
local v17 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
return function(v18, v19) --[[ Line: 40 ]] --[[ Name: DrawOperation ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_BrushShape_0 (copy), v1 (copy), v8 (copy), v17 (copy), v10 (copy), l_MaterialSettings_0 (copy), l_BrushMode_0 (copy), v9 (copy), v7 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy)
    local function v29(v20, _) --[[ Line: 41 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), v1 (ref), v8 (ref)
        local v22 = v20.Payload[l_Category_0.BrushSettings];
        local v23 = v22[l_BrushSettings_0.BrushSize];
        local l_Height_0 = v23.Height;
        local l_Size_0 = v23.Size;
        local v26 = v22[l_BrushSettings_0.BrushShape];
        local v27 = v22[l_BrushSettings_0.State];
        local v28 = (if v26 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0) * v1.VoxelResolution;
        v20.State = {
            Position = v8(v22[l_BrushSettings_0.PivotPosition], v27.Position, v28)
        };
    end;
    local function v95(v30, v31) --[[ Line: 57 ]] --[[ Name: onStep ]]
        -- upvalues: v17 (ref), l_Category_0 (ref), l_BrushSettings_0 (ref), v10 (ref), v19 (copy), l_MaterialSettings_0 (ref), l_BrushShape_0 (ref), v1 (ref), l_BrushMode_0 (ref), v8 (ref), v9 (ref), v7 (ref), v3 (ref), v6 (ref), v5 (ref)
        assert(v30.State, "Tried to step without starting first.");
        if v17.ProfileTools() then
            debug.profilebegin("Draw");
        end;
        local l_State_0 = v30.State;
        local v33 = v30.Payload[l_Category_0.BrushSettings];
        local v34 = v33[l_BrushSettings_0.BrushSize];
        local l_Height_1 = v34.Height;
        local l_Size_1 = v34.Size;
        local v37 = v33[l_BrushSettings_0.BrushMode];
        local v38 = v33[l_BrushSettings_0.BrushShape];
        local v39 = v33[l_BrushSettings_0.State];
        local v40 = v33[l_BrushSettings_0.IgnoreWater];
        if v33[l_BrushSettings_0.TemporarySmooth] then
            if not l_State_0.Smooth then
                local v41 = v10("Smooth", v19);
                v41:start({
                    Payload = v30.Payload
                });
                l_State_0.Smooth = v41;
            else
                l_State_0.Smooth:updatePayload(v30.Payload);
            end;
            if v17.ProfileTools() then
                debug.profileend();
            end;
            return true, 0;
        else
            if l_State_0.Smooth then
                l_State_0.Smooth:cancel();
                l_State_0.Smooth = nil;
                l_State_0.Position = v39.Position;
            end;
            if v39.Material == Enum.Material.Air then
                v31:skipBudget();
                return true, 0;
            else
                local v42 = v30.Payload[l_Category_0.MaterialSettings];
                local v43 = v42[l_MaterialSettings_0.AutoMaterial];
                local v44 = v42[l_MaterialSettings_0.SourceMaterial];
                local v45 = (if v38 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1) * v1.VoxelResolution;
                local v46 = l_Size_1 * v1.VoxelResolution;
                local v47 = v46 * 0.5;
                if v37 == l_BrushMode_0.Add then
                    l_Size_1 = l_Size_1 - 1;
                    v45 = v45 - 2;
                    v46 = v46 - 2;
                    v47 = v47 - 1;
                else
                    v44 = Enum.Material.Air;
                end;
                local v48 = v8(v33[l_BrushSettings_0.PivotPosition], v39.Position, v45);
                local v49 = v9(l_State_0.Position, v48, v47);
                l_State_0.Position = v49[#v49];
                for _, v51 in v49 do
                    if v51 == l_State_0.LastPosition and not v43 then
                        v31:skipBudget();
                        if v17.ProfileTools() then
                            debug.profileend();
                        end;
                        return true, 0;
                    else
                        l_State_0.LastPosition = v51;
                        local v52, v53 = v7(v51, v47, v45);
                        local v54 = os.clock();
                        if (not (v37 ~= l_BrushMode_0.Add) or v37 == l_BrushMode_0.Subtract and not v40) and not v43 then
                            if v38 == l_BrushShape_0.Sphere then
                                v19.Terrain:FillBall(v51, v47, v44);
                            elseif v38 == l_BrushShape_0.Cube then
                                v19.Terrain:FillBlock(CFrame.new(v51), Vector3.new(v46, v45, v46), v44);
                            elseif v38 == l_BrushShape_0.Cylinder then
                                if (v53 - v52).X <= 2 * v1.VoxelResolution then
                                    v19.Terrain:FillBall(v51, v47, v44);
                                else
                                    v19.Terrain:FillCylinder(CFrame.new(v51), v45, v47, v44);
                                end;
                            end;
                            v31:addTimeStatistic(v3.NormalizeBrushTimer(v54, v34.Size, v34.Height));
                        else
                            local v55 = Region3.new(v52, v53);
                            local v56 = (v53.X - v52.X) * 0.5;
                            local v57 = (v53 - v52) / v1.VoxelResolution;
                            local v58, v59 = v19.Terrain:ReadVoxels(v55, v1.VoxelResolution);
                            v58.Size = nil;
                            v59.Size = nil;
                            local v60 = #v58;
                            local v61 = #v58[1];
                            local _ = #v58[1][1];
                            local v63 = table.create(v60);
                            local v64 = table.create(v60);
                            local v65 = table.create(v60);
                            local l_VoxelResolution_0 = v1.VoxelResolution;
                            local v67 = false;
                            if v38 == l_BrushShape_0.Sphere then
                                v67 = l_Size_1 > 2;
                            end;
                            local v68 = v38 == l_BrushShape_0.Cylinder and l_Size_1 > 2 or v67;
                            local v69 = v52.X - l_VoxelResolution_0 * 0.5 - v51.X;
                            local v70 = v52.Y - l_VoxelResolution_0 * 0.5 - v51.Y;
                            local v71 = v52.Z - l_VoxelResolution_0 * 0.5 - v51.Z;
                            local v72 = nil;
                            local v73 = nil;
                            local v74 = v37 == l_BrushMode_0.Add;
                            local v75 = v37 == l_BrushMode_0.Subtract;
                            local v76 = os.clock();
                            for v77, v78 in v59 do
                                v72 = if v68 then (v77 * l_VoxelResolution_0 + v69) ^ 2 else nil;
                                local v79 = v58[v77];
                                local v80 = table.create(v61);
                                local v81 = table.create(v61);
                                local v82 = table.create(v61);
                                v63[v77] = v80;
                                v64[v77] = v81;
                                v65[v77] = v82;
                                for v83, v84 in v78 do
                                    v73 = if v67 then v72 + (v83 * l_VoxelResolution_0 + v70) ^ 2 else nil;
                                    local v85 = v79[v83];
                                    local v86 = table.clone(v85);
                                    local v87 = table.clone(v85);
                                    local v88 = table.clone(v84);
                                    v80[v83] = v86;
                                    v81[v83] = v87;
                                    v82[v83] = v88;
                                    for v89, v90 in v84 do
                                        local v91 = v85[v89];
                                        local v92 = 1;
                                        if v68 then
                                            local v93 = (v89 * l_VoxelResolution_0 + v71) ^ 2;
                                            local v94 = if v67 then math.sqrt(v73 + v93) else math.sqrt(v72 + v93);
                                            v92 = v6(v94, v56);
                                        end;
                                        if v74 and v90 < v92 then
                                            v84[v89] = v92;
                                            if not v43 then
                                                v86[v89] = v91;
                                            else
                                                v86[v89] = v5(v77, v83, v89, v58, v57) or v91;
                                            end;
                                        elseif v75 and (not v40 or v91 ~= Enum.Material.Water) and v1.MinimumOccupancy <= v92 then
                                            v84[v89] = 0;
                                            v86[v89] = Enum.Material.Air;
                                            if v92 == 1 then
                                                v87[v89] = Enum.Material.Air;
                                                v88[v89] = 0;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            v31:addTimeStatistic(v3.NormalizeBrushTimer(v76, v34.Size, v34.Height));
                            if v37 == l_BrushMode_0.Subtract then
                                v19.Terrain:WriteVoxels(v55, v1.VoxelResolution, v64, v65);
                            end;
                            v19.Terrain:WriteVoxels(v55, v1.VoxelResolution, v63, v59);
                        end;
                    end;
                end;
                if v17.ProfileTools() then
                    debug.profileend();
                end;
                return true, 0;
            end;
        end;
    end;
    return v4.new({
        Budget = 0.005, 
        Name = v18, 
        OnFinish = function(v96, _) --[[ Line: 281 ]] --[[ Name: onFinish ]]
            -- upvalues: v19 (copy)
            assert(v96.State, "Tried to finish without starting first.");
            local l_State_1 = v96.State;
            v19.ChangeHistoryService:SetWaypoint("Draw");
            if l_State_1.Smooth then
                l_State_1.Smooth:cancel();
            end;
        end, 
        OnStart = v29, 
        OnStep = v95
    });
end;