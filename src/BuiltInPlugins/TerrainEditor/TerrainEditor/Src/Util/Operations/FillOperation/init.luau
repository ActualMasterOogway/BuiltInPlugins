local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.AnalyticsHelper);
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_Util_0.CreateSubregions);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v6.Category;
local l_FillMode_0 = v6.FillMode;
local l_MaterialSettings_0 = v6.MaterialSettings;
local l_SelectionSettings_0 = v6.SelectionSettings;
return function(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: FillOperation ]]
    -- upvalues: l_Category_0 (copy), l_SelectionSettings_0 (copy), v5 (copy), v4 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), v3 (copy), v1 (copy)
    local function v23(v14, _) --[[ Line: 31 ]] --[[ Name: onStart ]]
        -- upvalues: v13 (copy), l_Category_0 (ref), l_SelectionSettings_0 (ref), v5 (ref), v4 (ref)
        local l_Terrain_0 = v13.Terrain;
        local v17 = v14.Payload[l_Category_0.SelectionSettings];
        local v18 = v17[l_SelectionSettings_0.Transform];
        local v19 = v17[l_SelectionSettings_0.Size];
        local v20 = v5(v18, v19);
        local v21 = v4(v18, v19);
        local v22 = l_Terrain_0:CopyRegion(v21);
        v14.State = {
            BackupRegion = v21, 
            BackupTerrainRegion = v22, 
            CurrentIndex = 1, 
            Regions = v20, 
            StartTime = os.clock()
        };
    end;
    local function v36(v24, _) --[[ Line: 54 ]] --[[ Name: onStep ]]
        -- upvalues: v13 (copy), l_Category_0 (ref), l_MaterialSettings_0 (ref), l_SelectionSettings_0 (ref), l_FillMode_0 (ref)
        assert(v24.State, "Tried to step without starting first.");
        local l_State_0 = v24.State;
        local l_Terrain_1 = v13.Terrain;
        local v28 = v24.Payload[l_Category_0.MaterialSettings];
        local v29 = v24.Payload[l_Category_0.SelectionSettings];
        local v30 = v28[l_MaterialSettings_0.FillMode];
        local v31 = v29[l_SelectionSettings_0.Size];
        local v32 = v28[l_MaterialSettings_0.SourceMaterial];
        local v33 = v28[l_MaterialSettings_0.TargetMaterial];
        local v34 = v29[l_SelectionSettings_0.Transform];
        local v35 = l_State_0.Regions[l_State_0.CurrentIndex];
        if not v35 then
            return false, 0;
        else
            if v30 == l_FillMode_0.Replace then
                l_Terrain_1:ReplaceMaterialInTransformSubregion(v34, v31, v32, v33, v35);
            else
                l_Terrain_1:SetMaterialInTransformSubregion(v34, v31, v32, v35);
            end;
            if l_State_0.CurrentIndex == #l_State_0.Regions then
                return false, 0;
            else
                l_State_0.CurrentIndex = l_State_0.CurrentIndex + 1;
                return true, l_State_0.CurrentIndex / #l_State_0.Regions;
            end;
        end;
    end;
    local function v40(v37, _) --[[ Line: 90 ]] --[[ Name: onCancel ]]
        -- upvalues: v13 (copy)
        assert(v37.State, "Tried to cancel without starting first.");
        local l_State_1 = v37.State;
        v13.Terrain:PasteRegion(l_State_1.BackupTerrainRegion, l_State_1.BackupRegion.Min, true);
    end;
    local function v44(v41, v42) --[[ Line: 99 ]] --[[ Name: onFinish ]]
        -- upvalues: l_Category_0 (ref), l_SelectionSettings_0 (ref), v3 (ref), v13 (copy)
        if v41.State and v41.State.StartTime then
            local v43 = v41.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
            v42:addTimeStatistic(v3.NormalizeRegionTimer(v41.State.StartTime, v43));
        end;
        v13.ChangeHistoryService:SetWaypoint("FillAction");
    end;
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v12, 
        Name = v11, 
        OnCancel = v40, 
        OnFinish = v44, 
        OnStart = v23, 
        OnStep = v36
    });
end;