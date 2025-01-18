local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Utility.getGeometry);
local v3 = require(l_Parent_0.Utility.blackboxFindClosestMeshEdge);
local v4 = require(l_Parent_0.Utility.snapRotationToPrimaryDirection);
local v5 = require(l_Parent_0.Utility.CursorGroupName);
local v6 = require(l_Parent_0.Flags.getFFlagDraggerLockedSummon);
local v7 = require(l_Parent_0.Flags.getFFlagDraggerTerrainSummonFix);
local function v21(v8, v9) --[[ Line: 15 ]] --[[ Name: getClosestEdge ]]
    local v10 = nil;
    local v11 = 1e999;
    for _, v13 in v8.faces do
        local v14 = math.abs(((v9 - v13.point).Unit:Dot(v13.normal)));
        if v14 < v11 then
            v11 = v14;
            v10 = v13;
        end;
    end;
    local v15 = nil;
    local v16 = 1e999;
    for _, v18 in v8.edges do
        if math.abs((v18.direction:Dot(v10.normal))) < 0.001 then
            local v19 = (v9 - v18.a):Dot(v18.direction);
            local l_Magnitude_0 = (v18.a + v18.direction * v19 - v9).Magnitude;
            if l_Magnitude_0 < v16 then
                v16 = l_Magnitude_0;
                v15 = v18;
            end;
        end;
    end;
    return v15;
end;
local function v36(v22, v23, v24) --[[ Line: 45 ]] --[[ Name: findSnapAlongEdge ]]
    -- upvalues: v4 (copy)
    local v25 = nil;
    local v26 = 0.5 * (v22.a + v22.b);
    local l_Magnitude_1 = (v22.a - v24).Magnitude;
    local l_Magnitude_2 = (v22.b - v24).Magnitude;
    local l_Magnitude_3 = (v26 - v24).Magnitude;
    v25 = if l_Magnitude_3 < l_Magnitude_1 and l_Magnitude_3 < l_Magnitude_2 then v26 else if l_Magnitude_1 < l_Magnitude_2 then v22.a else v22.b;
    local l_CFrame_0 = v23.CFrame;
    local l_XVector_0 = l_CFrame_0.XVector;
    if math.abs((l_XVector_0:Dot(v22.direction))) > 0.9 then
        l_XVector_0 = l_CFrame_0.ZVector;
    end;
    local v32 = CFrame.fromMatrix(Vector3.zero, v22.direction, v22.direction:Cross(l_XVector_0).Unit);
    local v33 = l_CFrame_0.Rotation:ToObjectSpace(v32);
    local v34 = v4(v33);
    local v35 = v34 * v34:ToObjectSpace(v33) * v34:Inverse();
    return l_CFrame_0.Rotation * v35 + v25;
end;
local function v42(v37) --[[ Line: 75 ]] --[[ Name: getSnapCFrame ]]
    -- upvalues: v3 (copy), v36 (copy), v7 (copy), v2 (copy), v21 (copy)
    local l_Instance_0 = v37.Instance;
    local l_Position_0 = v37.Position;
    if l_Instance_0:IsA("TriangleMeshPart") then
        local v40 = v3(v37);
        if v40 then
            return (v36(v40, l_Instance_0, l_Position_0));
        else
            return l_Instance_0:GetPivot().Rotation + l_Position_0;
        end;
    elseif v7() and l_Instance_0:IsA("Terrain") then
        return CFrame.new(l_Position_0);
    else
        local v41 = v2(l_Instance_0);
        if v41.shape == "Mesh" then
            return (v36(v21(v41, l_Position_0), l_Instance_0, l_Position_0));
        else
            return l_Instance_0:GetPivot().Rotation + l_Position_0;
        end;
    end;
end;
return function(_, v44, v45) --[[ Line: 101 ]]
    -- upvalues: v5 (copy), l_Workspace_0 (copy), v6 (copy), v42 (copy)
    local v46 = RaycastParams.new();
    v46.FilterDescendantsInstances = v44;
    v46.BruteForceAllSlow = true;
    v46.CollisionGroup = v5;
    local v47 = l_Workspace_0:Raycast(v45.Origin, v45.Direction, v46);
    if v6() then
        if v47 then
            return v42(v47);
        else
            return nil;
        end;
    elseif v47 and not v47.Instance.Locked then
        return v42(v47);
    else
        return nil;
    end;
end;