local v0 = {};
local l_InsertService_0 = game:GetService("InsertService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v5 = require(l_Modules_0.CharacterMeshesMap);
local v6 = require(l_Modules_0.NpcIdManager);
local v7 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v8 = require(l_script_FirstAncestor_0.Src.Util.areCFramesEqual);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.normalizeAssetId);
local v10 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterCharacterScripts_0 = game:GetService("StarterPlayer"):FindFirstChild("StarterCharacterScripts");
local v14 = {
    AdaptInstance = "rbxasset://avatar/unification/AdaptInstance.lua", 
    SetupAdapterParts = "rbxasset://avatar/unification/SetupAdapterParts.lua"
};
local v15 = "rbxasset://avatar/unification/" .. "LocalEffects" .. ".lua";
local v16 = "rbxasset://avatar/unification/" .. "UnificationServerScript" .. "R15Migrator" .. ".lua";
local v17 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/AdapterReference.rbxm");
local v18 = l_InsertService_0:LoadLocalAsset("rbxasset://avatar/unification/R15.rbxm");
local l_Color_0 = v18.UpperTorso.Color;
local v20 = CFrame.Angles(1.5707963267948966, -3.141592653589793, 0);
local v21 = CFrame.Angles(0, -1.5707963267948966, 0);
local v22 = CFrame.Angles(0, 1.5707963267948966, 0);
local v23 = {
    RootJoint = {
        C0 = v20, 
        C1 = v20
    }, 
    Neck = {
        C0 = CFrame.new(0, 1, 0) * v20, 
        C1 = CFrame.new(0, -0.5, 0) * v20
    }, 
    ["Right Shoulder"] = {
        C0 = CFrame.new(1, 0.5, 0) * v22, 
        C1 = CFrame.new(-0.5, 0.5, 0) * v22
    }, 
    ["Right Hip"] = {
        C0 = CFrame.new(1, -1, 0) * v22, 
        C1 = CFrame.new(0.5, 1, 0) * v22
    }, 
    ["Left Shoulder"] = {
        C0 = CFrame.new(-1, 0.5, 0) * v21, 
        C1 = CFrame.new(0.5, 0.5, 0) * v21
    }, 
    ["Left Hip"] = {
        C0 = CFrame.new(-1, -1, 0) * v21, 
        C1 = CFrame.new(-0.5, 1, 0) * v21
    }
};
local v24 = {
    Root = v20:Inverse(), 
    Neck = v20:Inverse(), 
    RightShoulder = v22:Inverse(), 
    RightHip = v22:Inverse(), 
    LeftShoulder = v21:Inverse(), 
    LeftHip = v21:Inverse()
};
local v25 = {
    ["Left Hip"] = "LeftHip", 
    ["Right Hip"] = "RightHip", 
    ["Left Shoulder"] = "LeftShoulder", 
    ["Right Shoulder"] = "RightShoulder", 
    Neck = "Neck", 
    RootJoint = "Root"
};
local v26 = {
    ["Left Hip"] = {
        Part0Name = "Torso", 
        Part1Name = "Left Leg"
    }, 
    ["Right Hip"] = {
        Part0Name = "Torso", 
        Part1Name = "Right Leg"
    }, 
    ["Left Shoulder"] = {
        Part0Name = "Torso", 
        Part1Name = "Left Arm"
    }, 
    ["Right Shoulder"] = {
        Part0Name = "Torso", 
        Part1Name = "Right Arm"
    }, 
    Neck = {
        Part0Name = "Torso", 
        Part1Name = "Head"
    }, 
    RootJoint = {
        Part0Name = "HumanoidRootPart", 
        Part1Name = "Torso"
    }
};
local v27 = {
    [Enum.BodyPart.Head] = {
        "Head"
    }, 
    [Enum.BodyPart.Torso] = {
        "UpperTorso", 
        "LowerTorso"
    }, 
    [Enum.BodyPart.LeftArm] = {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand"
    }, 
    [Enum.BodyPart.RightArm] = {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand"
    }, 
    [Enum.BodyPart.LeftLeg] = {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot"
    }, 
    [Enum.BodyPart.RightLeg] = {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot"
    }
};
local v28 = {
    [Enum.BodyPart.Head] = "Head", 
    [Enum.BodyPart.Torso] = "Torso", 
    [Enum.BodyPart.LeftArm] = "Left Arm", 
    [Enum.BodyPart.RightArm] = "Right Arm", 
    [Enum.BodyPart.LeftLeg] = "Left Leg", 
    [Enum.BodyPart.RightLeg] = "Right Leg"
};
local v29 = {};
for v30, v31 in v28 do
    v29[v31] = v30;
