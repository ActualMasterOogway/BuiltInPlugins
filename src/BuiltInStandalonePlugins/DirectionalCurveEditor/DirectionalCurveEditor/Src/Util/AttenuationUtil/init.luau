local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
local v9 = {
    setDistanceAttenuation = function(v3, v4) --[[ Line: 22 ]] --[[ Name: setDistanceAttenuation ]]
        -- upvalues: v1 (copy)
        if v3:IsA(v1.EMITTER) then
            v3:SetDistanceAttenuation(v4);
            return;
        elseif v3:IsA(v1.LISTENER) then
            return;
        else
            assert(false, "DirectionalCurveEditor only supports emitters and listeners");
            return;
        end;
    end, 
    getDistanceAttenuation = function(v5) --[[ Line: 32 ]] --[[ Name: getDistanceAttenuation ]]
        -- upvalues: v1 (copy)
        if v5:IsA(v1.EMITTER) then
            return (v5:GetDistanceAttenuation());
        elseif v5:IsA(v1.LISTENER) then
            return {};
        else
            assert(false, "DirectionalCurveEditor only supports emitters and listeners");
            return;
        end;
    end, 
    setAngleAttenuation = function(v6, v7) --[[ Line: 42 ]] --[[ Name: setAngleAttenuation ]]
        -- upvalues: v1 (copy)
        if v6:IsA(v1.EMITTER) then
            v6:SetAngleAttenuation(v7);
            return;
        elseif v6:IsA(v1.LISTENER) then
            v6:SetAngleAttenuation(v7);
            return;
        else
            assert(false, "DirectionalCurveEditor only supports emitters and listeners");
            return;
        end;
    end, 
    getAngleAttenuation = function(v8) --[[ Line: 52 ]] --[[ Name: getAngleAttenuation ]]
        -- upvalues: v1 (copy)
        if v8:IsA(v1.EMITTER) then
            return (v8:GetAngleAttenuation());
        elseif v8:IsA(v1.LISTENER) then
            return (v8:GetAngleAttenuation());
        else
            assert(false, "DirectionalCurveEditor only supports emitters and listeners");
            return;
        end;
    end
};
v9.getInstanceData = function(v10) --[[ Line: 62 ]] --[[ Name: getInstanceData ]]
    -- upvalues: v1 (copy), v9 (copy)
    local l_NO_INSTANCE_0 = v1.NO_INSTANCE;
    if v10:IsA(v1.EMITTER) then
        l_NO_INSTANCE_0 = v1.EMITTER;
    elseif v10:IsA(v1.LISTENER) then
        l_NO_INSTANCE_0 = v1.LISTENER;
    else
        assert(false, "DirectionalCurveEditor only supports emitters and listeners");
    end;
    return {
        InstanceType = l_NO_INSTANCE_0, 
        DistanceCurve = v9.stringifyCurveTable(v9.getDistanceAttenuation(v10)), 
        AngleCurve = v9.stringifyCurveTable(v9.getAngleAttenuation(v10))
    };
end;
v9.areKeypointsEqual = function(v12, v13) --[[ Line: 79 ]] --[[ Name: areKeypointsEqual ]]
    local v14 = #v12;
    if v14 ~= #v13 then
        return false;
    else
        for v15 = 1, v14 do
            if (v12[v15] - v13[v15]).Magnitude > 0.001 then
                return false;
            end;
        end;
        return true;
    end;
end;
v9.stringifyCurveTable = function(v16) --[[ Line: 95 ]] --[[ Name: stringifyCurveTable ]]
    local v17 = {};
    for v18, v19 in v16 do
        local v20 = tostring(v18);
        if not v20 then
            print((("%* couldn't be converted to a string!"):format(v18)));
        else
            v17[v20] = v19;
        end;
    end;
    return v17;
end;
v9.destringifyCurveTable = function(v21) --[[ Line: 108 ]] --[[ Name: destringifyCurveTable ]]
    local v22 = {};
    for v23, v24 in v21 do
        local v25 = tonumber(v23);
        if not v25 then
            print((("%* couldn't be converted to a number!"):format(v23)));
        else
            v22[v25] = v24;
        end;
    end;
    return v22;
end;
v9.tableToKeypoints = function(v26) --[[ Line: 121 ]] --[[ Name: tableToKeypoints ]]
    local v27 = {};
    for v28, v29 in v26 do
        table.insert(v27, Vector2.new(v28, v29));
    end;
    table.sort(v27, function(v30, v31) --[[ Line: 126 ]]
        return v30.X < v31.X;
    end);
    return v27;
end;
v9.keypointsToTable = function(v32) --[[ Line: 132 ]] --[[ Name: keypointsToTable ]]
    -- upvalues: v2 (copy)
    local v33 = {};
    for _, v35 in v32 do
        v33[v2(v35.X, 3)] = v2(v35.Y, 3);
    end;
    return v33;
end;
v9.keypointsToStrTable = function(v36) --[[ Line: 143 ]] --[[ Name: keypointsToStrTable ]]
    -- upvalues: v9 (copy)
    return v9.stringifyCurveTable(v9.keypointsToTable(v36));
end;
v9.strTableToKeypoints = function(v37) --[[ Line: 147 ]] --[[ Name: strTableToKeypoints ]]
    -- upvalues: v9 (copy)
    return v9.tableToKeypoints(v9.destringifyCurveTable(v37));
end;
return v9;