local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v3 = require(l_DraggerFramework_0.Utility.Math);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.Adorn);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.RigInfo);
local v8 = {};
local function _(v9) --[[ Line: 17 ]] --[[ Name: getBonePosition ]]
    return v9.TransformedWorldCFrame.Position;
end;
local function _(v11) --[[ Line: 21 ]] --[[ Name: getLinkLength ]]
    local v12 = 0;
    local l_Parent_0 = v11.Parent;
    if l_Parent_0 and l_Parent_0:IsA("Bone") then
        v12 = (l_Parent_0.TransformedWorldCFrame.Position - v11.TransformedWorldCFrame.Position).Magnitude;
    end;
    return v12;
end;
local function v22(v15, v16) --[[ Line: 30 ]] --[[ Name: alignBoneLink ]]
    -- upvalues: l_Math_0 (copy)
    local v17 = v16 - v15;
    local l_Magnitude_0 = v17.Magnitude;
    v17 = if l_Math_0.fuzzyEq(l_Magnitude_0, 0) then Vector3.new(0, 0, 1, 0) else v17 / l_Magnitude_0;
    local v19 = Vector3.new(0, 1, 0, 0);
    if l_Math_0.fuzzyEq(math.abs((v17:Dot(v19))), 1) then
        v19 = Vector3.new(1, 0, 0, 0);
    end;
    local v20 = v17:Cross(v19);
    local v21 = v20:Cross(v17);
    return CFrame.fromMatrix(v15, v20, v21);
end;
local function v44(v23, v24, v25) --[[ Line: 49 ]] --[[ Name: createBoneLinks ]]
    -- upvalues: v5 (copy), v6 (copy), v22 (copy)
    local v26 = false;
    local l_Position_0 = v23.TransformedWorldCFrame.Position;
    local function v37(v28, v29) --[[ Line: 53 ]] --[[ Name: updateOrCreateLinkInstances ]]
        -- upvalues: v24 (copy), v23 (copy), v5 (ref), v6 (ref), v25 (copy)
        local l_v24_FirstChild_0 = v24:FindFirstChild(v28);
        if not l_v24_FirstChild_0 or not l_v24_FirstChild_0:IsA("Part") then
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Transparency = 1;
            l_Part_0.Name = v28;
            l_Part_0.Archivable = false;
            l_Part_0.Parent = v24;
            l_Part_0.Size = Vector3.new(0, 0, 0, 0);
            l_v24_FirstChild_0 = l_Part_0;
        end;
        local l_BoneRef_0 = l_v24_FirstChild_0:FindFirstChild("BoneRef");
        if not l_BoneRef_0 or not l_BoneRef_0:IsA("ObjectValue") then
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Name = "BoneRef";
            l_ObjectValue_0.Parent = l_v24_FirstChild_0;
            l_BoneRef_0 = l_ObjectValue_0;
        end;
        assert(l_v24_FirstChild_0:IsA("Part"));
        assert(l_BoneRef_0:IsA("ObjectValue"));
        l_BoneRef_0.Value = v23;
        local l_Cone_0 = l_v24_FirstChild_0:FindFirstChild("Cone");
        if not l_Cone_0 or not l_Cone_0:IsA("ConeHandleAdornment") then
            l_Cone_0 = v5:Cone("Cone", l_v24_FirstChild_0, v6.BONE_LINK_TRANSPARENCY, v6.BONE_CONE_COLOR, 0);
        end;
        local l_Line_0 = l_v24_FirstChild_0:FindFirstChild("Line");
        if not l_Line_0 or not l_Line_0:IsA("LineHandleAdornment") then
            l_Line_0 = v5:Line("Line", l_v24_FirstChild_0, 1, v6.BONE_LINK_COLOR, 0, 0);
        end;
        assert(l_Cone_0:IsA("ConeHandleAdornment"));
        assert(l_Line_0:IsA("LineHandleAdornment"));
        local v36 = if v25 then v6.BONE_TRANSPARENCY_DEFAULT else 1;
        l_Cone_0.Transparency = v36;
        l_Cone_0.Radius = v29 / v6.LENGTH_TO_RADIUS_RATIO;
        l_Cone_0.Height = v29;
        l_Line_0.Transparency = v36;
        l_Line_0.Length = v29;
        return l_v24_FirstChild_0;
    end;
    for _, v39 in ipairs(v23:GetChildren()) do
        if v39:IsA("Bone") then
            local l_Position_1 = v39.TransformedWorldCFrame.Position;
            local l_Magnitude_1 = (l_Position_1 - l_Position_0).Magnitude;
            v37(v23.Name .. "To" .. v39.Name, l_Magnitude_1).CFrame = v22(l_Position_0, l_Position_1);
            v26 = true;
        end;
    end;
    if not v26 then
        local l_Parent_1 = v23.Parent;
        local _ = nil;
        v37(v23.Name .. "End", if l_Parent_1 and l_Parent_1:IsA("Bone") then (l_Parent_1.TransformedWorldCFrame.Position - l_Position_0).Magnitude * v6.LEAF_BONE_LENGTH_RATIO else 1).CFrame = v23.TransformedWorldCFrame * CFrame.fromEulerAngles(1.5707963267948966, 0, 0);
    end;
