local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_deepCopy_0 = v1.Util.deepCopy;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Generation.MaterialLUT);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.getLookRight);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getVoxelAlignedRegion);
local v8 = require(l_script_FirstAncestor_0.Src.Util.TerrainPlacementHelper);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationAnalytics);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v10.BuildSettings;
local l_Category_0 = v10.Category;
local l_Gizmo_0 = v10.Gizmo;
local l_Tab_0 = v10.Tab;
local l_TerrainType_0 = v10.TerrainType;
local l_Tool_0 = v10.Tool;
local v17 = {
    [l_TerrainType_0.Arctic] = require(script.Arctic), 
    [l_TerrainType_0.Crater] = require(script.Crater), 
    [l_TerrainType_0.Desert] = require(script.Desert), 
    [l_TerrainType_0.Lake] = require(script.Lake), 
    [l_TerrainType_0.Mesa] = require(script.Mesa), 
    [l_TerrainType_0.Mountain] = require(script.Mountain), 
    [l_TerrainType_0.None] = require(script.None), 
    [l_TerrainType_0.Plain] = require(script.Plain), 
    [l_TerrainType_0.Volcano] = require(script.Volcano)
};
local v18 = {
    [l_TerrainType_0.Arctic] = require(l_script_FirstAncestor_0.Src.Stamps.ArcticStamp), 
    [l_TerrainType_0.Crater] = require(l_script_FirstAncestor_0.Src.Stamps.CraterStamp), 
    [l_TerrainType_0.Desert] = require(l_script_FirstAncestor_0.Src.Stamps.DesertStamp), 
    [l_TerrainType_0.Lake] = require(l_script_FirstAncestor_0.Src.Stamps.LakeStamp), 
    [l_TerrainType_0.Mesa] = require(l_script_FirstAncestor_0.Src.Stamps.MesaStamp), 
    [l_TerrainType_0.Mountain] = require(l_script_FirstAncestor_0.Src.Stamps.MountainStamp), 
    [l_TerrainType_0.Plain] = require(l_script_FirstAncestor_0.Src.Stamps.PlainStamp), 
    [l_TerrainType_0.Volcano] = require(l_script_FirstAncestor_0.Src.Stamps.VolcanoStamp)
};
local v19 = {
    {
        Defaults = {}, 
        Id = l_Category_0.BuildSettings
    }
};
local v20 = v2:new(l_Tool_0.Build, l_Tab_0.Create, v19, {});
v20.init = function(v21, v22, v23) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_TerrainType_0 (copy), v17 (copy), l_Category_0 (copy), l_BuildSettings_0 (copy), l_deepCopy_0 (copy), v9 (copy), v6 (copy)
    v2.init(v21, v22, v23);
    v21._terrainType = l_TerrainType_0.None;
    v21._tools = {};
    for v24, v25 in v17 do
        local v26 = v25:new();
        v26:init(v22, v23);
        v26.setDisabledState = function(v27) --[[ Line: 70 ]]
            -- upvalues: l_Category_0 (ref), l_BuildSettings_0 (ref)
            local v28 = v27:hasError();
            if v27._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Disabled ~= v28 then
                v27._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Disabled = v28;
                v27.OnInternalsChanged:Fire();
            end;
        end;
        v21._tools[v24] = v26;
        v21._tools[v24]._overrides = {
            [l_Category_0.BuildSettings] = {
                [l_BuildSettings_0.Material] = {
                    Disabled = true, 
                    Schema = {
                        OnReset = function() --[[ Line: 84 ]] --[[ Name: OnReset ]]
                            -- upvalues: v21 (copy), l_Category_0 (ref), l_BuildSettings_0 (ref), l_deepCopy_0 (ref)
                            v21:saveForm({
                                [l_Category_0.BuildSettings] = {
                                    [l_BuildSettings_0.Material] = l_deepCopy_0(v21._tools[v21._terrainType]._configuration[1].Defaults[l_BuildSettings_0.Material])
                                }
                            });
                            v21.OnInternalsChanged:Fire();
                        end
                    }
                }, 
                [l_BuildSettings_0.Confirm] = {
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        CanConfirm = false, 
                        CanRegenerate = false, 
                        OnClick = function() --[[ Line: 103 ]] --[[ Name: OnClick ]]
                            -- upvalues: v21 (copy), v9 (ref), l_Category_0 (ref), l_BuildSettings_0 (ref), l_TerrainType_0 (ref)
                            if not v21._stamp then
                                return;
                            else
                                if v9() then
                                    v21._analytics:report("Usage", v21._terrainType, 1);
                                    local v29 = v21._stamp:getAverageFrameTime();
                                    if v29 then
                                        v21._analytics:report("Performance", v21._terrainType, v29);
                                    end;
                                end;
                                v21._stamp:commit();
                                v21._stamp = nil;
                                v21:finishRecording(Enum.FinishRecordingOperation.Append);
                                local v30 = v21._tools[v21._terrainType]:getPayload();
                                v21._previousTerrainType = v21._terrainType;
                                v21._previousTerrainTransform = v30[l_Category_0.BuildSettings][l_BuildSettings_0.Transform];
                                v21._previousTerrainSize = v30[l_Category_0.BuildSettings][l_BuildSettings_0.Size];
                                v21:saveForm({
                                    [l_Category_0.BuildSettings] = {
                                        [l_BuildSettings_0.TerrainType] = l_TerrainType_0.None
                                    }
                                });
                                v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanConfirm = false;
                                v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanRegenerate = true;
                                v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Material].Disabled = true;
                                v21._terrainType = l_TerrainType_0.None;
                                if v21._onUndoConnection then
                                    v21._onUndoConnection:Disconnect();
                                end;
                                v21._onUndoConnection = v21._services.ChangeHistoryService.OnUndo:Connect(function() --[[ Line: 143 ]]
                                    -- upvalues: v21 (ref), l_Category_0 (ref), l_BuildSettings_0 (ref)
                                    local l_Schema_0 = v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema;
                                    l_Schema_0.CanRegenerate = false;
                                    l_Schema_0.CanConfirm = false;
                                    v21.OnInternalsChanged:Fire();
                                end);
                                v21.OnInternalsChanged:Fire();
                                return;
                            end;
                        end, 
                        OnRegenerate = function() --[[ Line: 154 ]] --[[ Name: OnRegenerate ]]
                            -- upvalues: v21 (copy), l_Category_0 (ref), l_BuildSettings_0 (ref), v6 (ref), l_TerrainType_0 (ref)
                            if v21._previousTerrainType then
                                local v32 = v21:setTerrainType({
                                    [l_Category_0.BuildSettings] = {
                                        [l_BuildSettings_0.TerrainType] = v21._previousTerrainType
                                    }
                                });
                                v32[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] = false;
                                v32 = v21:setPlacementMode(v32);
                                v32[l_Category_0.BuildSettings][l_BuildSettings_0.Transform] = v21._previousTerrainTransform + v6() * v21._previousTerrainSize;
                                v21._tools[v21._terrainType]:saveForm(v32);
                                if v21._onUndoConnection then
                                    v21._onUndoConnection:Disconnect();
                                end;
                                v21._onUndoConnection = v21._services.ChangeHistoryService.OnUndo:Connect(function() --[[ Line: 174 ]]
                                    -- upvalues: v21 (ref), l_Category_0 (ref), l_BuildSettings_0 (ref), l_TerrainType_0 (ref)
                                    v21._stamp = nil;
                                    v21:saveForm({
                                        [l_Category_0.BuildSettings] = {
                                            [l_BuildSettings_0.TerrainType] = l_TerrainType_0.None
                                        }
                                    });
                                    local l_Schema_1 = v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema;
                                    l_Schema_1.CanRegenerate = false;
                                    l_Schema_1.CanConfirm = false;
                                    v21.OnInternalsChanged:Fire();
                                end);
                                local l_Schema_2 = v21._tools[v21._terrainType]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema;
                                l_Schema_2.CanRegenerate = false;
                                l_Schema_2.CanConfirm = true;
                                v21.OnInternalsChanged:Fire();
                                v21:createStamp();
                            end;
                        end
                    }
                }
            }
        };
    end;
