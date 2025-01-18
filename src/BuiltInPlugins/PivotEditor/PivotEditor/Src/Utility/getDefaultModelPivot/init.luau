local l_DraggerFramework_0 = script.Parent.Parent.Parent.Packages.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Utility.snapRotationToPrimaryDirection);
local function _(v2) --[[ Line: 10 ]] --[[ Name: maxComponent ]]
    return (math.max(v2.X, v2.Y, v2.Z));
end;
local function _(v4, v5) --[[ Line: 14 ]] --[[ Name: fuzzyEq ]]
    local v6, v7 = v4:ToAxisAngle();
    local v8, v9 = v5:ToAxisAngle();
    return v6:FuzzyEq(v8, 0.001) and math.abs(v7 - v9) < 0.001;
end;
local function v26(v11) --[[ Line: 20 ]] --[[ Name: mostFrequentRotation ]]
    local v12 = {};
    for _, v14 in v11 do
        local v15 = false;
        for v16, v17 in v12 do
            local v18, v19 = v14:ToAxisAngle();
            local v20, v21 = v16:ToAxisAngle();
            if v18:FuzzyEq(v20, 0.001) and math.abs(v19 - v21) < 0.001 then
                v12[v16] = v17 + 1;
                v15 = true;
                break;
            end;
        end;
        if not v15 then
            v12[v14] = 1;
        end;
    end;
    local v22 = 0;
    local v23 = nil;
    for v24, v25 in v12 do
        if v22 < v25 then
            v22 = v25;
            v23 = v24;
        end;
    end;
    return v23;
end;
return function(v27) --[[ Line: 46 ]] --[[ Name: getDefaultModelPivot ]]
    -- upvalues: v1 (copy), v26 (copy)
    local v28 = {};
    local function v37(v29) --[[ Line: 49 ]] --[[ Name: getBucket ]]
        -- upvalues: v28 (copy)
        for v30, v31 in v28 do
            local v32, v33 = v29:ToAxisAngle();
            local v34, v35 = v30:ToAxisAngle();
            if v32:FuzzyEq(v34, 0.001) and math.abs(v33 - v35) < 0.001 then
                return v31;
            end;
        end;
        local v36 = {
            RotationList = {}, 
            TotalSize = 0, 
            Count = 0
        };
        v28[v29] = v36;
        return v36;
    end;
    for _, v39 in v27:GetDescendants() do
        if v39:IsA("PVInstance") then
            local l_Rotation_0 = v39:GetPivot().Rotation;
            local v41 = v37(v1(l_Rotation_0):Inverse() * l_Rotation_0);
            table.insert(v41.RotationList, l_Rotation_0);
            v41.Count = v41.Count + 1;
            if v39:IsA("BasePart") then
                local l_TotalSize_0 = v41.TotalSize;
                local l_ExtentsSize_0 = v39.ExtentsSize;
                v41.TotalSize = l_TotalSize_0 + math.max(l_ExtentsSize_0.X, l_ExtentsSize_0.Y, l_ExtentsSize_0.Z);
            end;
        end;
    end;
    local v44 = 0;
    local v45 = 0;
    local v46 = nil;
    local v47 = 0;
    local v48 = nil;
    for _, v50 in v28 do
        if v44 < v50.Count then
            v44 = v50.Count;
            v46 = v50.RotationList;
            v45 = v50.TotalSize;
        end;
        if v47 < v50.TotalSize then
            v47 = v50.TotalSize;
            v48 = v50.RotationList;
        end;
    end;
    if v46 and v48 then
        local v51 = if not (v45 >= v47) or #v46 == 1 then v48 else v46;
        v27.WorldPivot = v26(v51);
        return v27:GetBoundingBox();
    else
        return v27.WorldPivot;
    end;
end;