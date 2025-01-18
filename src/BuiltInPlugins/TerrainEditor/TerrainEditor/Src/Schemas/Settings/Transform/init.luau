local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_TransformSettings_0 = v2.TransformSettings;
local l_Storage_0 = v2.Storage;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_TransformSettings_1 = l_Category_0.TransformSettings;
local v8 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v9 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
return {
    Storage = {
        [l_TransformSettings_0.Apply] = l_Storage_0.LocalSession, 
        [l_TransformSettings_0.ForcePreview] = l_Storage_0.LocalSession, 
        [l_TransformSettings_0.LiveEdit] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.MergeEmpty] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.OperationSource] = l_Storage_0.LocalPersistent, 
        [l_TransformSettings_0.Position] = l_Storage_0.GlobalPersistent, 
        [l_TransformSettings_0.Size] = l_Storage_0.GlobalPersistent, 
        [l_TransformSettings_0.SnapToVoxels] = l_Storage_0.GlobalPersistent, 
        [l_TransformSettings_0.TerrainRegion] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.TerrainRegionBuffer] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.TerrainRegionBufferSize] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.TerrainRegionBufferTransform] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.TerrainRegionSize] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.TerrainRegionTransform] = l_Storage_0.GlobalSession, 
        [l_TransformSettings_0.Transform] = l_Storage_0.GlobalPersistent, 
        [l_TransformSettings_0.TransformMode] = l_Storage_0.GlobalSession
    }, 
    Generator = function(v10, v11, _, v13) --[[ Line: 38 ]] --[[ Name: Generator ]]
        -- upvalues: v1 (copy), l_TransformSettings_0 (copy), v9 (copy), v6 (copy), v8 (copy), l_TransformSettings_1 (copy)
        local l_Localization_0 = v10.Localization;
        return v1(v10, {
            {
                Id = l_TransformSettings_0.Size, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v15) --[[ Line: 54 ]] --[[ Name: GetValue ]]
                        return (Vector3.new(v15[1], v15[2], v15[3]));
                    end, 
                    GetComponents = function(v16) --[[ Line: 57 ]] --[[ Name: GetComponents ]]
                        return {
                            v16.X, 
                            v16.Y, 
                            v16.Z
                        };
                    end
                }, 
                Validate = function(v17) --[[ Line: 61 ]] --[[ Name: Validate ]]
                    -- upvalues: v9 (ref), l_Localization_0 (copy), v6 (ref)
                    if v9(v17) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                    elseif v17.X < 4 or v17.Y < 4 or v17.Z < 4 then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "Size");
                    elseif v17.X > v6.MaxRegion or v17.Y > v6.MaxRegion or v17.Z > v6.MaxRegion then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "SizeMax");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end
            }, 
            {
                DataId = l_TransformSettings_0.Transform, 
                Id = l_TransformSettings_0.Position, 
                Hidden = false, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v18) --[[ Line: 83 ]] --[[ Name: GetValue ]]
                        -- upvalues: v11 (copy), l_TransformSettings_0 (ref)
                        return v11[l_TransformSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
                    end, 
                    GetComponents = function(v19) --[[ Line: 87 ]] --[[ Name: GetComponents ]]
                        local l_Position_0 = v19.Position;
                        return {
                            l_Position_0.X, 
                            l_Position_0.Y, 
                            l_Position_0.Z
                        };
                    end
                }, 
                Validate = function(v21) --[[ Line: 92 ]] --[[ Name: Validate ]]
                    -- upvalues: v9 (ref), l_Localization_0 (copy)
                    if v9(v21.Position) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end, 
                Value = v11[l_TransformSettings_0.Transform]
            }, 
            {
                DataId = l_TransformSettings_0.Transform, 
                Id = l_TransformSettings_0.Rotation, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v22) --[[ Line: 107 ]] --[[ Name: GetValue ]]
                        -- upvalues: v11 (copy), l_TransformSettings_0 (ref)
                        return CFrame.fromEulerAnglesXYZ(math.rad(v22[1]), math.rad(v22[2]), (math.rad(v22[3]))) + v11[l_TransformSettings_0.Transform].Position;
                    end, 
                    GetComponents = function(v23) --[[ Line: 115 ]] --[[ Name: GetComponents ]]
                        local v24, v25, v26 = v23:ToEulerAnglesXYZ();
                        return {
                            math.deg(v24), 
                            math.deg(v25), 
                            (math.deg(v26))
                        };
                    end
                }, 
                Validate = function(v27) --[[ Line: 120 ]] --[[ Name: Validate ]]
                    -- upvalues: v10 (copy), v9 (ref), l_Localization_0 (copy), v8 (ref), l_TransformSettings_1 (ref), l_TransformSettings_0 (ref)
                    local v28 = v10.Tool:getPayload();
                    if v9(v27.Position) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                    elseif not v8(v27, v28[l_TransformSettings_1][l_TransformSettings_0.Size]) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end, 
                Value = v11[l_TransformSettings_0.Transform]
            }, 
            {
                Id = l_TransformSettings_0.MergeEmpty, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.LiveEdit, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.SnapToVoxels, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_TransformSettings_0.Apply, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_TransformSettings_1, l_TransformSettings_0.Apply), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_TransformSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};