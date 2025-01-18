local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_Util_0.CreateSubregions);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v6.Category;
local l_SelectionSettings_0 = v6.SelectionSettings;
local l_TransformMode_0 = v6.TransformMode;
local l_TransformSettings_0 = v6.TransformSettings;
return function(v11, v12, v13) --[[ Line: 34 ]] --[[ Name: TransformOperation ]]
    -- upvalues: l_Category_0 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), v5 (copy), v4 (copy), v3 (copy), v1 (copy)
    local function v30(v14, _) --[[ Line: 35 ]] --[[ Name: onStart ]]
        -- upvalues: v13 (copy), l_Category_0 (ref), l_SelectionSettings_0 (ref), l_TransformSettings_0 (ref), l_TransformMode_0 (ref), v5 (ref), v4 (ref)
        local l_Terrain_0 = v13.Terrain;
        local v17 = v14.Payload[l_Category_0.SelectionSettings];
        local v18 = v14.Payload[l_Category_0.TransformSettings];
        local v19 = v17[l_SelectionSettings_0.Transform];
        local v20 = v17[l_SelectionSettings_0.Size];
        local v21 = nil;
        local v22 = nil;
        if v18[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Move then
            v21 = v5(v19, v20);
            v22 = 1;
        end;
        local v23 = v18[l_TransformSettings_0.Transform];
        local v24 = v18[l_TransformSettings_0.Size];
        local v25, v26 = v5(v23, v24);
        local v27 = nil;
        v27 = if v18[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Paste then v18[l_TransformSettings_0.TerrainRegionBuffer] else v18[l_TransformSettings_0.TerrainRegion];
        local v28 = v4(v23, v24);
        local v29 = l_Terrain_0:CopyRegion(v28);
        v14.State = {
            BackupRegion = v28, 
            BackupTerrainRegion = v29, 
            SourceCurrentIndex = v22, 
            SourceRegions = v21, 
            SourceTerrainRegion = v27, 
            StartTime = os.clock(), 
            TargetCurrentIndex = 1, 
            TargetOrigins = v26, 
            TargetRegions = v25
        };
    end;
    local function v42(v31, _) --[[ Line: 85 ]] --[[ Name: onStep ]]
        -- upvalues: l_Category_0 (ref), v13 (copy), l_TransformSettings_0 (ref), l_TransformMode_0 (ref), l_SelectionSettings_0 (ref)
        assert(v31.State, "Tried to step without starting first.");
        local l_State_0 = v31.State;
        local v34 = v31.Payload[l_Category_0.SelectionSettings];
        local v35 = v31.Payload[l_Category_0.TransformSettings];
        local l_SourceTerrainRegion_0 = l_State_0.SourceTerrainRegion;
        local l_Terrain_1 = v13.Terrain;
        local v38 = l_State_0.TargetOrigins[l_State_0.TargetCurrentIndex];
        local v39 = l_State_0.TargetRegions[l_State_0.TargetCurrentIndex];
        local v40 = v35[l_TransformSettings_0.Size];
        local v41 = v35[l_TransformSettings_0.Transform];
        if v35[l_TransformSettings_0.TransformMode] == l_TransformMode_0.Move and l_State_0.SourceRegions and l_State_0.SourceCurrentIndex then
            l_Terrain_1:SetMaterialInTransformSubregion(v34[l_SelectionSettings_0.Transform], v34[l_SelectionSettings_0.Size], Enum.Material.Air, l_State_0.SourceRegions[l_State_0.SourceCurrentIndex]);
            if l_State_0.SourceCurrentIndex ~= #l_State_0.SourceRegions then
                l_State_0.SourceCurrentIndex = l_State_0.SourceCurrentIndex + 1;
                return true, l_State_0.SourceCurrentIndex / (#l_State_0.SourceRegions + #l_State_0.TargetRegions);
            end;
        end;
        if v35[l_TransformSettings_0.MergeEmpty] then
            l_Terrain_1:SetMaterialInTransformSubregion(v41, v40, Enum.Material.Air, v39);
        end;
        l_Terrain_1:PasteRegion(l_SourceTerrainRegion_0:ApplyTransformSubregion(v41.Rotation, v40, v39), v38, false);
        if l_State_0.TargetCurrentIndex == #l_State_0.TargetRegions then
            return false, 0;
        else
            l_State_0.TargetCurrentIndex = l_State_0.TargetCurrentIndex + 1;
            return true, (l_State_0.TargetCurrentIndex + (l_State_0.SourceCurrentIndex or 0)) / (#l_State_0.TargetRegions + if l_State_0.SourceRegions then #l_State_0.SourceRegions else 0);
        end;
    end;
    local function v46(v43, _) --[[ Line: 141 ]] --[[ Name: onCancel ]]
        -- upvalues: v13 (copy)
        assert(v43.State, "Tried to cancel without starting first.");
        local l_State_1 = v43.State;
        v13.Terrain:PasteRegion(l_State_1.BackupTerrainRegion, l_State_1.BackupRegion.Min, true);
    end;
    local function v50(v47, v48) --[[ Line: 150 ]] --[[ Name: onFinish ]]
        -- upvalues: l_Category_0 (ref), l_SelectionSettings_0 (ref), v3 (ref), v13 (copy)
        local v49 = v47.Payload[l_Category_0.TransformSettings][l_SelectionSettings_0.Size];
        v48:addTimeStatistic(v3.NormalizeRegionTimer(v47.State.StartTime, v49));
        v13.ChangeHistoryService:SetWaypoint("TransformAction");
    end;
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v12, 
        Name = v11, 
        OnCancel = v46, 
        OnFinish = v50, 
        OnStart = v30, 
        OnStep = v42
    });
end;