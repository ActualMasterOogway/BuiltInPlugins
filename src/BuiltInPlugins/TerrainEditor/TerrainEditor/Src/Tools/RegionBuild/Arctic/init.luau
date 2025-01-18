local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_Gizmo_0 = v2.Gizmo;
local l_MaterialUnit_0 = v2.MaterialUnit;
local l_Tab_0 = v2.Tab;
local l_TerrainType_0 = v2.TerrainType;
local v9 = {
    {
        Defaults = {
            [l_BuildSettings_0.AdvancedNoise] = {
                Children = {
                    [l_BuildSettings_0.Offset] = Vector2.new(0, 0), 
                    [l_BuildSettings_0.Rotation] = 0, 
                    [l_BuildSettings_0.Seed] = 0.123
                }
            }, 
            [l_BuildSettings_0.NoiseStrength] = 0.3, 
            [l_BuildSettings_0.BlendingEdge] = nil, 
            [l_BuildSettings_0.NoiseScale] = 0.3, 
            [l_BuildSettings_0.Material] = {
                Unit = l_MaterialUnit_0.Percentage, 
                FallbackMaterial = Enum.Material.Ice, 
                Min = 0, 
                Max = 1, 
                MaterialIndex = 1, 
                MaterialList = {
                    {
                        Material = Enum.Material.Snow, 
                        MinHeight = 0, 
                        MaxHeight = 1, 
                        MinSlope = 0, 
                        MaxSlope = 15, 
                        Priority = 0
                    }, 
                    {
                        Material = Enum.Material.Ice, 
                        MinHeight = 0, 
                        MaxHeight = 1, 
                        MinSlope = 0, 
                        MaxSlope = 90, 
                        Priority = 1
                    }
                }
            }, 
            [l_BuildSettings_0.PlacementMode] = true, 
            [l_BuildSettings_0.Size] = Vector3.new(512, 128, 512, 0), 
            [l_BuildSettings_0.SnapToVoxels] = true, 
            [l_BuildSettings_0.Transform] = CFrame.new()
        }, 
        Id = l_Category_0.BuildSettings
    }
};
local v10 = {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }, 
    {
        Id = l_Gizmo_0.Placement, 
        Schema = {
            Type = l_Gizmo_0.Placement
        }
    }
};
return (v1:new(l_TerrainType_0.Arctic, l_Tab_0.None, v9, v10));