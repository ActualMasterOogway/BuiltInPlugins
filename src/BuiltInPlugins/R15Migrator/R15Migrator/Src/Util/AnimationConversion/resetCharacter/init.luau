local function v10(v0) --[[ Line: 1 ]] --[[ Name: rebuildJoints ]]
    local v1 = {
        RootJoint = {
            Name = "RootJoint", 
            Part0 = "HumanoidRootPart", 
            Part1 = "Torso", 
            C0 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), 
            C1 = CFrame.new(0, 0, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), 
            MaxVelocity = 0.1
        }, 
        ["Left Hip"] = {
            Name = "Left Hip", 
            Part0 = "Torso", 
            Part1 = "Left Leg", 
            C0 = CFrame.new(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), 
            C1 = CFrame.new(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), 
            MaxVelocity = 0.1
        }, 
        ["Left Shoulder"] = {
            Name = "Left Shoulder", 
            Part0 = "Torso", 
            Part1 = "Left Arm", 
            C0 = CFrame.new(-1, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), 
            C1 = CFrame.new(0.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), 
            MaxVelocity = 0.1
        }, 
        Neck = {
            Name = "Neck", 
            Part0 = "Torso", 
            Part1 = "Head", 
            C0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), 
            C1 = CFrame.new(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0), 
            MaxVelocity = 0.1
        }, 
        ["Right Shoulder"] = {
            Name = "Right Shoulder", 
            Part0 = "Torso", 
            Part1 = "Right Arm", 
            C0 = CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), 
            C1 = CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), 
            MaxVelocity = 0.1
        }, 
        ["Right Hip"] = {
            Name = "Right Hip", 
            Part0 = "Torso", 
            Part1 = "Right Leg", 
            C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), 
            C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0), 
            MaxVelocity = 0.1
        }
    };
    local function v6(v2) --[[ Line: 52 ]] --[[ Name: findOrCreateJoint ]]
        -- upvalues: v0 (copy)
        v2.Part0 = v0:FindFirstChild(v2.Part0);
        v2.Part1 = v0:FindFirstChild(v2.Part1);
        if not v2.Part0 or not v2.Part1 then
            return;
        else
            local l_FirstChild_0 = v2.Part0:FindFirstChild(v2.Name);
            if not l_FirstChild_0 then
                l_FirstChild_0 = Instance.new("Motor6D");
                l_FirstChild_0.Parent = v2.Part0;
            end;
            for v4, v5 in pairs(v2) do
                l_FirstChild_0[v4] = v5;
            end;
            return;
        end;
    end;
    local l_Humanoid_0 = v0:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0.RigType == Enum.HumanoidRigType.R6 then
        for _, v9 in pairs(v1) do
            v6(v9);
        end;
        return;
    else
        l_Humanoid_0:BuildRigFromAttachments();
        return;
    end;
end;
local function v11(v12, v13, v14, v15) --[[ Line: 78 ]] --[[ Name: setPartPosition ]]
    -- upvalues: v11 (copy)
    v15 = v15 or {};
    if not v13 then
        return;
    elseif v15[v13] then
        warn(tostring(v12) .. "'s JointInstance form a circular hierarchy");
        return;
    else
        v15[v13] = true;
        v13.Anchored = false;
        v13.CFrame = v14;
        for _, v17 in v12:GetDescendants() do
            if v17:IsA("JointInstance") and v17.Enabled and v17.Part0 == v13 then
                local v18 = v17.Part0.CFrame * v17.C0 * v17.C1:Inverse();
                v11(v12, v17.Part1, v18, v15);
            end;
        end;
        return;
    end;
end;
local function v19(v20, v21) --[[ Line: 104 ]] --[[ Name: findMatchingAttachment ]]
    -- upvalues: v19 (copy)
    for _, v23 in v20:GetChildren() do
        if not v23:IsA("Accessory") and not v23:IsA("Tool") then
            if v23:IsA("Attachment") and v23.Name == v21 then
                return v23;
            else
                local v24 = v19(v23, v21);
                if v24 then
                    return v24;
                end;
            end;
        end;
    end;
end;
local function v31(v25) --[[ Line: 120 ]] --[[ Name: setAccessories ]]
    -- upvalues: v19 (copy)
    for _, v27 in v25:GetChildren() do
        if v27:IsA("Accessory") then
            local l_Handle_0 = v27:FindFirstChild("Handle");
            local l_Attachment_0 = l_Handle_0:FindFirstChildWhichIsA("Attachment");
            if l_Attachment_0 then
                local v30 = v19(v25, l_Attachment_0);
                if v30 then
                    l_Handle_0.CFrame = v30.Parent.CFrame * v30.CFrame * l_Attachment_0.CFrame:Inverse();
                    return;
                end;
            end;
            l_Handle_0.CFrame = v25:FindFirstChild("Head").CFrame * CFrame.new(0, 0.5, 0) * v27.AttachmentPoint:Inverse();
        end;
    end;
end;
local function v35(v32) --[[ Line: 143 ]] --[[ Name: deleteScripts ]]
    for _, v34 in v32:GetDescendants() do
        if v34:IsA("Script") then
            v34:Destroy();
        end;
    end;
end;
return function(v36, v37) --[[ Line: 151 ]] --[[ Name: resetCharacter ]]
    -- upvalues: v10 (copy), v11 (copy), v31 (copy), v35 (copy)
    if not v37 then
        v37 = CFrame.new();
    end;
    assert(v36:FindFirstChildWhichIsA("Humanoid"), "model does not contain humanoid");
    local l_HumanoidRootPart_0 = v36:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 and v36:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        l_HumanoidRootPart_0 = Instance.new("Part", v36);
        l_HumanoidRootPart_0.Name = "HumanoidRootPart";
        l_HumanoidRootPart_0.Size = Vector3.new(2, 2, 1, 0);
        l_HumanoidRootPart_0.Transparency = 1;
    end;
    if not l_HumanoidRootPart_0 then
        return;
    else
        v10(v36);
        v11(v36, l_HumanoidRootPart_0, v37);
        v31(v36);
        v35(v36);
        return;
    end;
end;