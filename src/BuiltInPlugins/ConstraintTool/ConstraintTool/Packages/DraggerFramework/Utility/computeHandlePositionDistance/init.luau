local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.getFFlagDraggerHandleTracking);
local function _(v2, v3, v4, v5) --[[ Line: 91 ]] --[[ Name: getResultIfHandleScalesSame ]]
    return v5 - (v4 - (v3 - v2).Magnitude);
end;
return function(v7, v8, v9, v10, v11, v12, v13) --[[ Line: 97 ]] --[[ Name: computeHandlePositionDistance ]]
    -- upvalues: v1 (copy)
    assert(v1());
    if not v7 or math.abs(v11) < 0.001 then
        return v13 - (v12 - (v10 - v8).Magnitude);
    else
        local l_CFrame_0 = v7.CFrame;
        local l_LookVector_0 = l_CFrame_0.LookVector;
        local v16 = math.sin((math.rad(v7.FieldOfView))) * 0.05;
        local v17 = v16 * l_CFrame_0.Position:Dot(l_LookVector_0);
        local v18 = v8 + v12 * v9;
        local v19 = v8 + v13 * v9;
        local v20 = (v18 - v10):Dot(v9) / v11;
        local v21 = v19:Dot(v9) + v20 * v17;
        local v22 = v20 * v16 * l_LookVector_0 + v9;
        local v23 = v9:Dot(v22);
        if math.abs(v23) < 0.001 then
            return v13 - (v12 - (v10 - v8).Magnitude);
        else
            return (v21 - v8:Dot(v22)) / v23;
        end;
    end;
end;