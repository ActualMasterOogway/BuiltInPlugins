local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_BuildSettings_0 = v2.BuildSettings;
local l_Storage_0 = v2.Storage;
local l_TerrainType_0 = v2.TerrainType;
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v9 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
local l_BuildSettings_1 = l_Category_0.BuildSettings;
local v11 = {
    Storage = {
        [l_BuildSettings_0.AdvancedNoise] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.NoiseStrength] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.BankSize] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.BlendingEdge] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.CliffSlope] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Confirm] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.CraterDepth] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.CraterRadius] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.FillBottom] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Material] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.MaterialLUT] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.NoiseScale] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Offset] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.PlacementMode] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.Position] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.RimHeight] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.TalusHeight] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Rotation] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Seed] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Size] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.SnapToVoxels] = l_Storage_0.LocalSession, 
        [l_BuildSettings_0.TerrainType] = l_Storage_0.GlobalSession, 
        [l_BuildSettings_0.TopRadius] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.Transform] = l_Storage_0.LocalPersistent, 
        [l_BuildSettings_0.WaterLevel] = l_Storage_0.LocalPersistent
    }
};
local v12 = {
    Type = "DelayedSlider", 
    Min = 0, 
    Max = 1, 
    ShowInput = true, 
    SnapIncrement = 0.01
};
v11.Generator = function(v13, v14, _, v16) --[[ Line: 56 ]] --[[ Name: Generator ]]
    -- upvalues: v1 (copy), l_BuildSettings_0 (copy), v9 (copy), v8 (copy), l_BuildSettings_1 (copy), v7 (copy), v12 (copy), l_TerrainType_0 (copy)
    local l_Localization_0 = v13.Localization;
    return v1(v13, {
        {
            Id = l_BuildSettings_0.TerrainType, 
            Layout = Enum.FillDirection.Vertical, 
            Schema = {
                Type = "TerrainType"
            }
        }, 
        {
            DataId = l_BuildSettings_0.Transform, 
            Hidden = false, 
            Id = l_BuildSettings_0.Position, 
            Schema = {
                Type = "Vector", 
                Components = {
                    "X", 
                    "Y", 
                    "Z"
                }, 
                GetValue = function(v18) --[[ Line: 81 ]] --[[ Name: GetValue ]]
                    -- upvalues: v14 (copy), l_BuildSettings_0 (ref)
                    return v14[l_BuildSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
                end, 
                GetComponents = function(v19) --[[ Line: 85 ]] --[[ Name: GetComponents ]]
                    local l_Position_0 = v19.Position;
                    return {
                        l_Position_0.X, 
                        l_Position_0.Y, 
                        l_Position_0.Z
                    };
                end
            }, 
            Validate = function(v21) --[[ Line: 90 ]] --[[ Name: Validate ]]
                -- upvalues: v13 (copy), v9 (ref), l_Localization_0 (copy), v8 (ref), l_BuildSettings_1 (ref), l_BuildSettings_0 (ref)
                local v22 = v13.Tool:getPayload();
                if v9(v21.Position) then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                elseif not v8(v21, v22[l_BuildSettings_1][l_BuildSettings_0.Size]) then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                else
                    return Enum.PropertyStatus.Ok, "";
                end;
            end, 
            Value = v14[l_BuildSettings_0.Transform]
        }, 
        {
            Id = l_BuildSettings_0.Size, 
            Schema = {
                Type = "Vector", 
                Components = {
                    "X", 
                    "Y", 
                    "Z"
                }, 
                GetValue = function(v23) --[[ Line: 109 ]] --[[ Name: GetValue ]]
                    return (Vector3.new(v23[1], v23[2], v23[3]));
                end, 
                GetComponents = function(v24) --[[ Line: 112 ]] --[[ Name: GetComponents ]]
                    return {
                        v24.X, 
                        v24.Y, 
                        v24.Z
                    };
                end
            }, 
            Validate = function(v25) --[[ Line: 116 ]] --[[ Name: Validate ]]
                -- upvalues: v9 (ref), l_Localization_0 (copy), v7 (ref)
                if v9(v25) then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                elseif v25.X < 4 or v25.Y < 4 or v25.Z < 4 then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "Size");
                elseif v25.X * v25.Y * v25.Z > v7.MaxBuildRegion ^ 3 then
                    return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "Volume");
                else
                    return Enum.PropertyStatus.Ok, "";
                end;
            end
        }, 
        {
            Id = l_BuildSettings_0.CraterDepth, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.CraterRadius, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.TopRadius, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.FillBottom, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.WaterLevel, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.BankSize, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.RimHeight, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.TalusHeight, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.CliffSlope, 
            Schema = {
                Type = "DelayedSlider", 
                Min = 0, 
                Max = 90, 
                ShowInput = true, 
                SnapIncrement = 1
            }
        }, 
        {
            Id = l_BuildSettings_0.NoiseScale, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.NoiseStrength, 
            Schema = v12
        }, 
        {
            Children = {
                {
                    Id = l_BuildSettings_0.Offset, 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "Y"
                        }, 
                        GetValue = function(v26) --[[ Line: 189 ]] --[[ Name: GetValue ]]
                            -- upvalues: v9 (ref), v7 (ref)
                            local v27 = Vector2.new(v26[1], v26[2]);
                            if v9(v27) then
                                return v27;
                            else
                                local v28 = math.clamp(v27.X, v7.MinNoiseValue, v7.MaxNoiseValue);
                                local v29 = math.clamp(v27.Y, v7.MinNoiseValue, v7.MaxNoiseValue);
                                return Vector2.new(v28, v29);
                            end;
                        end, 
                        GetComponents = function(v30) --[[ Line: 201 ]] --[[ Name: GetComponents ]]
                            return {
                                v30.X, 
                                v30.Y
                            };
                        end
                    }, 
                    Validate = function(v31) --[[ Line: 205 ]] --[[ Name: Validate ]]
                        -- upvalues: v9 (ref), l_Localization_0 (copy)
                        if v9(v31) then
                            return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                        else
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end
                }, 
                {
                    Id = l_BuildSettings_0.Rotation, 
                    Schema = {
                        Type = "DelayedSlider", 
                        Min = 0, 
                        Max = 360, 
                        ShowInput = true, 
                        SnapIncrement = 1
                    }
                }, 
                {
                    Id = l_BuildSettings_0.Seed, 
                    Schema = {
                        Type = "Seed"
                    }, 
                    Validate = function(v32) --[[ Line: 228 ]] --[[ Name: Validate ]]
                        -- upvalues: l_Localization_0 (copy)
                        if v32 ~= v32 or not v32 then
                            return Enum.PropertyStatus.Error, l_Localization_0:getText("NumberWarning", "NaN");
                        else
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end
                }
            }, 
            Id = l_BuildSettings_0.AdvancedNoise, 
            Schema = {
                Text = "", 
                Type = "Label"
            }, 
            Value = v14[l_BuildSettings_0.TerrainType] ~= l_TerrainType_0.None or nil
        }, 
        {
            Id = l_BuildSettings_0.Material, 
            Schema = {
                Height = if v14[l_BuildSettings_0.Size] then v14[l_BuildSettings_0.Size].Y else 1, 
                Type = "MaterialRanges"
            }
        }, 
        {
            Id = l_BuildSettings_0.BlendingEdge, 
            Schema = v12
        }, 
        {
            Id = l_BuildSettings_0.Confirm, 
            Layout = Enum.FillDirection.Vertical, 
            Schema = {
                CanConfirm = false, 
                CanRegenerate = false, 
                Label = l_Localization_0:getText(l_BuildSettings_1, l_BuildSettings_0.Confirm), 
                Type = "ConfirmGeneration"
            }, 
            Value = true
        }
    }, {
        Category = l_BuildSettings_1, 
        Data = v14, 
        Overrides = v16
    });
end;
return v11;