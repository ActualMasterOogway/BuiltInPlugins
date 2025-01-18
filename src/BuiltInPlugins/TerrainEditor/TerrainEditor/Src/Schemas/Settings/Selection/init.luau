local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_SelectionSettings_0 = v2.SelectionSettings;
local l_Storage_0 = v2.Storage;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v8 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
local l_SelectionSettings_1 = l_Category_0.SelectionSettings;
return {
    Storage = {
        [l_SelectionSettings_0.Size] = l_Storage_0.GlobalPersistent, 
        [l_SelectionSettings_0.Position] = l_Storage_0.GlobalPersistent, 
        [l_SelectionSettings_0.Transform] = l_Storage_0.GlobalPersistent, 
        [l_SelectionSettings_0.SnapToVoxels] = l_Storage_0.GlobalPersistent
    }, 
    Generator = function(v10, v11, _, v13) --[[ Line: 26 ]] --[[ Name: Generator ]]
        -- upvalues: v1 (copy), l_SelectionSettings_0 (copy), v8 (copy), v6 (copy), v7 (copy), l_SelectionSettings_1 (copy)
        local l_Localization_0 = v10.Localization;
        return v1(v10, {
            {
                Id = l_SelectionSettings_0.Size, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v15) --[[ Line: 42 ]] --[[ Name: GetValue ]]
                        return (Vector3.new(v15[1], v15[2], v15[3]));
                    end, 
                    GetComponents = function(v16) --[[ Line: 45 ]] --[[ Name: GetComponents ]]
                        return {
                            v16.X, 
                            v16.Y, 
                            v16.Z
                        };
                    end
                }, 
                Validate = function(v17) --[[ Line: 49 ]] --[[ Name: Validate ]]
                    -- upvalues: v8 (ref), l_Localization_0 (copy), v6 (ref)
                    if v8(v17) then
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
                DataId = l_SelectionSettings_0.Transform, 
                Hidden = false, 
                Id = l_SelectionSettings_0.Position, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v18) --[[ Line: 72 ]] --[[ Name: GetValue ]]
                        -- upvalues: v11 (copy), l_SelectionSettings_0 (ref)
                        return v11[l_SelectionSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
                    end, 
                    GetComponents = function(v19) --[[ Line: 76 ]] --[[ Name: GetComponents ]]
                        local l_Position_0 = v19.Position;
                        return {
                            l_Position_0.X, 
                            l_Position_0.Y, 
                            l_Position_0.Z
                        };
                    end
                }, 
                Validate = function(v21) --[[ Line: 81 ]] --[[ Name: Validate ]]
                    -- upvalues: v10 (copy), v8 (ref), l_Localization_0 (copy), v7 (ref), l_SelectionSettings_1 (ref), l_SelectionSettings_0 (ref)
                    local v22 = v10.Tool:getPayload();
                    if v8(v21.Position) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                    elseif not v7(v21, v22[l_SelectionSettings_1][l_SelectionSettings_0.Size]) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end, 
                Value = v11[l_SelectionSettings_0.Transform]
            }, 
            {
                DataId = l_SelectionSettings_0.Transform, 
                Id = l_SelectionSettings_0.Rotation, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v23) --[[ Line: 101 ]] --[[ Name: GetValue ]]
                        -- upvalues: v11 (copy), l_SelectionSettings_0 (ref)
                        return CFrame.fromEulerAnglesXYZ(math.rad(v23[1]), math.rad(v23[2]), (math.rad(v23[3]))) + v11[l_SelectionSettings_0.Transform].Position;
                    end, 
                    GetComponents = function(v24) --[[ Line: 109 ]] --[[ Name: GetComponents ]]
                        local v25, v26, v27 = v24:ToEulerAnglesXYZ();
                        return {
                            math.deg(v25), 
                            math.deg(v26), 
                            (math.deg(v27))
                        };
                    end
                }, 
                Value = v11[l_SelectionSettings_0.Transform]
            }, 
            {
                Id = l_SelectionSettings_0.SnapToVoxels, 
                Schema = {
                    Type = "Checkbox"
                }
            }
        }, {
            Category = l_SelectionSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};