end;
local v32 = {};
for v33, v34 in v27 do
    for _, v36 in v34 do
        v32[v36] = v33;
    end;
end;
local v37 = {
    "R15ArtistIntent", 
    "R15", 
    "R15Fixed"
};
v0.GetBodyPartR6 = function(v38) --[[ Line: 129 ]] --[[ Name: GetBodyPartR6 ]]
    -- upvalues: v29 (copy)
    if not v38 then
        return;
    else
        return v29[v38.Name];
    end;
end;
v0.GetR15PartsFromBodyPart = function(v39) --[[ Line: 137 ]] --[[ Name: GetR15PartsFromBodyPart ]]
    -- upvalues: v27 (copy)
    if not v39 then
        return;
    else
        return v27[v39];
    end;
end;
v0.GetLimbForR15Part = function(v40) --[[ Line: 145 ]] --[[ Name: GetLimbForR15Part ]]
    -- upvalues: v32 (copy), v28 (copy)
    if not v40 then
        return;
    else
        local v41 = v32[v40];
        if not v41 then
            return;
        else
            return v28[v41];
        end;
    end;
end;
local function _(v42, v43) --[[ Line: 157 ]] --[[ Name: isRigType ]]
    local l_Humanoid_0 = v42:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        return l_Humanoid_0.RigType == v43;
    else
        return false;
    end;
end;
v0.GetR6Npcs = function() --[[ Line: 162 ]] --[[ Name: GetR6Npcs ]]
    -- upvalues: v7 (copy)
    return v7(function(v46) --[[ Line: 163 ]] --[[ Name: isNpc ]]
        local v47 = v46:IsA("Model");
        if v47 then
            local l_R6_0 = Enum.HumanoidRigType.R6;
            local l_Humanoid_1 = v46:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                return l_Humanoid_1.RigType == l_R6_0;
            else
                v47 = false;
            end;
        end;
        return v47;
    end);
end;
v0.GetR15ConvertedNpcs = function() --[[ Line: 170 ]] --[[ Name: GetR15ConvertedNpcs ]]
    -- upvalues: v11 (copy), v7 (copy)
    return v7(function(v50) --[[ Line: 171 ]] --[[ Name: isR15ConvertedNpc ]]
        -- upvalues: v11 (ref)
        if v50:IsA("Model") then
            local l_R15_0 = Enum.HumanoidRigType.R15;
            local l_Humanoid_2 = v50:FindFirstChildOfClass("Humanoid");
            if if l_Humanoid_2 then l_Humanoid_2.RigType == l_R15_0 else false then
                return v11.hasConvertedFrom(v50);
            end;
        end;
        return false;
    end);
end;
v0.IsR15Complete = function(v53) --[[ Line: 181 ]] --[[ Name: IsR15Complete ]]
    -- upvalues: v27 (copy)
    if v53:IsA("Model") then
        local l_R15_1 = Enum.HumanoidRigType.R15;
        local l_Humanoid_3 = v53:FindFirstChildOfClass("Humanoid");
        if if l_Humanoid_3 then l_Humanoid_3.RigType == l_R15_1 else false then
            for _, v57 in v27 do
                for _, v59 in v57 do
                    if not v53:FindFirstChild(v59) then
                        return false;
                    end;
                end;
            end;
            return true;
        end;
    end;
    return false;
end;
v0.ClearAdapterSetup = function() --[[ Line: 197 ]] --[[ Name: ClearAdapterSetup ]]
    -- upvalues: v7 (copy), l_ReplicatedStorage_0 (copy), l_StarterCharacterScripts_0 (copy)
    for _, v62 in (v7(function(v60) --[[ Line: 198 ]] --[[ Name: isNpc ]]
        return v60:IsA("Model") and v60:FindFirstChild("Humanoid");
    end)) do
        for _, v64 in v62:GetDescendants() do
            if v64:IsA("LuaSourceContainer") and v64.Name == "UnificationServerScript" then
                v64:Destroy();
            end;
        end;
    end;
    local l_AvatarUnification_0 = l_ReplicatedStorage_0:FindFirstChild("AvatarUnification");
    if l_AvatarUnification_0 then
        l_AvatarUnification_0:Destroy();
    end;
    local l_LocalEffects_0 = l_StarterCharacterScripts_0:FindFirstChild("LocalEffects");
    if l_LocalEffects_0 then
        l_LocalEffects_0:Destroy();
    end;
