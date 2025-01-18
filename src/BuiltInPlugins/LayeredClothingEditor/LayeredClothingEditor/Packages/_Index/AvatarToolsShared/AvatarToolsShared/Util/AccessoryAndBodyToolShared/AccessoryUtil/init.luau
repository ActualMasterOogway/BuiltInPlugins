local v0 = game:DefineFastFlag("UseMockMannequin", false);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = script.Parent;
local v3 = require(l_Parent_1.AssetTypeAttachmentInfo);
local v4 = require(l_Parent_1.AvatarUtil);
local v5 = require(l_Parent_1.Constants);
local v6 = require(l_Parent_0.Flags.GetFFlagUseModelCageForAccessoryFittingTool);
local v7 = {};
local _ = game:GetService("Workspace");
local l_CoreGui_0 = game:GetService("CoreGui");
v7.getSpecialMesh = function(v10, v11) --[[ Line: 25 ]] --[[ Name: getSpecialMesh ]]
    local v12 = v10:getHandle(v11);
    if not v12 then
        return;
    else
        return v12:FindFirstChildWhichIsA("SpecialMesh");
    end;
end;
v7.getSpecialMeshScale = function(v13, v14) --[[ Line: 34 ]] --[[ Name: getSpecialMeshScale ]]
    local v15 = v13:getSpecialMesh(v14);
    if not v15 then
        return;
    else
        return v15.Scale;
    end;
end;
v7.setSpecialMeshScale = function(v16, v17, v18) --[[ Line: 43 ]] --[[ Name: setSpecialMeshScale ]]
    local v19 = v16:getSpecialMesh(v17);
    if not v19 then
        return;
    else
        v19.Scale = v18;
        return;
    end;
end;
v7.getHandle = function(_, v21) --[[ Line: 52 ]] --[[ Name: getHandle ]]
    if v21:IsA("BasePart") then
        return v21;
    elseif v21:IsA("Accessory") then
        return v21:FindFirstChild("Handle");
    elseif v21:IsA("Model") then
        return v21:FindFirstChildWhichIsA("BasePart");
    else
        return;
    end;
end;
v7.findMatchingAccessoryAndAvatarAttachments = function(v22, v23, v24) --[[ Line: 62 ]] --[[ Name: findMatchingAccessoryAndAvatarAttachments ]]
    for _, v26 in ipairs(v23:GetChildren()) do
        if v26:IsA("Attachment") then
            local v27 = v22:findAvatarAttachmentByName(v24, v26.Name);
            if v27 then
                return v26, v27;
            end;
        end;
    end;
end;
v7.findAvatarAttachmentByName = function(_, v29, v30) --[[ Line: 73 ]] --[[ Name: findAvatarAttachmentByName ]]
    if v30 == "" or v30 == nil or not v29 then
        return nil;
    else
        local l_v29_Children_0 = v29:GetChildren();
        for _, v33 in ipairs(l_v29_Children_0) do
            if v33:IsA("BasePart") and not v33:FindFirstChildWhichIsA("WrapLayer") then
                local l_v33_FirstChild_0 = v33:FindFirstChild(v30);
                if l_v33_FirstChild_0 and l_v33_FirstChild_0:IsA("Attachment") then
                    return l_v33_FirstChild_0;
                else
                    local l_v33_FirstChild_1 = v33:FindFirstChild(v30 .. "Attachment");
                    if l_v33_FirstChild_1 and l_v33_FirstChild_1:IsA("Attachment") then
                        return l_v33_FirstChild_1;
                    end;
                end;
            end;
        end;
        return nil;
    end;
end;
v7.addWeld = function(_, v37, v38, v39, v40) --[[ Line: 103 ]] --[[ Name: addWeld ]]
    if v37 then
        v40.CFrame = v37;
    end;
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v38;
    l_Weld_0.C0 = v38.CFrame:inverse() * v39.CFrame;
    l_Weld_0.Part1 = v39;
    l_Weld_0.Parent = v40;
end;
v7.clearWelds = function(_, v43) --[[ Line: 115 ]] --[[ Name: clearWelds ]]
    for _, v45 in pairs(v43:GetDescendants()) do
        if v45:IsA("WeldConstraint") or v45:IsA("Weld") or v45:IsA("Motor6D") then
            v45:Destroy();
        end;
    end;
end;
v7.getAutomaticAccessoryScaling = function(v46, v47, v48, v49) --[[ Line: 123 ]] --[[ Name: getAutomaticAccessoryScaling ]]
    local l_Humanoid_0 = v47:FindFirstChildWhichIsA("Humanoid");
    if not l_Humanoid_0 then
        return (Vector3.new(1, 1, 1, 0));
    else
        local v51 = v46:findAvatarAttachmentByName(v47, v49);
        if not v51 then
            return (Vector3.new(1, 1, 1, 0));
        else
            local l_l_Humanoid_0_BodyPartR15_0 = l_Humanoid_0:GetBodyPartR15(v51.Parent);
            if l_l_Humanoid_0_BodyPartR15_0 == Enum.BodyPartR15.Unknown then
                return (Vector3.new(1, 1, 1, 0));
            else
                return l_Humanoid_0:GetAccessoryHandleScale(v48, l_l_Humanoid_0_BodyPartR15_0);
            end;
        end;
    end;