end;
v20.form = function(v35) --[[ Line: 208 ]] --[[ Name: form ]]
    return v35._tools[v35._terrainType]:form();
end;
v20.setTerrainType = function(v36, v37) --[[ Line: 212 ]] --[[ Name: setTerrainType ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v38 = v37[l_Category_0.BuildSettings][l_BuildSettings_0.TerrainType];
    if not v38 then
        return v37;
    else
        v36:destroyStamp();
        if v36._onFormChangedForwarder then
            v36._onFormChangedForwarder:Disconnect();
        end;
        if v36._onGizmoChangedForwarder then
            v36._onGizmoChangedForwarder:Disconnect();
        end;
        if v36._onInternalsChangedForwarder then
            v36._onInternalsChangedForwarder:Disconnect();
        end;
        if v36._onUndoConnection then
            v36._onUndoConnection:Disconnect();
        end;
        v36._onFormChangedForwarder = v36._tools[v38].OnFormChanged:Connect(function() --[[ Line: 239 ]]
            -- upvalues: v36 (copy)
            v36.OnFormChanged:Fire();
        end);
        v36._onGizmoChangedForwarder = v36._tools[v38].OnGizmoChanged:Connect(function() --[[ Line: 243 ]]
            -- upvalues: v36 (copy)
            v36.OnGizmoChanged:Fire();
        end);
        v36._onInternalsChangedForwarder = v36._tools[v38].OnInternalsChanged:Connect(function() --[[ Line: 247 ]]
            -- upvalues: v36 (copy)
            v36.OnInternalsChanged:Fire();
        end);
        v36._tools[v38]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanRegenerate = false;
        v36._tools[v38]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Confirm].Schema.CanConfirm = false;
        v37[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] = true;
        v36._tools[v38]._overrides[l_Category_0.BuildSettings][l_BuildSettings_0.Material].Disabled = true;
        v36._terrainType = v38;
        return v37;
    end;
end;
v20.setMaterial = function(_, v40) --[[ Line: 262 ]] --[[ Name: setMaterial ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v4 (copy)
    local v41 = v40[l_Category_0.BuildSettings][l_BuildSettings_0.Material];
    if not v41 then
        return v40;
    else
        local v42 = v4.new(v41);
        v40[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT] = v42;
        return v40;
    end;
end;
v20.setPlacementMode = function(v43, v44) --[[ Line: 275 ]] --[[ Name: setPlacementMode ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v8 (copy)
    if v44[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] == nil then
        return v44;
    else
        if v43._onUndoConnection then
            v43._onUndoConnection:Disconnect();
        end;
        v43._onUndoConnection = v43._services.ChangeHistoryService.OnUndo:Connect(function() --[[ Line: 286 ]]
            -- upvalues: v43 (copy), l_Category_0 (ref), l_BuildSettings_0 (ref)
            v43._stamp = nil;
            v43:saveForm({
                [l_Category_0.BuildSettings] = {
                    [l_BuildSettings_0.PlacementMode] = true
                }
            });
        end);
        local v45 = v43._tools[v43._terrainType]:getPayload();
        v44[l_Category_0.BuildSettings][l_BuildSettings_0.Transform] = v8.Place(v45[l_Category_0.BuildSettings][l_BuildSettings_0.Transform], v45[l_Category_0.BuildSettings][l_BuildSettings_0.Size], v45[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength], v43._terrainType);
        return v44;
    end;
end;
v20.setTransform = function(v46, v47) --[[ Line: 307 ]] --[[ Name: setTransform ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v7 (copy), v5 (copy)
    local v48 = v47[l_Category_0.BuildSettings][l_BuildSettings_0.Transform];
    if not v48 then
        return v47;
    else
        local v49 = v46._tools[v46._terrainType]:getPayload();
        local v50, v51 = v7(v48, v47[l_Category_0.BuildSettings][l_BuildSettings_0.Size] or v49[l_Category_0.BuildSettings][l_BuildSettings_0.Size], v5.VoxelResolution);
        v47[l_Category_0.BuildSettings][l_BuildSettings_0.Transform] = v50;
        v47[l_Category_0.BuildSettings][l_BuildSettings_0.Size] = v51;
        return v47;
    end;
end;
v20.beginRecording = function(v52, v53) --[[ Line: 326 ]] --[[ Name: beginRecording ]]
    if v52._services.ChangeHistoryService:IsRecordingInProgress() then
        if v52._recording then
            v52._services.ChangeHistoryService:FinishRecording(v52._recording, Enum.FinishRecordingOperation.Append);
        else
            v52._services.ChangeHistoryService:FinishRecording("", Enum.FinishRecordingOperation.Cancel);
        end;
    end;
    v52._recording = v52._services.ChangeHistoryService:TryBeginRecording("TerrainPlacement", v53);
end;
v20.finishRecording = function(v54, v55) --[[ Line: 337 ]] --[[ Name: finishRecording ]]
    if v54._recording then
        v54._services.ChangeHistoryService:FinishRecording(v54._recording, v55);
        v54._recording = nil;
        return true;
    else
        return false;
    end;
end;
v20.saveForm = function(v56, v57) --[[ Line: 348 ]] --[[ Name: saveForm ]]
    -- upvalues: l_deepCopy_0 (copy)
    local v58 = v56:setMaterial((v56:setTerrainType((l_deepCopy_0(v57)))));
    v56._tools[v56._terrainType]:saveForm(v58);
    if v56._stamp then
        v56._stamp:update(v56._tools[v56._terrainType]:getPayload(), v58);
    end;
end;
v20.gizmos = function(v59) --[[ Line: 360 ]] --[[ Name: gizmos ]]
    -- upvalues: l_TerrainType_0 (copy), l_Gizmo_0 (copy), l_Category_0 (copy), l_BuildSettings_0 (copy)
    local _ = v59:getPayload();
    if v59._terrainType == l_TerrainType_0.None then
        return {};
    else
        local v61 = v59._tools[v59._terrainType]:gizmos();
        local v62 = {};
        for _, v64 in v61 do
            if v64.Id == l_Gizmo_0.Placement and v64.Value[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] then
                table.insert(v62, v64);
            elseif v64.Id == l_Gizmo_0.Region and not v64.Value[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] then
                table.insert(v62, v64);
            end;
        end;
        return v62;
    end;
end;
v20.saveGizmos = function(v65, v66) --[[ Line: 381 ]] --[[ Name: saveGizmos ]]
    -- upvalues: l_deepCopy_0 (copy)
    local v67 = v65:setTransform((v65:setPlacementMode((l_deepCopy_0(v66)))));
    v65._tools[v65._terrainType]:saveGizmos(v67);
    if v65._stamp then
        v65._stamp:update(v65._tools[v65._terrainType]:getPayload(), v67);
        return;
    else
        v65:createStamp();
        return;
    end;
end;
v20.activate = function(v68) --[[ Line: 395 ]] --[[ Name: activate ]]
    v68:saveForm((v68:getPayload()));
    v68._tools[v68._terrainType]:activate();
end;
v20.deactivate = function(v69) --[[ Line: 402 ]] --[[ Name: deactivate ]]
    v69._tools[v69._terrainType]:deactivate();
    if v69._onFormChangedForwarder then
        v69._onFormChangedForwarder:Disconnect();
    end;
    if v69._onGizmoChangedForwarder then
        v69._onGizmoChangedForwarder:Disconnect();
    end;
    if v69._onInternalsChangedForwarder then
        v69._onInternalsChangedForwarder:Disconnect();
    end;
    if v69._mouseDownConnection then
        v69._mouseDownConnection:Disconnect();
    end;
    if v69._onUndoConnection then
        v69._onUndoConnection:Disconnect();
    end;
    v69:destroyStamp();
    v69:finishRecording(Enum.FinishRecordingOperation.Append);
end;
v20.destroyStamp = function(v70) --[[ Line: 430 ]] --[[ Name: destroyStamp ]]
    if v70._stamp then
        v70._stamp:destroy();
        v70._stamp = nil;
    end;
end;
v20.createStamp = function(v71) --[[ Line: 437 ]] --[[ Name: createStamp ]]
    -- upvalues: l_TerrainType_0 (copy), l_Category_0 (copy), l_BuildSettings_0 (copy), v9 (copy), v18 (copy)
    local v72 = v71._tools[v71._terrainType]:getPayload();
    if v71._terrainType == l_TerrainType_0.None or v72[l_Category_0.BuildSettings][l_BuildSettings_0.PlacementMode] then
        return;
    else
        v71:destroyStamp();
        if not v72[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT] then
            v72 = v71:setMaterial(v72);
            v71._tools[v71._terrainType]:setPayload(v72);
        end;
        v71:beginRecording("Adjust");
        if v9() then
            v71._analytics:report("Activated", v71._terrainType, 1);
        end;
        v71._stamp = v18[v71._terrainType]:new(v71._terrainType);
        v71._stamp:init(v72, v71._services);
        v71._stamp:update(v72);
        v71:finishRecording(Enum.FinishRecordingOperation.Commit);
        v71:beginRecording("Adjust");
        local v73 = v71._tools[v71._terrainType]._overrides[l_Category_0.BuildSettings];
        v73[l_BuildSettings_0.Confirm].Schema.CanConfirm = true;
        v73[l_BuildSettings_0.Material].Disabled = false;
        v71.OnInternalsChanged:Fire();
        return;
    end;
end;
return v20;