end;
local function v75(v67) --[[ Line: 222 ]] --[[ Name: getCharacterMeshes ]]
    -- upvalues: v29 (copy), v9 (copy)
    local v68 = {};
    for _, v70 in v67:GetChildren() do
        if v70:IsA("CharacterMesh") then
            v68[v70.BodyPart] = tostring(v70.MeshId);
        end;
    end;
    for _, v72 in v67:GetChildren() do
        if v72:IsA("Part") and v29[v72.Name] then
            local l_SpecialMesh_0 = v72:FindFirstChildOfClass("SpecialMesh");
            local v74 = v29[v72.Name];
            if l_SpecialMesh_0 and l_SpecialMesh_0.MeshId ~= "" and not v68[v74] then
                v68[v74] = tostring(v9(l_SpecialMesh_0.MeshId) or l_SpecialMesh_0.MeshId);
            end;
        end;
    end;
    return v68;
end;
local function _(v76) --[[ Line: 246 ]] --[[ Name: createFaceDecal ]]
    if not v76 then
        return;
    else
        local l_Decal_0 = Instance.new("Decal");
        l_Decal_0.Name = "face";
        l_Decal_0.Color3 = v76.Color3;
        l_Decal_0.Texture = v76.Texture;
        l_Decal_0.Transparency = v76.Transparency;
        l_Decal_0.ZIndex = v76.ZIndex;
        return l_Decal_0;
    end;
end;
local function v92(v79, v80, v81, v82) --[[ Line: 261 ]] --[[ Name: loadDefaultR15Parts ]]
    -- upvalues: v27 (copy), v18 (copy)
    local v83 = v27[v79];
    if not v83 then
        return;
    else
        for _, v85 in v83 do
            local l_v18_FirstChild_0 = v18:FindFirstChild(v85);
            if l_v18_FirstChild_0 then
                local l_v80_FirstChild_0 = v80:FindFirstChild(v85);
                if l_v80_FirstChild_0 then
                    l_v80_FirstChild_0:Destroy();
                end;
                local v88 = l_v18_FirstChild_0:Clone();
                v88.Color = v81;
                if v79 == Enum.BodyPart.Head then
                    local l_Decal_1 = v88:FindFirstChildOfClass("Decal");
                    if l_Decal_1 and l_Decal_1.Name == "face" then
                        l_Decal_1:Destroy();
                    end;
                    local v90;
                    if not v82 then
                        v90 = nil;
                    else
                        local l_Decal_2 = Instance.new("Decal");
                        l_Decal_2.Name = "face";
                        l_Decal_2.Color3 = v82.Color3;
                        l_Decal_2.Texture = v82.Texture;
                        l_Decal_2.Transparency = v82.Transparency;
                        l_Decal_2.ZIndex = v82.ZIndex;
                        v90 = l_Decal_2;
                    end;
                    if v90 then
                        v90.Parent = v88;
                    end;
                end;
                v88.Parent = v80;
            end;
        end;
        return;
    end;
end;
local function v112(v93, v94, v95, v96, v97, v98) --[[ Line: 294 ]] --[[ Name: loadR15Parts ]]
    -- upvalues: v5 (copy), l_InsertService_0 (copy), v92 (copy), v37 (copy), v27 (copy)
    local v99 = v5[v95];
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 297 ]]
        -- upvalues: l_InsertService_0 (ref), v99 (copy)
        return l_InsertService_0:LoadAsset(v99);
    end);
    if not l_status_0 then
        warn("Failed to load R15 part for " .. tostring(v93) .. " with meshId " .. v95);
        v92(v93, v94);
        return;
    else
        local v102 = nil;
        for _, v104 in v37 do
            v102 = l_result_0:FindFirstChild(v104);
            if v102 then
                break;
            end;
        end;
        if not v102 then
            warn("Failed to find R15 folder for " .. tostring(v93) .. " with meshId " .. v95);
            v92(v93, v94);
            return;
        else
            for v105, v106 in v27[v93] do
                local l_v102_FirstChild_0 = v102:FindFirstChild(v106);
                if l_v102_FirstChild_0 then
                    local v108 = l_v102_FirstChild_0:Clone();
                    v108.Color = v96;
                    if v93 == Enum.BodyPart.Head then
                        local l_Decal_3 = v108:FindFirstChildOfClass("Decal");
                        if l_Decal_3 and l_Decal_3.Name == "face" then
                            l_Decal_3:Destroy();
                        end;
                        local v110;
                        if not v97 then
                            v110 = nil;
                        else
                            local l_Decal_4 = Instance.new("Decal");
                            l_Decal_4.Name = "face";
                            l_Decal_4.Color3 = v97.Color3;
                            l_Decal_4.Texture = v97.Texture;
                            l_Decal_4.Transparency = v97.Transparency;
                            l_Decal_4.ZIndex = v97.ZIndex;
                            v110 = l_Decal_4;
                        end;
                        if v110 then
                            v110.Parent = v108;
                        end;
                    elseif v105 == 1 and v98 then
                        v108.TextureID = v98;
                    end;
                    v108.Parent = v94;
                end;
            end;
            return;
        end;
    end;
