local v4 = {
    intersectRayPlane = function(v0, v1, v2, v3) --[[ Line: 4 ]] --[[ Name: intersectRayPlane ]]
        return (v2 - v0):Dot(v3) / v1:Dot(v3);
    end
};
v4.intersectRayPlanePoint = function(v5, v6, v7, v8) --[[ Line: 9 ]] --[[ Name: intersectRayPlanePoint ]]
    -- upvalues: v4 (copy)
    return v5 + v4.intersectRayPlane(v5, v6, v7, v8) * v6;
end;
v4.intersectRayRay = function(v9, v10, v11, v12) --[[ Line: 19 ]] --[[ Name: intersectRayRay ]]
    local v13 = (v11 - v9):Dot(v10) * v12:Dot(v12) + (v9 - v11):Dot(v12) * v10:Dot(v12);
    local v14 = v10:Dot(v10) * v12:Dot(v12) - v10:Dot(v12) * v10:Dot(v12);
    if v14 == 0 then
        return false;
    else
        return true, v13 / v14;
    end;
end;
v4.intersectRayRayPoint = function(v15, v16, v17, v18) --[[ Line: 33 ]] --[[ Name: intersectRayRayPoint ]]
    -- upvalues: v4 (copy)
    local l_Unit_0 = v16.Unit;
    local l_Unit_1 = v18.Unit;
    local _, v22 = v4.intersectRayRay(v15, l_Unit_0, v17, l_Unit_1);
    return v15 + v22 * l_Unit_0;
end;
v4.intersectRayCylinder = function(v23, v24, v25, v26) --[[ Line: 47 ]] --[[ Name: intersectRayCylinder ]]
    local v27 = v24.Y * v24.Y + v24.Z * v24.Z;
    local v28 = v24.Y * v23.Y + v24.Z * v23.Z;
    local v29 = v23.Y * v23.Y + v23.Z * v23.Z - v25 * v25;
    local v30 = v28 * v28 - v27 * v29;
    if v30 < 0 then
        return false;
    else
        local v31 = (-v28 - math.sqrt(v30)) / v27;
        if math.abs(v23.X + v31 * v24.X) <= 0.5 * v26 then
            return true, v31;
        else
            local v32 = (-v28 + math.sqrt(v30)) / v27;
            if math.abs(v23.X + v32 * v24.X) <= 0.5 * v26 then
                return true, v32;
            else
                return false;
            end;
        end;
    end;
end;
v4.intersectRaySphere = function(v33, v34, v35, v36) --[[ Line: 82 ]] --[[ Name: intersectRaySphere ]]
    local v37 = v33 - v35;
    local v38 = v34:Dot(v34);
    local v39 = 2 * v37:Dot(v34);
    local v40 = v37:Dot(v37) - v36 * v36;
    local v41 = v39 * v39 - 4 * v38 * v40;
    if v41 >= 0 then
        local v42 = -v39 - math.sqrt(v41);
        if v42 > 0 then
            return true, v42 / 2 * v38;
        end;
    end;
    return false;
end;
v4.regionFromParts = function(v43) --[[ Line: 97 ]] --[[ Name: regionFromParts ]]
    local v44 = 1e999;
    local v45 = 1e999;
    local v46 = 1e999;
    local v47 = -1e999;
    local v48 = -1e999;
    local v49 = -1e999;
    for _, v51 in ipairs(v43) do
        local v52 = nil;
        local v53 = nil;
        if v51:IsA("BasePart") then
            v52 = v51.CFrame.Position - v51.Size;
            v53 = v51.CFrame.Position + v51.Size;
        elseif v51:IsA("Model") then
            local l_v51_BoundingBox_0, v55 = v51:GetBoundingBox();
            v52 = l_v51_BoundingBox_0 - v55;
            v53 = l_v51_BoundingBox_0 + v55;
        end;
        if v52 ~= nil and v53 ~= nil then
            v44 = math.min(v44, v52.X);
            v45 = math.min(v45, v52.Y);
            v46 = math.min(v46, v52.Z);
            v47 = math.max(v47, v53.X);
            v48 = math.max(v48, v53.Y);
            v49 = math.max(v49, v53.Z);
        end;
    end;
    return Region3.new(Vector3.new(v44, v45, v46), (Vector3.new(v47, v48, v49)));
end;
v4.setToVector3 = function(v56) --[[ Line: 123 ]] --[[ Name: setToVector3 ]]
    return v56 and Vector3.new(not v56.X and 0 or 1, not v56.Y and 0 or 1, not v56.Z and 0 or 1) or Vector3.new(0, 0, 0, 0);
end;
v4.vectorToArray = function(v57) --[[ Line: 128 ]] --[[ Name: vectorToArray ]]
    return {
        v57.X, 
        v57.Y, 
        v57.Z
    };
end;
v4.maxComponent = function(v58) --[[ Line: 133 ]] --[[ Name: maxComponent ]]
    return (math.max(v58.X, v58.Y, v58.Z));
end;
v4.minComponent = function(v59) --[[ Line: 138 ]] --[[ Name: minComponent ]]
    return (math.min(v59.X, v59.Y, v59.Z));
end;
v4.complimentDirection = function(v60) --[[ Line: 146 ]] --[[ Name: complimentDirection ]]
    local l_X_0 = v60.X;
    local l_Y_0 = v60.Y;
    local l_Z_0 = v60.Z;
    return (Vector3.new(1 - math.abs(l_X_0), 1 - math.abs(l_Y_0), 1 - math.abs(l_Z_0)));
end;
return v4;