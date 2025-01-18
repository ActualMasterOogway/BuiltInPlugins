local v0 = {};
local v1 = game:GetService("InsertService"):LoadLocalAsset("rbxasset://models/RigBuilder/AnthroRigs.rbxm");
local function _(v2, v3, v4, v5) --[[ Line: 9 ]] --[[ Name: jointBetween ]]
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Part0 = v2;
    l_Motor6D_0.Part1 = v3;
    l_Motor6D_0.C0 = v4;
    l_Motor6D_0.C1 = v5;
    l_Motor6D_0.Parent = v2;
    return l_Motor6D_0;
end;
v0.CreateR6Rig = function() --[[ Line: 19 ]] --[[ Name: CreateR6Rig ]]
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "Dummy";
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "HumanoidRootPart";
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = true;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(2, 2, 1, 0);
    l_Part_0.Parent = l_Model_0;
    l_Part_0.CFrame = CFrame.new(0, 5.2, 4.5);
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.TopSurface = "Smooth";
    l_Model_0.PrimaryPart = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Name = "Torso";
    l_Part_1.Anchored = false;
    l_Part_1.CanCollide = false;
    l_Part_1.Size = Vector3.new(2, 2, 1, 0);
    l_Part_1.Parent = l_Model_0;
    l_Part_1.CFrame = CFrame.new(0, 5.2, 4.5);
    l_Part_1.BottomSurface = "Smooth";
    l_Part_1.TopSurface = "Smooth";
    local v11 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local l_Motor6D_1 = Instance.new("Motor6D");
    l_Motor6D_1.Part0 = l_Part_0;
    l_Motor6D_1.Part1 = l_Part_1;
    l_Motor6D_1.C0 = v11;
    l_Motor6D_1.C1 = v11;
    l_Motor6D_1.Parent = l_Part_0;
    local l_l_Motor6D_1_0 = l_Motor6D_1;
    l_l_Motor6D_1_0.Name = "Root Hip";
    l_l_Motor6D_1_0.MaxVelocity = 0.1;
    l_Motor6D_1 = Instance.new("Part", l_Model_0);
    l_Motor6D_1.Name = "Left Leg";
    l_Motor6D_1.Anchored = false;
    l_Motor6D_1.CanCollide = false;
    l_Motor6D_1.Size = Vector3.new(1, 2, 1, 0);
    l_Motor6D_1.CFrame = CFrame.new(0.5, 3.2, 4.5);
    l_Motor6D_1.BottomSurface = "Smooth";
    l_Motor6D_1.TopSurface = "Smooth";
    local v14 = CFrame.new(-1, -1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), -1.5707963267948966);
    local v15 = CFrame.new(-0.5, 1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), -1.5707963267948966);
    local l_Motor6D_2 = Instance.new("Motor6D");
    l_Motor6D_2.Part0 = l_Part_1;
    l_Motor6D_2.Part1 = l_Motor6D_1;
    l_Motor6D_2.C0 = v14;
    l_Motor6D_2.C1 = v15;
    l_Motor6D_2.Parent = l_Part_1;
    local l_l_Motor6D_2_0 = l_Motor6D_2;
    l_l_Motor6D_2_0.Name = "Left Hip";
    l_l_Motor6D_2_0.MaxVelocity = 0.1;
    l_Motor6D_2 = Instance.new("Part", l_Model_0);
    l_Motor6D_2.Name = "Right Leg";
    l_Motor6D_2.Anchored = false;
    l_Motor6D_2.CanCollide = false;
    l_Motor6D_2.Size = Vector3.new(1, 2, 1, 0);
    l_Motor6D_2.CFrame = CFrame.new(-0.5, 3.2, 4.5);
    l_Motor6D_2.BottomSurface = "Smooth";
    l_Motor6D_2.TopSurface = "Smooth";
    local v18 = CFrame.new(1, -1, 0) * CFrame.fromAxisAngle(Vector3.new(0, -1, 0, 0), -1.5707963267948966);
    local v19 = CFrame.new(0.5, 1, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), 1.5707963267948966);
    local l_Motor6D_3 = Instance.new("Motor6D");
    l_Motor6D_3.Part0 = l_Part_1;
    l_Motor6D_3.Part1 = l_Motor6D_2;
    l_Motor6D_3.C0 = v18;
    l_Motor6D_3.C1 = v19;
    l_Motor6D_3.Parent = l_Part_1;
    local l_l_Motor6D_3_0 = l_Motor6D_3;
    l_l_Motor6D_3_0.Name = "Right Hip";
    l_l_Motor6D_3_0.MaxVelocity = 0.1;
    l_Motor6D_3 = Instance.new("Part", l_Model_0);
    l_Motor6D_3.Name = "Left Arm";
    l_Motor6D_3.Anchored = false;
    l_Motor6D_3.CanCollide = false;
    l_Motor6D_3.Size = Vector3.new(1, 2, 1, 0);
    l_Motor6D_3.CFrame = CFrame.new(1.5, 5.2, 4.5);
    l_Motor6D_3.BottomSurface = "Smooth";
    l_Motor6D_3.TopSurface = "Smooth";
    local v22 = CFrame.new(-1, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), -1.5707963267948966);
    local v23 = CFrame.new(0.5, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), -1.5707963267948966);
    local l_Motor6D_4 = Instance.new("Motor6D");
    l_Motor6D_4.Part0 = l_Part_1;
    l_Motor6D_4.Part1 = l_Motor6D_3;
    l_Motor6D_4.C0 = v22;
    l_Motor6D_4.C1 = v23;
    l_Motor6D_4.Parent = l_Part_1;
    local l_l_Motor6D_4_0 = l_Motor6D_4;
    l_l_Motor6D_4_0.Name = "Left Shoulder";
    l_l_Motor6D_4_0.MaxVelocity = 0.1;
    l_Motor6D_4 = Instance.new("Part", l_Model_0);
    l_Motor6D_4.Name = "Right Arm";
    l_Motor6D_4.Anchored = false;
    l_Motor6D_4.CanCollide = false;
    l_Motor6D_4.Size = Vector3.new(1, 2, 1, 0);
    l_Motor6D_4.CFrame = CFrame.new(-1.5, 5.2, 4.5);
    l_Motor6D_4.BottomSurface = "Smooth";
    l_Motor6D_4.TopSurface = "Smooth";
    local v26 = CFrame.new(1, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, -1, 0, 0), -1.5707963267948966);
    local v27 = CFrame.new(-0.5, 0.5, 0) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), 1.5707963267948966);
    local l_Motor6D_5 = Instance.new("Motor6D");
    l_Motor6D_5.Part0 = l_Part_1;
    l_Motor6D_5.Part1 = l_Motor6D_4;
    l_Motor6D_5.C0 = v26;
    l_Motor6D_5.C1 = v27;
    l_Motor6D_5.Parent = l_Part_1;
    local l_l_Motor6D_5_0 = l_Motor6D_5;
    l_l_Motor6D_5_0.Name = "Right Shoulder";
    l_l_Motor6D_5_0.MaxVelocity = 0.1;
    l_Motor6D_5 = Instance.new("Part", l_Model_0);
    l_Motor6D_5.Name = "Head";
    l_Motor6D_5.Anchored = false;
    l_Motor6D_5.CanCollide = true;
    l_Motor6D_5.Size = Vector3.new(2, 1, 1, 0);
    l_Motor6D_5.CFrame = CFrame.new(0, 6.7, 4.5);
    l_Motor6D_5.BottomSurface = "Smooth";
    l_Motor6D_5.TopSurface = "Smooth";
    local v30 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local v31 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0);
    local l_Motor6D_6 = Instance.new("Motor6D");
    l_Motor6D_6.Part0 = l_Part_1;
    l_Motor6D_6.Part1 = l_Motor6D_5;
    l_Motor6D_6.C0 = v30;
    l_Motor6D_6.C1 = v31;
    l_Motor6D_6.Parent = l_Part_1;
    local l_l_Motor6D_6_0 = l_Motor6D_6;
    l_l_Motor6D_6_0.Name = "Neck";
    l_l_Motor6D_6_0.MaxVelocity = 0.1;
    l_Motor6D_6 = Instance.new("Decal", l_Motor6D_5);
    l_Motor6D_6.Name = "Face";
    l_Motor6D_6.Texture = "rbxasset://textures/face.png";
    Instance.new("Humanoid", l_Model_0);
    l_Model_0.Parent = workspace;
    return l_Model_0;