end;
local function v126(v113) --[[ Line: 349 ]] --[[ Name: convertHeadToMeshPart ]]
    -- upvalues: l_InsertService_0 (copy), l_CollectionService_0 (copy)
    local l_l_InsertService_0_MeshPartAsync_0 = l_InsertService_0:CreateMeshPartAsync(v113.MeshId, Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic);
    l_l_InsertService_0_MeshPartAsync_0.TextureID = v113.TextureId;
    l_l_InsertService_0_MeshPartAsync_0.Size = l_l_InsertService_0_MeshPartAsync_0.Size * v113.Scale;
    l_l_InsertService_0_MeshPartAsync_0.Name = "Head";
    if not l_CollectionService_0:HasTag(v113, "NoFace") then
        local l_Decal_5 = Instance.new("Decal");
        l_Decal_5.Parent = l_l_InsertService_0_MeshPartAsync_0;
        l_Decal_5.Name = "face";
        l_Decal_5.Texture = "rbxasset://textures/face.png";
    end;
    for _, v117 in v113:GetChildren() do
        if v117:IsA("Vector3Value") and string.sub(v117.Name, -10) == "Attachment" then
            local l_Attachment_0 = Instance.new("Attachment");
            l_Attachment_0.Name = v117.Name;
            l_Attachment_0.Position = v117.Value;
            l_Attachment_0.Parent = l_l_InsertService_0_MeshPartAsync_0;
        else
            local v119 = v117:Clone();
            v119.Parent = l_l_InsertService_0_MeshPartAsync_0;
            if v119:IsA("Attachment") then
                v119.Position = v119.Position - v113.Offset;
            end;
        end;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("AvatarPartScaleType") then
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Name = "AvatarPartScaleType";
        l_StringValue_0.Value = "Classic";
        l_StringValue_0.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("FaceCenterAttachment") then
        local l_Attachment_1 = Instance.new("Attachment");
        l_Attachment_1.Name = "FaceCenterAttachment";
        l_Attachment_1.Position = Vector3.new(0, 0, 0, 0);
        l_Attachment_1.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("FaceFrontAttachment") then
        local l_Attachment_2 = Instance.new("Attachment");
        l_Attachment_2.Name = "FaceFrontAttachment";
        l_Attachment_2.Position = Vector3.new(0, 0, -0.6000000238418579, 0);
        l_Attachment_2.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("HairAttachment") then
        local l_Attachment_3 = Instance.new("Attachment");
        l_Attachment_3.Name = "HairAttachment";
        l_Attachment_3.Position = Vector3.new(0, 0.6000000238418579, 0, 0);
        l_Attachment_3.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("HatAttachment") then
        local l_Attachment_4 = Instance.new("Attachment");
        l_Attachment_4.Name = "HatAttachment";
        l_Attachment_4.Position = Vector3.new(0, 0.6000000238418579, 0, 0);
        l_Attachment_4.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    if not l_l_InsertService_0_MeshPartAsync_0:FindFirstChild("NeckRigAttachment") then
        local l_Attachment_5 = Instance.new("Attachment");
        l_Attachment_5.Name = "NeckRigAttachment";
        l_Attachment_5.Position = Vector3.new(0, -0.5, 0, 0);
        l_Attachment_5.Parent = l_l_InsertService_0_MeshPartAsync_0;
    end;
    return l_l_InsertService_0_MeshPartAsync_0;
end;
local function v143(v127, v128, v129, v130) --[[ Line: 426 ]] --[[ Name: loadMeshPartHead ]]
    -- upvalues: v9 (copy), v5 (copy), l_InsertService_0 (copy), v126 (copy)
    local l_SpecialMesh_1 = v130:FindFirstChildOfClass("SpecialMesh");
    local v132 = tostring(v9(l_SpecialMesh_1.MeshId) or l_SpecialMesh_1.MeshId);
    assert(l_SpecialMesh_1, "SpecialMesh must exist if loadMeshPartHead() is called");
    local v133 = v5[v132];
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 433 ]]
        -- upvalues: l_InsertService_0 (ref), v133 (copy)
        return l_InsertService_0:LoadAsset(v133);
    end);
    if l_status_1 and l_result_1 and #l_result_1:GetChildren() > 0 and l_result_1:GetChildren()[1]:IsA("SpecialMesh") then
        l_SpecialMesh_1.MeshId = l_result_1:GetChildren()[1].MeshId;
    else
        warn("Failed to load R15 head for meshId " .. v132);
    end;
    local v136 = v126(l_SpecialMesh_1);
    for _, v138 in v130:GetChildren() do
        if not v138:IsA("SpecialMesh") and (not v138:IsA("Weld") or v138.Name ~= "HeadWeld") then
            local l_v136_FirstChild_0 = v136:FindFirstChild(v138.Name);
            if l_v136_FirstChild_0 and l_v136_FirstChild_0.ClassName == v138.ClassName then
                l_v136_FirstChild_0:Destroy();
            end;
            v138.Parent = v136;
        end;
    end;
    v130:Destroy();
    v136.Color = v128;
    local l_Decal_6 = v136:FindFirstChildOfClass("Decal");
    if l_Decal_6 and l_Decal_6.Name == "face" then
        l_Decal_6:Destroy();
    end;
    local v141;
    if not v129 then
        v141 = nil;
    else
        local l_Decal_7 = Instance.new("Decal");
        l_Decal_7.Name = "face";
        l_Decal_7.Color3 = v129.Color3;
        l_Decal_7.Texture = v129.Texture;
        l_Decal_7.Transparency = v129.Transparency;
        l_Decal_7.ZIndex = v129.ZIndex;
        v141 = l_Decal_7;
    end;
    if v141 then
        v141.Parent = v136;
    end;
    v136.Parent = v127;
