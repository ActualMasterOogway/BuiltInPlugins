local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_Gizmo_0 = v3.Gizmo;
local l_Note_0 = v3.Note;
local l_OperationSource_0 = v3.OperationSource;
local l_PluginAction_0 = v3.PluginAction;
local l_SelectionSettings_0 = v3.SelectionSettings;
local l_TransformMode_0 = v3.TransformMode;
local l_TransformSettings_0 = v3.TransformSettings;
local l_Tab_0 = v3.Tab;
local l_Tool_0 = v3.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.AnalyticsHelper);
local v16 = require(l_Util_0.ApplyTransform);
local v17 = require(l_Util_0.ConvertTransformToRegion);
local v18 = require(l_Util_0.getWithinTerrainBounds);
local v19 = require(l_Util_0.SettingsHelper);
local v20 = require(l_Util_0.Operations.TransformOperation);
local l_game_FastInt_0 = game:GetFastInt("SmoothTerrainMaxCppRegion");
local v22 = {
    {
        Defaults = {
            [l_TransformSettings_0.MergeEmpty] = false, 
            [l_TransformSettings_0.LiveEdit] = true, 
            [l_TransformSettings_0.ForcePreview] = false, 
            [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Move
        }, 
        Id = l_Category_0.TransformSettings
    }
};
local v23 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Color = Color3.new(0, 0, 1), 
            Wireframe = true, 
            Rotation = true
        }
    }
};
local v24 = v2:new(l_Tool_0.Transform, l_Tab_0.Edit, v22, v23);
v24.startOperation = function(v25, v26) --[[ Line: 55 ]] --[[ Name: startOperation ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), v19 (copy), l_TransformSettings_0 (copy), v20 (copy), v17 (copy), l_TransformMode_0 (copy), l_SelectionSettings_0 (copy), l_Tool_0 (copy), v1 (copy)
    v2.startOperation(v25, v26);
    local v27 = v25:getPayload();
    v27[l_Category_0.SelectionSettings] = v19.Get(l_Category_0.SelectionSettings, v25._pluginController, v25._persistentUserSettings[l_Category_0.SelectionSettings]);
    local v28 = v27[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
    local v29 = v25._localization:getText("Operations", (("%*Name"):format(v28)));
    local v30 = v25._localization:getText("Operations", (("%*Description"):format(v28)));
    v25._operation = v20(v29, v30, v25._services);
    local v31 = v27[l_Category_0.TransformSettings][l_TransformSettings_0.Size];
    local v32 = v27[l_Category_0.TransformSettings][l_TransformSettings_0.Transform];
    local function v35(v33, v34) --[[ Line: 75 ]] --[[ Name: simpleMove ]]
        -- upvalues: v31 (copy), v32 (copy), v25 (copy), v17 (ref), v27 (copy), l_Category_0 (ref), l_TransformSettings_0 (ref)
        if v31 ~= v33 or v32.Rotation ~= CFrame.new() then
            return false;
        else
            v25._services.Terrain:PasteRegion(v34:Clone(), v17(v32, v31, true).Min, v27[l_Category_0.TransformSettings][l_TransformSettings_0.MergeEmpty]);
            return true;
        end;
    end;
    if v28 == l_TransformMode_0.Move then
        if v35(v27[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], v27[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion]) then
            return;
        end;
    elseif v28 == l_TransformMode_0.Paste then
        if v35(v27[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize], v27[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBuffer]) then
            return;
        end;
    elseif (v28 == l_TransformMode_0.Import or v28 == l_TransformMode_0.Duplicate) and v35(v27[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize], v27[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion]) then
        return;
    end;
    v25._operationFinishedConnection = v25._operation.Finished:Connect(function() --[[ Line: 118 ]]
        -- upvalues: v25 (copy), l_Tool_0 (ref)
        v25:finishOperation();
        v25._toolController.selectTool(l_Tool_0.Select);
    end);
    v25._operation:start(v1.join({
        Payload = v27
    }, v26));
    v25.OnOperationChanged:Fire();
end;
v24.init = function(v36, v37, v38) --[[ Line: 129 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_TransformSettings_0 (copy)
    v2.init(v36, v37, v38);
    v36._overrides = {
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.Rotation] = {
                Hidden = false
            }, 
            [l_TransformSettings_0.Apply] = {
                Hidden = not v36._persistentUserSettings[l_Category_0.TransformSettings][l_TransformSettings_0.ForcePreview] and v36._persistentUserSettings[l_Category_0.TransformSettings][l_TransformSettings_0.LiveEdit], 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 142 ]] --[[ Name: OnClick ]]
                        -- upvalues: v36 (copy)
                        v36:startOperation();
                    end
                }, 
                Value = true
            }
        }
    };
