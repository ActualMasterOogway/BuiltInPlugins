local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.ConvertTransformToRegion);
local v5 = require(l_Util_0.hasCorrectAspectRatio);
local v6 = require(l_Util_0.hasCorrectScaling);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Operations.ImportOperation);
local v8 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
local v9 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v10.Category;
local l_Gizmo_0 = v10.Gizmo;
local l_HeightmapSettings_0 = v10.HeightmapSettings;
local l_SelectionSettings_0 = v10.SelectionSettings;
local l_Tab_0 = v10.Tab;
local l_Tool_0 = v10.Tool;
local v17 = {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_HeightmapSettings_0.Colormap] = {
                Error = ""
            }, 
            [l_HeightmapSettings_0.DefaultMaterial] = Enum.Material.Grass, 
            [l_HeightmapSettings_0.Heightmap] = {
                Error = ""
            }, 
            [l_HeightmapSettings_0.Import] = true
        }, 
        Id = l_Category_0.HeightmapSettings
    }
};
local v18 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }
};
local v19 = v2:new(l_Tool_0.Import, l_Tab_0.Create, v17, v18);
v19.startOperation = function(v20, v21) --[[ Line: 59 ]] --[[ Name: startOperation ]]
    -- upvalues: v2 (copy), v4 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), v7 (copy), v1 (copy)
    v2.startOperation(v20, v21);
    local v22 = v20:getPayload();
    local v23 = v20._localization:getText("Operations", "ImportName");
    local v24 = v20._localization:getText("Operations", "ImportDescription");
    v20._region = v4(v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform], v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], true);
    v20._terrainRegion = v20._services.Terrain:CopyRegion(v20._region);
    v20._operation = v7(v23, v24, v20._services);
    v20._operationFinishedConnection = v20._operation.Finished:Connect(function() --[[ Line: 75 ]]
        -- upvalues: v20 (copy)
        v20:finishOperation();
    end);
    v20._operation:start(v1.join({
        Payload = v22
    }, v21));
    v20.OnOperationChanged:Fire();
end;
v19.init = function(v25, v26, v27) --[[ Line: 85 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), v8 (copy), v9 (copy), l_HeightmapSettings_0 (copy), v5 (copy), v6 (copy)
    v2.init(v25, v26, v27);
    local _ = v25:getPayload()[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
    v25._overrides = {
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = {
                Validate = function(v29) --[[ Line: 95 ]] --[[ Name: Validate ]]
                    -- upvalues: v8 (ref), v25 (copy), v9 (ref), l_Category_0 (ref), l_HeightmapSettings_0 (ref), v5 (ref), v6 (ref)
                    if v8(v29) then
                        return Enum.PropertyStatus.Error, v25._localization:getText("SelectionWarning", "NaN");
                    elseif v29.X < v9.VoxelResolution or v29.Y < v9.VoxelResolution or v29.Z < v9.VoxelResolution then
                        return Enum.PropertyStatus.Error, v25._localization:getText("SelectionWarning", "Size");
                    elseif v29.X * v29.Y * v29.Z > v9.MaxImportVolume then
                        return Enum.PropertyStatus.Error, v25._localization:getText("ImportWarning", "Volume");
                    else
                        local l_Image_0 = v25._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image;
                        if not l_Image_0 then
                            return Enum.PropertyStatus.Ok, "";
                        else
                            local v31, v32 = v5(l_Image_0, v29);
                            if not v31 then
                                return Enum.PropertyStatus.Warning, v25._localization:getText("ImportWarning", "AspectRatio", {
                                    ImageAspectRatio = v32, 
                                    RegionWidth = v29.X, 
                                    RegionHeight = v29.Z
                                });
                            elseif not v6(l_Image_0, v29) then
                                return Enum.PropertyStatus.Warning, v25._localization:getText("ImportWarning", "Scaling", {
                                    ImageWidth = l_Image_0.Width, 
                                    ImageHeight = l_Image_0.Height, 
                                    RegionWidth = v29.X, 
                                    RegionHeight = v29.Z
                                });
                            else
                                return Enum.PropertyStatus.Ok, "";
                            end;
                        end;
                    end;
                end
            }
        }, 
        [l_Category_0.HeightmapSettings] = {
            [l_HeightmapSettings_0.Import] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function() --[[ Line: 149 ]] --[[ Name: OnClick ]]
                        -- upvalues: v25 (copy)
                        v25:startOperation();
                    end
                }
            }
        }
    };
end;
v19.operation = function(v33) --[[ Line: 158 ]] --[[ Name: operation ]]
    return v33._operation;
end;
v19.setDisabledState = function(v34) --[[ Line: 162 ]] --[[ Name: setDisabledState ]]
    -- upvalues: l_Category_0 (copy), l_HeightmapSettings_0 (copy)
    local v35 = v34:hasError();
    if v34._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled ~= v35 then
        v34._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled = v35;
        v34.OnInternalsChanged:Fire();
    end;
end;
v19.saveForm = function(v36, v37) --[[ Line: 171 ]] --[[ Name: saveForm ]]
    -- upvalues: v2 (copy)
    v2.saveForm(v36, v37);
    v36:setDisabledState();
end;
v19.activate = function(v38) --[[ Line: 177 ]] --[[ Name: activate ]]
    -- upvalues: v2 (copy), l_Category_0 (copy), l_SelectionSettings_0 (copy), l_HeightmapSettings_0 (copy), v9 (copy), l_Tool_0 (copy)
    v2.activate(v38);
    local v39 = v38:getPayload()[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
    v38._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled = not v38._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image or v39.X * v39.Y * v39.Z > v9.MaxImportVolume or v39.X < v9.VoxelResolution or v39.Y < v9.VoxelResolution or v39.Z < v9.VoxelResolution;
    v38.OnGizmoChanged:Fire();
    v38._analytics:report("Activated", l_Tool_0.Import);
end;
return v19;