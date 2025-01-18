local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_Category_0 = v1.Category;
local l_EnumType_0 = v1.EnumType;
local l_FillMode_0 = v1.FillMode;
local l_MaterialMode_0 = v1.MaterialMode;
local l_MaterialSettings_0 = v1.MaterialSettings;
local l_Storage_0 = v1.Storage;
local l_Tool_0 = v1.Tool;
local l_MaterialSettings_1 = l_Category_0.MaterialSettings;
return {
    Storage = {
        [l_MaterialSettings_0.AutoMaterial] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.FillMode] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.MaterialMode] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.SourceMaterial] = l_Storage_0.LocalPersistent, 
        [l_MaterialSettings_0.TargetMaterial] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v12, v13, v14, v15) --[[ Line: 26 ]] --[[ Name: Generator ]]
        -- upvalues: v3 (copy), l_MaterialSettings_0 (copy), v2 (copy), l_EnumType_0 (copy), l_MaterialMode_0 (copy), l_FillMode_0 (copy), l_Tool_0 (copy), l_MaterialSettings_1 (copy)
        local l_Localization_0 = v12.Localization;
        return v3(v12, {
            {
                Id = l_MaterialSettings_0.AutoMaterial, 
                Schema = {
                    Type = "Checkbox"
                }
            }, 
            {
                Id = l_MaterialSettings_0.MaterialMode, 
                Schema = {
                    Type = "SingleSelectButton", 
                    Items = v2(l_Localization_0, nil, l_EnumType_0.MaterialMode)
                }
            }, 
            {
                Id = l_MaterialSettings_0.FillMode, 
                Schema = {
                    Type = "SingleSelectButton", 
                    Items = v2(l_Localization_0, nil, l_EnumType_0.FillMode)
                }
            }, 
            {
                Hidden = v13[l_MaterialSettings_0.AutoMaterial], 
                Id = l_MaterialSettings_0.SourceMaterial, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    AllowAir = true, 
                    Type = "Material"
                }
            }, 
            {
                Hidden = (not (v13[l_MaterialSettings_0.MaterialMode] ~= nil) or v13[l_MaterialSettings_0.MaterialMode] == l_MaterialMode_0.Paint) and (v13[l_MaterialSettings_0.FillMode] == nil or v13[l_MaterialSettings_0.FillMode] == l_FillMode_0.Fill), 
                Id = l_MaterialSettings_0.TargetMaterial, 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    AllowAir = true, 
                    Type = "Material"
                }
            }, 
            {
                Hidden = v14 ~= l_Tool_0.Paint, 
                Id = l_MaterialSettings_0.Apply, 
                Layout = Enum.FillDirection.Vertical, 
                Label = if not not v13[l_MaterialSettings_0.MaterialMode] or v13[l_MaterialSettings_0.FillMode] then l_Localization_0:getText(l_MaterialSettings_1, v13[l_MaterialSettings_0.MaterialMode] or v13[l_MaterialSettings_0.FillMode]) else nil, 
                Schema = {
                    Label = if not not v13[l_MaterialSettings_0.MaterialMode] or v13[l_MaterialSettings_0.FillMode] then l_Localization_0:getText(l_MaterialSettings_1, v13[l_MaterialSettings_0.MaterialMode] or v13[l_MaterialSettings_0.FillMode]) else nil, 
                    Type = "Button"
                }
            }
        }, {
            Category = l_MaterialSettings_1, 
            Data = v13, 
            Overrides = v15
        });
    end
};