end;
local function v57(v45, v46, v47) --[[ Line: 129 ]] --[[ Name: createBoneNode ]]
    -- upvalues: v5 (copy), v6 (copy), v44 (copy)
    local l_Position_2 = v45.TransformedWorldCFrame.Position;
    local v49 = v45.Name .. "Node";
    local l_v46_FirstChild_0 = v46:FindFirstChild(v49);
    if not l_v46_FirstChild_0 or not l_v46_FirstChild_0:IsA("Part") then
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Transparency = 1;
        l_Part_1.Name = v49;
        l_Part_1.Archivable = false;
        l_Part_1.Parent = v46;
        v5:Sphere("Sphere", l_Part_1, v6.BONE_NODE_TRANSPARENCY, v6.BONE_NODE_COLOR, 0);
        l_v46_FirstChild_0 = l_Part_1;
    end;
    local l_BoneRef_1 = l_v46_FirstChild_0:FindFirstChild("BoneRef");
    if not l_BoneRef_1 or not l_BoneRef_1:IsA("ObjectValue") then
        local l_ObjectValue_1 = Instance.new("ObjectValue");
        l_ObjectValue_1.Name = "BoneRef";
        l_ObjectValue_1.Parent = l_v46_FirstChild_0;
        l_BoneRef_1 = l_ObjectValue_1;
    end;
    assert(l_v46_FirstChild_0:IsA("Part"));
    assert(l_BoneRef_1:IsA("ObjectValue"));
    l_BoneRef_1.Value = v45;
    local l_Sphere_0 = l_v46_FirstChild_0:FindFirstChild("Sphere");
    if l_Sphere_0 and l_Sphere_0:IsA("SphereHandleAdornment") then
        local v55 = 0;
        local l_Parent_2 = v45.Parent;
        if l_Parent_2 and l_Parent_2:IsA("Bone") then
            v55 = (l_Parent_2.TransformedWorldCFrame.Position - v45.TransformedWorldCFrame.Position).Magnitude;
        end;
        l_Sphere_0.Radius = v55 / v6.LENGTH_TO_RADIUS_RATIO;
        l_Sphere_0.Transparency = if v47 then v6.BONE_TRANSPARENCY_DEFAULT else 1;
    end;
    l_v46_FirstChild_0.CFrame = CFrame.new(l_Position_2);
    v44(v45, v46, v47);
end;
local function _() --[[ Line: 161 ]] --[[ Name: getMicroboneFolder ]]
    -- upvalues: v6 (copy)
    return Workspace:FindFirstChild(v6.FOLDERS.Microbones);