end;
v24.getValues = function(v39) --[[ Line: 152 ]] --[[ Name: getValues ]]
    -- upvalues: v19 (copy), l_Category_0 (copy)
    return v19.Get(l_Category_0.SelectionSettings, v39._pluginController, v39._persistentUserSettings[l_Category_0.SelectionSettings], v39._sessionUserSettings[l_Category_0.SelectionSettings]), (v19.Get(l_Category_0.TransformSettings, v39._pluginController, v39._persistentUserSettings[l_Category_0.TransformSettings], v39._sessionUserSettings[l_Category_0.TransformSettings]));
end;
v24.checkSize = function(v40, v41, v42, v43, v44) --[[ Line: 169 ]] --[[ Name: checkSize ]]
    -- upvalues: v17 (copy), l_game_FastInt_0 (copy), l_Category_0 (copy), l_TransformSettings_0 (copy)
    local v45 = v17(v41, v42);
    local v46 = v45.Max - v45.Min;
    local v47 = v46.X * v46.Y * v46.Z > l_game_FastInt_0;
    if v40:hasError() then
        v47 = true;
    end;
    if v43 and v44 then
        local v48 = v17(v43, v44);
        local v49 = v48.Max - v48.Min;
        v47 = v47 or v49.X * v49.Y * v49.Z > l_game_FastInt_0;
        if v40:hasError() then
            v47 = true;
        end;
    end;
    v40:setPayload({
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.ForcePreview] = v47
        }
    });
    return v47;
end;
v24.hasError = function(v50) --[[ Line: 196 ]] --[[ Name: hasError ]]
    -- upvalues: l_SelectionSettings_0 (copy), v2 (copy), v18 (copy)
    local v51, _ = v50:getValues();
    local v53 = v51[l_SelectionSettings_0.Size];
    local v54 = v51[l_SelectionSettings_0.Transform];
    return v2.hasError(v50) or not v18(v54, v53);
end;
v24.setDisabledState = function(v55) --[[ Line: 206 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_TransformSettings_0 (copy)
    local v56 = v55:hasError();
    if v55._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Disabled ~= v56 then
        v55._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Disabled = v56;
        v55.OnInternalsChanged:Fire();
    end;
end;
v24.activate = function(v57) --[[ Line: 215 ]] --[[ Name: activate ]]
    -- upvalues: l_SelectionSettings_0 (copy), l_TransformMode_0 (copy), v17 (copy), l_PluginAction_0 (copy), l_Category_0 (copy), l_TransformSettings_0 (copy), l_Tool_0 (copy), v2 (copy)
    local v58, v59 = v57:getValues();
    local v60 = v58[l_SelectionSettings_0.Size];
    local v61 = v58[l_SelectionSettings_0.SnapToVoxels];
    local v62 = v58[l_SelectionSettings_0.Transform];
    local v63 = v59[l_SelectionSettings_0.TransformMode];
    v57:checkSize(v62, v60);
    local v64 = nil;
    if v63 == l_TransformMode_0.Move then
        v64 = v57._services.Terrain:CopyRegion(v17(v62, v60, true));
        v64.Parent = v57._services.CoreGui;
    end;
    v57._applyConnection = v57._shortcutController:Connect(l_PluginAction_0.Apply, function() --[[ Line: 235 ]]
        -- upvalues: v57 (copy)
        if v57._live then
            return;
        else
            v57:startOperation();
            return;
        end;
    end);
    v57._shortcutController:Enable(l_PluginAction_0.Apply);
    v57:setPayload({
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.Size] = v60, 
            [l_TransformSettings_0.SnapToVoxels] = v61, 
            [l_TransformSettings_0.Transform] = v62, 
            [l_TransformSettings_0.TerrainRegion] = v64
        }
    });
    v57._region = v17(v62, v60);
    v57._regionOriginal = v17(v62, v60);
    v57._terrainBackup = v57._services.Terrain:CopyRegion(v57._region);
    v57._terrainOriginal = v57._services.Terrain:CopyRegion(v57._regionOriginal);
    v57._analytics:report("Activated", l_Tool_0.Transform);
    v57:updateValues();
    v2.activate(v57);
