local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Form_0 = v1.UI.Form;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.OptionsContext);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorFixOptionsValidation);
local function _(v8) --[[ Line: 30 ]] --[[ Name: isValidRotationAngle ]]
    local v9 = false;
    if v8 >= -360 then
        v9 = v8 <= 360;
    end;
    return v9;
end;
local function v17(v11, v12) --[[ Line: 34 ]] --[[ Name: updateItemsFromContext ]]
    local l_Children_0 = v11[1].Children;
    l_Children_0[1].Value = v12.randomizeSeed;
    l_Children_0[2].Disabled = v12.randomizeSeed;
    l_Children_0[2].Value = v12.seed;
    local v14, v15, v16 = v12.rotation:ToEulerAnglesYXZ();
    l_Children_0[3].Value = Vector3.new(math.deg(v14), math.deg(v15), (math.deg(v16)));
    l_Children_0[4].Value = v12.smartUVUnwrap;
    l_Children_0[5].Value = v12.promptMasking;
end;
local function v27(v18, v19, v20) --[[ Line: 48 ]] --[[ Name: updateContextFromItems ]]
    local l_Children_1 = v19[1].Children;
    v18.setRandomizeSeed(l_Children_1[1].Value);
    v18.setSeed(l_Children_1[2].Value);
    if l_Children_1[1].Value then
        v18.setValidSeed(true);
    else
        l_Children_1[2].Validate(v20);
    end;
    local l_Value_0 = l_Children_1[3].Value;
    local v23 = (l_Value_0.X + 180) % 360 - 180;
    local v24 = (l_Value_0.Y + 180) % 360 - 180;
    local v25 = (l_Value_0.Z + 180) % 360 - 180;
    local v26 = CFrame.fromEulerAnglesYXZ(math.rad(v23), math.rad(v24), (math.rad(v25)));
    v18.setRotation(v26);
    v18.setSmartUVUnwrap(l_Children_1[4].Value);
    v18.setPromptMasking(l_Children_1[5].Value);