end;
local function _() --[[ Line: 165 ]] --[[ Name: getOrCreateMicroboneFolder ]]
    -- upvalues: v6 (copy)
    local l_Workspace_FirstChild_0 = Workspace:FindFirstChild(v6.FOLDERS.Microbones);
    if not l_Workspace_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v6.FOLDERS.Microbones;
        l_Folder_0.Archivable = false;
        l_Folder_0.Parent = Workspace;
        l_Workspace_FirstChild_0 = l_Folder_0;
    end;
    assert(l_Workspace_FirstChild_0);
    return l_Workspace_FirstChild_0;
end;
local function v72(v62, v63) --[[ Line: 178 ]] --[[ Name: hitTestEachBoneLink ]]
    -- upvalues: v3 (copy)
    local l_Cone_1 = v62:FindFirstChild("Cone");
    local l_Sphere_1 = v62:FindFirstChild("Sphere");
    if l_Cone_1 and l_Cone_1:IsA("ConeHandleAdornment") then
        local v66, v67 = v3.intersectRayRay(v62.CFrame.Position, v62.CFrame.LookVector, v63.Origin, v63.Direction.Unit);
        if not v66 then
            return nil;
        else
            local _, v69 = v3.intersectRayRay(v63.Origin, v63.Direction.Unit, v62.CFrame.Position, v62.CFrame.LookVector);
            if (v62.CFrame.Position + v62.CFrame.LookVector * v67 - (v63.Origin + v63.Direction.Unit * v69)).Magnitude < l_Cone_1.Radius and v67 > 0 and v67 < l_Cone_1.Height then
                return v69;
            else
                return nil;
            end;
        end;
    elseif l_Sphere_1 and l_Sphere_1:IsA("SphereHandleAdornment") then
        local v70, v71 = v3.intersectRaySphere(v63.Origin, v63.Direction.Unit, v62.CFrame.Position, l_Sphere_1.Radius);
        if v70 then
            return v71;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v83(v73) --[[ Line: 230 ]] --[[ Name: hitTestAllBoneLinks ]]
    -- upvalues: v6 (copy), v72 (copy)
    local v74 = nil;
    local v75 = 1e999;
    local l_Workspace_FirstChild_1 = Workspace:FindFirstChild(v6.FOLDERS.Microbones);
    if l_Workspace_FirstChild_1 then
        local l_l_Workspace_FirstChild_1_Children_0 = l_Workspace_FirstChild_1:GetChildren();
        for _, v79 in pairs(l_l_Workspace_FirstChild_1_Children_0) do
            local l_Cone_2 = v79:FindFirstChild("Cone");
            local l_Sphere_2 = v79:FindFirstChild("Sphere");
            if l_Cone_2 and l_Cone_2:IsA("ConeHandleAdornment") and l_Cone_2.Color3 ~= v6.BONE_COLOR_SELECTED then
                l_Cone_2.Color3 = v6.BONE_COLOR_DEFAULT;
                l_Cone_2.Transparency = v6.BONE_TRANSPARENCY_DEFAULT;
            end;
            if l_Sphere_2 and l_Sphere_2:IsA("SphereHandleAdornment") and l_Sphere_2.Color3 ~= v6.BONE_COLOR_SELECTED then
                l_Sphere_2.Color3 = v6.BONE_COLOR_DEFAULT;
                l_Sphere_2.Transparency = v6.BONE_TRANSPARENCY_DEFAULT;
            end;
            if v79:IsA("Part") then
                local v82 = v72(v79, v73);
                if v82 and v82 < v75 then
                    v75 = v82;
                    v74 = v79;
                end;
            end;
        end;
    end;
    return v74, v75;
end;
v8.clearMicrobones = function() --[[ Line: 261 ]] --[[ Name: clearMicrobones ]]
    -- upvalues: v6 (copy)
    local l_Workspace_FirstChild_2 = Workspace:FindFirstChild(v6.FOLDERS.Microbones);
    if l_Workspace_FirstChild_2 then
        l_Workspace_FirstChild_2:Destroy();
    end;