end;
v0.CreateR6MeshRig = function() --[[ Line: 136 ]] --[[ Name: CreateR6MeshRig ]]
    -- upvalues: v0 (copy)
    local v34 = v0.CreateR6Rig();
    local v35 = Instance.new("CharacterMesh", v34);
    v35.MeshId = 27111419;
    v35.BodyPart = 2;
    local v36 = Instance.new("CharacterMesh", v34);
    v36.MeshId = 27111864;
    v36.BodyPart = 3;
    local v37 = Instance.new("CharacterMesh", v34);
    v37.MeshId = 27111857;
    v37.BodyPart = 4;
    local v38 = Instance.new("CharacterMesh", v34);
    v38.MeshId = 27111882;
    v38.BodyPart = 5;
    local v39 = Instance.new("CharacterMesh", v34);
    v39.MeshId = 27111894;
    v39.BodyPart = 1;
    local v40 = Instance.new("SpecialMesh", v34.Head);
    v40.MeshType = 0;
    v40.Scale = Vector3.new(1.25, 1.25, 1.25, 0);
    return v34;
end;
v0.CreateR6MeshBoyRig = function() --[[ Line: 165 ]] --[[ Name: CreateR6MeshBoyRig ]]
    -- upvalues: v0 (copy)
    local v41 = v0.CreateR6Rig();
    local v42 = Instance.new("CharacterMesh", v41);
    v42.MeshId = 82907977;
    v42.BodyPart = 2;
    local v43 = Instance.new("CharacterMesh", v41);
    v43.MeshId = 82908019;
    v43.BodyPart = 3;
    local v44 = Instance.new("CharacterMesh", v41);
    v44.MeshId = 81487640;
    v44.BodyPart = 4;
    local v45 = Instance.new("CharacterMesh", v41);
    v45.MeshId = 81487710;
    v45.BodyPart = 5;
    local v46 = Instance.new("CharacterMesh", v41);
    v46.MeshId = 82907945;
    v46.BodyPart = 1;
    local v47 = Instance.new("SpecialMesh", v41.Head);
    v47.MeshType = 0;
    v47.Scale = Vector3.new(1.25, 1.25, 1.25, 0);
    return v41;
