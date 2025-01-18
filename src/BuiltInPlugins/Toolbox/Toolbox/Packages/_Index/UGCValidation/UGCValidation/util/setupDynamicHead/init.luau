local l_Players_0 = game:GetService("Players");
local v1 = {
    LeftArm = 11714033534, 
    LeftLeg = 11714035598, 
    RightArm = 11714037276, 
    RightLeg = 11714039415, 
    Torso = 11714041015
};
local v2 = {
    "Head", 
    "Torso", 
    "LeftLeg", 
    "RightLeg", 
    "RightArm", 
    "LeftArm"
};
local v3 = Color3.fromRGB(163, 162, 165);
local function v28() --[[ Line: 22 ]] --[[ Name: getDefaultCharacter ]]
    -- upvalues: v2 (copy), v3 (copy), l_Players_0 (copy), v1 (copy)
    local v4 = false;
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    for _, v7 in v2 do
        l_HumanoidDescription_0[v7 .. "Color"] = v3;
    end;
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(l_HumanoidDescription_0, Enum.HumanoidRigType.R15);
    l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local function _(v9, v10) --[[ Line: 31 ]] --[[ Name: getObjects ]]
        local v11 = "https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v10) .. "&expectedAssetType=" .. v9;
        return game:GetObjectsAllOrNone(v11);
    end;
    local _ = function(v13, v14) --[[ Line: 40 ]] --[[ Name: getInstance ]]
        for _, v16 in pairs(v13) do
            if v16.Name == v14 then
                return v16;
            end;
        end;
        return nil;
    end;
    for v18, v19 in v1 do
        local v20 = "https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(v19) .. "&expectedAssetType=" .. v18;
        local l_game_ObjectsAllOrNone_0 = game:GetObjectsAllOrNone(v20);
        if not l_game_ObjectsAllOrNone_0 then
            return nil;
        else
            for _, v23 in pairs(l_game_ObjectsAllOrNone_0) do
                if v23.Name == "R15ArtistIntent" then
                    v20 = v23;
                    v4 = true;
                end;
                if v4 then
                    break;
                end;
            end;
            if not v4 then
                v20 = nil;
            end;
            v4 = false;
            if not v20 then
                return nil;
            else
                for _, v25 in v20:GetChildren() do
                    local l_SurfaceAppearance_0 = v25:FindFirstChildWhichIsA("SurfaceAppearance");
                    if l_SurfaceAppearance_0 then
                        l_SurfaceAppearance_0:Destroy();
                    end;
                    local l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild(v25.Name);
                    if l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0 then
                        l_l_l_Players_0_HumanoidModelFromDescription_0_FirstChild_0:Destroy();
                    end;
                    v25.Parent = l_l_Players_0_HumanoidModelFromDescription_0;
                end;
            end;
        end;
    end;
    l_l_Players_0_HumanoidModelFromDescription_0:PivotTo(CFrame.new(l_l_Players_0_HumanoidModelFromDescription_0:GetPivot().Position, l_l_Players_0_HumanoidModelFromDescription_0:GetPivot().Position + Vector3.new(0, 0, -1, 0)));
    return l_l_Players_0_HumanoidModelFromDescription_0;
end;
local function _(v29, v30) --[[ Line: 80 ]] --[[ Name: swapHead ]]
    v29:FindFirstChild("Head"):Destroy();
    v30.Parent = v29;
    v29:FindFirstChild("Humanoid"):BuildRigFromAttachments();
end;
local function v35(v32) --[[ Line: 87 ]] --[[ Name: hideNotHead ]]
    for _, v34 in v32:GetChildren() do
        if v34:IsA("MeshPart") and v34.Name ~= "Head" then
            v34.Transparency = 1;
        end;
    end;
end;
return function(v36) --[[ Line: 95 ]]
    -- upvalues: v28 (copy), v35 (copy)
    local v37 = v28();
    if not v37 then
        return nil;
    else
        v37:FindFirstChild("Head"):Destroy();
        v36.Parent = v37;
        v37:FindFirstChild("Humanoid"):BuildRigFromAttachments();
        v35(v37);
        return v37;
    end;
end;