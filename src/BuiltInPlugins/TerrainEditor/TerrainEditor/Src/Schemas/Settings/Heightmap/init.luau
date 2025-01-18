local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_Category_0 = v1.Category;
local l_HeightmapSettings_0 = v1.HeightmapSettings;
local l_ImageType_0 = v1.ImageType;
local l_Storage_0 = v1.Storage;
local l_HeightmapSettings_1 = l_Category_0.HeightmapSettings;
return {
    Storage = {
        [l_HeightmapSettings_0.Colormap] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.Heightmap] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.Import] = l_Storage_0.LocalSession, 
        [l_HeightmapSettings_0.DefaultMaterial] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v8, v9, _, v11) --[[ Line: 21 ]] --[[ Name: Generator ]]
        -- upvalues: v2 (copy), l_HeightmapSettings_0 (copy), l_ImageType_0 (copy), l_HeightmapSettings_1 (copy)
        local l_Localization_0 = v8.Localization;
        return v2(v8, {
            {
                Id = l_HeightmapSettings_0.Heightmap, 
                Schema = {
                    ImageType = l_ImageType_0.Heightmap, 
                    Type = "Image"
                }, 
                Validate = function(v13) --[[ Line: 38 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Localization_0 (copy)
                    if v13.Error ~= "" then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("ImportWarning", "FailedImport", {
                            Error = v13.Error
                        });
                    else
                        if v13.Image then
                            if v13.Image.ChannelInfo.DiscardedChannels then
                                return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "DiscardedChannels");
                            elseif v13.Image.Preview.Error then
                                return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "FailedPreview", {
                                    Error = v13.Image.Preview.Error
                                });
                            end;
                        end;
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_HeightmapSettings_0.Colormap, 
                Schema = {
                    ImageType = l_ImageType_0.Colormap, 
                    Type = "Image"
                }, 
                Validate = function(v14) --[[ Line: 64 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Localization_0 (copy)
                    if v14.Error ~= "" then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("ImportWarning", "FailedImport", {
                            Error = v14.Error
                        });
                    elseif v14.Image and v14.Image.Preview.Error then
                        return Enum.PropertyStatus.Warning, l_Localization_0:getText("ImportWarning", "FailedPreview", {
                            Error = v14.Image.Preview.Error
                        });
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_HeightmapSettings_0.DefaultMaterial, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    AllowAir = false, 
                    Type = "Material"
                }
            }, 
            {
                Disabled = not v9[l_HeightmapSettings_0.Heightmap] or not v9[l_HeightmapSettings_0.Heightmap].Image, 
                Id = l_HeightmapSettings_0.Import, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_HeightmapSettings_1, l_HeightmapSettings_0.Import), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_HeightmapSettings_1, 
            Data = v9, 
            Overrides = v11
        });
    end
};