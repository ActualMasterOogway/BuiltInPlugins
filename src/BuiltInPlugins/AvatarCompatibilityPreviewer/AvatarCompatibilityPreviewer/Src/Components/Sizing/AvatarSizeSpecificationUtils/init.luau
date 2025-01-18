local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local v2 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local v3 = require(l_script_FirstAncestor_0.Src.Util.BoundingBoxUtils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v15 = {
    getSpecFromProportionType = function(v6) --[[ Line: 57 ]] --[[ Name: getSpecFromProportionType ]]
        -- upvalues: l_AvatarCreationService_0 (copy)
        local l_l_AvatarCreationService_0_ValidationRules_0 = l_AvatarCreationService_0:GetValidationRules();
        local function v11(v8) --[[ Line: 62 ]] --[[ Name: getForAssetType ]]
            -- upvalues: l_l_AvatarCreationService_0_ValidationRules_0 (copy), v6 (copy)
            local v9 = l_l_AvatarCreationService_0_ValidationRules_0.BodyPartRules[v8];
            if v9 == nil then
                error(string.format("ValidationRules missing entry for assetType %s", (tostring(v8))));
            end;
            local v10 = v9.Bounds[v6];
            if v10 == nil then
                error(string.format("ValidationRules missing entry for assetType %s and proportionType %s", tostring(v8), (tostring(v6))));
            end;
            return {
                minSize = v10.MinSize, 
                maxSize = v10.MaxSize
            };
        end;
        return {
            head = v11(Enum.AssetType.DynamicHead), 
            arm = v11(Enum.AssetType.LeftArm), 
            torso = v11(Enum.AssetType.Torso), 
            leg = v11(Enum.AssetType.LeftLeg)
        };
    end, 
    createR15BodySegment = function(v12, v13, v14) --[[ Line: 93 ]] --[[ Name: createR15BodySegment ]]
        return {
            bodySegmentType = v12, 
            key = v13, 
            r15BodyParts = v14
        };
    end
};
v15.getBodyPartR15FromBodySegmentType = function(v16) --[[ Line: 107 ]] --[[ Name: getBodyPartR15FromBodySegmentType ]]
    -- upvalues: v15 (copy)
    if v16 == "head" then
        return v15.createR15BodySegment("head", "head", {
            Enum.BodyPartR15.Head
        });
    elseif v16 == "leftArm" then
        return v15.createR15BodySegment("arm", "leftArm", {
            Enum.BodyPartR15.LeftUpperArm, 
            Enum.BodyPartR15.LeftLowerArm, 
            Enum.BodyPartR15.LeftHand
        });
    elseif v16 == "rightArm" then
        return v15.createR15BodySegment("arm", "rightArm", {
            Enum.BodyPartR15.RightUpperArm, 
            Enum.BodyPartR15.RightLowerArm, 
            Enum.BodyPartR15.RightHand
        });
    elseif v16 == "leftLeg" then
        return v15.createR15BodySegment("leg", "leftLeg", {
            Enum.BodyPartR15.LeftUpperLeg, 
            Enum.BodyPartR15.LeftLowerLeg, 
            Enum.BodyPartR15.LeftFoot
        });
    elseif v16 == "rightLeg" then
        return v15.createR15BodySegment("leg", "rightLeg", {
            Enum.BodyPartR15.RightUpperLeg, 
            Enum.BodyPartR15.RightLowerLeg, 
            Enum.BodyPartR15.RightFoot
        });
    elseif v16 == "torso" then
        return v15.createR15BodySegment(v16, "torso", {
            Enum.BodyPartR15.UpperTorso, 
            Enum.BodyPartR15.LowerTorso
        });
    else
        error("Invalid bodySegmentType");
        return;
    end;
end;
v15.createInvalidBodyPartFactory = function(v17) --[[ Line: 149 ]] --[[ Name: createInvalidBodyPartFactory ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_Humanoid_0 = v17:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 == nil then
        return nil;
    else
        local l_HumanoidRootPart_0 = v17:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 == nil or not l_HumanoidRootPart_0:IsA("BasePart") then
            return nil;
        else
            local v20 = {};
            local v21 = {};
            local function v26(v22) --[[ Line: 163 ]] --[[ Name: getAccessoryBodyType ]]
                -- upvalues: l_Humanoid_0 (copy)
                local l_AccessoryWeld_0 = v22:FindFirstChild("AccessoryWeld");
                if l_AccessoryWeld_0 == nil or not l_AccessoryWeld_0:IsA("Weld") then
                    return nil;
                elseif l_AccessoryWeld_0.Part0 ~= v22 then
                    return nil;
                else
                    local l_Part1_0 = l_AccessoryWeld_0.Part1;
                    if not l_Part1_0 then
                        return nil;
                    elseif l_Part1_0.Parent ~= l_Humanoid_0.Parent then
                        return nil;
                    else
                        local l_l_Humanoid_0_BodyPartR15_0 = l_Humanoid_0:GetBodyPartR15(l_Part1_0);
                        if l_l_Humanoid_0_BodyPartR15_0 then
                            return l_l_Humanoid_0_BodyPartR15_0;
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
            for _, v28 in v17:GetChildren() do
                if v28:IsA("Accessory") then
                    local l_Handle_0 = v28:FindFirstChild("Handle");
                    if l_Handle_0 ~= nil and l_Handle_0:IsA("BasePart") then
                        local v30 = v26(l_Handle_0);
                        if v30 then
                            if v21[v30] == nil then
                                v21[v30] = {
                                    l_Handle_0
                                };
                            else
                                table.insert(v21[v30], l_Handle_0);
                            end;
                        else
                            continue;
                        end;
                    else
                        continue;
                    end;
                end;
                if v28:IsA("BasePart") then
                    local l_l_Humanoid_0_BodyPartR15_1 = l_Humanoid_0:GetBodyPartR15(v28);
                    if l_l_Humanoid_0_BodyPartR15_1 then
                        if v20[l_l_Humanoid_0_BodyPartR15_1] == nil then
                            v20[l_l_Humanoid_0_BodyPartR15_1] = {
                                v28
                            };
                        else
                            table.insert(v20[l_l_Humanoid_0_BodyPartR15_1], v28);
                        end;
                    end;
                end;
            end;
            local function v43(v32) --[[ Line: 226 ]] --[[ Name: getSegmentParts ]]
                -- upvalues: v20 (copy), v21 (copy)
                local v33 = {};
                local v34 = {};
                for _, v36 in v32.r15BodyParts do
                    local v37 = v20[v36];
                    if v37 ~= nil then
                        for _, v39 in v37 do
                            table.insert(v33, v39);
                        end;
                    end;
                    local v40 = v21[v36];
                    if v40 ~= nil then
                        for _, v42 in v40 do
                            table.insert(v34, v42);
                        end;
                    end;
                end;
                return v33, v34;
            end;
            local function v50(v44) --[[ Line: 249 ]] --[[ Name: getProportions ]]
                -- upvalues: v43 (copy), v2 (ref)
                local v45 = v43(v44);
                local v46 = {};
                for _, v48 in v45 do
                    local v49 = v2.getAvatarPartScaleType(v48);
                    if v49 then
                        table.insert(v46, v49);
                    end;
                end;
                return v2.computeAvatarPartScaleType(v46);
            end;
            return {
                getInvalidBodyPart = function(v51, v52) --[[ Line: 262 ]] --[[ Name: getInvalidBodyPart ]]
                    -- upvalues: v43 (copy), l_HumanoidRootPart_0 (copy), v3 (ref)
                    local v53, v54 = v43(v51);
                    if next(v53) == nil then
                        return nil;
                    else
                        local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                        local v56, v57 = v3.getAABoundingBox(v53, l_CFrame_0);
                        return {
                            key = v51.key, 
                            bodySegmentType = v51.bodySegmentType, 
                            cframe = l_CFrame_0:ToWorldSpace(CFrame.new(v56)), 
                            size = v57, 
                            accessoryParts = v54, 
                            r15BodyParts = v51.r15BodyParts, 
                            segmentParts = v53, 
                            sizeBounds = v52
                        };
                    end;
                end, 
                getProportions = v50
            };
        end;
    end;
end;
v15.computeInvalidBodyPartList = function(v58, v59) --[[ Line: 289 ]] --[[ Name: computeInvalidBodyPartList ]]
    -- upvalues: v15 (copy)
    local v60 = {};
    if v59.ok ~= true then
        return v60;
    else
        local v61 = v15.createInvalidBodyPartFactory(v58);
        if not v61 then
            return v60;
        else
            local function v70(v62, v63) --[[ Line: 307 ]] --[[ Name: processBodySegment ]]
                -- upvalues: v15 (ref), v61 (copy), v60 (copy)
                local v64 = v15.getBodyPartR15FromBodySegmentType(v62);
                local v65 = v61.getProportions(v64);
                if v65 == nil or v65 == "Mixed" then
                    return;
                else
                    local v66 = v63[v65];
                    if v66 == nil then
                        return;
                    elseif not v66.ok then
                        return;
                    else
                        local v67 = {
                            minSize = v63.meshSize * Vector3.new(v66.X.min, v66.Y.min, v66.Z.min), 
                            maxSize = v63.overallSize * Vector3.new(v66.X.max, v66.Y.max, v66.Z.max)
                        };
                        local v68 = false;
                        if v66.max >= 1 then
                            v68 = false;
                            if v66.min <= 1 then
                                v68 = v66.min <= v66.max;
                            end;
                        end;
                        if v68 then
                            return;
                        else
                            local v69 = v61.getInvalidBodyPart(v64, v67);
                            if v69 then
                                table.insert(v60, v69);
                                return;
                            else
                                warn("No invalidBodyPart");
                                return;
                            end;
                        end;
                    end;
                end;
            end;
            v70("head", v59.DynamicHead);
            v70("torso", v59.Torso);
            v70("leftArm", v59.LeftArm);
            v70("rightArm", v59.RightArm);
            v70("leftLeg", v59.LeftLeg);
            v70("rightLeg", v59.RightLeg);
            return v60;
        end;
    end;
end;
v15.getBodyTypeSizeSpecification = function(v71, v72) --[[ Line: 352 ]] --[[ Name: getBodyTypeSizeSpecification ]]
    -- upvalues: v15 (copy), v2 (copy)
    if v71 == "Classic" then
        return v15.getSpecFromProportionType(v71);
    elseif v71 == "ProportionsNormal" then
        return v15.getSpecFromProportionType(v71);
    elseif v71 == "ProportionsSlender" then
        return v15.getSpecFromProportionType(v71);
    elseif v71 == "Mixed" then
        local l_Humanoid_1 = v72:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_1 == nil then
            return v15.getSpecFromProportionType("ProportionsNormal");
        elseif l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return v15.getSpecFromProportionType("Classic");
        else
            local v74 = {};
            local function v77(v75, v76) --[[ Line: 374 ]] --[[ Name: assignBodyPartSizeBounds ]]
                -- upvalues: v74 (copy)
                if v74[v75] == v76 then
                    return;
                else
                    if v74[v75] ~= nil then
                        v74[v75] = {
                            minSize = Vector3.new(math.min(v74[v75].minSize.X, v76.minSize.X), math.min(v74[v75].minSize.Y, v76.minSize.Y), (math.min(v74[v75].minSize.Z, v76.minSize.Z))), 
                            maxSize = Vector3.new(math.max(v74[v75].maxSize.X, v76.maxSize.X), math.max(v74[v75].maxSize.Y, v76.maxSize.Y), (math.max(v74[v75].maxSize.Z, v76.maxSize.Z)))
                        };
                    end;
                    v74[v75] = v76;
                    return;
                end;
            end;
            for _, v79 in v2.allAvatarPartScaleTypeValueObjects(v72) do
                local l_Value_0 = v79.Value;
                if l_Value_0 == "ProportionsNormal" or l_Value_0 == "ProportionsSlender" or l_Value_0 == "Classic" then
                    local l_Parent_0 = v79.Parent;
                    if typeof(l_Parent_0) == "Instance" and l_Parent_0:IsA("BasePart") then
                        local l_l_Humanoid_1_BodyPartR15_0 = l_Humanoid_1:GetBodyPartR15(l_Parent_0);
                        if l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.Head then
                            v77("head", v15.getSpecFromProportionType(l_Value_0).head);
                        elseif l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftUpperArm or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftLowerArm or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftHand or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightUpperArm or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightLowerArm or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightHand then
                            v77("arm", v15.getSpecFromProportionType(l_Value_0).arm);
                        elseif l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.UpperTorso or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LowerTorso then
                            v77("torso", v15.getSpecFromProportionType(l_Value_0).torso);
                        elseif l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftUpperLeg or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftLowerLeg or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.LeftFoot or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightUpperLeg or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightLowerLeg or l_l_Humanoid_1_BodyPartR15_0 == Enum.BodyPartR15.RightFoot then
                            v77("leg", v15.getSpecFromProportionType(l_Value_0).leg);
                        end;
                    end;
                end;
            end;
            local v83 = v15.getSpecFromProportionType("Classic");
            if not v74.head then
                v74.head = v83.head;
            end;
            if not v74.arm then
                v74.arm = v83.arm;
            end;
            if not v74.torso then
                v74.torso = v83.torso;
            end;
            if not v74.leg then
                v74.leg = v83.leg;
            end;
            return v74;
        end;
    else
        error("Invalid proportions value");
        return;
    end;
end;
v15.guessAvatarSizeBounds = function(v84) --[[ Line: 473 ]] --[[ Name: guessAvatarSizeBounds ]]
    local v85 = v84.arm.minSize.X * 2 + v84.torso.minSize.X;
    local v86 = v84.arm.maxSize.X * 2 + v84.torso.maxSize.X;
    local v87 = v84.head.minSize.Y + v84.torso.minSize.Y + v84.leg.minSize.Y;
    local v88 = v84.head.maxSize.Y + v84.torso.maxSize.Y + v84.leg.maxSize.Y;
    local v89 = math.max(v84.head.minSize.Z, v84.arm.minSize.Z, v84.leg.minSize.Z, v84.torso.minSize.Z);
    local v90 = math.max(v84.head.maxSize.Z, v84.arm.maxSize.Z, v84.leg.maxSize.Z, v84.torso.maxSize.Z);
    return {
        minSize = Vector3.new(v85, v87, v89), 
        maxSize = Vector3.new(v86, v88, v90)
    };
end;
v15.getAvatarSizeBoundsFromValidationResults = function(v91, v92) --[[ Line: 504 ]] --[[ Name: getAvatarSizeBoundsFromValidationResults ]]
    if not v91.ok then
        return nil;
    elseif v92 == "Mixed" then
        return nil;
    else
        local l_FullBody_0 = v91.FullBody;
        local v94 = l_FullBody_0[v92];
        if v94 == nil then
            return nil;
        elseif not v94.ok then
            return nil;
        else
            return {
                minSize = l_FullBody_0.meshSize * Vector3.new(v94.X.min, v94.Y.min, v94.Z.min), 
                maxSize = l_FullBody_0.overallSize * Vector3.new(v94.X.max, v94.Y.max, v94.Z.max)
            };
        end;
    end;
end;
v15.coversMin = function(v95, v96) --[[ Line: 536 ]] --[[ Name: coversMin ]]
    local v97 = false;
    if v95.X >= v96.X then
        v97 = false;
        if v95.Y >= v96.Y then
            v97 = v95.Z >= v96.Z;
        end;
    end;
    return v97;
end;
v15.containsMax = function(v98, v99) --[[ Line: 540 ]] --[[ Name: containsMax ]]
    local v100 = false;
    if v98.X <= v99.X then
        v100 = false;
        if v98.Y <= v99.Y then
            v100 = v98.Z <= v99.Z;
        end;
    end;
    return v100;
end;
v15.getScaleFactorToContain = function(v101, v102) --[[ Line: 544 ]] --[[ Name: getScaleFactorToContain ]]
    local function _(v103, v104) --[[ Line: 545 ]] --[[ Name: getAxisScale ]]
        return v103 / v104;
    end;
    return (math.max(math.max(v101.X / v102.X, v101.Y / v102.Y), v101.Z / v102.Z));
end;
v15.getScaleFactorToCover = function(v106, v107) --[[ Line: 556 ]] --[[ Name: getScaleFactorToCover ]]
    local function _(v108, v109) --[[ Line: 557 ]] --[[ Name: getAxisScale ]]
        return v108 / v109;
    end;
    return (math.min(math.min(v106.X / v107.X, v106.Y / v107.Y), v106.Z / v107.Z));
end;
v15.fitsSizeBounds = function(v111, v112) --[[ Line: 568 ]] --[[ Name: fitsSizeBounds ]]
    -- upvalues: v15 (copy)
    return v15.coversMin(v111, v112.minSize) and v15.containsMax(v111, v112.maxSize);
end;
return v15;