end;
v8.updateMicrobones = function(v85, v86) --[[ Line: 268 ]] --[[ Name: updateMicrobones ]]
    -- upvalues: v6 (copy), v7 (copy), v57 (copy)
    if not v85 or type(v85) == "table" then
        return;
    else
        local l_Workspace_FirstChild_3 = Workspace:FindFirstChild(v6.FOLDERS.Microbones);
        if not l_Workspace_FirstChild_3 then
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = v6.FOLDERS.Microbones;
            l_Folder_1.Archivable = false;
            l_Folder_1.Parent = Workspace;
            l_Workspace_FirstChild_3 = l_Folder_1;
        end;
        assert(l_Workspace_FirstChild_3);
        local l_l_Workspace_FirstChild_3_0 = l_Workspace_FirstChild_3;
        for _, v91 in v7.getRigInfo(v85).BoneNameToBone do
            v57(v91, l_l_Workspace_FirstChild_3_0, v86);
        end;
        return;
    end;
end;
v8.getBoneHit = function(v92, v93) --[[ Line: 280 ]] --[[ Name: getBoneHit ]]
    -- upvalues: v7 (copy), v83 (copy)
    local _ = v7.getRigInfo(v93).BoneNameToBone;
    return v83(v92);
end;
v8.selectBone = function(v95) --[[ Line: 286 ]] --[[ Name: selectBone ]]
    -- upvalues: v6 (copy)
    if not v95 then
        return;
    else
        assert(v95);
        local l_Cone_3 = v95:FindFirstChild("Cone");
        local l_Sphere_3 = v95:FindFirstChild("Sphere");
        if l_Cone_3 and l_Cone_3:IsA("ConeHandleAdornment") then
            l_Cone_3.Color3 = v6.BONE_COLOR_SELECTED;
        end;
        if l_Sphere_3 and l_Sphere_3:IsA("SphereHandleAdornment") then
            l_Sphere_3.Color3 = v6.BONE_COLOR_SELECTED;
        end;
        return;
    end;
end;
v8.deselectBones = function() --[[ Line: 304 ]] --[[ Name: deselectBones ]]
    -- upvalues: v6 (copy)
    local l_Workspace_FirstChild_4 = Workspace:FindFirstChild(v6.FOLDERS.Microbones);
    if not l_Workspace_FirstChild_4 then
        return;
    else
        assert(l_Workspace_FirstChild_4);
        local l_l_Workspace_FirstChild_4_Children_0 = l_Workspace_FirstChild_4:GetChildren();
        for _, v101 in pairs(l_l_Workspace_FirstChild_4_Children_0) do
            local l_Cone_4 = v101:FindFirstChild("Cone");
            local l_Sphere_4 = v101:FindFirstChild("Sphere");
            if l_Cone_4 and l_Cone_4:IsA("ConeHandleAdornment") and l_Cone_4.Color3 == v6.BONE_COLOR_SELECTED then
                l_Cone_4.Color3 = v6.BONE_COLOR_DEFAULT;
                l_Cone_4.Transparency = v6.BONE_TRANSPARENCY_DEFAULT;
            end;
            if l_Sphere_4 and l_Sphere_4:IsA("SphereHandleAdornment") and l_Sphere_4.Color3 == v6.BONE_COLOR_SELECTED then
                l_Sphere_4.Color3 = v6.BONE_COLOR_DEFAULT;
                l_Sphere_4.Transparency = v6.BONE_TRANSPARENCY_DEFAULT;
            end;
        end;
        return;
    end;
end;
v8.isBone = function(v104) --[[ Line: 327 ]] --[[ Name: isBone ]]
    -- upvalues: v6 (copy)
    local v105 = false;
    if v104.Parent ~= nil then
        v105 = v104.Parent.Name == v6.FOLDERS.Microbones;
    end;
    return v105;
end;
return v8;