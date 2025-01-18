local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Src.Resources.AnalyticsHandlers);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v3.BrushSettings;
local l_Category_0 = v3.Category;
local l_FillMode_0 = v3.FillMode;
local l_MaterialMode_0 = v3.MaterialMode;
local l_MaterialSettings_0 = v3.MaterialSettings;
local l_SeaLevelSettings_0 = v3.SeaLevelSettings;
local l_SelectionSettings_0 = v3.SelectionSettings;
local l_Tool_0 = v3.Tool;
local l_TransformSettings_0 = v3.TransformSettings;
return {
    getBrushPayload = function(v13, v14, v15) --[[ Line: 20 ]] --[[ Name: getBrushPayload ]]
        -- upvalues: l_Category_0 (copy), l_BrushSettings_0 (copy)
        return {
            averageTime = v14, 
            height = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Height, 
            locked = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Locked and true or false, 
            shape = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushShape], 
            size = v13[l_Category_0.BrushSettings][l_BrushSettings_0.BrushSize].Size, 
            strength = v13[l_Category_0.BrushSettings][l_BrushSettings_0.Strength], 
            tool = v15
        };
    end, 
    getMaterialPayload = function(v16, v17) --[[ Line: 36 ]] --[[ Name: getMaterialPayload ]]
        -- upvalues: l_Category_0 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), l_MaterialMode_0 (copy)
        local v18 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.AutoMaterial];
        local v19 = true;
        if v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode] ~= l_FillMode_0.Replace then
            v19 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.MaterialMode] == l_MaterialMode_0.Replace;
        end;
        local v20 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial];
        local v21 = v16[l_Category_0.MaterialSettings][l_MaterialSettings_0.TargetMaterial];
        local v22 = if v19 then v21 else v20;
        local v23 = if v19 then v20 else nil;
        return {
            autoMaterial = v18, 
            replace = v19, 
            material = if not v18 then v22 else nil, 
            secondaryMaterial = if not v18 then v23 else nil, 
            tool = v17
        };
    end, 
    getRegionPayload = function(v24, v25, v26) --[[ Line: 58 ]] --[[ Name: getRegionPayload ]]
        -- upvalues: l_Tool_0 (copy), l_Category_0 (copy), l_SeaLevelSettings_0 (copy), l_TransformSettings_0 (copy), l_SelectionSettings_0 (copy)
        local v27 = if v26 == l_Tool_0.SeaLevel then v24[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size] else if v26 == l_Tool_0.Transform then v24[l_Category_0.TransformSettings][l_TransformSettings_0.Size] else v24[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        local v28 = if v26 == l_Tool_0.SeaLevel then v24[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform] else if v26 == l_Tool_0.Transform then v24[l_Category_0.TransformSettings][l_TransformSettings_0.Transform] else v24[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform];
        return {
            averageTime = v25, 
            position = v28.Position, 
            rotation = v28.Rotation, 
            size = v27, 
            tool = v26
        };
    end, 
    NormalizeBrushTimer = function(v29, v30, v31) --[[ Line: 82 ]] --[[ Name: NormalizeBrushTimer ]]
        -- upvalues: v2 (copy)
        local v32 = os.clock() - v29;
        local v33 = v30 * v30 * v31;
        local v34 = v32 * (v2.BrushNormalization ^ 3 / v33) * 1000;
        if v33 < v2.BrushNormalizationMinVolume then
            return nil;
        elseif v2.SpikeThreshold < v34 then
            return v2.SpikeThreshold;
        else
            return v34;
        end;
    end, 
    NormalizeDepthFirstSearch = function(v35, v36) --[[ Line: 94 ]] --[[ Name: NormalizeDepthFirstSearch ]]
        -- upvalues: v2 (copy)
        return (os.clock() - v35) * (v2.BrushNormalization ^ 2 / v36) * 1000;
    end, 
    NormalizeRegionTimer = function(v37, v38) --[[ Line: 100 ]] --[[ Name: NormalizeRegionTimer ]]
        -- upvalues: v2 (copy)
        local v39 = os.clock() - v37;
        local v40 = v38.X * v38.Y * v38.Z;
        local v41 = v39 * (v2.RegionNormalization ^ 3 / v40) * 1000;
        if v40 < v2.BrushNormalizationMinVolume then
            return nil;
        elseif v2.SpikeThreshold < v41 then
            return v2.SpikeThreshold;
        else
            return v41;
        end;
    end
};