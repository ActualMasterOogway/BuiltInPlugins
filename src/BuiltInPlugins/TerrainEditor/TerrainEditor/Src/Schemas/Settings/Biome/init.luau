local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Biome_0 = v2.Biome;
local l_BiomeSettings_0 = v2.BiomeSettings;
local l_Storage_0 = v2.Storage;
local l_BiomeSettings_1 = l_Category_0.BiomeSettings;
return {
    Storage = {
        [l_BiomeSettings_0.Biomes] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.BiomeBlending] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.BiomeSize] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Caves] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Seed] = l_Storage_0.LocalPersistent, 
        [l_BiomeSettings_0.Generate] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v8, v9, _, v11) --[[ Line: 24 ]] --[[ Name: Generator ]]
        -- upvalues: l_Biome_0 (copy), v1 (copy), l_BiomeSettings_0 (copy), l_BiomeSettings_1 (copy)
        local l_Localization_0 = v8.Localization;
        local v13 = {};
        for v14, _ in l_Biome_0 do
            v13[v14] = l_Localization_0:getText("Biomes", v14);
        end;
        return v1(v8, {
            {
                Id = l_BiomeSettings_0.Biomes, 
                Schema = {
                    Items = l_Biome_0, 
                    Labels = v13, 
                    Type = "MultiSelection"
                }, 
                Validate = function(v16) --[[ Line: 47 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Localization_0 (copy)
                    local v17 = false;
                    for _, v19 in v16 do
                        v17 = v17 or v19;
                    end;
                    if not v17 then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("BiomeWarning", "NoBiomesSelected");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.BiomeBlending, 
                Schema = {
                    Type = "Slider", 
                    Min = 0, 
                    Max = 1, 
                    ShowInput = true, 
                    SnapIncrement = 0.001
                }
            }, 
            {
                Id = l_BiomeSettings_0.Caves, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_BiomeSettings_0.BiomeSize, 
                Schema = {
                    Type = "Number"
                }, 
                Validate = function(v20) --[[ Line: 82 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Localization_0 (copy)
                    local v21 = tonumber(v20);
                    if not v21 then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "InvalidNumber");
                    elseif v21 <= 0 then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "Minimum");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.Seed, 
                Schema = {
                    Type = "Number"
                }, 
                Validate = function(v22) --[[ Line: 101 ]] --[[ Name: Validate ]]
                    -- upvalues: l_Localization_0 (copy)
                    if not tonumber(v22) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "InvalidNumber");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                Id = l_BiomeSettings_0.Generate, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_BiomeSettings_1, l_BiomeSettings_0.Generate), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_BiomeSettings_1, 
            Data = v9, 
            Overrides = v11
        });
    end
};