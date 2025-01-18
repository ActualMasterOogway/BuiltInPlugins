local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Operations.GenerateOperation);
local v7 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local l_Biome_0 = v8.Biome;
local l_BiomeSettings_0 = v8.BiomeSettings;
local l_Category_0 = v8.Category;
local l_Gizmo_0 = v8.Gizmo;
local l_SelectionSettings_0 = v8.SelectionSettings;
local l_Tab_0 = v8.Tab;
local l_Tool_0 = v8.Tool;
local v16 = {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_BiomeSettings_0.Biomes] = {
                [l_Biome_0.Mountains] = true, 
                [l_Biome_0.Hills] = true, 
                [l_Biome_0.Plains] = true
            }, 
            [l_BiomeSettings_0.BiomeBlending] = 0.25, 
            [l_BiomeSettings_0.BiomeSize] = 100, 
            [l_BiomeSettings_0.Caves] = true, 
            [l_BiomeSettings_0.Seed] = 618033988
        }, 
        Id = l_Category_0.BiomeSettings
    }
};
local v17 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }
};
local v18 = v2:new(l_Tool_0.Generate, l_Tab_0.Create, v16, v17);
v18.startOperation = function(v19, v20) --[[ Line: 59 ]] --[[ Name: startOperation ]]
    -- upvalues: v2 (copy), v4 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), v6 (copy), v1 (copy)
    v2.startOperation(v19, v20);
    local v21 = v19:getPayload();
    local v22 = v19._localization:getText("Operations", "GenerateName");
    local v23 = v19._localization:getText("Operations", "GenerateDescription");
    v19._region = v4(v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform], v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], true);
    v19._terrainRegion = v19._services.Terrain:CopyRegion(v19._region);
    v19._operation = v6(v22, v23, v19._services);
    v19._operationFinishedConnection = v19._operation.Finished:Connect(function() --[[ Line: 75 ]]
        -- upvalues: v19 (copy)
        v19:finishOperation();
    end);
    v19._operation:start(v1.join({
        Payload = v21
    }, v20));
    v19.OnOperationChanged:Fire();
end;
v18.setDisabledState = function(v24) --[[ Line: 85 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_BiomeSettings_0 (copy)
    local v25 = v24:hasError();
    if v24._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled ~= v25 then
        v24._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled = v25;
        v24.OnInternalsChanged:Fire();
    end;
end;
v18.init = function(v26, v27, v28) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), v7 (copy), v5 (copy), l_BiomeSettings_0 (copy)
    v2.init(v26, v27, v28);
    v26._overrides = {
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = {
                Validate = function(v29) --[[ Line: 100 ]] --[[ Name: Validate ]]
                    -- upvalues: v7 (ref), v26 (copy), v5 (ref)
                    if v7(v29) then
                        return Enum.PropertyStatus.Error, v26._localization:getText("SelectionWarning", "NaN");
                    elseif v29.X < v5.VoxelResolution or v29.Y < v5.VoxelResolution or v29.Z < v5.VoxelResolution then
                        return Enum.PropertyStatus.Error, v26._localization:getText("SelectionWarning", "Size");
                    elseif v29.X * v29.Y * v29.Z > v5.MaxImportVolume then
                        return Enum.PropertyStatus.Error, v26._localization:getText("ImportWarning", "Volume");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }
        }, 
        [l_Category_0.BiomeSettings] = {
            [l_BiomeSettings_0.Generate] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 126 ]] --[[ Name: OnClick ]]
                        -- upvalues: v26 (copy)
                        v26:startOperation();
                    end
                }, 
                Value = true
            }
        }
    };
end;
v18.saveForm = function(v30, v31) --[[ Line: 136 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v30, v31);
end;
v18.operation = function(v32) --[[ Line: 140 ]] --[[ Name: operation ]]
    return v32._operation;
end;
v18.activate = function(v33) --[[ Line: 144 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Tool_0 (copy)
    v2.activate(v33);
    v33._analytics:report("Activated", l_Tool_0.Generate);
end;
return v18;