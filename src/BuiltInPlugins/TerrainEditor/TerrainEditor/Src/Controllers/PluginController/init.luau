local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v4.BrushSettings;
local l_BuildSettings_0 = v4.BuildSettings;
local l_Category_0 = v4.Category;
local l_PlaneLock_0 = v4.PlaneLock;
local l_SelectionSettings_0 = v4.SelectionSettings;
local l_Storage_0 = v4.Storage;
local l_TerrainType_0 = v4.TerrainType;
local l_TransformMode_0 = v4.TransformMode;
local l_TransformSettings_0 = v4.TransformSettings;
local l_Signal_0 = v2.Util.Signal;
local l_Serialization_0 = l_script_FirstAncestor_0.Src.Util.Serialization;
local v16 = require(l_Serialization_0.Serialize);
local v17 = require(l_Serialization_0.Deserialize);
local v18 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v20 = l_ContextItem_0:extend("PluginController");
local l_Workspace_0 = game:GetService("Workspace");
v20.new = function(v22, v23) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: l_Category_0 (copy), l_SelectionSettings_0 (copy), l_TransformSettings_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), v19 (copy), l_BuildSettings_0 (copy), l_TerrainType_0 (copy), l_TransformMode_0 (copy), l_Signal_0 (copy), v20 (copy), v18 (copy), v17 (copy), v1 (copy)
    if not v23 then
        assert(v22, "PluginController.new() requires a plugin");
    end;
    local v24 = setmetatable({
        _mock = v23, 
        _plugin = v22, 
        _store = {
            [l_Category_0.SelectionSettings] = {
                [l_SelectionSettings_0.Size] = Vector3.new(64, 32, 64, 0), 
                [l_SelectionSettings_0.SnapToVoxels] = true, 
                [l_SelectionSettings_0.Transform] = CFrame.new()
            }, 
            [l_Category_0.TransformSettings] = {
                [l_TransformSettings_0.Size] = Vector3.new(64, 32, 64, 0), 
                [l_TransformSettings_0.SnapToVoxels] = true, 
                [l_TransformSettings_0.Transform] = CFrame.new()
            }, 
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.ManualPlaneLock] = false, 
                [l_BrushSettings_0.PlaneLock] = l_PlaneLock_0.Off, 
                [l_BrushSettings_0.PlaneTransform] = CFrame.Angles(1.5707963267948966, 0, 0)
            }
        }, 
        _session = {
            [l_Category_0.BuildSettings] = if v19() then {
                [l_BuildSettings_0.TerrainType] = l_TerrainType_0.None
            } else nil, 
            [l_Category_0.BrushSettings] = {}, 
            [l_Category_0.SelectionSettings] = {}, 
            [l_Category_0.TransformSettings] = {
                [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Move
            }
        }, 
        Activation = l_Signal_0.new(), 
        Compact = l_Signal_0.new(), 
        Focused = l_Signal_0.new(), 
        PluginWidth = l_Signal_0.new()
    }, v20);
    if not v18.IsDebuggingSavedSettings then
        local v25 = v17(v24._plugin:GetSetting("Global") or {});
        v24._store = v1.join(v24._store, v25);
    end;
    v24._deactivationListener = v24._plugin.Deactivation:Connect(function() --[[ Line: 85 ]]
        -- upvalues: v24 (copy)
        v24.Activation:Fire(false);
        v24._enabled = false;
    end);
    return v24;
end;
v20.mock = function(v26) --[[ Line: 93 ]] --[[ Name: mock ]]
    -- upvalues: v20 (copy)
    return v20.new(v26, true);
end;
v20.isMocking = function(v27) --[[ Line: 97 ]] --[[ Name: isMocking ]]
    return v27._mock;
end;
v20.getPlugin = function(v28) --[[ Line: 101 ]] --[[ Name: getPlugin ]]
    return v28._plugin;
end;
v20.getEnabled = function(v29) --[[ Line: 105 ]] --[[ Name: getEnabled ]]
    return v29._enabled;