end;
v24.gizmos = function(v65) --[[ Line: 263 ]] --[[ Name: gizmos ]]
    -- upvalues: v2 (copy), l_Gizmo_0 (copy), l_Category_0 (copy), v19 (copy)
    local v66 = v2.gizmos(v65);
    for _, v68 in v66 do
        if v68.Id == l_Gizmo_0.Region then
            v68.Value[l_Category_0.SelectionSettings] = v19.Get(l_Category_0.SelectionSettings, v65._pluginController, v65._persistentUserSettings[l_Category_0.SelectionSettings]);
        end;
    end;
    return v66;
end;
v24.operation = function(v69) --[[ Line: 281 ]] --[[ Name: operation ]]
    return v69._operation;
end;
v24.note = function(v70) --[[ Line: 285 ]] --[[ Name: note ]]
    return v70._note;
end;
v24.deactivate = function(v71) --[[ Line: 289 ]] --[[ Name: deactivate ]]
    -- upvalues: v2 (copy), l_PluginAction_0 (copy), v19 (copy), l_Category_0 (copy), l_TransformMode_0 (copy)
    v2.deactivate(v71);
    v71._applyConnection:Disconnect();
    v71._shortcutController:Disable(l_PluginAction_0.Apply);
    v19.Set(l_Category_0.TransformSettings, v71._pluginController, {
        TransformMode = l_TransformMode_0.Move
    });
end;
v24.saveGizmos = function(v72, v73) --[[ Line: 300 ]] --[[ Name: saveGizmos ]]
    -- upvalues: v2 (copy)
    v2.saveGizmos(v72, v73);
    v72:updateValues();
