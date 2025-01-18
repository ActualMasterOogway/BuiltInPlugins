local function v9(v0, v1, v2, v3) --[[ Line: 12 ]] --[[ Name: intersectPlanePlane ]]
    local l_Unit_0 = v1:Cross(v3).Unit;
    local l_Unit_1 = v1:Cross(l_Unit_0).Unit;
    local l_Unit_2 = v3:Cross(l_Unit_0).Unit;
    local v7 = l_Unit_1:Dot(l_Unit_2);
    local v8 = v0 - v2;
    return v2 + l_Unit_2 * ((v8:Dot(l_Unit_2) - v7 * v8:Dot(l_Unit_1)) / (1 - v7 * v7)), l_Unit_0;
end;
local function _(v10, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: intersectRayPlane ]]
    return (v12 - v10):Dot(v13) / v11:Dot(v13);
end;
local function v57(v15, v16, v17, v18, v19, v20, v21) --[[ Line: 55 ]] --[[ Name: exploreEdge ]]
    local v22 = v15.Size.Magnitude + 0.01;
    local v23 = -1e999;
    local v24 = 1e999;
    local v25 = RaycastParams.new();
    v25.FilterType = Enum.RaycastFilterType.Whitelist;
    v25.BruteForceAllSlow = true;
    v25.CollisionGroup = "StudioSelectable";
    v25.FilterDescendantsInstances = {
        v15
    };
    local l_Unit_3 = (v18 + v19).Unit;
    local v27 = v16 + l_Unit_3 * 0.01;
    local v28 = workspace:Raycast(v27 + v20 * 0.01, v17 * v22, v25);
    if v28 then
        local l_Position_0 = v28.Position;
        local l_Normal_0 = v28.Normal;
        v24 = math.min(v24, (l_Position_0 - v16):Dot(l_Normal_0) / v17:Dot(l_Normal_0));
    end;
    local v31 = workspace:Raycast(v27 + v21 * 0.01, v17 * v22, v25);
    if v31 then
        local l_Position_1 = v31.Position;
        local l_Normal_1 = v31.Normal;
        v24 = math.min(v24, (l_Position_1 - v16):Dot(l_Normal_1) / v17:Dot(l_Normal_1));
    end;
    local v34 = 0.01;
    for _ = 1, 14 do
        if v24 >= v34 then
            local v36 = workspace:Raycast(v27 + v17 * v34, -l_Unit_3 * 2 * 0.01, v25);
            if not v36 or v36.Distance > 0.02 then
                local v37 = v27 + v17 * v34;
                v37 = if v36 then v37 - l_Unit_3 * v36.Distance else v37 - l_Unit_3 * 2 * 0.01;
                local v38 = workspace:Raycast(v37, v16 - v37, v25);
                if v38 and v38.Normal:Dot(l_Unit_3) < 0.8 then
                    local l_Position_2 = v38.Position;
                    local l_Normal_2 = v38.Normal;
                    v24 = math.min(v24, (l_Position_2 - v16):Dot(l_Normal_2) / v17:Dot(l_Normal_2));
                    break;
                else
                    break;
                end;
            else
                v34 = v34 * 2.28;
            end;
        else
            break;
        end;
    end;
    local v41 = workspace:Raycast(v27 + v20 * 0.01, -v17 * v22, v25);
    if v41 then
        local l_Position_3 = v41.Position;
        local l_Normal_3 = v41.Normal;
        v23 = math.max(v23, (l_Position_3 - v16):Dot(l_Normal_3) / v17:Dot(l_Normal_3));
    end;
    local v44 = workspace:Raycast(v27 + v21 * 0.01, -v17 * v22, v25);
    if v44 then
        local l_Position_4 = v44.Position;
        local l_Normal_4 = v44.Normal;
        v23 = math.max(v23, (l_Position_4 - v16):Dot(l_Normal_4) / v17:Dot(l_Normal_4));
    end;
    local v47 = 0.01;
    for _ = 1, 14 do
        if -v47 >= v23 then
            local v49 = workspace:Raycast(v27 - v17 * v47, -l_Unit_3 * 2 * 0.01, v25);
            if not v49 or v49.Distance > 0.02 then
                local v50 = v27 - v17 * v47;
                v50 = if v49 then v50 - l_Unit_3 * v49.Distance else v50 - l_Unit_3 * 2 * 0.01;
                local v51 = workspace:Raycast(v50, v16 - v50, v25);
                if v51 and v51.Normal:Dot(l_Unit_3) < 0.8 then
                    local l_Position_5 = v51.Position;
                    local l_Normal_5 = v51.Normal;
                    v23 = math.max(v23, (l_Position_5 - v16):Dot(l_Normal_5) / v17:Dot(l_Normal_5));
                    break;
                else
                    break;
                end;
            else
                v47 = v47 * 2.28;
            end;
        else
            break;
        end;
    end;
    if v24 ~= 1e999 and v23 ~= -1e999 then
        local v54 = v16 + v17 * v24;
        local v55 = v16 + v17 * v23;
        local v56 = {
            a = v54, 
            b = v55
        };
        v56.direction = (v56.b - v56.a).Unit;
        v56.length = (v56.b - v56.a).Magnitude;
        v56.edgeMargin = 0.5;
        v56.part = v15;
        v56.type = "Edge";
        v56.inferred = true;
        return v56;
    else
        return nil;
    end;
