local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_SeaLevelSettings_0 = v2.SeaLevelSettings;
local l_Storage_0 = v2.Storage;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_SeaLevelSettings_1 = l_Category_0.SeaLevelSettings;
local v8 = require(l_script_FirstAncestor_0.Src.Util.getWithinTerrainBounds);
local v9 = require(l_script_FirstAncestor_0.Src.Util.isVectorNaNOrInf);
return {
    Storage = {
        [l_SeaLevelSettings_0.Evaporate] = l_Storage_0.LocalSession, 
        [l_SeaLevelSettings_0.Create] = l_Storage_0.LocalSession, 
        [l_SeaLevelSettings_0.Size] = l_Storage_0.LocalPersistent, 
        [l_SeaLevelSettings_0.SnapToVoxels] = l_Storage_0.LocalPersistent, 
        [l_SeaLevelSettings_0.Transform] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v10, v11, _, v13) --[[ Line: 27 ]] --[[ Name: Generator ]]
        -- upvalues: v1 (copy), l_SeaLevelSettings_0 (copy), v9 (copy), v6 (copy), v8 (copy), l_SeaLevelSettings_1 (copy)
        local l_Localization_0 = v10.Localization;
        return v1(v10, {
            {
                Id = l_SeaLevelSettings_0.Size, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v15) --[[ Line: 43 ]] --[[ Name: GetValue ]]
                        return (Vector3.new(v15[1], v15[2], v15[3]));
                    end, 
                    GetComponents = function(v16) --[[ Line: 46 ]] --[[ Name: GetComponents ]]
                        return {
                            v16.X, 
                            v16.Y, 
                            v16.Z
                        };
                    end
                }, 
                Validate = function(v17) --[[ Line: 50 ]] --[[ Name: Validate ]]
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
                end, 
                Value = v11[l_SeaLevelSettings_0.Size]
            }, 
            {
                DataId = l_SeaLevelSettings_0.Transform, 
                Hidden = false, 
                Id = l_SeaLevelSettings_0.Position, 
                Schema = {
                    Type = "Vector", 
                    Components = {
                        "X", 
                        "Y", 
                        "Z"
                    }, 
                    GetValue = function(v18) --[[ Line: 74 ]] --[[ Name: GetValue ]]
                        -- upvalues: v11 (copy), l_SeaLevelSettings_0 (ref)
                        return v11[l_SeaLevelSettings_0.Transform].Rotation + Vector3.new(v18[1], v18[2], v18[3]);
                    end, 
                    GetComponents = function(v19) --[[ Line: 78 ]] --[[ Name: GetComponents ]]
                        local l_Position_0 = v19.Position;
                        return {
                            l_Position_0.X, 
                            l_Position_0.Y, 
                            l_Position_0.Z
                        };
                    end
                }, 
                Validate = function(v21) --[[ Line: 83 ]] --[[ Name: Validate ]]
                    -- upvalues: v10 (copy), v9 (ref), l_Localization_0 (copy), v8 (ref), l_SeaLevelSettings_1 (ref), l_SeaLevelSettings_0 (ref)
                    local v22 = v10.Tool:getPayload();
                    if v9(v21.Position) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "NaN");
                    elseif not v8(v21, v22[l_SeaLevelSettings_1][l_SeaLevelSettings_0.Size]) then
                        return Enum.PropertyStatus.Error, l_Localization_0:getText("SelectionWarning", "OutOfBounds");
                    else
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end, 
                Value = v11[l_SeaLevelSettings_0.Transform]
            }, 
            {
                Id = l_SeaLevelSettings_0.SnapToVoxels, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_SeaLevelSettings_0.Evaporate, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_SeaLevelSettings_1, l_SeaLevelSettings_0.Evaporate), 
                    Type = "Button"
                }
            }, 
            {
                Id = l_SeaLevelSettings_0.Create, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    Label = l_Localization_0:getText(l_SeaLevelSettings_1, l_SeaLevelSettings_0.Create), 
                    Type = "Button"
                }
            }
        }, {
            Category = l_SeaLevelSettings_1, 
            Data = v11, 
            Overrides = v13
        });
    end
};