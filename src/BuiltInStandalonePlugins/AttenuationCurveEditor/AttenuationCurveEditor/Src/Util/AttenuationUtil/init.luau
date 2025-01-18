local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
local v6 = {
    setDistanceAttenuation = function(v3, v4) --[[ Line: 20 ]] --[[ Name: setDistanceAttenuation ]]
        if v3:IsA("AudioEmitter") then
            v3:SetDistanceAttenuation(v4);
            return;
        else
            if v3:IsA("AudioListener") then
                v3:SetDistanceAttenuation(v4);
            end;
            return;
        end;
    end, 
    getDistanceAttenuation = function(v5) --[[ Line: 28 ]] --[[ Name: getDistanceAttenuation ]]
        if v5:IsA("AudioEmitter") then
            return v5:GetDistanceAttenuation();
        elseif v5:IsA("AudioListener") then
            return v5:GetDistanceAttenuation();
        else
            return {};
        end;
    end
};
v6.areCurvesEqual = function(v7, v8) --[[ Line: 37 ]] --[[ Name: areCurvesEqual ]]
    -- upvalues: v6 (copy)
    local l_Keypoints_0 = v6.tableToCurve(v7).Keypoints;
    local l_Keypoints_1 = v6.tableToCurve(v8).Keypoints;
    local v11 = #l_Keypoints_0;
    if v11 ~= #l_Keypoints_1 then
        return false;
    else
        for v12 = 1, v11 do
            if (l_Keypoints_0[v12] - l_Keypoints_1[v12]).Magnitude > 0.001 then
                return false;
            end;
        end;
        return true;
    end;
end;
v6.stringifyCurveTable = function(v13) --[[ Line: 56 ]] --[[ Name: stringifyCurveTable ]]
    local v14 = {};
    for v15, v16 in v13 do
        local v17 = tostring(v15);
        if not v17 then
            print((("%* couldn't be converted to a string!"):format(v15)));
        else
            v14[v17] = v16;
        end;
    end;
    return v14;
end;
v6.destringifyCurveTable = function(v18) --[[ Line: 69 ]] --[[ Name: destringifyCurveTable ]]
    local v19 = {};
    for v20, v21 in v18 do
        local v22 = tonumber(v20);
        if not v22 then
            print((("%* couldn't be converted to a number!"):format(v20)));
        else
            v19[v22] = v21;
        end;
    end;
    return v19;
end;
v6.curveToTable = function(v23) --[[ Line: 82 ]] --[[ Name: curveToTable ]]
    -- upvalues: v2 (copy)
    local v24 = {};
    for _, v26 in v23.Keypoints do
        v24[v2(v26.X, 3)] = v2(v26.Y, 3);
    end;
    return v24;
end;
v6.tableToCurve = function(v27) --[[ Line: 93 ]] --[[ Name: tableToCurve ]]
    local v28 = {};
    for v29, v30 in v27 do
        table.insert(v28, Vector2.new(v29, v30));
    end;
    table.sort(v28, function(v31, v32) --[[ Line: 98 ]]
        return v31.X < v32.X;
    end);
    return {
        Keypoints = v28
    };
end;
v6.keypointsToStrTable = function(v33) --[[ Line: 106 ]] --[[ Name: keypointsToStrTable ]]
    -- upvalues: v6 (copy)
    return v6.stringifyCurveTable(v6.curveToTable({
        Keypoints = v33
    }));
end;
v6.strTableToKeypoints = function(v34) --[[ Line: 112 ]] --[[ Name: strTableToKeypoints ]]
    -- upvalues: v6 (copy)
    return v6.tableToCurve(v6.destringifyCurveTable(v34)).Keypoints;
end;
return v6;