end;
local _ = function(_, v59, v60) --[[ Line: 175 ]] --[[ Name: getBasis ]]
    local l_XVector_0 = v60.XVector;
    if l_XVector_0:Cross(v59).Magnitude < 0.01 then
        l_XVector_0 = v60.YVector;
    end;
    local l_Unit_4 = l_XVector_0:Cross(v59).Unit;
    return v59, v59:Cross(l_Unit_4), l_Unit_4;
end;
local v64 = table.freeze({
    {
        0, 
        1
    }, 
    {
        1, 
        0
    }, 
    {
        0, 
        -1
    }, 
    {
        -1, 
        0
    }
});
return function(v65) --[[ Line: 199 ]]
    -- upvalues: v64 (copy), v9 (copy), v57 (copy)
    local l_Instance_0 = v65.Instance;
    local v67 = l_Instance_0.Size.Magnitude + 0.01;
    local l_CFrame_0 = l_Instance_0.CFrame;
    local l_Position_6 = v65.Position;
    local l_Normal_6 = v65.Normal;
    local l_XVector_1 = l_CFrame_0.XVector;
    if l_XVector_1:Cross(l_Normal_6).Magnitude < 0.01 then
        l_XVector_1 = l_CFrame_0.YVector;
    end;
    local l_Unit_5 = l_XVector_1:Cross(l_Normal_6).Unit;
    l_XVector_1 = l_Normal_6:Cross(l_Unit_5);
    local l_l_Normal_6_0 = l_Normal_6;
    local l_l_XVector_1_0 = l_XVector_1;
    local l_l_Unit_5_0 = l_Unit_5;
    l_Normal_6 = RaycastParams.new();
    l_Normal_6.FilterType = Enum.RaycastFilterType.Whitelist;
    l_Normal_6.BruteForceAllSlow = true;
    l_Normal_6.CollisionGroup = "StudioSelectable";
    l_Normal_6.FilterDescendantsInstances = {
        l_Instance_0
    };
    l_XVector_1 = l_Position_6 + l_l_Normal_6_0 * 0.01;
    l_Unit_5 = nil;
    local v76 = 1e999;
    for _, v78 in v64 do
        local v79 = l_l_XVector_1_0 * v78[1] + l_l_Unit_5_0 * v78[2];
        local v80 = 1e999;
        local v81 = workspace:Raycast(l_XVector_1, v79 * v67, l_Normal_6);
        if v81 then
            v80 = v81.Distance;
            if v81.Normal:Dot(l_l_Normal_6_0) < 0.5 and v81.Distance < v76 then
                l_Unit_5 = v81;
                v76 = v81.Distance;
            end;
        end;
        local v82 = 0.01;
        for _ = 1, 14 do
            if v80 >= v82 then
                local v84 = workspace:Raycast(l_XVector_1 + v79 * v82, -l_l_Normal_6_0 * 2 * 0.01, l_Normal_6);
                if not v84 or v84.Distance > 0.02 then
                    local v85 = l_XVector_1 + v79 * v82;
                    v85 = if v84 then v85 - l_l_Normal_6_0 * v84.Distance else v85 - l_l_Normal_6_0 * 2 * 0.01;
                    local v86 = workspace:Raycast(v85, l_Position_6 - v85, l_Normal_6);
                    if v86 and v86.Normal:Dot(l_l_Normal_6_0) < 0.5 then
                        local l_Magnitude_0 = (v86.Position - l_XVector_1).Magnitude;
                        if l_Magnitude_0 < v76 then
                            l_Unit_5 = v86;
                            v76 = l_Magnitude_0;
                            break;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                else
                    v82 = v82 * 2.28;
                end;
            else
                break;
            end;
        end;
    end;
    if l_Unit_5 then
        local v88, v89 = v9(l_Position_6, l_l_Normal_6_0, l_Unit_5.Position, l_Unit_5.Normal);
        local v90 = l_Position_6 - v88;
        local v91 = l_Unit_5.Position - v88;
        v90 = (v90 - v89 * v90:Dot(v89)).Unit;
        v91 = (v91 - v89 * v91:Dot(v89)).Unit;
        return (v57(l_Instance_0, v88, v89, l_l_Normal_6_0, l_Unit_5.Normal, v90, v91));
    else
        return nil;
    end;
end;