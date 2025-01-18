local l_ReflectionService_0 = game:GetService("ReflectionService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Breadcrumb_0 = require(l_Parent_0.Packages.Framework).UI.Breadcrumb;
local v3 = require(l_Parent_0.Packages.Dash);
local l_append_0 = v3.append;
local l_collectArray_0 = v3.collectArray;
local l_collectSet_0 = v3.collectSet;
local l_forEach_0 = v3.forEach;
local l_includes_0 = v3.includes;
local l_keys_0 = v3.keys;
local l_splitOn_0 = v3.splitOn;
local l_startsWith_0 = v3.startsWith;
local l_trim_0 = v3.trim;
local v13 = require(l_Parent_0.Src.Util.MenuHelpers);
local v14 = require(l_Parent_0.Src.Resources.ModernIcons);
local v15 = require(l_Parent_0.Src.Util.roundDecimal);
local v16 = require(l_Parent_0.Src.Util.sortByLabel);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local v18 = {
    allProperties = {}, 
    possiblePropertyTypes = {}
};
v18.CreateSelectSchema = function(v19) --[[ Line: 29 ]] --[[ Name: CreateSelectSchema ]]
    -- upvalues: v18 (copy), l_includes_0 (copy)
    if v19 == nil or v19.EnumType == nil then
        return v18.TextSchema;
    else
        return {
            Type = "Select", 
            Items = v18.GetEnumItems(v19.EnumType), 
            PlaceholderText = "Add a " .. tostring(v19.EnumType) .. "...", 
            Validate = function(v20) --[[ Line: 37 ]] --[[ Name: Validate ]]
                -- upvalues: v19 (copy), l_includes_0 (ref)
                local l_EnumType_0 = v19.EnumType;
                return l_includes_0(l_EnumType_0:GetEnumItems(), v20);
            end, 
            GetDefaultValue = function() --[[ Line: 42 ]] --[[ Name: GetDefaultValue ]]
                -- upvalues: v19 (copy)
                return v19;
            end
        };
    end;
end;
v18.GetEnumItems = function(v22) --[[ Line: 48 ]] --[[ Name: GetEnumItems ]]
    -- upvalues: l_collectArray_0 (copy), l_splitOn_0 (copy)
    local l_v22_EnumItems_0 = v22:GetEnumItems();
    table.sort(l_v22_EnumItems_0, function(v24, v25) --[[ Line: 51 ]]
        return tostring(v24) < tostring(v25);
    end);
    return (l_collectArray_0(l_v22_EnumItems_0, function(_, v27) --[[ Line: 54 ]]
        -- upvalues: l_splitOn_0 (ref)
        local v28 = tostring(v27);
        return {
            Id = v27, 
            Label = l_splitOn_0(v28, "%.")[3]
        };
    end));
end;
v18.CreateChildSchema = function(v29, v30, v31, v32, v33) --[[ Line: 64 ]] --[[ Name: CreateChildSchema ]]
    -- upvalues: v18 (copy)
    return {
        Id = ("%*/%*"):format(v30, v29), 
        Name = {
            Schema = v18.ChildComponentSchema, 
            Value = v29
        }, 
        Value = {
            Schema = v31, 
            Value = v32
        }, 
        SetParentValue = v33
    };
end;
v18.GetComponentsValues = function(v34) --[[ Line: 79 ]] --[[ Name: GetComponentsValues ]]
    -- upvalues: l_collectArray_0 (copy)
    return l_collectArray_0(v34:split(","), function(_, v36) --[[ Line: 80 ]]
        return (tonumber(v36));
    end);
end;
v18.GetComponentsString = function(v37) --[[ Line: 85 ]] --[[ Name: GetComponentsString ]]
    -- upvalues: v15 (copy)
    local v38 = "";
    for v39, v40 in v37 do
        if v39 ~= 1 then
            v38 = v38 .. " , ";
        end;
        v38 = v38 .. v15(tonumber(v40), 2);
    end;
    return {
        v38
    };
end;
v18.BrickColorSchema = {
    Type = "BrickColor", 
    Validate = function(v41) --[[ Line: 98 ]] --[[ Name: Validate ]]
        return typeof(v41) == "BrickColor";
    end, 
    GetDefaultValue = function() --[[ Line: 101 ]] --[[ Name: GetDefaultValue ]]
        return BrickColor.new(1);
    end
};
local function _(v42) --[[ Line: 105 ]] --[[ Name: radToDeg ]]
    if v42 == -0 then
        return 0;
    else
        return (math.deg(v42));
    end;
end;
v18.NumberSchema = {
    Type = "Number", 
    PlaceholderText = "Add a Number...", 
    Validate = function(v44) --[[ Line: 115 ]] --[[ Name: Validate ]]
        return typeof(v44) == "number";
    end, 
    GetDefaultValue = function() --[[ Line: 118 ]] --[[ Name: GetDefaultValue ]]
        return 0;
    end
};
v18.CFrameSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v45) --[[ Line: 126 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v46 = v18.GetComponentsValues(v45[1]);
        local v47 = Vector3.new(v46[1], v46[2], v46[3]);
        local v48 = v46[4];
        local v49 = v48 == -0 and 0 or math.deg(v48);
        v48 = v46[5];
        local v50 = v48 == -0 and 0 or math.deg(v48);
        v48 = v46[6];
        local v51 = v48 == -0 and 0 or math.deg(v48);
        v48 = CFrame.Angles(v49, v50, v51);
        return CFrame.new(v47) * v48;
    end, 
    GetChildren = function(v52, v53) --[[ Line: 133 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_0 = v18.NumberSchema;
        local l_Position_0 = v52.Position;
        local l_X_0 = l_Position_0.X;
        local l_Y_0 = l_Position_0.Y;
        local l_Z_0 = l_Position_0.Z;
        local v59, v60, v61 = v52:ToOrientation();
        local v62 = CFrame.Angles(v59, v60, v61);
        local v63 = v59 == -0 and 0 or math.deg(v59);
        local v64 = v60 == -0 and 0 or math.deg(v60);
        local v65 = v61 == -0 and 0 or math.deg(v61);
        return {
            v18.CreateChildSchema("Position-X", v53, l_NumberSchema_0, l_X_0, function(v66) --[[ Line: 142 ]]
                -- upvalues: l_Position_0 (ref), l_Y_0 (copy), l_Z_0 (copy), v62 (ref)
                l_Position_0 = Vector3.new(v66, l_Y_0, l_Z_0);
                return CFrame.new(l_Position_0) * v62;
            end), 
            v18.CreateChildSchema("Position-Y", v53, l_NumberSchema_0, l_Y_0, function(v67) --[[ Line: 146 ]]
                -- upvalues: l_Position_0 (ref), l_X_0 (copy), l_Z_0 (copy), v62 (ref)
                l_Position_0 = Vector3.new(l_X_0, v67, l_Z_0);
                return CFrame.new(l_Position_0) * v62;
            end), 
            v18.CreateChildSchema("Position-Z", v53, l_NumberSchema_0, l_Z_0, function(v68) --[[ Line: 150 ]]
                -- upvalues: l_Position_0 (ref), l_X_0 (copy), l_Y_0 (copy), v62 (ref)
                l_Position_0 = Vector3.new(l_X_0, l_Y_0, v68);
                return CFrame.new(l_Position_0) * v62;
            end), 
            v18.CreateChildSchema("Orientation-X", v53, l_NumberSchema_0, v63, function(v69) --[[ Line: 154 ]]
                -- upvalues: v62 (ref), v60 (copy), v61 (copy), l_Position_0 (ref)
                v62 = CFrame.Angles(math.rad(v69), v60, v61);
                return CFrame.new(l_Position_0) * v62;
            end), 
            v18.CreateChildSchema("Orientation-Y", v53, l_NumberSchema_0, v64, function(v70) --[[ Line: 158 ]]
                -- upvalues: v62 (ref), v59 (copy), v61 (copy), l_Position_0 (ref)
                v62 = CFrame.Angles(v59, math.rad(v70), v61);
                return CFrame.new(l_Position_0) * v62;
            end), 
            v18.CreateChildSchema("Orientation-Z", v53, l_NumberSchema_0, v65, function(v71) --[[ Line: 162 ]]
                -- upvalues: v62 (ref), v59 (copy), v60 (copy), l_Position_0 (ref)
                v62 = CFrame.Angles(v59, v60, (math.rad(v71)));
                return CFrame.new(l_Position_0) * v62;
            end)
        };
    end, 
    GetComponents = function(v72) --[[ Line: 168 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        local l_Position_1 = v72.Position;
        local v74, v75, v76 = v72:ToOrientation();
        local v77 = v74 == -0 and 0 or math.deg(v74);
        local v78 = v75 == -0 and 0 or math.deg(v75);
        local v79 = v76 == -0 and 0 or math.deg(v76);
        return v18.GetComponentsString({
            l_Position_1.X, 
            l_Position_1.Y, 
            l_Position_1.Z, 
            v77, 
            v78, 
            v79
        });
    end, 
    Validate = function(v80) --[[ Line: 174 ]] --[[ Name: Validate ]]
        return typeof(v80) == "CFrame";
    end, 
    GetDefaultValue = function() --[[ Line: 177 ]] --[[ Name: GetDefaultValue ]]
        return CFrame.new();
    end
};
v18.CheckboxSchema = {
    Type = "Checkbox", 
    Validate = function(v81) --[[ Line: 183 ]] --[[ Name: Validate ]]
        return typeof(v81) == "boolean";
    end, 
    GetDefaultValue = function() --[[ Line: 186 ]] --[[ Name: GetDefaultValue ]]
        return false;
    end
};
v18.ChildComponentSchema = {
    Type = "StaticText", 
    Name = "Child", 
    Validate = function(v82) --[[ Line: 193 ]] --[[ Name: Validate ]]
        return typeof(v82) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 196 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.ColorSchema = {
    Type = "Color", 
    PlaceholderText = "Add a Color...", 
    Validate = function(v83) --[[ Line: 203 ]] --[[ Name: Validate ]]
        return typeof(v83) == "Color3";
    end, 
    GetDefaultValue = function() --[[ Line: 206 ]] --[[ Name: GetDefaultValue ]]
        return Color3.new(1, 1, 1);
    end
};
v18.ColorSequenceSchema = {
    Type = "ColorSequence", 
    Validate = function(v84) --[[ Line: 212 ]] --[[ Name: Validate ]]
        return typeof(v84) == "ColorSequence";
    end, 
    GetDefaultValue = function() --[[ Line: 215 ]] --[[ Name: GetDefaultValue ]]
        return ColorSequence.new(Color3.new());
    end
};
v18.EmptySchema = {
    Type = "Empty", 
    Validate = function() --[[ Line: 221 ]] --[[ Name: Validate ]]
        return true;
    end, 
    GetDefaultValue = function() --[[ Line: 224 ]] --[[ Name: GetDefaultValue ]]
        return nil;
    end
};
v18.FontStyleSchema = {
    Type = "FontStyle", 
    Validate = function(v85) --[[ Line: 230 ]] --[[ Name: Validate ]]
        return typeof(v85) == "Font";
    end, 
    GetDefaultValue = function() --[[ Line: 233 ]] --[[ Name: GetDefaultValue ]]
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.FontWeightSchema = {
    Type = "FontWeight", 
    Validate = function(v86) --[[ Line: 239 ]] --[[ Name: Validate ]]
        return typeof(v86) == "Font";
    end, 
    GetDefaultValue = function() --[[ Line: 242 ]] --[[ Name: GetDefaultValue ]]
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.FontSchema = {
    Type = "FontFamily", 
    PlaceholderText = "Add a Font...", 
    GetChildren = function(v87) --[[ Line: 249 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        return {
            {
                Name = {
                    Schema = v18.ChildComponentSchema, 
                    Value = "Style"
                }, 
                Value = {
                    Schema = v18.FontStyleSchema, 
                    Value = v87
                }
            }, 
            {
                Name = {
                    Schema = v18.ChildComponentSchema, 
                    Value = "Weight"
                }, 
                Value = {
                    Schema = v18.FontWeightSchema, 
                    Value = v87
                }
            }
        };
    end, 
    Validate = function(v88) --[[ Line: 273 ]] --[[ Name: Validate ]]
        return typeof(v88) == "Font";
    end, 
    GetDefaultValue = function() --[[ Line: 276 ]] --[[ Name: GetDefaultValue ]]
        return Font.new("rbxasset://fonts/families/SourceSansPro.json");
    end
};
v18.NumberRangeSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v89) --[[ Line: 283 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v90 = v18.GetComponentsValues(v89[1]);
        local v91 = v90[1];
        local v92 = v90[2];
        if v91 <= v92 then
            return NumberRange.new(v91, v92);
        else
            return NumberRange.new(v92, v91);
        end;
    end, 
    GetChildren = function(v93, v94) --[[ Line: 292 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_1 = v18.NumberSchema;
        local l_Min_0 = v93.Min;
        local l_Max_0 = v93.Max;
        return {
            v18.CreateChildSchema("Min", v94, l_NumberSchema_1, l_Min_0, function(v98) --[[ Line: 296 ]]
                -- upvalues: l_Max_0 (copy)
                if v98 <= l_Max_0 then
                    return NumberRange.new(v98, l_Max_0);
                else
                    return NumberRange.new(l_Max_0, v98);
                end;
            end), 
            v18.CreateChildSchema("Max", v94, l_NumberSchema_1, l_Max_0, function(v99) --[[ Line: 303 ]]
                -- upvalues: l_Min_0 (copy)
                if l_Min_0 <= v99 then
                    return NumberRange.new(l_Min_0, v99);
                else
                    return NumberRange.new(v99, l_Min_0);
                end;
            end)
        };
    end, 
    GetComponents = function(v100) --[[ Line: 312 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        return v18.GetComponentsString({
            v100.Min, 
            v100.Max
        });
    end, 
    Validate = function(v101) --[[ Line: 315 ]] --[[ Name: Validate ]]
        return typeof(v101) == "NumberRange";
    end, 
    GetDefaultValue = function() --[[ Line: 318 ]] --[[ Name: GetDefaultValue ]]
        return NumberRange.new(0);
    end
};
v18.PropertyNameSchema = {
    Type = "PropertyName", 
    ErrorStyle = "PropertyCellError", 
    Validate = function(v102) --[[ Line: 325 ]] --[[ Name: Validate ]]
        return typeof(v102) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 328 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.RectSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v103) --[[ Line: 335 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v104 = v18.GetComponentsValues(v103[1]);
        return Rect.new(v104[1], v104[2], v104[3], v104[4]);
    end, 
    GetChildren = function(v105, v106) --[[ Line: 339 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_2 = v18.NumberSchema;
        local l_X_1 = v105.Min.X;
        local l_X_2 = v105.Max.X;
        local l_Y_1 = v105.Min.Y;
        local l_Y_2 = v105.Max.Y;
        return {
            v18.CreateChildSchema("X0", v106, l_NumberSchema_2, l_X_1, function(v112) --[[ Line: 344 ]]
                -- upvalues: l_Y_1 (copy), l_X_2 (copy), l_Y_2 (copy)
                return Rect.new(v112, l_Y_1, l_X_2, l_Y_2);
            end), 
            v18.CreateChildSchema("Y0", v106, l_NumberSchema_2, l_Y_1, function(v113) --[[ Line: 347 ]]
                -- upvalues: l_X_1 (copy), l_X_2 (copy), l_Y_2 (copy)
                return Rect.new(l_X_1, v113, l_X_2, l_Y_2);
            end), 
            v18.CreateChildSchema("X1", v106, l_NumberSchema_2, l_X_2, function(v114) --[[ Line: 350 ]]
                -- upvalues: l_X_1 (copy), l_Y_1 (copy), l_Y_2 (copy)
                return Rect.new(l_X_1, l_Y_1, v114, l_Y_2);
            end), 
            v18.CreateChildSchema("Y1", v106, l_NumberSchema_2, l_Y_2, function(v115) --[[ Line: 353 ]]
                -- upvalues: l_X_1 (copy), l_Y_1 (copy), l_X_2 (copy)
                return Rect.new(l_X_1, l_Y_1, l_X_2, v115);
            end)
        };
    end, 
    GetComponents = function(v116) --[[ Line: 358 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        local l_X_3 = v116.Min.X;
        local l_X_4 = v116.Max.X;
        local l_Y_3 = v116.Min.Y;
        local l_Y_4 = v116.Max.Y;
        return v18.GetComponentsString({
            l_X_3, 
            l_Y_3, 
            l_X_4, 
            l_Y_4
        });
    end, 
    Validate = function(v121) --[[ Line: 363 ]] --[[ Name: Validate ]]
        return typeof(v121) == "Rect";
    end, 
    GetDefaultValue = function() --[[ Line: 366 ]] --[[ Name: GetDefaultValue ]]
        return Rect.new(Vector2.zero, Vector2.zero);
    end
};
v18.SelectorSchema = {
    Type = "Breadcrumb", 
    Delimiters = {
        ">>", 
        ">", 
        "::", 
        ":", 
        "%.", 
        " ", 
        "#", 
        ","
    }, 
    ErrorStyle = "PropertyCellError", 
    GetImageProps = l_Breadcrumb_0.GetSelectorIcon, 
    Name = "Selector", 
    Validate = function(v122) --[[ Line: 376 ]] --[[ Name: Validate ]]
        return typeof(v122) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 379 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.DeriveSchema = {
    Type = "Derive", 
    Validate = function(v123) --[[ Line: 385 ]] --[[ Name: Validate ]]
        local v124 = false;
        if typeof(v123) == "Instance" then
            v124 = v123:IsA("StyleSheet");
        end;
        return v124;
    end, 
    GetDefaultValue = function() --[[ Line: 388 ]] --[[ Name: GetDefaultValue ]]
        return Instance.new("StyleSheet");
    end
};
v18.FolderSchema = {
    Type = "Breadcrumb", 
    GetImageProps = function(v125) --[[ Line: 394 ]] --[[ Name: GetImageProps ]]
        -- upvalues: v14 (copy), v13 (copy), l_Attribute_0 (copy)
        return {
            Image = if v14[v125:lower()] then v14[v125:lower()]() else v13.getClassIcon("Folder"), 
            Size = l_Attribute_0
        };
    end, 
    Name = "Folder", 
    Validate = function(v126) --[[ Line: 404 ]] --[[ Name: Validate ]]
        return typeof(v126) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 407 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.StyleSheetSchema = {
    Type = "Breadcrumb", 
    GetImageProps = function(v127) --[[ Line: 413 ]] --[[ Name: GetImageProps ]]
        -- upvalues: v14 (copy), v13 (copy), l_Attribute_0 (copy)
        return {
            Image = if v14[v127:lower()] then v14[v127:lower()]() else v13.getClassIcon("StyleSheet"), 
            Size = l_Attribute_0
        };
    end, 
    Name = "StyleSheet", 
    Validate = function(v128) --[[ Line: 423 ]] --[[ Name: Validate ]]
        return typeof(v128) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 426 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.ThemeSchema = {
    Type = "Theme", 
    Validate = function(v129) --[[ Line: 432 ]] --[[ Name: Validate ]]
        return typeof(v129) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 435 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.TextSchema = {
    Type = "Text", 
    Validate = function(v130) --[[ Line: 441 ]] --[[ Name: Validate ]]
        return typeof(v130) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 444 ]] --[[ Name: GetDefaultValue ]]
        return "";
    end
};
v18.TransparencySchema = {
    Type = "Slider", 
    Min = 0, 
    Max = 1, 
    ShowInput = true, 
    InputPrecision = 3, 
    SnapIncrement = 0.05, 
    Validate = function(v131) --[[ Line: 455 ]] --[[ Name: Validate ]]
        return typeof(v131) == "number";
    end, 
    GetDefaultValue = function() --[[ Line: 458 ]] --[[ Name: GetDefaultValue ]]
        return 0;
    end
};
v18.NumberSequenceSchema = {
    Type = "NumberSequence", 
    Validate = function(v132) --[[ Line: 464 ]] --[[ Name: Validate ]]
        return typeof(v132) == "NumberSequence";
    end, 
    GetDefaultValue = function() --[[ Line: 467 ]] --[[ Name: GetDefaultValue ]]
        return NumberSequence.new(0);
    end
};
v18.UDimSchema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v133) --[[ Line: 474 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v134 = v18.GetComponentsValues(v133[1]);
        return UDim.new(v134[1], v134[2]);
    end, 
    GetChildren = function(v135, v136) --[[ Line: 478 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_3 = v18.NumberSchema;
        local l_Scale_0 = v135.Scale;
        local l_Offset_0 = v135.Offset;
        return {
            v18.CreateChildSchema("Scale", v136, l_NumberSchema_3, l_Scale_0, function(v140) --[[ Line: 482 ]]
                -- upvalues: l_Offset_0 (copy)
                return UDim.new(v140, l_Offset_0);
            end), 
            v18.CreateChildSchema("Offset", v136, l_NumberSchema_3, l_Offset_0, function(v141) --[[ Line: 485 ]]
                -- upvalues: l_Scale_0 (copy)
                return UDim.new(l_Scale_0, v141);
            end)
        };
    end, 
    GetComponents = function(v142) --[[ Line: 490 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        return v18.GetComponentsString({
            v142.Scale, 
            v142.Offset
        });
    end, 
    Validate = function(v143) --[[ Line: 493 ]] --[[ Name: Validate ]]
        return typeof(v143) == "UDim";
    end, 
    GetDefaultValue = function() --[[ Line: 496 ]] --[[ Name: GetDefaultValue ]]
        return UDim.new();
    end
};
v18.UDim2Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v144) --[[ Line: 503 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v145 = v18.GetComponentsValues(v144[1]);
        return UDim2.new(v145[1], v145[2], v145[3], v145[4]);
    end, 
    GetChildren = function(v146, v147) --[[ Line: 507 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_4 = v18.NumberSchema;
        local l_Scale_1 = v146.X.Scale;
        local l_Offset_1 = v146.X.Offset;
        local l_Scale_2 = v146.Y.Scale;
        local l_Offset_2 = v146.Y.Offset;
        return {
            v18.CreateChildSchema("X-Scale", v147, l_NumberSchema_4, l_Scale_1, function(v153) --[[ Line: 512 ]]
                -- upvalues: l_Offset_1 (copy), l_Scale_2 (copy), l_Offset_2 (copy)
                return UDim2.new(v153, l_Offset_1, l_Scale_2, l_Offset_2);
            end), 
            v18.CreateChildSchema("X-Offset", v147, l_NumberSchema_4, l_Offset_1, function(v154) --[[ Line: 515 ]]
                -- upvalues: l_Scale_1 (copy), l_Scale_2 (copy), l_Offset_2 (copy)
                return UDim2.new(l_Scale_1, v154, l_Scale_2, l_Offset_2);
            end), 
            v18.CreateChildSchema("Y-Scale", v147, l_NumberSchema_4, l_Scale_2, function(v155) --[[ Line: 518 ]]
                -- upvalues: l_Scale_1 (copy), l_Offset_1 (copy), l_Offset_2 (copy)
                return UDim2.new(l_Scale_1, l_Offset_1, v155, l_Offset_2);
            end), 
            v18.CreateChildSchema("Y-Offset", v147, l_NumberSchema_4, l_Offset_2, function(v156) --[[ Line: 521 ]]
                -- upvalues: l_Scale_1 (copy), l_Offset_1 (copy), l_Scale_2 (copy)
                return UDim2.new(l_Scale_1, l_Offset_1, l_Scale_2, v156);
            end)
        };
    end, 
    GetComponents = function(v157) --[[ Line: 526 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        local l_Scale_3 = v157.X.Scale;
        local l_Offset_3 = v157.X.Offset;
        local l_Scale_4 = v157.Y.Scale;
        local l_Offset_4 = v157.Y.Offset;
        return v18.GetComponentsString({
            l_Scale_3, 
            l_Offset_3, 
            l_Scale_4, 
            l_Offset_4
        });
    end, 
    Validate = function(v162) --[[ Line: 531 ]] --[[ Name: Validate ]]
        return typeof(v162) == "UDim2";
    end, 
    GetDefaultValue = function() --[[ Line: 534 ]] --[[ Name: GetDefaultValue ]]
        return UDim2.new();
    end
};
v18.Vector2Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v163) --[[ Line: 541 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v164 = v18.GetComponentsValues(v163[1]);
        return Vector2.new(v164[1], v164[2]);
    end, 
    GetChildren = function(v165, v166) --[[ Line: 545 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_5 = v18.NumberSchema;
        local l_X_5 = v165.X;
        local l_Y_5 = v165.Y;
        return {
            v18.CreateChildSchema("X", v166, l_NumberSchema_5, l_X_5, function(v170) --[[ Line: 549 ]]
                -- upvalues: l_Y_5 (copy)
                return Vector2.new(v170, l_Y_5);
            end), 
            v18.CreateChildSchema("Y", v166, l_NumberSchema_5, l_Y_5, function(v171) --[[ Line: 552 ]]
                -- upvalues: l_X_5 (copy)
                return Vector2.new(l_X_5, v171);
            end)
        };
    end, 
    GetComponents = function(v172) --[[ Line: 557 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        return v18.GetComponentsString({
            v172.X, 
            v172.Y
        });
    end, 
    Validate = function(v173) --[[ Line: 560 ]] --[[ Name: Validate ]]
        return typeof(v173) == "Vector2";
    end, 
    GetDefaultValue = function() --[[ Line: 563 ]] --[[ Name: GetDefaultValue ]]
        return Vector2.new();
    end
};
v18.Vector3Schema = {
    Type = "Vector", 
    Components = {
        ""
    }, 
    GetValue = function(v174) --[[ Line: 570 ]] --[[ Name: GetValue ]]
        -- upvalues: v18 (copy)
        local v175 = v18.GetComponentsValues(v174[1]);
        return (Vector3.new(v175[1], v175[2], v175[3]));
    end, 
    GetChildren = function(v176, v177) --[[ Line: 574 ]] --[[ Name: GetChildren ]]
        -- upvalues: v18 (copy)
        local l_NumberSchema_6 = v18.NumberSchema;
        local l_X_6 = v176.X;
        local l_Y_6 = v176.Y;
        local l_Z_1 = v176.Z;
        return {
            v18.CreateChildSchema("X", v177, l_NumberSchema_6, l_X_6, function(v182) --[[ Line: 578 ]]
                -- upvalues: l_Y_6 (copy), l_Z_1 (copy)
                return (Vector3.new(v182, l_Y_6, l_Z_1));
            end), 
            v18.CreateChildSchema("Y", v177, l_NumberSchema_6, l_Y_6, function(v183) --[[ Line: 581 ]]
                -- upvalues: l_X_6 (copy), l_Z_1 (copy)
                return (Vector3.new(l_X_6, v183, l_Z_1));
            end), 
            v18.CreateChildSchema("Z", v177, l_NumberSchema_6, l_Z_1, function(v184) --[[ Line: 584 ]]
                -- upvalues: l_X_6 (copy), l_Y_6 (copy)
                return (Vector3.new(l_X_6, l_Y_6, v184));
            end)
        };
    end, 
    GetComponents = function(v185) --[[ Line: 589 ]] --[[ Name: GetComponents ]]
        -- upvalues: v18 (copy)
        return v18.GetComponentsString({
            v185.X, 
            v185.Y, 
            v185.Z
        });
    end, 
    Validate = function(v186) --[[ Line: 592 ]] --[[ Name: Validate ]]
        return typeof(v186) == "Vector3";
    end, 
    GetDefaultValue = function() --[[ Line: 595 ]] --[[ Name: GetDefaultValue ]]
        return (Vector3.new());
    end
};
v18.TokenReferenceSchema = {
    Type = "TokenReference", 
    ErrorStyle = "PropertyCellError", 
    HideSelfTokens = false, 
    Validate = function(v187) --[[ Line: 604 ]] --[[ Name: Validate ]]
        return typeof(v187) == "string";
    end, 
    GetDefaultValue = function() --[[ Line: 607 ]] --[[ Name: GetDefaultValue ]]
        return "$";
    end
};
v18.createClassProperties = function(v188) --[[ Line: 612 ]] --[[ Name: createClassProperties ]]
    -- upvalues: v18 (copy), l_forEach_0 (copy), l_ReflectionService_0 (copy)
    if v18.allProperties[v188] then
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 617 ]]
            -- upvalues: v188 (copy)
            return Instance.new(v188);
        end);
        if not l_status_0 or not l_result_0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 621 ]]
                -- upvalues: v188 (copy)
                return game:GetService(v188);
            end);
            l_status_0 = l_status_1;
            l_result_0 = l_result_1;
        end;
        if not l_status_0 or not l_result_0 then
            return;
        else
            local function _(v193, v194) --[[ Line: 630 ]] --[[ Name: addPropertyType ]]
                -- upvalues: v18 (ref)
                if typeof(v18.possiblePropertyTypes[v193]) ~= "table" then
                    v18.possiblePropertyTypes[v193] = {};
                end;
                v18.possiblePropertyTypes[v193][v194] = true;
            end;
            local v196 = {};
            l_forEach_0(l_ReflectionService_0:GetPropertyNames(v188), function(v197) --[[ Line: 639 ]]
                -- upvalues: l_status_0 (ref), l_result_0 (ref), v18 (ref), v196 (copy)
                if v197:sub(1, 1) == v197:sub(1, 1):lower() then
                    return;
                else
                    local v198 = nil;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 646 ]]
                        -- upvalues: l_result_0 (ref), v197 (copy)
                        return l_result_0[v197];
                    end);
                    l_status_0 = l_status_2;
                    v198 = l_result_2;
                    if not l_status_0 or v198 == nil then
                        return;
                    else
                        l_status_2 = typeof(v198);
                        if typeof(v18.possiblePropertyTypes[v197]) ~= "table" then
                            v18.possiblePropertyTypes[v197] = {};
                        end;
                        v18.possiblePropertyTypes[v197][l_status_2] = true;
                        for _, v202 in v18.OverridenSchemas do
                            if v202.Property == v197 and typeof(v198) == v202.Type then
                                v196[v197] = v202.Schema;
                                return;
                            end;
                        end;
                        if typeof(v198) == "EnumItem" then
                            v196[v197] = v18.CreateSelectSchema(v198);
                            return;
                        else
                            v196[v197] = v18.getAttributeSchema(v198);
                            return;
                        end;
                    end;
                end;
            end);
            v18.allProperties[v188] = v196;
            pcall(function() --[[ Line: 669 ]]
                -- upvalues: l_result_0 (ref)
                l_result_0:Remove();
            end);
            return;
        end;
    end;
end;
v18.getPropertySchema = function(v203, v204) --[[ Line: 674 ]] --[[ Name: getPropertySchema ]]
    -- upvalues: v18 (copy)
    if v204 == nil or v204 == "" then
        for _, v206 in v18.allProperties do
            if v206[v203] then
                return v206[v203];
            end;
        end;
    else
        v18.createClassProperties(v204);
        local v207 = v18.allProperties[v204];
        if v207 then
            return v207[v203];
        end;
    end;
    return nil;
end;
v18.getPropertyNames = function(v208) --[[ Line: 692 ]] --[[ Name: getPropertyNames ]]
    -- upvalues: v18 (copy), l_append_0 (copy), l_keys_0 (copy), l_collectSet_0 (copy), l_startsWith_0 (copy), l_trim_0 (copy)
    local v209 = {};
    if not v208 or v208 == "" then
        for v210, _ in pairs(v18.allProperties) do
            v209 = l_append_0(v209, l_keys_0(v18.allProperties[v210]));
        end;
        return (l_keys_0(l_collectSet_0(v209)));
    else
        if l_startsWith_0(v208, "::") then
            v208 = l_trim_0(v208:sub(3));
        end;
        v18.createClassProperties(v208);
        if v18.allProperties[v208] then
            v209 = l_keys_0(v18.allProperties[v208]);
        end;
        return v209;
    end;
end;
v18.getPossiblePropertyTypes = function(v212) --[[ Line: 712 ]] --[[ Name: getPossiblePropertyTypes ]]
    -- upvalues: v18 (copy), l_keys_0 (copy)
    local v213 = v18.possiblePropertyTypes[v212] or {};
    return l_keys_0(v213);
end;
v18.getAttributeSchema = function(v214) --[[ Line: 717 ]] --[[ Name: getAttributeSchema ]]
    -- upvalues: v18 (copy)
    if typeof(v214) == "string" then
        if v214:sub(1, 1) == "$" then
            return v18.TokenReferenceSchema;
        else
            return v18.TextSchema;
        end;
    elseif typeof(v214) == "EnumItem" then
        return v18.CreateSelectSchema(v214);
    elseif v18.PropertySchemas[typeof(v214)] then
        return v18.PropertySchemas[typeof(v214)];
    else
        return v18.SelectTokenSchema;
    end;
end;
v18.OverridenSchemas = {
    {
        Property = "Transparency", 
        Type = "number", 
        Schema = v18.TransparencySchema
    }, 
    {
        Property = "BackgroundTransparency", 
        Type = "number", 
        Schema = v18.TransparencySchema
    }
};
v18.PropertySchemas = {
    Token = v18.TokenReferenceSchema, 
    boolean = v18.CheckboxSchema, 
    BrickColor = v18.BrickColorSchema, 
    CFrame = v18.CFrameSchema, 
    Color3 = v18.ColorSchema, 
    ColorSequence = v18.ColorSequenceSchema, 
    NumberRange = v18.NumberRangeSchema, 
    NumberSequence = v18.NumberSequenceSchema, 
    Font = v18.FontSchema, 
    number = v18.NumberSchema, 
    string = v18.TextSchema, 
    Rect = v18.RectSchema, 
    UDim = v18.UDimSchema, 
    UDim2 = v18.UDim2Schema, 
    Vector2 = v18.Vector2Schema, 
    Vector3 = v18.Vector3Schema
};
v18.SelectTokenSchema = {
    Type = "Select", 
    Items = v16(l_collectArray_0(v18.PropertySchemas, function(v215, v216) --[[ Line: 768 ]]
        return {
            Id = v216, 
            Label = v215
        };
    end)), 
    PlaceholderText = "Select Type...", 
    Validate = function(_) --[[ Line: 775 ]] --[[ Name: Validate ]]
        return true;
    end, 
    GetDefaultValue = function() --[[ Line: 778 ]] --[[ Name: GetDefaultValue ]]
        return nil;
    end
};
l_forEach_0({
    "Frame", 
    "ImageButton", 
    "ImageLabel", 
    "Part", 
    "ScrollingFrame", 
    "TextBox", 
    "TextButton", 
    "TextLabel"
}, function(v218) --[[ Line: 795 ]]
    -- upvalues: v18 (copy)
    v18.createClassProperties(v218);
end);
return v18;