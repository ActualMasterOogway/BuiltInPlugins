local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v3 = require(l_script_FirstAncestor_0.Src.Util.getMaterialsMinWidth);
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_AdditionalSettings_0 = v4.AdditionalSettings;
local l_Category_0 = v4.Category;
local l_EnumType_0 = v4.EnumType;
local l_ElevationSettings_0 = v4.ElevationSettings;
local l_MaterialUnit_0 = v4.MaterialUnit;
return {
    Get = function(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: Get ]]
        -- upvalues: v3 (copy), l_Category_0 (copy), l_ElevationSettings_0 (copy), v2 (copy), l_EnumType_0 (copy), l_AdditionalSettings_0 (copy)
        local v13 = v3(v11, v12);
        return {
            {
                Id = l_Category_0.ElevationSettings, 
                Label = v11:getText("Category", l_Category_0.ElevationSettings), 
                Children = {
                    {
                        Id = l_ElevationSettings_0.Unit, 
                        Label = v11:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Unit), 
                        Schema = {
                            Items = v2(v11, nil, l_EnumType_0.MaterialUnit), 
                            Type = "Select"
                        }, 
                        Value = v10.Unit
                    }, 
                    {
                        Id = l_ElevationSettings_0.Elevation, 
                        Label = "", 
                        Layout = Enum.FillDirection.Vertical, 
                        Schema = {
                            Type = l_ElevationSettings_0.Elevation
                        }, 
                        Value = v10
                    }, 
                    if v10.MaterialIndex and v10.MaterialIndex <= #v10.MaterialList then {
                        Id = l_ElevationSettings_0.Material, 
                        Label = v11:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Material), 
                        MinWidth = v13, 
                        Schema = {
                            AllowWater = false, 
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v10.MaterialList[v10.MaterialIndex].Material
                    } else nil, 
                    if v10.MaterialIndex and v10.MaterialIndex <= #v10.MaterialList then {
                        Id = l_ElevationSettings_0.Slope, 
                        Label = v11:getText(l_Category_0.ElevationSettings, l_ElevationSettings_0.Slope), 
                        Schema = {
                            Type = "Slope"
                        }, 
                        Value = {
                            Min = v10.MaterialList[v10.MaterialIndex].MinSlope, 
                            Max = v10.MaterialList[v10.MaterialIndex].MaxSlope
                        }, 
                        Tooltip = v11:getText("Tooltip", l_ElevationSettings_0.Slope)
                    } else nil
                }, 
                Expandable = false, 
                Separator = true
            }, 
            {
                Id = l_Category_0.AdditionalSettings, 
                Label = v11:getText("Category", l_Category_0.AdditionalSettings), 
                Children = {
                    if v10.FillMaterial then {
                        Id = l_AdditionalSettings_0.FillMaterial, 
                        Label = v11:getText(l_Category_0.AdditionalSettings, l_AdditionalSettings_0.FillMaterial), 
                        MinWidth = v13, 
                        Schema = {
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v10.FillMaterial, 
                        Tooltip = v11:getText("Tooltip", l_AdditionalSettings_0.FillMaterial)
                    } else nil, 
                    {
                        Id = l_AdditionalSettings_0.FallbackMaterial, 
                        Label = v11:getText(l_Category_0.AdditionalSettings, l_AdditionalSettings_0.FallbackMaterial), 
                        MinWidth = v13, 
                        Schema = {
                            AllowWater = false, 
                            Dropdown = true, 
                            Type = "Material"
                        }, 
                        Value = v10.FallbackMaterial, 
                        Tooltip = v11:getText("Tooltip", l_AdditionalSettings_0.FallbackMaterial)
                    }
                }, 
                Expandable = false, 
                Separator = true
            }
        };
    end, 
    Set = function(v14, v15, v16) --[[ Line: 115 ]] --[[ Name: Set ]]
        -- upvalues: l_deepCopy_0 (copy), l_ElevationSettings_0 (copy), l_MaterialUnit_0 (copy), l_AdditionalSettings_0 (copy)
        assert(v14[1] and v14[1].Children and v14[2] and v14[2].Children, "Cannot update from nothing.");
        local v17 = {};
        for _, v19 in v14[1].Children do
            v17[v19.Id] = v19.Value;
        end;
        for _, v21 in v14[2].Children do
            v17[v21.Id] = v21.Value;
        end;
        local v22 = l_deepCopy_0(v17[l_ElevationSettings_0.Elevation]);
        local v23 = v17[l_ElevationSettings_0.Unit];
        if v22.Unit ~= v23 then
            if v23 == l_MaterialUnit_0.Stud then
                for _, v25 in v22.MaterialList do
                    v25.MinHeight = v16 * v25.MinHeight;
                    v25.MaxHeight = v16 * v25.MaxHeight;
                end;
                v22.Min = 0;
                v22.Max = v16;
            elseif v23 == l_MaterialUnit_0.Percentage then
                for _, v27 in v22.MaterialList do
                    v27.MinHeight = math.clamp(v27.MinHeight, 0, v16) / v16;
                    v27.MaxHeight = math.clamp(v27.MaxHeight, 0, v16) / v16;
                end;
                v22.Min = 0;
                v22.Max = 1;
            end;
        end;
        if v15.MaterialIndex <= #v22.MaterialList and #v15.MaterialList == #v22.MaterialList then
            v22.Unit = v23;
            v22.FallbackMaterial = v17[l_AdditionalSettings_0.FallbackMaterial];
            v22.FillMaterial = v17[l_AdditionalSettings_0.FillMaterial];
            local v28 = v17[l_ElevationSettings_0.Material];
            if v28 then
                v22.MaterialList[v15.MaterialIndex].Material = v28;
            end;
            local v29 = v17[l_ElevationSettings_0.Slope];
            if v29 then
                v22.MaterialList[v15.MaterialIndex].MinSlope = v29.Min;
                v22.MaterialList[v15.MaterialIndex].MaxSlope = v29.Max;
            end;
        end;
        return v22;
    end
};