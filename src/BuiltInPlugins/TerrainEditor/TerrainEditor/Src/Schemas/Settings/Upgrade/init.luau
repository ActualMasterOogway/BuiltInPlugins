local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Storage_0 = v2.Storage;
local l_UpgradeSettings_0 = v2.UpgradeSettings;
local l_UpgradeSettings_1 = l_Category_0.UpgradeSettings;
local l_game_FastString_0 = game:GetFastString("Shorelines_LearnMoreUrl");
local l_game_FastString_1 = game:GetFastString("SmoothVoxels_LearnMoreUrl");
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagSmoothVoxels_Tooling);
return {
    Storage = {
        [l_UpgradeSettings_0.Shorelines] = l_Storage_0.LocalSession, 
        [l_UpgradeSettings_0.SmoothVoxels] = if v9() then l_Storage_0.LocalSession else nil
    }, 
    Generator = function(v10, v11, _, v13) --[[ Line: 23 ]] --[[ Name: Generator ]]
        -- upvalues: l_UpgradeSettings_0 (copy), l_game_FastString_0 (copy), v9 (copy), l_game_FastString_1 (copy), v1 (copy), l_UpgradeSettings_1 (copy)
        local v14 = {
            {
                Id = l_UpgradeSettings_0.Shorelines, 
                Schema = {
                    Id = l_UpgradeSettings_0.Shorelines, 
                    Type = "Upgrade", 
                    URL = l_game_FastString_0
                }
            }
        };
        if v9() then
            table.insert(v14, {
                Id = l_UpgradeSettings_0.SmoothVoxels, 
                Schema = {
                    Id = l_UpgradeSettings_0.SmoothVoxels, 
                    Type = "Upgrade", 
                    URL = l_game_FastString_1
                }
            });
        end;
        return v1(v10, v14, {
            Category = l_UpgradeSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};