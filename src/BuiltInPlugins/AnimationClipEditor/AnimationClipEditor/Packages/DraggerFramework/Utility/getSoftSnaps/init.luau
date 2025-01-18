local v0 = require(script.Parent.Math);
local v1 = require(script.Parent.isGoodRaycastResult);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Flags.getFFlagDraggerBetterWedgeSnap);
local v4 = require(l_Parent_0.Flags.getFFlagDraggerSafeThresholdCast);
local v5 = require(l_Parent_0.Utility.CursorGroupName);
local function v7(v6) --[[ Line: 26 ]] --[[ Name: isWedgePart ]]
    return v6:IsA("WedgePart") or v6:IsA("CornerWedgePart") or v6:IsA("Part") and (v6.Shape == Enum.PartType.Wedge or v6.Shape == Enum.PartType.CornerWedge);
end;
local function v8(v9, v10, v11, v12) --[[ Line: 39 ]] --[[ Name: thresholdCast ]]
    -- upvalues: v1 (copy), v5 (copy), v8 (copy), v3 (copy), v7 (copy), v0 (copy)
    local l_Position_0 = v9.Position;
    local v14 = workspace:Blockcast(v9, v10, v11.Unit * 1023, v12);
    if v1(v14) then
        if math.abs((v14.Normal:Dot(v11.Unit))) < 0.3 and v12.FilterType == Enum.RaycastFilterType.Exclude then
            local v15 = RaycastParams.new();
            v15.FilterDescendantsInstances = v12.FilterDescendantsInstances;
            v15.BruteForceAllSlow = v12.BruteForceAllSlow;
            v15.CollisionGroup = v5;
            v15:AddToFilter(v14.Instance);
            return v8(v9, v10, v11, v15);
        else
            local l_Position_1 = v14.Position;
            local v17 = nil;
            v17 = if v3() and v7(v14.Instance) then v14.Instance.CFrame:PointToWorldSpace((Vector3.new(0, -v14.Instance.Size.Y / 4, 0))) - l_Position_1 else v14.Instance.Position - l_Position_1;
            v17 = v17 - v11.Unit * v17:Dot(v11.Unit);
            if v17.Magnitude > 0.05 then
                l_Position_1 = l_Position_1 + v17.Unit * 0.05;
            end;
            local v18 = RaycastParams.new();
            v18.FilterType = Enum.RaycastFilterType.Exclude;
            v18.BruteForceAllSlow = v12.BruteForceAllSlow;
            v18.CollisionGroup = v5;
            local v19 = v11.Unit * 0.1;
            local v20 = workspace:Raycast(l_Position_1 - v19, v19 * 2, v18);
            while v20 and v20.Instance ~= v14.Instance do
                v18:AddToFilter(v20.Instance);
                v20 = workspace:Raycast(l_Position_1 - v19, v19 * 2, v18);
            end;
            if v1(v20) then
                if math.abs((v20.Normal:Dot(v11.Unit))) < 0.3 then
                    if v12.FilterType == Enum.RaycastFilterType.Exclude then
                        local v21 = RaycastParams.new();
                        v21.FilterDescendantsInstances = v12.FilterDescendantsInstances;
                        v21.BruteForceAllSlow = v12.BruteForceAllSlow;
                        v21.CollisionGroup = v5;
                        v21:AddToFilter(v20.Instance);
                        return v8(v9, v10, v11, v21);
                    else
                        local v22 = v0.intersectRayPlane(l_Position_0, v11, v20.Position, -v11);
                        return {
                            Position = l_Position_0 + v11 * v22, 
                            Distance = v11.Magnitude * v22, 
                            Normal = v20.Normal, 
                            Instance = v14.Instance
                        };
                    end;
                else
                    local v23 = v0.intersectRayPlane(l_Position_0, v11, v20.Position, v20.Normal);
                    return {
                        Position = l_Position_0 + v11 * v23, 
                        Distance = v11.Magnitude * v23, 
                        Normal = v20.Normal, 
                        Instance = v14.Instance
                    };
                end;
            elseif v12.FilterType == Enum.RaycastFilterType.Exclude then
                local v24 = RaycastParams.new();
                v24.FilterDescendantsInstances = v12.FilterDescendantsInstances;
                v24.BruteForceAllSlow = v12.BruteForceAllSlow;
                v24.CollisionGroup = v5;
                v24:AddToFilter(v14.Instance);
                return v8(v9, v10, v11, v24);
            end;
        end;
    end;
    return nil;
