local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateAddSpecificPropertyRequirements);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.valueToString);
local function _(v7, v8) --[[ Line: 17 ]] --[[ Name: floatEq ]]
    return math.abs(v7 - v8) <= 1.0E-5;
end;
local function _(v10, v11) --[[ Line: 21 ]] --[[ Name: v3FloatEq ]]
    return math.abs(v10.X - v11.X) <= 1.0E-5 and math.abs(v10.Y - v11.Y) <= 1.0E-5 and math.abs(v10.Z - v11.Z) <= 1.0E-5;
end;
local function _(v13, v14) --[[ Line: 25 ]] --[[ Name: c3FloatEq ]]
    return math.abs(v13.R - v14.R) <= 1.0E-5 and math.abs(v13.G - v14.G) <= 1.0E-5 and math.abs(v13.B - v14.B) <= 1.0E-5;
end;
local function v18(v16, v17) --[[ Line: 29 ]] --[[ Name: propEq ]]
    -- upvalues: v1 (copy)
    if v17 == v1.None then
        return v16 == nil;
    elseif typeof(v17) == "number" then
        return math.abs(v16 - v17) <= 1.0E-5;
    elseif typeof(v17) == "Vector3" then
        return math.abs(v16.X - v17.X) <= 1.0E-5 and math.abs(v16.Y - v17.Y) <= 1.0E-5 and math.abs(v16.Z - v17.Z) <= 1.0E-5;
    elseif typeof(v17) == "Color3" then
        return math.abs(v16.R - v17.R) <= 1.0E-5 and math.abs(v16.G - v17.G) <= 1.0E-5 and math.abs(v16.B - v17.B) <= 1.0E-5;
    else
        return v16 == v17;
    end;
end;
local function _(v19, v20, v21, v22) --[[ Line: 43 ]] --[[ Name: getSpecificExpectedValue ]]
    -- upvalues: v4 (copy)
    if not v22 or not v4.SPECIFIC_PROPERTIES[v22] or not v4.SPECIFIC_PROPERTIES[v22][v20] or not v4.SPECIFIC_PROPERTIES[v22][v20][v21] then
        return v19;
    else
        return v4.SPECIFIC_PROPERTIES[v22][v20][v21];
    end;
end;
return function(v24, v25, v26) --[[ Line: 61 ]] --[[ Name: validateProperties ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v18 (copy), v6 (copy)
    local l_v24_Descendants_0 = v24:GetDescendants();
    table.insert(l_v24_Descendants_0, v24);
    for _, v29 in pairs(l_v24_Descendants_0) do
        for v30, v31 in pairs(v4.PROPERTIES) do
            if v29:IsA(v30) then
                for v32, v33 in pairs(v31) do
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 75 ]]
                        -- upvalues: v29 (copy), v32 (copy)
                        return v29[v32];
                    end);
                    if not l_status_0 then
                        v3.reportFailure(v3.ErrorType.validateProperties_PropertyDoesNotExist, nil, v26);
                        return false, {
                            string.format("Property '%s' does not exist on type '%s'. Delete the property and try again.", v32, v29.ClassName)
                        };
                    else
                        local l_v33_0 = v33;
                        if v2() then
                            l_v33_0 = if v25 and v4.SPECIFIC_PROPERTIES[v25] and v4.SPECIFIC_PROPERTIES[v25][v30] and v4.SPECIFIC_PROPERTIES[v25][v30][v32] then v4.SPECIFIC_PROPERTIES[v25][v30][v32] else v33;
                            if l_v33_0 == v4.PROPERTIES_UNRESTRICTED then
                                continue;
                            end;
                        end;
                        if not v18(l_result_0, l_v33_0) then
                            v3.reportFailure(v3.ErrorType.validateProperties_PropertyMismatch, nil, v26);
                            return false, {
                                string.format("Tying to access property '%s.%s' using the incorrect type for it. Expected '%s' to be '%s'.", v29:GetFullName(), v32, v32, v6(l_v33_0))
                            };
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;