local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_FillMode_0 = v2.FillMode;
local l_Gizmo_0 = v2.Gizmo;
local l_MaterialSettings_0 = v2.MaterialSettings;
local l_PluginAction_0 = v2.PluginAction;
local l_SelectionSettings_0 = v2.SelectionSettings;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local l_TransformMode_0 = v2.TransformMode;
local l_TransformSettings_0 = v2.TransformSettings;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v14 = require(l_Util_0.ConvertTransformToRegion);
local v15 = require(l_Util_0.Operations.FillOperation);
local v16 = require(l_Util_0.SettingsHelper);
local v17 = {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }
};
local v18 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = true, 
            Rotation = false
        }
    }
};
local v19 = v1:new(l_Tool_0.Select, l_Tab_0.Edit, v17, v18);
v19.fillAir = function(v20, v21) --[[ Line: 42 ]] --[[ Name: fillAir ]]
    -- upvalues: l_Category_0 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), l_SelectionSettings_0 (copy), v15 (copy)
    local v22 = v20:getPayload();
    v22 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Fill, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Air
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform]
        }
    };
    local v23 = v20._localization:getText("Operations", (("%*Name"):format(v21)));
    local v24 = v20._localization:getText("Operations", (("%*Description"):format(v21)));
    v20._operation = v15(v23, v24, v20._services);
    v20._operation:start({
        Payload = v22
    });
end;
v19.copy = function(v25) --[[ Line: 64 ]] --[[ Name: copy ]]
    -- upvalues: v16 (copy), l_Category_0 (copy), v14 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy)
    if v25:hasError() then
        return;
    else
        local v26 = v16.Get(l_Category_0.SelectionSettings, v25._pluginController, v25._persistentUserSettings);
        v25._analytics:report("Activated", "Copy");
        local v27 = v25._services.Terrain:CopyRegion(v14(v26[l_SelectionSettings_0.Transform], v26[l_SelectionSettings_0.Size], true));
        v16.Set(l_Category_0.TransformSettings, v25._pluginController, {
            [l_TransformSettings_0.TerrainRegionBuffer] = v27, 
            [l_TransformSettings_0.TerrainRegionBufferSize] = v26[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionBufferTransform] = v26[l_SelectionSettings_0.Transform]
        });
        return;
    end;
end;
v19.delete = function(v28) --[[ Line: 85 ]] --[[ Name: delete ]]
    if v28:hasError() then
        return;
    else
        v28._analytics:report("Activated", "Delete");
        v28:fillAir("Delete");
        return;
    end;
end;
v19.cut = function(v29) --[[ Line: 94 ]] --[[ Name: cut ]]
    -- upvalues: v16 (copy), l_Category_0 (copy), v14 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy)
    if v29:hasError() then
        return;
    else
        local v30 = v16.Get(l_Category_0.SelectionSettings, v29._pluginController, v29._persistentUserSettings);
        v29._analytics:report("Activated", "Cut");
        local v31 = v29._services.Terrain:CopyRegion(v14(v30[l_SelectionSettings_0.Transform], v30[l_SelectionSettings_0.Size], true));
        v29:fillAir("Cut");
        v16.Set(l_Category_0.TransformSettings, v29._pluginController, {
            [l_TransformSettings_0.TerrainRegionBuffer] = v31, 
            [l_TransformSettings_0.TerrainRegionBufferSize] = v30[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionBufferTransform] = v30[l_SelectionSettings_0.Transform]
        });
        return;
    end;