end;
v24.saveForm = function(v74, v75) --[[ Line: 306 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v74, v75);
    v74:updateValues();
end;
v24.updateMode = function(v76) --[[ Line: 312 ]] --[[ Name: updateMode ]]
    -- upvalues: l_TransformSettings_0 (copy), l_Category_0 (copy), l_Note_0 (copy)
    local _, v78 = v76:getValues();
    local v79 = not v78[l_TransformSettings_0.ForcePreview] and v78[l_TransformSettings_0.LiveEdit];
    if v76._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Hidden ~= v79 then
        v76._note = if v79 then nil else l_Note_0.Transform;
        v76.OnNoteChanged:Fire();
        v76._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Hidden = v79;
        task.spawn(function() --[[ Line: 324 ]]
            -- upvalues: v76 (copy)
            v76.OnFormChanged:Fire();
        end);
    end;
    if v79 then
        if not v76._live then
            v76._services.Terrain:PasteRegion(v76._terrainOriginal, v76._regionOriginal.Min, true);
            v76._services.Terrain:PasteRegion(v76._terrainBackup, v76._region.Min, true);
        end;
    elseif v76._live then
        v76._services.Terrain:PasteRegion(v76._terrainOriginal, v76._regionOriginal.Min, true);
        v76._services.Terrain:PasteRegion(v76._terrainBackup, v76._region.Min, true);
    end;
    v76._live = v79;
    return not v76._live;
end;
v24.updateValues = function(v80) --[[ Line: 346 ]] --[[ Name: updateValues ]]
    -- upvalues: l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_OperationSource_0 (copy)
    local v81, v82 = v80:getValues();
    local v83 = v81[l_SelectionSettings_0.Size];
    local v84 = v81[l_SelectionSettings_0.Transform];
    local v85 = v82[l_TransformSettings_0.Size];
    v80:checkSize(v84, v83, v82[l_TransformSettings_0.Transform], v85);
    if v80:updateMode() then
        return;
    elseif v82[l_TransformSettings_0.OperationSource] == l_OperationSource_0.History then
        return;
    else
        v80:transform(v81, v82);
        return;
    end;
end;
v24.transform = function(v86, v87, v88) --[[ Line: 369 ]] --[[ Name: transform ]]
    -- upvalues: l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), v17 (copy), v16 (copy), v15 (copy), l_Category_0 (copy)
    local v89 = v88[l_SelectionSettings_0.TransformMode];
    local v90 = v88[l_TransformSettings_0.Size];
    local v91 = v88[l_TransformSettings_0.Transform];
    local v92 = if v89 == l_TransformMode_0.Paste then v88[l_TransformSettings_0.TransformRegionBufferSize] else v87[l_SelectionSettings_0.Size];
    local v93 = v87[l_SelectionSettings_0.Transform];
    local v94 = v17(v91, v90);
    local v95 = os.clock();
    v86._services.Terrain:PasteRegion(v86._terrainBackup, v86._region.Min, true);
    v86._terrainBackup = v86._services.Terrain:CopyRegion(v94);
    v86._region = v94;
    local v96 = v88[l_TransformSettings_0.MergeEmpty];
    local v97 = nil;
    if v89 == l_TransformMode_0.Move then
        v97 = v88[l_TransformSettings_0.TerrainRegion]:Clone();
        if v96 then
            v86._services.Terrain:SetMaterialInTransform(v91, v90, Enum.Material.Air);
        end;
        v86._services.Terrain:SetMaterialInTransform(v93, v92, Enum.Material.Air);
    elseif v89 == l_TransformMode_0.Paste then
        v97 = v88[l_TransformSettings_0.TerrainRegionBuffer]:Clone();
        if v96 then
            v86._services.Terrain:SetMaterialInTransform(v91, v90, Enum.Material.Air);
        end;
    elseif v89 == l_TransformMode_0.Duplicate or v89 == l_TransformMode_0.Import then
        v97 = v88[l_TransformSettings_0.TerrainRegion]:Clone();
        if v96 then
            v86._services.Terrain:SetMaterialInTransform(v91, v90, Enum.Material.Air);
        end;
    else
        return;
    end;
    local l_v16_0 = v16;
    local l_Terrain_0 = v86._services.Terrain;
    local l_v97_0 = v97;
    local l_v91_0 = v91;
    local l_v90_0 = v90;
    local v103 = false;
    if v91.Rotation == v93.Rotation then
        v103 = v90 == v92;
    end;
    l_v16_0(l_Terrain_0, l_v97_0, l_v91_0, l_v90_0, v103);
    v86._time = os.clock() - v95;
    l_v16_0 = v15.NormalizeRegionTimer(v95, v90);
    if l_v16_0 then
        v86._totalTime = (v86._totalTime or 0) + l_v16_0;
        v86._count = if v86._count then v86._count + 1 else 1;
    end;
    if os.clock() - v95 > 5 then
        v86:setPayload({
            [l_Category_0.TransformSettings] = {
                [l_TransformSettings_0.LiveEdit] = false
            }
        });
    end;
end;
v24.reportAnalytics = function(v104) --[[ Line: 443 ]] --[[ Name: reportAnalytics ]]
    -- upvalues: l_TransformSettings_0 (copy), v15 (copy), l_Tool_0 (copy)
    local _, v106 = v104:getValues();
    if not v106[l_TransformSettings_0.ForcePreview] and v106[l_TransformSettings_0.LiveEdit] and v104._time then
        local v107 = v104:getPayload();
        v104._analytics:report("RegionProperties", v15.getRegionPayload(v107, v104._time, l_Tool_0.Transform));
        v104._analytics:report("Usage", l_Tool_0.Transform, 1);
        if v104._count then
            v104._analytics:report("Performance", l_Tool_0.Transform, v104._totalTime / v104._count);
        end;
        v104._time = nil;
    end;
end;
return v24;