end;
local function v60(v53) --[[ Line: 142 ]] --[[ Name: isAccessoryOrClothingAttachment ]]
    -- upvalues: v3 (copy)
    for _, v55 in pairs(v3) do
        for _, v57 in pairs(v55) do
            for _, v59 in pairs(v57.Attachments) do
                if v59.Name == v53.Name or v59.Name == v53.Name .. "Attachment" then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v7.getItemCFrameRelativeToAttachmentPoint = function(_, v62, v63, v64) --[[ Line: 156 ]] --[[ Name: getItemCFrameRelativeToAttachmentPoint ]]
    if v62 then
        local l_v63_FirstChild_0 = v63:FindFirstChild(v62, true);
        if l_v63_FirstChild_0 then
            return CFrame.new(l_v63_FirstChild_0.WorldPosition):inverse() * v64.CFrame;
        end;
    end;
end;
v7.clearAccessoryAssetAttachmentsWithFilter = function(_, v67, v68) --[[ Line: 165 ]] --[[ Name: clearAccessoryAssetAttachmentsWithFilter ]]
    -- upvalues: v60 (copy)
    local l_v67_Children_0 = v67:GetChildren();
    if v68 then
        l_v67_Children_0 = v68(l_v67_Children_0);
    end;
    for _, v71 in ipairs(l_v67_Children_0) do
        if v71:IsA("Attachment") and v60(v71) then
            v71:Destroy();
        end;
    end;
end;
v7.getExistingAttachmentInstance = function(_, v73, v74) --[[ Line: 179 ]] --[[ Name: getExistingAttachmentInstance ]]
    local v75 = nil;
    for _, v77 in ipairs(v73:GetChildren()) do
        if v74 == v77.Name then
            return v77;
        end;
    end;
    return v75;
end;
v7.getExistingAttachmentPoint = function(v78, v79, v80, v81) --[[ Line: 191 ]] --[[ Name: getExistingAttachmentPoint ]]
    if not v78:findAvatarAttachmentByName(v80, v81) then
        return;
    else
        local v82 = v78:getExistingAttachmentInstance(v79, v81);
        if not v82 then
            return;
        else
            return {
                ItemCFrame = v82.CFrame:inverse(), 
                AttachmentCFrame = v82.CFrame
            };
        end;
    end;
end;
v7.createOrReuseAttachmentInstance = function(v83, v84, v85, v86, v87, v88) --[[ Line: 208 ]] --[[ Name: createOrReuseAttachmentInstance ]]
    if not v86 then
        return;
    else
        local v89 = v83:findAvatarAttachmentByName(v85, v86);
        if not v89 then
            return;
        else
            local v90 = v83:getExistingAttachmentInstance(v84, v86);
            v83:clearAccessoryAssetAttachmentsWithFilter(v84, function(v91) --[[ Line: 226 ]]
                -- upvalues: v86 (copy)
                local v92 = {};
                for _, v94 in ipairs(v91) do
                    if v94.Name ~= v86 then
                        table.insert(v92, v94);
                    end;
                end;
                return v92;
            end);
            if not v90 then
                v90 = Instance.new("Attachment", v84);
                v90.Name = v86;
            end;
            if v87 and v88 then
                v90.CFrame = v87;
                v84.CFrame = CFrame.new(v89.WorldPosition) * v88;
                return;
            else
                v90.CFrame = v89.Parent.CFrame;
                return;
            end;
        end;
    end;
end;
v7.attachNonLayeredItem = function(v95, v96, v97, v98, v99) --[[ Line: 249 ]] --[[ Name: attachNonLayeredItem ]]
    -- upvalues: v4 (copy)
    local v100 = v4:getRootPart(v96);
    if not v100 then
        return;
    else
        if v98 == nil then
            v98 = "";
        end;
        v97.Parent = v96;
        v95:clearWelds(v97);
        if v99 then
            v97.Size = v97.Size * v95:getAutomaticAccessoryScaling(v96, v97, v98);
        end;
        local l_v97_FirstChild_0 = v97:FindFirstChild(v98);
        if not l_v97_FirstChild_0 then
            v95:addWeld(v100.CFrame, v97, v100, v97);
            return;
        else
            local v102 = v95:findAvatarAttachmentByName(v96, l_v97_FirstChild_0.Name);
            if not v102 then
                v95:addWeld(v100.CFrame, v97, v100, v97);
                return;
            else
                v95:addWeld(nil, v97, v102.Parent, v97);
                return;
            end;
        end;
    end;