end;
local function v40(v28, v29, v30, v31) --[[ Line: 72 ]] --[[ Name: createFormItems ]]
    -- upvalues: v7 (copy), v5 (copy)
    return {
        {
            Id = "Advanced Options", 
            Label = v28:getText("Options", "AdvancedOptions"), 
            Children = {
                {
                    Id = "RandomizeSeed", 
                    Label = v28:getText("Options", "RandomizeSeed"), 
                    Tooltip = v28:getText("Options", "RandomizeSeedTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }, 
                {
                    Id = "Seed", 
                    Disabled = true, 
                    Label = v28:getText("Options", "Seed"), 
                    Validate = if v7() then v31.Seed else function(v32) --[[ Line: 97 ]]
                        -- upvalues: v30 (copy), v29 (copy), v28 (copy), v5 (ref)
                        if type(v32) ~= "number" then
                            v30(v32);
                            v29.setValidSeed(false);
                            return Enum.PropertyStatus.Error, v28:getText("Options", "SeedNotANumber");
                        elseif v32 < 0 or v5.MAX_SEED_VALUE < v32 then
                            v30(v32);
                            v29.setValidSeed(false);
                            return Enum.PropertyStatus.Error, v28:getText("Options", "SeedOutOfRange");
                        else
                            v30(v32);
                            v29.setValidSeed(true);
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end, 
                    Schema = {
                        Type = "Number"
                    }
                }, 
                {
                    Id = "Rotation", 
                    Label = v28:getText("Options", "Rotation"), 
                    Validate = if v7() then v31.Rotation else function(v33) --[[ Line: 121 ]]
                        -- upvalues: v29 (copy), v28 (copy)
                        if type(v33.X) ~= "number" or type(v33.Y) ~= "number" or type(v33.Z) ~= "number" then
                            v29.setValidRotation(false);
                            return Enum.PropertyStatus.Error, v28:getText("Options", "RotationAnglesNotNumbers");
                        else
                            local l_X_0 = v33.X;
                            local v35 = false;
                            if l_X_0 >= -360 then
                                v35 = l_X_0 <= 360;
                            end;
                            if v35 then
                                l_X_0 = v33.Y;
                                v35 = false;
                                if l_X_0 >= -360 then
                                    v35 = l_X_0 <= 360;
                                end;
                                if v35 then
                                    l_X_0 = v33.Z;
                                    v35 = false;
                                    if l_X_0 >= -360 then
                                        v35 = l_X_0 <= 360;
                                    end;
                                    if v35 then
                                        v29.setValidRotation(true);
                                        return Enum.PropertyStatus.Ok, "";
                                    end;
                                end;
                            end;
                            v29.setValidRotation(false);
                            return Enum.PropertyStatus.Error, v28:getText("Options", "RotationAnglesOutOfRange");
                        end;
                    end, 
                    Schema = {
                        Type = "Vector", 
                        Components = {
                            "X", 
                            "Y", 
                            "Z"
                        }, 
                        GetValue = function(v36) --[[ Line: 142 ]] --[[ Name: GetValue ]]
                            if type(v36[1]) == "number" and type(v36[2]) == "number" and type(v36[3]) == "number" then
                                local v37 = v36[1];
                                local v38 = false;
                                if v37 >= -360 then
                                    v38 = v37 <= 360;
                                end;
                                if v38 then
                                    v37 = v36[2];
                                    v38 = false;
                                    if v37 >= -360 then
                                        v38 = v37 <= 360;
                                    end;
                                    if v38 then
                                        v37 = v36[3];
                                        v38 = false;
                                        if v37 >= -360 then
                                            v38 = v37 <= 360;
                                        end;
                                        if v38 then
                                            return (Vector3.new(v36[1], v36[2], v36[3]));
                                        end;
                                    end;
                                end;
                            end;
                            return {
                                X = v36[1], 
                                Y = v36[2], 
                                Z = v36[3]
                            };
                        end, 
                        GetComponents = function(v39) --[[ Line: 159 ]] --[[ Name: GetComponents ]]
                            return {
                                v39.X, 
                                v39.Y, 
                                v39.Z
                            };
                        end
                    }
                }, 
                {
                    Id = "SmartUVUnwrap", 
                    Label = v28:getText("Options", "SmartUVUnwrap"), 
                    Tooltip = v28:getText("Options", "SmartUVUnwrapTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }, 
                {
                    Id = "PromptMasking", 
                    Label = v28:getText("Options", "PromptMasking"), 
                    Tooltip = v28:getText("Options", "PromptMaskingTooltip"), 
                    Schema = {
                        Type = "Checkbox"
                    }
                }
            }
        }
    };
end;
return function(v41) --[[ Line: 185 ]] --[[ Name: Options ]]
    -- upvalues: v2 (copy), v6 (copy), l_Localization_0 (copy), v5 (copy), v40 (copy), v17 (copy), v27 (copy), l_Form_0 (copy)
    local v42 = v2.useContext(v6);
    local v43 = l_Localization_0:use();
    local v44, v45 = v2.useState({});
    local v46, v47 = v2.useState(0);
    local v49 = v2.useCallback(function(v48) --[[ Line: 193 ]]
        -- upvalues: v47 (copy), v42 (copy), v43 (copy), v5 (ref)
        if type(v48) ~= "number" then
            v47(v48);
            v42.setValidSeed(false);
            return Enum.PropertyStatus.Error, v43:getText("Options", "SeedNotANumber");
        elseif v48 < 0 or v5.MAX_SEED_VALUE < v48 then
            v47(v48);
            v42.setValidSeed(false);
            return Enum.PropertyStatus.Error, v43:getText("Options", "SeedOutOfRange");
        else
            v47(v48);
            v42.setValidSeed(true);
            return Enum.PropertyStatus.Ok, "";
        end;
    end, {
        v42.setValidSeed
    });
    local v53 = v2.useCallback(function(v50) --[[ Line: 209 ]]
        -- upvalues: v42 (copy), v43 (copy)
        if type(v50.X) ~= "number" or type(v50.Y) ~= "number" or type(v50.Z) ~= "number" then
            v42.setValidRotation(false);
            return Enum.PropertyStatus.Error, v43:getText("Options", "RotationAnglesNotNumbers");
        else
            local l_X_1 = v50.X;
            local v52 = false;
            if l_X_1 >= -360 then
                v52 = l_X_1 <= 360;
            end;
            if v52 then
                l_X_1 = v50.Y;
                v52 = false;
                if l_X_1 >= -360 then
                    v52 = l_X_1 <= 360;
                end;
                if v52 then
                    l_X_1 = v50.Z;
                    v52 = false;
                    if l_X_1 >= -360 then
                        v52 = l_X_1 <= 360;
                    end;
                    if v52 then
                        v42.setValidRotation(true);
                        return Enum.PropertyStatus.Ok, "";
                    end;
                end;
            end;
            v42.setValidRotation(false);
            return Enum.PropertyStatus.Error, v43:getText("Options", "RotationAnglesOutOfRange");
        end;
    end, {
        v42.setValidRotation
    });
    local v54 = v2.useMemo(function() --[[ Line: 225 ]]
        -- upvalues: v49 (copy), v53 (copy)
        return {
            Seed = v49, 
            Rotation = v53
        };
    end, {
        v49, 
        v53
    });
    local v56 = v2.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: v40 (ref), v43 (copy), v42 (copy), v47 (copy), v54 (copy), v17 (ref)
        local v55 = v40(v43, v42, v47, v54);
        v17(v55, v42);
        return v55;
    end, {
        v42
    });
    local v58 = v2.useCallback(function(v57) --[[ Line: 238 ]]
        -- upvalues: v27 (ref), v42 (copy), v46 (copy)
        v27(v42, v57, v46);
    end, {
        v42, 
        v46
    });
    v2.useEffect(function() --[[ Line: 245 ]]
        -- upvalues: v42 (copy)
        v42.setValidRotation(true);
        v42.setValidSeed(true);
    end, {
        v44
    });
    return v2.createElement(l_Form_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Expansion = v44, 
        ExpandByDefault = false, 
        Items = v56, 
        LabelHeight = 24, 
        LabelWidth = UDim.new(0, 164), 
        LayoutOrder = v41.LayoutOrder, 
        OnChange = v58, 
        OnExpansionChange = v45, 
        Size = UDim2.fromScale(1, 0), 
        UseScrollingFrame = false
    });
end;