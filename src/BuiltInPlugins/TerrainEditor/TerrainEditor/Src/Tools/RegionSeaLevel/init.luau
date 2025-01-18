local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_FillMode_0 = v3.FillMode;
local l_Gizmo_0 = v3.Gizmo;
local l_MaterialSettings_0 = v3.MaterialSettings;
local l_SeaLevelSettings_0 = v3.SeaLevelSettings;
local l_SelectionSettings_0 = v3.SelectionSettings;
local l_Tab_0 = v3.Tab;
local l_Tool_0 = v3.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v13 = require(l_Util_0.Operations.FillOperation);
local v14 = {
    {
        Defaults = {
            [l_SeaLevelSettings_0.Size] = Vector3.new(64, 32, 64, 0), 
            [l_SeaLevelSettings_0.SnapToVoxels] = true, 
            [l_SeaLevelSettings_0.Transform] = CFrame.new()
        }, 
        Id = l_Category_0.SeaLevelSettings
    }
};
local v15 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }
};
local v16 = v2:new(l_Tool_0.SeaLevel, l_Tab_0.Edit, v14, v15);
v16.startOperation = function(v17, v18) --[[ Line: 44 ]] --[[ Name: startOperation ]]
    -- upvalues: v2 (copy)
    v2.startOperation(v17, v18);
    v17._operation:start(v18);
    v17.OnOperationChanged:Fire();
end;
v16.create = function(v19, v20) --[[ Line: 51 ]] --[[ Name: create ]]
    -- upvalues: l_Category_0 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), l_SelectionSettings_0 (copy), l_SeaLevelSettings_0 (copy), v13 (copy), v1 (copy)
    local v21 = v19:getPayload();
    v21 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Replace, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Air, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Water
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v21[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v21[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform]
        }
    };
    local v22 = v19._localization:getText("Operations", "CreateName");
    local v23 = v19._localization:getText("Operations", "CreateDescription");
    v19._operation = v13(v22, v23, v19._services);
    v19._operationFinishedConnection = v19._operation.Finished:Connect(function() --[[ Line: 69 ]]
        -- upvalues: v19 (copy)
        v19:finishOperation();
    end);
    v19:startOperation(v1.join({
        Payload = v21
    }, v20));
end;
v16.evaporate = function(v24, v25) --[[ Line: 78 ]] --[[ Name: evaporate ]]
    -- upvalues: l_Category_0 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), l_SelectionSettings_0 (copy), l_SeaLevelSettings_0 (copy), v13 (copy), v1 (copy)
    local v26 = v24:getPayload();
    v26 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Replace, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Water, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Air
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v26[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v26[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform]
        }
    };
    local v27 = v24._localization:getText("Operations", "EvaporateName");
    local v28 = v24._localization:getText("Operations", "EvaporateDescription");
    v24._operation = v13(v27, v28, v24._services);
    v24._operationFinishedConnection = v24._operation.Finished:Connect(function() --[[ Line: 96 ]]
        -- upvalues: v24 (copy)
        v24:finishOperation();
    end);
    v24:startOperation(v1.join({
        Payload = v26
    }, v25));
end;
v16.init = function(v29, v30, v31) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_SeaLevelSettings_0 (copy)
    v2.init(v29, v30, v31);
    v29._overrides = {
        [l_Category_0.SeaLevelSettings] = {
            [l_SeaLevelSettings_0.Evaporate] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 114 ]] --[[ Name: OnClick ]]
                        -- upvalues: v29 (copy)
                        v29:evaporate();
                    end
                }, 
                Value = true
            }, 
            [l_SeaLevelSettings_0.Create] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 124 ]] --[[ Name: OnClick ]]
                        -- upvalues: v29 (copy)
                        v29:create();
                    end
                }, 
                Value = true
            }
        }
    };
end;
v16.setDisabledState = function(v32) --[[ Line: 134 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_SeaLevelSettings_0 (copy)
    local v33 = v32:hasError();
    if v32._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Evaporate].Disabled ~= v33 and v32._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Create].Disabled ~= v33 then
        v32._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Evaporate].Disabled = v33;
        v32._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Create].Disabled = v33;
        v32.OnInternalsChanged:Fire();
    end;
end;
v16.operation = function(v34) --[[ Line: 147 ]] --[[ Name: operation ]]
    return v34._operation;
end;
v16.activate = function(v35) --[[ Line: 151 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Tool_0 (copy)
    v2.activate(v35);
    v35._analytics:report("Activated", l_Tool_0.SeaLevel);
end;
return v16;