end;
local function _(v144, v145) --[[ Line: 479 ]] --[[ Name: loadLocalModule ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_l_InsertService_0_LocalFileContents_0 = l_InsertService_0:GetLocalFileContents(v145);
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = v144;
    l_ModuleScript_0.Source = l_l_InsertService_0_LocalFileContents_0;
    return l_ModuleScript_0;
end;
v0.RemoveUnificationScripts = function(v149) --[[ Line: 487 ]] --[[ Name: RemoveUnificationScripts ]]
    local l_UnificationServerScript_0 = v149:FindFirstChild("UnificationServerScript");
    if l_UnificationServerScript_0 then
        l_UnificationServerScript_0:Destroy();
    end;
end;
v0.HasUnificationScripts = function(v151) --[[ Line: 494 ]] --[[ Name: HasUnificationScripts ]]
    return v151:FindFirstChild("UnificationServerScript") ~= nil;
end;
v0.SetupUnificationScripts = function(v152) --[[ Line: 498 ]] --[[ Name: SetupUnificationScripts ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v14 (copy), l_InsertService_0 (copy), v10 (copy), v16 (copy), v17 (copy), l_StarterCharacterScripts_0 (copy), v15 (copy)
    if not l_ReplicatedStorage_0:FindFirstChild("AvatarUnification") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Parent = l_ReplicatedStorage_0;
        l_Folder_0.Name = "AvatarUnification";
        for v154, v155 in v14 do
            local l_l_InsertService_0_LocalFileContents_1 = l_InsertService_0:GetLocalFileContents(v155);
            local l_ModuleScript_1 = Instance.new("ModuleScript");
            l_ModuleScript_1.Name = v154;
            l_ModuleScript_1.Source = l_l_InsertService_0_LocalFileContents_1;
            local l_l_ModuleScript_1_0 = l_ModuleScript_1;
            l_l_ModuleScript_1_0:SetAttribute(v10.AttributeUnificationScriptName, true);
            l_l_ModuleScript_1_0.Parent = l_Folder_0;
        end;
    end;
    if not v152:FindFirstChild("UnificationServerScript") then
        local l_Script_0 = Instance.new("Script");
        l_Script_0.Name = "UnificationServerScript";
        l_Script_0.Source = l_InsertService_0:GetLocalFileContents(v16);
        l_Script_0:SetAttribute(v10.AttributeUnificationScriptName, true);
        l_Script_0.Parent = v152;
        v17:Clone().Parent = l_Script_0;
    end;
    if not l_StarterCharacterScripts_0:FindFirstChild("LocalEffects") then
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = "LocalEffects";
        l_LocalScript_0.Source = l_InsertService_0:GetLocalFileContents(v15);
        l_LocalScript_0:SetAttribute(v10.AttributeUnificationScriptName, true);
        l_LocalScript_0.Parent = l_StarterCharacterScripts_0;
    end;
end;
local function v165(v161) --[[ Line: 532 ]] --[[ Name: setupScaleValues ]]
    for v162, v163 in {
        BodyHeightScale = 1, 
        BodyDepthScale = 1, 
        BodyWidthScale = 1, 
        HeadScale = 1, 
        BodyProportionScale = 0
    } do
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Name = v162;
        l_NumberValue_0.Value = v163;
        l_NumberValue_0.Parent = v161;
    end;
end;
v0.FindInstanceUnderNewModel = function(v166, v167, v168) --[[ Line: 549 ]] --[[ Name: FindInstanceUnderNewModel ]]
    local v169 = {};
    local l_v166_0 = v166;
    while l_v166_0 ~= v167 do
        table.insert(v169, 1, l_v166_0.Name);
        l_v166_0 = l_v166_0.Parent;
    end;
    local l_v168_0 = v168;
    for _, v173 in v169 do
        local l_l_v168_0_FirstChild_0 = l_v168_0:FindFirstChild(v173);
        assert(l_l_v168_0_FirstChild_0, "can't find " .. v173 .. " under " .. v168:GetFullName());
        l_v168_0 = l_l_v168_0_FirstChild_0;
    end;
    return l_v168_0;
end;
v0.ReplaceModel = function(v175, v176, v177, v178) --[[ Line: 568 ]] --[[ Name: ReplaceModel ]]
    -- upvalues: v6 (copy), v10 (copy), v0 (copy)
    local v179 = v6.GetNpcFromId(v175);
    if not v179 then
        return;
    else
        v176.Name = v179.Name;
        local l_Parent_0 = v179.Parent;
        v179.Parent = nil;
        for _, v182 in v179:GetDescendants() do
            if v182:IsA("LuaSourceContainer") and not v182:GetAttribute(v10.AttributeUnificationScriptName) then
                local v183 = v0.FindInstanceUnderNewModel(v182, v179, v176);
                local l_Parent_1 = v183.Parent;
                v183:Destroy();
                v182.Parent = l_Parent_1;
            end;
        end;
        v176.Parent = l_Parent_0;
        if v177 then
            v0.ConvertR6ToR15(v176);
            if v178 then
                v0.SetupUnificationScripts(v176);
            end;
        end;
        v179:Destroy();
        v6.SetNpcWithId(v176, v175);
        return;
    end;
end;
v0.FixRootAttachment = function(v185) --[[ Line: 599 ]] --[[ Name: FixRootAttachment ]]
    local l_HumanoidRootPart_0 = v185:FindFirstChild("HumanoidRootPart");
    assert(l_HumanoidRootPart_0, "There must be a HumanoidRootPart on the npc!");
    if l_HumanoidRootPart_0:FindFirstChild("RootRigAttachment") then
        return;
    else
        local l_RootAttachment_0 = l_HumanoidRootPart_0:FindFirstChild("RootAttachment");
        if not l_RootAttachment_0 then
            l_RootAttachment_0 = Instance.new("Attachment");
            l_RootAttachment_0.Parent = l_HumanoidRootPart_0;
        end;
        l_RootAttachment_0.Name = "RootRigAttachment";
        return;
    end;
end;
v0.GetNumCharactersHaveWarnings = function(v188) --[[ Line: 617 ]] --[[ Name: GetNumCharactersHaveWarnings ]]
    -- upvalues: v0 (copy)
    local v189 = 0;
    for _, v191 in v188 do
        if v0.GetNpcHasWarnings(v191.model) then
            v189 = v189 + 1;
        end;
    end;
    return v189;
end;
v0.GetNpcHasWarnings = function(v192) --[[ Line: 628 ]] --[[ Name: GetNpcHasWarnings ]]
    -- upvalues: v0 (copy)
    return v0.GetNpcHasCustomMesh(v192);
end;
v0.GetNumCharactersHaveCustomMesh = function(v193) --[[ Line: 632 ]] --[[ Name: GetNumCharactersHaveCustomMesh ]]
    -- upvalues: v0 (copy)
    local v194 = 0;
    for _, v196 in v193 do
        if v0.GetNpcHasCustomMesh(v196.model) then
            v194 = v194 + 1;
        end;
    end;
    return v194;
end;
v0.GetNpcHasCustomMesh = function(v197) --[[ Line: 643 ]] --[[ Name: GetNpcHasCustomMesh ]]
    -- upvalues: v75 (copy), v27 (copy), v5 (copy)
    local v198 = v75(v197);
    for v199 in v27 do
        local v200 = v198[v199];
        if v200 and not v5[v200] then
            return true;
        end;
    end;
    return false;
end;
local function v205(v201) --[[ Line: 658 ]] --[[ Name: findR6Parts ]]
    -- upvalues: v29 (copy), v26 (copy)
    local v202 = {};
    for _, v204 in v201:GetDescendants() do
        if v204:IsA("Part") then
            if v29[v204.Name] and not v202[v29[v204.Name]] and v204.Parent == v201 then
                v202[v29[v204.Name]] = {
                    Part = v204
                };
            end;
        elseif v204:IsA("Motor6D") and v26[v204.Name] and v204.Part0 and v204.Part1 and v201 == v204.Part1.Parent and v26[v204.Name].Part1Name == v204.Part1.Name and v29[v204.Part1.Name] then
            v202[v29[v204.Part1.Name]] = {
                Part = v204.Part1, 
                Motor6D = v204
            };
        end;
    end;
    return v202;
end;
local function v221(v206, v207) --[[ Line: 690 ]] --[[ Name: repositionUnconnectedParts ]]
    -- upvalues: v26 (copy), v29 (copy), v25 (copy)
    local function _(v208) --[[ Line: 691 ]] --[[ Name: disconnectR15PartFromParent ]]
        v208.Part0 = nil;
    end;
    local function v215(v210, v211, v212) --[[ Line: 695 ]] --[[ Name: repositionR15Part ]]
        local l_Position_0 = v211.CFrame.Position;
        if v212 ~= Enum.BodyPart.Head then
            local v214 = (v211.Size.Y - v210.Size.Y) / 2;
            if v212 == Enum.BodyPart.Torso then
                v214 = -v214;
            end;
            l_Position_0 = v211.CFrame.Position + v211.CFrame.Rotation * Vector3.new(0, v214, 0);
        end;
        v210.CFrame = v211.CFrame.Rotation + l_Position_0;
    end;
    for v216, v217 in v26 do
        local v218 = v207[v29[v217.Part1Name]];
        if v218 and not v218.Motor6D then
            local l_v206_FirstChild_0 = v206:FindFirstChild(v25[v216], true);
            if l_v206_FirstChild_0 then
                l_v206_FirstChild_0.Part0 = nil;
                local l_Part1_0 = l_v206_FirstChild_0.Part1;
                if l_Part1_0 then
                    l_Part1_0.Anchored = true;
                    v215(l_Part1_0, v218.Part, v29[v217.Part1Name]);
                end;
            end;
        end;
    end;
end;
local function v228(v222, v223) --[[ Line: 737 ]] --[[ Name: repositionConnectedParts ]]
    -- upvalues: v26 (copy), v29 (copy), v25 (copy), v24 (copy), v23 (copy)
    for v224, v225 in v26 do
        local v226 = v223[v29[v225.Part1Name]];
        if v226 and v226.Motor6D then
            local l_v222_FirstChild_0 = v222:FindFirstChild(v25[v224], true);
            if l_v222_FirstChild_0 and v24[l_v222_FirstChild_0.Name] then
                l_v222_FirstChild_0.C0 = CFrame.new(l_v222_FirstChild_0.C0.Position - v23[v224].C0.Position) * v226.Motor6D.C0 * v24[l_v222_FirstChild_0.Name];
                l_v222_FirstChild_0.C1 = CFrame.new(l_v222_FirstChild_0.C1.Position - v23[v224].C1.Position) * v226.Motor6D.C1 * v24[l_v222_FirstChild_0.Name];
            end;
        end;
    end;
end;
local function _(v229) --[[ Line: 764 ]] --[[ Name: calculateDefaultLocalSpaceOffsetToLowerTorso ]]
    -- upvalues: v23 (copy)
    local v230 = v23.RootJoint.C0 * v23.RootJoint.C1:Inverse();
    local v231 = v229.C0 * v229.C1:Inverse();
    return v231.Rotation:Inverse() * (v231.Position - v230.Position);
end;
v0.ConvertR6ToR15 = function(v233) --[[ Line: 770 ]] --[[ Name: ConvertR6ToR15 ]]
    -- upvalues: v18 (copy), v75 (copy), v205 (copy), v5 (copy), v9 (copy), v143 (copy), v92 (copy), v27 (copy), l_Color_0 (copy), v112 (copy), v0 (copy), v165 (copy), v221 (copy), v8 (copy), v23 (copy), v25 (copy), v228 (copy)
    local l_v233_Pivot_0 = v233:GetPivot();
    local l_HumanoidRootPart_1 = v233:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_1 then
        l_HumanoidRootPart_1 = v18:FindFirstChild("HumanoidRootPart"):Clone();
        l_HumanoidRootPart_1.Parent = v233;
        l_HumanoidRootPart_1.CFrame = if v233.PrimaryPart then v233.PrimaryPart.CFrame else l_v233_Pivot_0;
    end;
    local v236 = false;
    if v233.PrimaryPart ~= nil then
        v236 = l_HumanoidRootPart_1 ~= v233.PrimaryPart;
    end;
    if l_HumanoidRootPart_1 ~= v233.PrimaryPart then
        v233.PrimaryPart = l_HumanoidRootPart_1;
    end;
    local v237 = {};
    local v238 = {};
    local v239 = nil;
    local v240 = nil;
    local v241 = {};
    local v242 = v75(v233);
    local v243 = v205(v233);
    for v244, v245 in v243 do
        local l_Part_0 = v245.Part;
        if l_Part_0 then
            v241[v244] = true;
            if v244 == Enum.BodyPart.Head then
                local l_Decal_8 = l_Part_0:FindFirstChildOfClass("Decal");
                if l_Decal_8 then
                    v239 = {
                        Color3 = l_Decal_8.Color3, 
                        Texture = l_Decal_8.Texture, 
                        Transparency = l_Decal_8.Transparency, 
                        ZIndex = l_Decal_8.ZIndex
                    };
                end;
                v240 = l_Part_0;
            end;
            v237[v244] = l_Part_0.Color;
            local l_Decal_9 = l_Part_0:FindFirstChildOfClass("Decal");
            if l_Decal_9 then
                v238[v244] = if l_Decal_9.Texture ~= "" then l_Decal_9.Texture else nil;
            end;
            l_Part_0.Parent = nil;
        end;
    end;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v250 = 0 + 1;
    task.delay(0, function() --[[ Line: 825 ]]
        -- upvalues: v237 (copy), v242 (copy), v5 (ref), v240 (ref), v9 (ref), v143 (ref), v233 (copy), v239 (ref), v92 (ref), v250 (ref), l_BindableEvent_0 (copy)
        local v251 = v237[Enum.BodyPart.Head];
        if v242[Enum.BodyPart.Head] and v5[v242[Enum.BodyPart.Head]] then
            assert(v240:FindFirstChildOfClass("SpecialMesh"), "SpecialMesh must exist if characterMeshes[Enum.BodyPart.Head] has a value");
            assert(v242[Enum.BodyPart.Head] == tostring(v9(v240:FindFirstChildOfClass("SpecialMesh").MeshId)));
            v143(v233, v251, v239, v240);
        else
            v92(Enum.BodyPart.Head, v233, v251, v239);
        end;
        v250 = v250 - 1;
        if v250 == 0 then
            l_BindableEvent_0:Fire();
        end;
    end);
    for v252, _ in pairs(v27) do
        if v241[v252] and Enum.BodyPart.Head ~= v252 then
            v250 = v250 + 1;
            task.delay(0, function() --[[ Line: 852 ]]
                -- upvalues: v237 (copy), v252 (copy), l_Color_0 (ref), v242 (copy), v5 (ref), v112 (ref), v233 (copy), v239 (ref), v238 (copy), v92 (ref), v250 (ref), l_BindableEvent_0 (copy)
                local v254 = v237[v252] or l_Color_0;
                local v255 = v242[v252];
                if v255 and v5[v255] then
                    v112(v252, v233, v255, v254, v239, v238[v252]);
                else
                    v92(v252, v233, v254, v239);
                end;
                v250 = v250 - 1;
                if v250 == 0 then
                    l_BindableEvent_0:Fire();
                end;
            end);
        end;
    end;
    l_BindableEvent_0.Event:Wait();
    v0.FixRootAttachment(v233);
    for _, v257 in v233:GetChildren() do
        if v257:IsA("CharacterMesh") then
            v257:Destroy();
        end;
    end;
    local l_Humanoid_4 = v233:FindFirstChildOfClass("Humanoid");
    l_Humanoid_4.RigType = Enum.HumanoidRigType.R15;
    v165(l_Humanoid_4);
    l_Humanoid_4:BuildRigFromAttachments();
    v221(v233, v243);
    local v259 = nil;
    local v260 = v243[Enum.BodyPart.Torso];
    local v261 = nil;
    if v260 and v260.Motor6D and (not v8(v260.Motor6D.C0, v23.RootJoint.C0) or not v8(v260.Motor6D.C1, v23.RootJoint.C1)) then
        v261 = v233:FindFirstChild(v25[v260.Motor6D.Name], true);
        if v261 then
            local l_v261_0 = v261;
            local v263 = v23.RootJoint.C0 * v23.RootJoint.C1:Inverse();
            local v264 = l_v261_0.C0 * l_v261_0.C1:Inverse();
            v259 = v264.Rotation:Inverse() * (v264.Position - v263.Position);
        end;
    end;
    v228(v233, v243);
    local v265 = false;
    if v259 ~= nil then
        v265 = false;
        if v261 ~= nil then
            v265 = v260 ~= nil;
        end;
    end;
    if v265 then
        local v266 = l_HumanoidRootPart_1.CFrame * v261.C0 * v261.C1:Inverse();
        local v267 = v266.Rotation * v259;
        v233:TranslateBy(v260.Part.CFrame.Position + v267 - v266.Position);
    end;
    if v236 then
        l_HumanoidRootPart_1.PivotOffset = l_HumanoidRootPart_1.CFrame:Inverse() * l_v233_Pivot_0;
    end;
    for _, v269 in v243 do
        if v269.Part then
            v269.Part:Destroy();
        end;
    end;
end;
return v0;