local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkFaceImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagBulkFaceImporterRemoveDashSplitOn);
local v2 = if v1() then nil else require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
local function v14(v3, v4, v5, v6) --[[ Line: 10 ]] --[[ Name: loadAvatarBody ]]
    local l_Humanoid_0 = v5:FindFirstChild("Humanoid");
    if l_Humanoid_0 ~= nil then
        local l_Items_0 = v4:GetBundleDetailsAsync(v6).Items;
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        l_HumanoidDescription_0.BodyTypeScale = 1;
        l_HumanoidDescription_0.ProportionScale = 0;
        for v10 = 1, #l_Items_0 do
            local l_Id_0 = l_Items_0[v10].Id;
            local l_AssetTypeId_0 = v3:GetProductInfo(l_Id_0).AssetTypeId;
            if l_AssetTypeId_0 == 27 then
                l_HumanoidDescription_0.Torso = l_Id_0;
            elseif l_AssetTypeId_0 == 28 then
                l_HumanoidDescription_0.RightArm = l_Id_0;
            elseif l_AssetTypeId_0 == 29 then
                l_HumanoidDescription_0.LeftArm = l_Id_0;
            elseif l_AssetTypeId_0 == 30 then
                l_HumanoidDescription_0.LeftLeg = l_Id_0;
            elseif l_AssetTypeId_0 == 31 then
                l_HumanoidDescription_0.RightLeg = l_Id_0;
            end;
        end;
        l_HumanoidDescription_0.HeadColor = BrickColor.new("Bright orange").Color;
        l_Humanoid_0:ApplyDescription(l_HumanoidDescription_0);
        local v13 = v5.PrimaryPart.Size.Y / 2 + v5.Humanoid.HipHeight;
        v5:PivotTo((CFrame.new(v5.PrimaryPart.Position.X, v13, v5.PrimaryPart.Position.Z)));
    end;
end;
return function(v15) --[[ Line: 54 ]] --[[ Name: setTestAvatarBody ]]
    -- upvalues: v1 (copy), v2 (copy), v14 (copy)
    local l_RunService_0 = game:GetService("RunService");
    local l_AssetService_0 = game:GetService("AssetService");
    local l_MarketplaceService_0 = game:GetService("MarketplaceService");
    local l_Selection_0 = game:GetService("Selection");
    if not l_RunService_0:IsRunning() then
        local v20 = nil;
        if string.find(v15.bundleIDs, ",") ~= nil then
            v20 = if v1() then string.split(v15.bundleIDs, ",") else v2(v15.bundleIDs, ",");
        elseif v15.bundleIDs ~= "" then
            v20 = {
                v15.bundleIDs
            };
        end;
        for v21, v22 in pairs(v20) do
            local v23 = l_Selection_0:Get()[1];
            if v21 == 1 then
                v14(l_MarketplaceService_0, l_AssetService_0, v23, (tonumber(v22)));
            elseif v21 >= 1 then
                local v24 = v23:Clone();
                v24.Parent = workspace;
                v14(l_MarketplaceService_0, l_AssetService_0, v24, (tonumber(v22)));
            end;
        end;
        return;
    else
        print("changing body is currently only editor mode.");
        return;
    end;
end;