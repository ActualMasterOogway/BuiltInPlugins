local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v10 = require(l_script_FirstAncestor_0.Src.Util.ApplyById);
local l_BrushSettings_0 = v8.BrushSettings;
local _ = v8.BrushMode;
local l_Category_0 = v8.Category;
local l_EnumType_0 = v8.EnumType;
local l_FlattenPlane_0 = v8.FlattenPlane;
local l_PlaneLock_0 = v8.PlaneLock;
local l_Storage_0 = v8.Storage;
local l_BrushSettings_1 = l_Category_0.BrushSettings;
return {
    Storage = {
        [l_BrushSettings_0.BrushMode] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.BrushShape] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.BrushSize] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.Strength] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FixedYPlane] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FlattenPlane] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.FlattenMode] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PivotPosition] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PlaneLock] = l_Storage_0.GlobalPersistent, 
        [l_BrushSettings_0.ManualPlaneLock] = l_Storage_0.GlobalPersistent, 
        [l_BrushSettings_0.PlaneTransform] = l_Storage_0.GlobalPersistent, 
        [l_BrushSettings_0.Snapping] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.State] = l_Storage_0.LocalSession, 
        [l_BrushSettings_0.IgnoreWater] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.IgnoreParts] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.PullTerrain] = l_Storage_0.LocalPersistent, 
        [l_BrushSettings_0.TemporarySmooth] = l_Storage_0.LocalSession, 
        [l_BrushSettings_0.WaterAutofill] = l_Storage_0.LocalPersistent
    }, 
    Generator = function(v19, v20, _, v22) --[[ Line: 39 ]] --[[ Name: Generator ]]
        -- upvalues: v10 (copy), l_BrushSettings_0 (copy), v9 (copy), l_EnumType_0 (copy), l_FlattenPlane_0 (copy), l_PlaneLock_0 (copy), l_Category_0 (copy), l_BrushSettings_1 (copy)
        local l_Localization_0 = v19.Localization;
        local l_Stylizer_0 = v19.Stylizer;
        local l_v10_0 = v10;
        local l_v19_0 = v19;
        local v27 = {};
        local v28 = {
            Id = l_BrushSettings_0.BrushMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(l_Localization_0, nil, l_EnumType_0.BrushMode)
            }
        };
        local v29 = {
            Height = 52, 
            Id = l_BrushSettings_0.BrushShape, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(nil, l_Stylizer_0, l_EnumType_0.BrushShape)
            }
        };
        local v30 = {
            Height = 52, 
            Id = l_BrushSettings_0.FlattenMode, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(nil, l_Stylizer_0, l_EnumType_0.FlattenMode)
            }
        };
        local v31 = {
            Id = l_BrushSettings_0.BrushSize, 
            Schema = {
                Shape = v20[l_BrushSettings_0.BrushShape], 
                Type = "BrushSize"
            }
        };
        local v32 = {
            Id = l_BrushSettings_0.Strength, 
            Schema = {
                Type = "Slider", 
                Min = 0, 
                Max = 1, 
                ShowInput = true, 
                SnapIncrement = 0.01
            }
        };
        local v33 = {
            Id = l_BrushSettings_0.PivotPosition, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(l_Localization_0, nil, l_EnumType_0.PivotPosition)
            }
        };
        local v34 = {
            Id = l_BrushSettings_0.Snapping, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(l_Localization_0, nil, l_EnumType_0.Snapping)
            }
        };
        local v35 = {
            Id = l_BrushSettings_0.FlattenPlane, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(l_Localization_0, nil, l_EnumType_0.FlattenPlane)
            }
        };
        local v36 = {
            Hidden = v20[l_BrushSettings_0.FlattenPlane] == l_FlattenPlane_0.Auto, 
            Id = l_BrushSettings_0.FixedYPlane, 
            Schema = {
                Type = "Number"
            }
        };
        local v37 = {
            Id = l_BrushSettings_0.PlaneLock, 
            Schema = {
                Type = "SingleSelectButton", 
                Items = v9(l_Localization_0, nil, l_EnumType_0.PlaneLock)
            }
        };
        local v38 = {
            Hidden = v20[l_BrushSettings_0.PlaneLock] ~= l_PlaneLock_0.Manual, 
            Id = l_BrushSettings_0.ManualPlaneLock, 
            Schema = {
                ApplyLabel = l_Localization_0:getText(l_Category_0.BrushSettings, "Apply"), 
                EditLabel = l_Localization_0:getText(l_Category_0.BrushSettings, "Edit"), 
                OnReset = function() --[[ Line: 131 ]] --[[ Name: OnReset ]]

                end, 
                Type = "PlaneLock"
            }
        };
        local v39 = {
            DataId = l_BrushSettings_0.PlaneTransform, 
            Id = l_BrushSettings_0.PlanePosition
        };
        local v40 = true;
        if v20[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
            v40 = not v20[l_BrushSettings_0.ManualPlaneLock];
        end;
        v39.Hidden = v40;
        v39.Schema = {
            Type = "Vector", 
            Components = {
                "X", 
                "Y", 
                "Z"
            }, 
            GetValue = function(v41) --[[ Line: 142 ]] --[[ Name: GetValue ]]
                -- upvalues: v20 (copy), l_BrushSettings_0 (ref)
                return v20[l_BrushSettings_0.PlaneTransform].Rotation + Vector3.new(v41[1], v41[2], v41[3]);
            end, 
            GetComponents = function(v42) --[[ Line: 146 ]] --[[ Name: GetComponents ]]
                local l_Position_0 = v42.Position;
                return {
                    l_Position_0.X, 
                    l_Position_0.Y, 
                    l_Position_0.Z
                };
            end
        };
        v39.Value = v20[l_BrushSettings_0.PlaneTransform];
        v40 = {
            DataId = l_BrushSettings_0.PlaneTransform, 
            Id = l_BrushSettings_0.PlaneRotation
        };
        local v44 = true;
        if v20[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
            v44 = not v20[l_BrushSettings_0.ManualPlaneLock];
        end;
        v40.Hidden = v44;
        v40.Schema = {
            Type = "Vector", 
            Components = {
                "X", 
                "Y", 
                "Z"
            }, 
            GetValue = function(v45) --[[ Line: 160 ]] --[[ Name: GetValue ]]
                -- upvalues: v20 (copy), l_BrushSettings_0 (ref)
                return CFrame.fromEulerAnglesXYZ(math.rad(v45[1]), math.rad(v45[2]), (math.rad(v45[3]))) + v20[l_BrushSettings_0.PlaneTransform].Position;
            end, 
            GetComponents = function(v46) --[[ Line: 168 ]] --[[ Name: GetComponents ]]
                local v47, v48, v49 = v46:ToEulerAnglesXYZ();
                return {
                    math.deg(v47), 
                    math.deg(v48), 
                    (math.deg(v49))
                };
            end
        };
        v40.Value = v20[l_BrushSettings_0.PlaneTransform];
        v44 = {
            Id = l_BrushSettings_0.IgnoreWater, 
            Schema = {
                Type = "Checkbox"
            }
        };
        local v50 = {
            Id = l_BrushSettings_0.IgnoreParts, 
            Schema = {
                Type = "Checkbox"
            }
        };
        v6(v27, 1, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v44, v50);
        return l_v10_0(l_v19_0, v27, {
            Category = l_BrushSettings_1, 
            Data = v20, 
            Overrides = v22
        });
    end
};