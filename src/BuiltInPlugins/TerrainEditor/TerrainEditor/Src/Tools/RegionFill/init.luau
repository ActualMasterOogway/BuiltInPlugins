local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_FillMode_0 = v3.FillMode;
local l_Gizmo_0 = v3.Gizmo;
local l_MaterialSettings_0 = v3.MaterialSettings;
local l_Tab_0 = v3.Tab;
local l_Tool_0 = v3.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.Operations.FillOperation);
local v12 = {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Fill, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Grass, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Grass
        }, 
        Id = l_Category_0.MaterialSettings
    }
};
local v13 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }
};
local v14 = v2:new(l_Tool_0.Fill, l_Tab_0.Edit, v12, v13);
v14.startOperation = function(v15, v16) --[[ Line: 46 ]] --[[ Name: startOperation ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_MaterialSettings_0 (copy), l_FillMode_0 (copy), v11 (copy), v1 (copy)
    v2.startOperation(v15, v16);
    local v17 = v15:getPayload();
    local v18 = if v17[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode] == l_FillMode_0.Fill then v15._localization:getText("Operations", "FillDescription", {
        material = v15._localization:getText("Materials", v17[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial].Name)
    }) else v15._localization:getText("Operations", "ReplaceDescription", {
        source = v15._localization:getText("Materials", v17[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial].Name), 
        target = v15._localization:getText("Materials", v17[l_Category_0.MaterialSettings][l_MaterialSettings_0.TargetMaterial].Name)
    });
    v15._operation = v11(v15._localization:getText("Operations", (("%*Name"):format(v17[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode]))), v18, v15._services);
    v15._operationFinishedConnection = v15._operation.Finished:Connect(function() --[[ Line: 73 ]]
        -- upvalues: v15 (copy)
        v15:finishOperation();
    end);
    v15._operation:start(v1.join({
        Payload = v17
    }, v16));
    v15.OnOperationChanged:Fire();
end;
v14.setDisabledState = function(v19) --[[ Line: 83 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_MaterialSettings_0 (copy)
    local v20 = v19:hasError();
    if v19._overrides[l_Category_0.MaterialSettings][l_MaterialSettings_0.Apply].Disabled ~= v20 then
        v19._overrides[l_Category_0.MaterialSettings][l_MaterialSettings_0.Apply].Disabled = v20;
        v19.OnInternalsChanged:Fire();
    end;
end;
v14.init = function(v21, v22, v23) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_MaterialSettings_0 (copy)
    v2.init(v21, v22, v23);
    v21._overrides = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.Apply] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 101 ]] --[[ Name: OnClick ]]
                        -- upvalues: v21 (copy)
                        v21:startOperation();
                    end
                }, 
                Value = true
            }
        }, 
        [l_MaterialSettings_0.SourceMaterial] = {
            Schema = {
                AllowAir = true
            }
        }, 
        [l_MaterialSettings_0.TargetMaterial] = {
            Schema = {
                AllowAir = true
            }
        }
    };
end;
v14.operation = function(v24) --[[ Line: 121 ]] --[[ Name: operation ]]
    return v24._operation;
end;
v14.activate = function(v25) --[[ Line: 125 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Tool_0 (copy)
    v2.activate(v25);
    v25._analytics:report("Activated", l_Tool_0.Fill);
end;
return v14;