end;
v0.CreateR6MeshGirlRig = function() --[[ Line: 194 ]] --[[ Name: CreateR6MeshGirlRig ]]
    -- upvalues: v0 (copy)
    local v48 = v0.CreateR6Rig();
    local v49 = Instance.new("CharacterMesh", v48);
    v49.MeshId = 83001137;
    v49.BodyPart = 2;
    local v50 = Instance.new("CharacterMesh", v48);
    v50.MeshId = 83001181;
    v50.BodyPart = 3;
    local v51 = Instance.new("CharacterMesh", v48);
    v51.MeshId = 81628361;
    v51.BodyPart = 4;
    local v52 = Instance.new("CharacterMesh", v48);
    v52.MeshId = 81628308;
    v52.BodyPart = 5;
    local v53 = Instance.new("CharacterMesh", v48);
    v53.MeshId = 82987757;
    v53.BodyPart = 1;
    local v54 = Instance.new("SpecialMesh", v48.Head);
    v54.MeshType = 0;
    v54.Scale = Vector3.new(1.25, 1.25, 1.25, 0);
    return v48;
end;
local function v63(v55) --[[ Line: 225 ]] --[[ Name: r15RigImported ]]
    local v56 = game:GetService("InsertService"):LoadAsset(9425124156):GetChildren()[1];
    for _, v58 in pairs(v55:GetChildren()) do
        local l_v56_FirstChild_0 = v56:FindFirstChild(v58.Name);
        if l_v56_FirstChild_0 then
            l_v56_FirstChild_0:Destroy();
        end;
        v58.Parent = v56;
    end;
    v55:Destroy();
    v55 = v56;
    v55.Parent = workspace;
    local l_Humanoid_0 = v55:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        l_Humanoid_0:BuildRigFromAttachments();
    end;
    local v61 = v55:WaitForChild("Head", 1);
    if (v61:FindFirstChild("face") or v61:FindFirstChild("Face")) == nil then
        local v62 = Instance.new("Decal", v61);
        v62.Name = "face";
        v62.Texture = "rbxasset://textures/face.png";
    end;
    return v55;