end;
v7.attachClothingItem = function(v103, v104, v105, v106, v107) --[[ Line: 279 ]] --[[ Name: attachClothingItem ]]
    -- upvalues: v4 (copy), l_CoreGui_0 (copy), v0 (copy), v6 (copy)
    local v108 = v4:getRootPart(v104);
    if not v108 then
        return;
    elseif v105:IsA("Accessory") then
        local v109 = v104:FindFirstAncestorOfClass("DataModel") ~= nil;
        if not v109 then
            v104.Parent = l_CoreGui_0;
        end;
        v105.Parent = v104;
        if not v109 then
            v104.Parent = nil;
        end;
        return;
    else
        local v110 = nil;
        for _, v112 in pairs(v104:GetDescendants()) do
            if v112:IsA("WrapTarget") then
                v110 = v112;
                break;
            end;
        end;
        local v113 = {};
        for _, v115 in pairs(v105:GetChildren()) do
            if v115:IsA("WrapLayer") then
                table.insert(v113, {
                    mesh = v105, 
                    wrap = v115
                });
            end;
        end;
        if #v113 <= 0 then
            v103:attachNonLayeredItem(v104, v105, v106, v107);
            return;
        elseif not v110 then
            if v0 then
                v105.Parent = v104;
            end;
            return;
        else
            for _, v117 in ipairs(v113) do
                v103:clearWelds(v117.mesh);
            end;
            local _, v119 = v103:findMatchingAccessoryAndAvatarAttachments(v105, v104);
            if v106 then
                v119 = v103:findAvatarAttachmentByName(v104, v106);
            end;
            if v119 then
                local l_WrapTarget_0 = v119.Parent:FindFirstChildWhichIsA("WrapTarget");
                if l_WrapTarget_0 then
                    v110 = l_WrapTarget_0;
                end;
            end;
            local l_v110_0 = v110;
            local l_ImportOriginWorld_0 = l_v110_0.ImportOriginWorld;
            for _, v124 in ipairs(v113) do
                local l_wrap_0 = v124.wrap;
                v124.mesh.Parent = v104;
                if v6() then
                    local l_l_wrap_0_CageOffset_0 = l_wrap_0:GetCageOffset();
                    l_wrap_0.Parent.CFrame = l_v110_0.Parent.CFrame * l_wrap_0.CageOrigin:Inverse() - l_l_wrap_0_CageOffset_0;
                else
                    local v127 = l_ImportOriginWorld_0 * l_wrap_0.ImportOriginWorld:Inverse();
                    local l_CFrame_0 = l_wrap_0.Parent.CFrame;
                    l_wrap_0.Parent.CFrame = v127 * l_CFrame_0;
                end;
                local l_mesh_0 = v124.mesh;
                local l_v108_0 = v108;
                if v119 then
                    l_v108_0 = v119.Parent;
                end;
                v103:addWeld(nil, l_mesh_0, l_v108_0, v124.mesh);
            end;
            v105.Parent = v104;
            return;
        end;
    end;
end;
v7.getScaleType = function(_, v132) --[[ Line: 380 ]] --[[ Name: getScaleType ]]
    if not v132 then
        return;
    else
        local l_AvatarPartScaleType_0 = v132:FindFirstChild("AvatarPartScaleType");
        if not l_AvatarPartScaleType_0 then
            return;
        elseif not l_AvatarPartScaleType_0:IsA("StringValue") then
            return;
        else
            return l_AvatarPartScaleType_0.Value;
        end;
    end;
end;
v7.setScaleType = function(_, v135, v136) --[[ Line: 397 ]] --[[ Name: setScaleType ]]
    if not v135 or not v136 then
        return;
    else
        local l_AvatarPartScaleType_1 = v135:FindFirstChild("AvatarPartScaleType");
        if not l_AvatarPartScaleType_1 then
            l_AvatarPartScaleType_1 = Instance.new("StringValue");
            l_AvatarPartScaleType_1.Name = "AvatarPartScaleType";
            l_AvatarPartScaleType_1.Parent = v135;
        end;
        if not l_AvatarPartScaleType_1:IsA("StringValue") then
            return;
        else
            l_AvatarPartScaleType_1.Value = v136;
            return;
        end;
    end;
end;
v7.checkAccessoryBounds = function(_, v139, v140, v141, v142) --[[ Line: 416 ]] --[[ Name: checkAccessoryBounds ]]
    -- upvalues: v5 (copy)
    local l_p_0 = v141.p;
    local v144 = v141 - l_p_0;
    local v145 = {};
    for _, v147 in pairs(v5.CUBE_CORNERS) do
        table.insert(v145, l_p_0 + v142 * (v144 * v147));
    end;
    local v148 = v139 + v140 * v5.CUBE_CORNERS.LeftBottomFront;
    local v149 = v139 + v140 * v5.CUBE_CORNERS.RightTopBack;
    for _, v151 in ipairs(v145) do
        if v151.x < v148.X or v151.x > v149.X or v151.y < v148.Y or v151.y > v149.Y or v151.z < v148.Z or v151.z > v149.Z then
            return false;
        end;
    end;
    return true;
end;
return v7;