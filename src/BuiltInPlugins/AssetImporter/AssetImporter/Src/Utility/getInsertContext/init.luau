local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.getWorkspaceInsertPosition);
local function v5(v2) --[[ Line: 8 ]] --[[ Name: clearChildParts ]]
    for _, v4 in pairs(v2:GetChildren()) do
        if v4:IsA("BasePart") or v4:IsA("JointInstance") then
            v4:Destroy();
        end;
    end;
end;
return function(v6, v7) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_Position_0 = v7.WorldPivot.Position;
    local l_v7_ExtentsSize_0 = v7:GetExtentsSize();
    local v10 = math.max(l_v7_ExtentsSize_0.X, l_v7_ExtentsSize_0.Y, l_v7_ExtentsSize_0.Z);
    if not v6.InsertWithScenePosition then
        l_Position_0 = v1();
    end;
    local l_PartBoundsInRadius_0 = game.Workspace:GetPartBoundsInRadius(l_Position_0, (math.max(v10 * 3, 100)));
    local l_Model_0 = Instance.new("Model");
    for _, v14 in l_PartBoundsInRadius_0 do
        local v15 = v14:Clone();
        v5(v15);
        v15.Parent = l_Model_0;
    end;
    local v16 = v7:Clone();
    v16.Parent = game.Workspace;
    if not v6.InsertWithScenePosition then
        v16:MoveTo(l_Position_0);
    end;
    local l_v16_BoundingBox_0 = v16:GetBoundingBox();
    v16.Parent = nil;
    l_Model_0.WorldPivot = CFrame.new();
    return l_Model_0, (CFrame.new(-l_v16_BoundingBox_0.Position));
end;