end;
v0.BuildR15Rig = function(v64) --[[ Line: 258 ]] --[[ Name: BuildR15Rig ]]
    -- upvalues: v63 (copy)
    local v65 = Instance.new("Model", workspace);
    local v66 = nil;
    local v67 = nil;
    if v64 ~= nil then
        local l_AssetIdsForPackage_0 = game:GetService("AssetService"):GetAssetIdsForPackage(v64);
        for _, v70 in pairs(l_AssetIdsForPackage_0) do
            local v71 = game:GetService("InsertService"):LoadAsset(v70);
            if v71:FindFirstChild("R15ArtistIntent") then
                for _, v73 in pairs(v71.R15ArtistIntent:GetChildren()) do
                    v73.Parent = v65;
                end;
            elseif v71:FindFirstChild("R15") then
                for _, v75 in pairs(v71.R15:GetChildren()) do
                    v75.Parent = v65;
                end;
            elseif v71:FindFirstChild("face") then
                v67 = v71.face;
            elseif v71:FindFirstChild("Face") then
                v67 = v71.Face;
            elseif v71:FindFirstChild("Mesh") then
                v66 = v71.Mesh;
            end;
        end;
    end;
    local v76 = v63(v65);
    if v66 then
        v76.Head.Mesh:Destroy();
        v66.Parent = v76.Head;
    end;
    if v67 then
        for _, v78 in pairs(v76.Head:GetChildren()) do
            if v78.Name == "face" or v78.Name == "Face" then
                v78:Destroy();
            end;
        end;
        v67.Parent = v76.Head;
    end;
    return v76;
end;
v0.BuildAnthroRig = function(v79) --[[ Line: 305 ]] --[[ Name: BuildAnthroRig ]]
    -- upvalues: v1 (copy)
    local l_v1_FirstChild_0 = v1:FindFirstChild(v79);
    if not l_v1_FirstChild_0 then
        error("RigCreator couldn't find Rig with name " .. v79);
        return;
    else
        local v81 = l_v1_FirstChild_0:Clone();
        local l_Humanoid_1 = v81:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_1 then
            l_Humanoid_1:BuildRigFromAttachments();
        end;
        v81.Parent = workspace;
        return v81;
    end;
end;
v0.buildTestRig = function() --[[ Line: 322 ]] --[[ Name: buildTestRig ]]
    local l_Model_1 = Instance.new("Model");
    local v84 = Instance.new("Part", l_Model_1);
    v84.Name = "HumanoidRootPart";
    local v85 = Instance.new("Part", l_Model_1);
    v85.Name = "UpperTorso";
    local v86 = Instance.new("Part", l_Model_1);
    v86.Name = "Head";
    local v87 = Instance.new("Motor6D", v85);
    v87.Part0 = v84;
    v87.Part1 = v85;
    local v88 = Instance.new("Motor6D", v86);
    v88.Part0 = v85;
    v88.Part1 = v86;
    Instance.new("Attachment", v84).Name = "RootAttachment";
    Instance.new("Attachment", v85).Name = "RootAttachment";
    local v89 = Instance.new("Attachment", v85);
    v89.Name = "NeckAttachment";
    local v90 = Instance.new("Attachment", v86);
    v90.Name = "NeckAttachment";
    local v91 = Instance.new("BallSocketConstraint", l_Model_1);
    v91.Enabled = false;
    v91.Attachment0 = v89;
    v91.Attachment1 = v90;
    Instance.new("AnimationController", l_Model_1);
    Instance.new("Bone", v86).Name = "Jaw";
    return l_Model_1;
end;
return v0;