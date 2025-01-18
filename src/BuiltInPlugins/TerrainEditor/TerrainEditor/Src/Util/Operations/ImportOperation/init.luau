local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Operations.BaseOperation);
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_HeightmapSettings_0 = v3.HeightmapSettings;
local l_SelectionSettings_0 = v3.SelectionSettings;
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_RegionNormalization_0 = v7.RegionNormalization;
local l_MaxImportVolume_0 = v7.MaxImportVolume;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.AnalyticsHelper);
local v12 = require(l_Util_0.ConvertTransformToRegion);
local function _(v13) --[[ Line: 32 ]] --[[ Name: convertVector ]]
    return (Vector3.new(v13.X * 4, v13.Y * 4, v13.Z * 4));
end;
return function(v15, v16, v17) --[[ Line: 36 ]] --[[ Name: ImportOperation ]]
    -- upvalues: l_Category_0 (copy), l_SelectionSettings_0 (copy), v12 (copy), l_MaxImportVolume_0 (copy), l_HeightmapSettings_0 (copy), l_HeightmapImporterService_0 (copy), l_RegionNormalization_0 (copy), v11 (copy), v1 (copy)
    local function v35(v18, v19) --[[ Line: 37 ]] --[[ Name: onStart ]]
        -- upvalues: l_Category_0 (ref), l_SelectionSettings_0 (ref), v12 (ref), l_MaxImportVolume_0 (ref), l_HeightmapSettings_0 (ref), l_HeightmapImporterService_0 (ref)
        local function v32() --[[ Line: 38 ]] --[[ Name: heightmapImporterTask ]]
            -- upvalues: v18 (copy), l_Category_0 (ref), l_SelectionSettings_0 (ref), v12 (ref), l_MaxImportVolume_0 (ref), l_HeightmapSettings_0 (ref), l_HeightmapImporterService_0 (ref)
            local v20 = v18.Payload[l_Category_0.SelectionSettings];
            local v21 = v18.Payload[l_Category_0.HeightmapSettings];
            local v22 = v20[l_SelectionSettings_0.Transform];
            local v23 = v20[l_SelectionSettings_0.Size];
            local v24 = v12(v22, v23, true);
            local l_Min_0 = v24.Min;
            local v26 = Vector3.new(l_Min_0.X * 4, l_Min_0.Y * 4, l_Min_0.Z * 4);
            local l_Max_0 = v24.Max;
            l_Min_0 = Vector3.new(l_Max_0.X * 4, l_Max_0.Y * 4, l_Max_0.Z * 4);
            l_Max_0 = l_Min_0 - v26;
            if l_Max_0.X * l_Max_0.Y * l_Max_0.Z > l_MaxImportVolume_0 then
                l_Min_0 = l_Min_0 - Vector3.one * 4;
            end;
            local v28 = Region3.new(v26, l_Min_0);
            if not v21[l_HeightmapSettings_0.Heightmap].Image then
                v18.State.Progress = 1;
                return;
            else
                local l_TemporaryId_0 = v21[l_HeightmapSettings_0.Heightmap].Image.File:GetTemporaryId();
                local l_Image_0 = v21[l_HeightmapSettings_0.Colormap].Image;
                local v31 = if l_Image_0 then l_Image_0.File:GetTemporaryId() else "";
                l_HeightmapImporterService_0:ImportHeightmap(v28, l_TemporaryId_0, v31, v21[l_HeightmapSettings_0.DefaultMaterial]);
                v18.State.Progress = 1;
                return;
            end;
        end;
        v18.State = {
            Progress = 0, 
            ProgressUpdateConnection = l_HeightmapImporterService_0.ProgressUpdate:Connect(function(v33, v34) --[[ Line: 80 ]]
                -- upvalues: v19 (copy), v18 (copy)
                v19:setDescription(v34);
                v18.State.Progress = v33;
            end), 
            StartTime = os.clock()
        };
        if v18.Synchronous then
            v32();
            return;
        else
            task.spawn(v32);
            return;
        end;
    end;
    local function v39(v36, _) --[[ Line: 94 ]] --[[ Name: onStep ]]
        local l_State_0 = v36.State;
        if l_State_0.Progress and l_State_0.Progress == 1 then
            return false, 1;
        else
            return true, l_State_0.Progress or 0;
        end;
    end;
    local function v42(_, _) --[[ Line: 104 ]] --[[ Name: onCancel ]]
        -- upvalues: l_HeightmapImporterService_0 (ref)
        l_HeightmapImporterService_0:CancelImportHeightmap();
    end;
    local function v45(_, _) --[[ Line: 108 ]] --[[ Name: onPause ]]
        -- upvalues: l_HeightmapImporterService_0 (ref)
        l_HeightmapImporterService_0:SetImportHeightmapPaused(true);
    end;
    local function v48(_, _) --[[ Line: 112 ]] --[[ Name: onResume ]]
        -- upvalues: l_HeightmapImporterService_0 (ref)
        l_HeightmapImporterService_0:SetImportHeightmapPaused(false);
    end;
    local function v53(v49, v50) --[[ Line: 116 ]] --[[ Name: onFinish ]]
        -- upvalues: l_Category_0 (ref), l_SelectionSettings_0 (ref), l_RegionNormalization_0 (ref), v11 (ref), v17 (copy)
        local l_State_1 = v49.State;
        if l_State_1.ProgressUpdateConnection then
            l_State_1.ProgressUpdateConnection:Disconnect();
            l_State_1.ProgressUpdateConnection = nil;
            l_State_1.Progress = 0;
        end;
        local v52 = v49.Payload[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        if v52.X >= l_RegionNormalization_0 and v52.Y >= l_RegionNormalization_0 and v52.Z >= l_RegionNormalization_0 then
            v50:addTimeStatistic(v11.NormalizeRegionTimer(l_State_1.StartTime, v52));
        end;
        v17.ChangeHistoryService:SetWaypoint("ImportAction");
    end;
    return v1.new({
        AllowPause = true, 
        AllowCancel = true, 
        Description = v16, 
        Name = v15, 
        OnCancel = v42, 
        OnFinish = v53, 
        OnPause = v45, 
        OnResume = v48, 
        OnStart = v35, 
        OnStep = v39
    });
end;