end;
v19.paste = function(v32) --[[ Line: 116 ]] --[[ Name: paste ]]
    -- upvalues: v16 (copy), l_Category_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), l_Tool_0 (copy)
    if v32:hasError() then
        return;
    else
        local v33 = v16.Get(l_Category_0.TransformSettings, v32._pluginController, v32._persistentUserSettings);
        v32._analytics:report("Activated", "Paste");
        if v33[l_TransformSettings_0.TerrainRegionBuffer] then
            v16.Set(l_Category_0.TransformSettings, v32._pluginController, {
                [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Paste
            });
            v32._toolController.selectTool(l_Tool_0.Transform);
        end;
        return;
    end;
end;
v19.duplicate = function(v34) --[[ Line: 133 ]] --[[ Name: duplicate ]]
    -- upvalues: v16 (copy), l_Category_0 (copy), v14 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), l_Tool_0 (copy)
    if v34:hasError() then
        return;
    else
        local v35 = v16.Get(l_Category_0.SelectionSettings, v34._pluginController, v34._persistentUserSettings);
        v34._analytics:report("Activated", "Duplicate");
        local v36 = v34._services.Terrain:CopyRegion(v14(v35[l_SelectionSettings_0.Transform], v35[l_SelectionSettings_0.Size], true));
        v16.Set(l_Category_0.TransformSettings, v34._pluginController, {
            [l_TransformSettings_0.TerrainRegion] = v36, 
            [l_TransformSettings_0.TerrainRegionSize] = v35[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionTransform] = v35[l_SelectionSettings_0.Transform], 
            [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Duplicate
        });
        v34._toolController.selectTool(l_Tool_0.Transform);
        return;
    end;
end;
v19.operation = function(v37) --[[ Line: 156 ]] --[[ Name: operation ]]
    return v37._operation;
end;
v19.activate = function(v38) --[[ Line: 160 ]] --[[ Name: activate ]]
    -- upvalues: v1 (copy), l_PluginAction_0 (copy), l_Tool_0 (copy)
    v1.activate(v38);
    v38._pluginActions = {
        [l_PluginAction_0.CopySelected] = function() --[[ Line: 163 ]]
            -- upvalues: v38 (copy)
            v38:copy();
        end, 
        [l_PluginAction_0.CutSelected] = function() --[[ Line: 166 ]]
            -- upvalues: v38 (copy)
            v38:cut();
        end, 
        [l_PluginAction_0.DeleteSelected] = function() --[[ Line: 169 ]]
            -- upvalues: v38 (copy)
            v38:delete();
        end, 
        [l_PluginAction_0.PasteSelected] = function() --[[ Line: 172 ]]
            -- upvalues: v38 (copy)
            v38:paste();
        end, 
        [l_PluginAction_0.DuplicateSelected] = function() --[[ Line: 175 ]]
            -- upvalues: v38 (copy)
            v38:duplicate();
        end
    };
    v38._connections = {};
    for v39, v40 in v38._pluginActions do
        v38._connections[v39] = v38._shortcutController:Connect(v39, v40);
        v38._shortcutController:Enable(v39);
    end;
    v38._selection = v38._services.Selection:Get() or {};
    v38._services.Selection:Set({});
    if not v38._onSelectionChanged then
        v38._onSelectionChanged = v38._services.Selection.SelectionChanged:Connect(function() --[[ Line: 189 ]]
            -- upvalues: v38 (copy)
            if v38._pluginController:getEnabled() then
                task.defer(function() --[[ Line: 191 ]]
                    -- upvalues: v38 (ref)
                    v38._services.Selection:Set({});
                end);
                return;
            else
                v38._selection = v38._services.Selection:Get() or {};
                return;
            end;
        end);
    end;
    v38._analytics:report("Activated", l_Tool_0.Select);
end;
v19.deactivate = function(v41) --[[ Line: 203 ]] --[[ Name: deactivate ]]
    -- upvalues: v1 (copy)
    if v41._onSelectionChanged then
        v41._onSelectionChanged:Disconnect();
        v41._onSelectionChanged = nil;
    end;
    v41._services.Selection:Set(v41._selection);
    v1.deactivate(v41);
    for v42 in v41._pluginActions do
        v41._shortcutController:Disable(v42);
    end;
    for _, v44 in v41._connections do
        v44:Disconnect();
    end;
    v41._connections = nil;
end;
return v19;