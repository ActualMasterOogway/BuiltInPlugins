local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_VoxelResolution_0 = v1.VoxelResolution;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.AnalyticsHelper);
local v5 = require(l_Util_0.Operations.BaseOperation);
local v6 = require(l_Util_0.CalculateBrushOccupancy);
local v7 = require(l_Util_0.CalculateMagnitudePercent);
local v8 = require(l_Util_0.ClampVoxelBoundaries);
local v9 = require(l_Util_0.ConvertForPivot);
local v10 = require(l_Util_0.getDraggedPositions);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushShape_0 = v11.BrushShape;
local l_BrushSettings_0 = v11.BrushSettings;
local l_Category_0 = v11.Category;
local v15 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
return function(v16, v17) --[[ Line: 35 ]] --[[ Name: SmoothOperation ]]
    -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy), l_BrushShape_0 (copy), l_VoxelResolution_0 (copy), v9 (copy), v15 (copy), v10 (copy), v8 (copy), v6 (copy), v7 (copy), v1 (copy), v4 (copy), v5 (copy)
    local function v27(v18, _) --[[ Line: 36 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), l_VoxelResolution_0 (ref), v9 (ref)
        local v20 = v18.Payload[l_Category_0.BrushSettings];
        local v21 = v20[l_BrushSettings_0.BrushSize];
        local l_Height_0 = v21.Height;
        local l_Size_0 = v21.Size;
        local v24 = v20[l_BrushSettings_0.BrushShape];
        local v25 = v20[l_BrushSettings_0.State];
        local v26 = (if v24 == l_BrushShape_0.Sphere then l_Size_0 else l_Height_0) * l_VoxelResolution_0;
        v18.State = {
            Position = v9(v20[l_BrushSettings_0.PivotPosition], v25.Position, v26)
        };
    end;
    local function v81(v28, v29) --[[ Line: 52 ]] --[[ Name: onStep ]]
        -- upvalues: v15 (ref), l_Category_0 (ref), l_BrushSettings_0 (ref), l_BrushShape_0 (ref), l_VoxelResolution_0 (ref), v9 (ref), v10 (ref), v8 (ref), v17 (copy), v6 (ref), v7 (ref), v1 (ref), v4 (ref)
        assert(v28.State, "Tried to step without starting first.");
        if v15.ProfileTools() then
            debug.profilebegin("Smooth");
        end;
        local l_State_0 = v28.State;
        local v31 = v28.Payload[l_Category_0.BrushSettings];
        local v32 = v31[l_BrushSettings_0.BrushSize];
        local l_Height_1 = v32.Height;
        local l_Size_1 = v32.Size;
        local v35 = v31[l_BrushSettings_0.BrushShape];
        local v36 = v31[l_BrushSettings_0.State];
        local v37 = v31[l_BrushSettings_0.IgnoreWater];
        local v38 = v31[l_BrushSettings_0.Strength] or 1;
        local v39 = false;
        if v35 == l_BrushShape_0.Sphere then
            v39 = l_Size_1 > 2;
        end;
        local v40 = v35 == l_BrushShape_0.Cylinder and l_Size_1 > 2 or v39;
        local v41 = (if v35 == l_BrushShape_0.Sphere then l_Size_1 else l_Height_1) * l_VoxelResolution_0;
        local v42 = l_Size_1 * l_VoxelResolution_0 * 0.5;
        local v43 = v9(v31[l_BrushSettings_0.PivotPosition], v36.Position, v41);
        local v44 = v10(l_State_0.Position, v43, v42);
        l_State_0.Position = v44[#v44];
        for _, v46 in v44 do
            local v47, v48 = v8(v46, v42, v41);
            local v49 = Region3.new(v47, v48);
            local v50 = (v48.X - v47.X) * 0.5;
            local v51 = v47.X - l_VoxelResolution_0 * 0.5 - v46.X;
            local v52 = v47.Y - l_VoxelResolution_0 * 0.5 - v46.Y;
            local v53 = v47.Z - l_VoxelResolution_0 * 0.5 - v46.Z;
            local v54 = nil;
            local v55 = nil;
            local v56, v57 = v17.Terrain:ReadVoxels(v49, l_VoxelResolution_0);
            local v58, v59 = v17.Terrain:SmoothRegion(v49, l_VoxelResolution_0, v38);
            v56.Size = nil;
            v57.Size = nil;
            local v60 = os.clock();
            for v61, v62 in v57 do
                v54 = if v40 then (v61 * l_VoxelResolution_0 + v51) ^ 2 else nil;
                local v63 = v58[v61];
                local v64 = v59[v61];
                local v65 = v56[v61];
                for v66, v67 in v62 do
                    v55 = if v39 then v54 + (v66 * l_VoxelResolution_0 + v52) ^ 2 else nil;
                    local v68 = v63[v66];
                    local v69 = v64[v66];
                    local v70 = v65[v66];
                    for v71, v72 in v67 do
                        local v73 = v70[v71];
                        local v74 = 1;
                        local v75 = 1;
                        if v40 then
                            local v76 = (v71 * l_VoxelResolution_0 + v53) ^ 2;
                            local v77 = if v39 then math.sqrt(v55 + v76) else math.sqrt(v54 + v76);
                            v74 = v6(v77, v50);
                            v75 = v7(v77, v50);
                        end;
                        if v37 and v73 == Enum.Material.Water then
                            v64[v71] = v72;
                            v68[v71] = v73;
                            return;
                        else
                            local v78 = v68[v71];
                            local v79 = true;
                            if v78 ~= Enum.Material.Air then
                                v79 = v69[v71] <= 0;
                            end;
                            local v80 = math.clamp(v72 + (v69[v71] - v72) * v38 * v74 * v75, 0, 1);
                            if v80 ~= v69[v71] then
                                v69[v71] = v80;
                                if v79 and v1.MinimumSmooth <= v80 then
                                    v68[v71] = v73;
                                elseif v80 <= 0 then
                                    v68[v71] = Enum.Material.Air;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            v29:addTimeStatistic(v4.NormalizeBrushTimer(v60, l_Size_1, l_Height_1));
            v17.Terrain:WriteVoxels(v49, l_VoxelResolution_0, v58, v59);
        end;
        if v15.ProfileTools() then
            debug.profileend();
        end;
        return true, 0;
    end;
    return v5.new({
        Budget = 0.005, 
        OnFinish = function(_, _) --[[ Line: 169 ]] --[[ Name: onFinish ]]
            -- upvalues: v17 (copy)
            v17.ChangeHistoryService:SetWaypoint("Smooth");
        end, 
        OnStart = v27, 
        OnStep = v81, 
        Name = v16
    });
end;