end;
v20.setGlobal = function(v30, v31, v32, v33, v34) --[[ Line: 109 ]] --[[ Name: setGlobal ]]
    -- upvalues: l_Storage_0 (copy), l_BrushSettings_0 (copy), l_PlaneLock_0 (copy), l_Workspace_0 (copy), v16 (copy)
    local v35 = if v34 == l_Storage_0.GlobalPersistent then v30._store else v30._session;
    v35[v31][v32] = v33;
    if v34 == l_Storage_0.GlobalPersistent then
        if v32 == l_BrushSettings_0.PlaneLock and v33 == l_PlaneLock_0.Manual then
            local l_CFrame_0 = l_Workspace_0.CurrentCamera.CFrame;
            local v37 = CFrame.Angles(1.5707963267948966, 0, 0);
            local v38 = l_CFrame_0.Position + l_CFrame_0.LookVector * 64;
            v35[v31][l_BrushSettings_0.PlaneTransform] = v37 + v38;
        end;
        if v30._saveSettingsTask then
            task.cancel(v30._saveSettingsTask);
            v30._saveSettingsTask = nil;
        end;
        v30._saveSettingsTask = task.delay(1, function() --[[ Line: 126 ]]
            -- upvalues: v30 (copy), v16 (ref)
            v30._plugin:SetSetting("Global", v16(v30._store));
            v30._saveSettingsTask = nil;
        end);
    end;
end;
v20.getGlobal = function(v39, v40, v41, v42) --[[ Line: 133 ]] --[[ Name: getGlobal ]]
    -- upvalues: l_Storage_0 (copy)
    return (if v42 == l_Storage_0.GlobalPersistent then v39._store else v39._session)[v40][v41];
end;
v20.setSetting = function(v43, v44, v45) --[[ Line: 139 ]] --[[ Name: setSetting ]]
    -- upvalues: v16 (copy)
    v43._plugin:SetSetting(v44, v16(v45));
end;
v20.getSetting = function(v46, v47) --[[ Line: 143 ]] --[[ Name: getSetting ]]
    -- upvalues: v17 (copy)
    return v17(v46._plugin:GetSetting(v47) or {});
end;
v20.toggle = function(v48) --[[ Line: 147 ]] --[[ Name: toggle ]]
    if v48._enabled then
        v48:disable();
        return;
    else
        v48:enable();
        return;
    end;
end;
v20.enable = function(v49) --[[ Line: 155 ]] --[[ Name: enable ]]
    if v49._enabled then
        return;
    else
        v49._enabled = true;
        v49._plugin:Activate(true);
        return;
    end;
end;
v20.disable = function(v50) --[[ Line: 165 ]] --[[ Name: disable ]]
    if not v50._enabled then
        return;
    else
        v50._enabled = false;
        v50._plugin:Deactivate();
        return;
    end;
end;
v20.resume = function(v51) --[[ Line: 175 ]] --[[ Name: resume ]]
    v51.Focused:Fire(true);
    v51.Activation:Fire(true);
end;
v20.pause = function(v52) --[[ Line: 180 ]] --[[ Name: pause ]]
    v52.Focused:Fire(false);
end;
v20.destroy = function(v53) --[[ Line: 184 ]] --[[ Name: destroy ]]
    if v53._deactivationListener then
        v53._deactivationListener:Disconnect();
        v53._deactivationListener = nil;
    end;
    v53:disable();
end;
v20.setRoot = function(v54, v55) --[[ Line: 193 ]] --[[ Name: setRoot ]]
    v54._root = v55;
end;
v20.getRoot = function(v56) --[[ Line: 197 ]] --[[ Name: getRoot ]]
    return v56._root;
end;
v20.setPluginWidth = function(v57, v58) --[[ Line: 201 ]] --[[ Name: setPluginWidth ]]
    local v59 = v57:getShouldBeCompact();
    local l__pluginWidth_0 = v57._pluginWidth;
    v57._pluginWidth = v58;
    if l__pluginWidth_0 ~= v58 then
        v57.PluginWidth:Fire(v58);
    end;
    if v59 ~= v57:getShouldBeCompact() then
        v57.Compact:Fire();
    end;
end;
v20.getPluginWidth = function(v61) --[[ Line: 216 ]] --[[ Name: getPluginWidth ]]
    return v61._pluginWidth;
end;
v20.getShouldBeCompact = function(v62) --[[ Line: 220 ]] --[[ Name: getShouldBeCompact ]]
    -- upvalues: v18 (copy)
    if v62._pluginWidth then
        return v62._pluginWidth < v18.MinWindowWidth;
    else
        return false;
    end;
end;
return v20;