end;
local function v39(v25, v26, v27) --[[ Line: 147 ]] --[[ Name: snapHitToBoundingBox ]]
    local l_Instance_0 = v27.Instance;
    local v29 = l_Instance_0.Size / 2;
    local v30 = l_Instance_0.CFrame:PointToObjectSpace(v27.Position);
    local v31 = v30:Abs();
    local v32 = v30:Sign();
    local v33 = (v31 - v29):Abs();
    local v34 = if v33.X < 0.2 then v29.X else v31.X;
    local v35 = if v33.Y < 0.2 then v29.Y else v31.Y;
    local v36 = if v33.Z < 0.2 then v29.Z else v31.Z;
    local v37 = l_Instance_0.CFrame:PointToWorldSpace(v32 * Vector3.new(v34, v35, v36));
    local v38 = math.abs(((v37 - v25):Dot(v26)));
    return {
        Position = v37, 
        Distance = v38, 
        Normal = v27.Normal, 
        Instance = l_Instance_0
    };
end;
return function(v40, v41, v42, v43, v44, v45, v46) --[[ Line: 189 ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), v39 (copy)
    local v47 = os.clock();
    local function _() --[[ Line: 202 ]] --[[ Name: timeBudgetExceeded ]]
        -- upvalues: v47 (ref)
        return os.clock() - v47 > 0.01;
    end;
    local v49 = {};
    if v4() then
        if v41 ~= v41 or v41.Magnitude == 1e999 or v40 ~= v40 or v40.Position.Magnitude == 1e999 then
            return v49;
        end;
    elseif v41 ~= v41 then
        return v49;
    end;
    local v50 = RaycastParams.new();
    v50.FilterType = Enum.RaycastFilterType.Include;
    v50.FilterDescendantsInstances = v43;
    v50.BruteForceAllSlow = true;
    v50.CollisionGroup = v5;
    v41 = v41:Min((Vector3.new(511, 511, 511, 0)));
    local v51 = {};
    for _, v53 in v45 do
        local v54 = v53 * v42 * 400;
        local v55 = v8(v40 + v54, v41, -v54 * 2, v50);
        if v55 then
            table.insert(v51, (v39((v40 + v54).Position, -v53 * v42, v55).Distance - 400) * v53);
        end;
    end;
    local v56 = false;
    for _, v58 in v51 do
        if math.abs(v58) < 0.001 then
            v56 = true;
            break;
        end;
    end;
    if #v45 == 1 then
        if #v51 == 0 then
            return {};
        end;
    elseif not v56 then
        table.insert(v51, 0);
    end;
    local v59 = {};
    local function v66(v60, v61) --[[ Line: 271 ]] --[[ Name: addSnap ]]
        -- upvalues: v51 (copy), v59 (copy), v49 (copy)
        for _, v63 in v51 do
            local v64 = v61 + v63;
            local v65 = math.floor(v64 * 1000 + 0.5);
            if not v59[v65] then
                v59[v65] = true;
                table.insert(v49, {
                    Point = v60, 
                    Distance = v64
                });
            end;
        end;
    end;
    v50.FilterType = Enum.RaycastFilterType.Exclude;
    for _, v68 in v44 do
        v50.FilterDescendantsInstances = v43;
        local l_v40_0 = v40;
        local v70 = 0;
        local v71 = nil;
        local v72 = 0;
        v47 = os.clock();
        while not (os.clock() - v47 > 0.01) do
            local v73 = v8(l_v40_0, v41, v42 * v68 * 2000, v50);
            if v73 then
                v72 = v72 + 1;
                local v74 = v68 * (v70 + v73.Distance);
                v66(v73.Position, v74);
                v50:AddToFilter(v73.Instance);
                l_v40_0 = l_v40_0.Rotation + v73.Position;
                v71 = v73.Instance;
                v70 = v70 + v73.Distance;
                if v46 / 2 <= v72 then
                    break;
                end;
            else
                break;
            end;
        end;
        if v71 then
            if v72 ~= v46 / 2 then
                local v75 = math.min(500, v71.Size.Magnitude);
                l_v40_0 = l_v40_0 + v42 * v68 * v75;
                v70 = v70 + v75;
            end;
        else
            l_v40_0 = l_v40_0 + v42 * v68 * 500;
            v70 = v70 + 500;
        end;
        v50.FilterDescendantsInstances = v43;
        v47 = os.clock();
        while not (os.clock() - v47 > 0.01) do
            local v76 = v8(l_v40_0, v41, -v42 * v68 * 2000, v50);
            if v76 then
                v70 = v70 - v76.Distance;
                l_v40_0 = l_v40_0.Rotation + v76.Position;
                if v70 >= -0.1 then
                    v66(l_v40_0.Position, v68 * v70);
                    v50:AddToFilter(v76.Instance);
                else
                    break;
                end;
            else
                break;
            end;
        end;
    end;
    return v49;
end;