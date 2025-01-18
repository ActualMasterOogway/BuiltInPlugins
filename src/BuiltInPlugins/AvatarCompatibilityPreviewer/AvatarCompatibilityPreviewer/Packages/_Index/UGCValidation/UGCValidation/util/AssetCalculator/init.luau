local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.canBeNormalized);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.util.AssetTraversalUtils);
local v7 = {
    root = "LowerTorso", 
    children = {
        UpperTorso = {
            children = {
                Head = v6.assetHierarchy[Enum.AssetType.DynamicHead], 
                LeftUpperArm = v6.assetHierarchy[Enum.AssetType.LeftArm], 
                RightUpperArm = v6.assetHierarchy[Enum.AssetType.RightArm]
            }
        }, 
        LeftUpperLeg = v6.assetHierarchy[Enum.AssetType.LeftLeg], 
        RightUpperLeg = v6.assetHierarchy[Enum.AssetType.RightLeg]
    }
};
local v8 = {};
local function v14(v9, v10) --[[ Line: 44 ]] --[[ Name: calculateCFrame ]]
    -- upvalues: v4 (copy)
    local v11 = v9 - v10;
    if not v4(v11) then
        return;
    else
        v11 = v11.Unit;
        local l_Unit_0 = v11:Cross(Vector3.zAxis).Unit;
        if not v4(l_Unit_0) then
            l_Unit_0 = v11:Cross(if v11.Z < 0 then Vector3.yAxis else -Vector3.yAxis).Unit;
        end;
        local l_Unit_1 = l_Unit_0:Cross(v11).Unit;
        return CFrame.fromMatrix(v9, l_Unit_0, v11, l_Unit_1);
    end;
end;
local function v24(v15, v16, v17, v18) --[[ Line: 63 ]] --[[ Name: calculatePartTransformInHierarchy ]]
    -- upvalues: v2 (copy)
    local l_v17_0 = v17;
    if v16 then
        local v20 = v18(v16);
        assert(v20);
        local v21 = v2.getRigAttachmentToParent(nil, v15.Name);
        local l_v20_FirstChild_0 = v20:FindFirstChild(v21);
        assert(l_v20_FirstChild_0);
        local l_v15_FirstChild_0 = v15:FindFirstChild(v21);
        assert(l_v15_FirstChild_0);
        return l_v17_0 * l_v20_FirstChild_0.CFrame * l_v15_FirstChild_0.CFrame:Inverse();
    else
        return (CFrame.new());
    end;
end;
local function v37(v25, v26) --[[ Line: 87 ]] --[[ Name: calculateHierarchyTransforms ]]
    -- upvalues: v24 (copy)
    local v27 = {};
    local function v28(v29, v30, v31, v32) --[[ Line: 90 ]] --[[ Name: calculateAllTransformsInternal ]]
        -- upvalues: v26 (copy), v24 (ref), v27 (copy), v28 (copy)
        local v33 = v26(v29);
        assert(v33);
        local v34 = v24(v33, v30, v32, v26);
        v27[v33.Name] = v34;
        if not v31.children then
            return;
        else
            for v35, v36 in v31.children do
                v28(v35, v29, v36, v34);
            end;
            return;
        end;
    end;
    v28(v25.root, nil, v25, CFrame.new());
    return v27;
end;
local function _(v38, v39) --[[ Line: 110 ]] --[[ Name: calculateLocalSpaceTransform ]]
    local v40 = v38.Rotation:Inverse() * v39.Rotation;
    local v41 = v38.Rotation:Inverse() * (v39.Position - v38.Position);
    return CFrame.new(v41) * v40;
end;
local function v48(v43, v44) --[[ Line: 117 ]] --[[ Name: calculateAssetCFrameFromPartsCFrames ]]
    -- upvalues: v5 (copy), v14 (copy)
    local v45 = v5(v43);
    local l_Position_0 = v44[v45[1]].Position;
    local l_Position_1 = v44[v45[3]].Position;
    return v14(l_Position_0, l_Position_1);
end;
local function _(v49) --[[ Line: 128 ]] --[[ Name: assertTypesToOrient ]]
    local v50 = true;
    if v49 ~= Enum.AssetType.LeftArm then
        v50 = true;
        if v49 ~= Enum.AssetType.RightArm then
            v50 = true;
            if v49 ~= Enum.AssetType.LeftLeg then
                v50 = v49 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v50);
end;
local function _(v52, v53, v54) --[[ Line: 137 ]] --[[ Name: getAttachmentCFrame ]]
    local l_v52_FirstChild_0 = v52:FindFirstChild(v53);
    assert(l_v52_FirstChild_0);
    return v54 * l_v52_FirstChild_0.CFrame;
end;
v8.calculatePartCFrameFromRigAttachments = function(v57, v58, v59) --[[ Line: 143 ]] --[[ Name: calculatePartCFrameFromRigAttachments ]]
    -- upvalues: v2 (copy), v6 (copy), v14 (copy)
    local v60 = true;
    if v57 ~= Enum.AssetType.LeftArm then
        v60 = true;
        if v57 ~= Enum.AssetType.RightArm then
            v60 = true;
            if v57 ~= Enum.AssetType.LeftLeg then
                v60 = v57 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v60);
    local v61 = v2.getRigAttachmentToParent(v57, v58.Name);
    if v61 == "" then
        return;
    else
        local l_v58_FirstChild_0 = v58:FindFirstChild(v61);
        assert(l_v58_FirstChild_0);
        v60 = v59 * l_v58_FirstChild_0.CFrame;
        l_v58_FirstChild_0 = v6.getAssetRigChild(v57, v58.Name);
        if not l_v58_FirstChild_0 then
            return;
        else
            local l_v58_FirstChild_1 = v58:FindFirstChild((v2.getRigAttachmentToParent(v57, l_v58_FirstChild_0)));
            assert(l_v58_FirstChild_1);
            local v64 = v59 * l_v58_FirstChild_1.CFrame;
            return v14(v60.Position, v64.Position);
        end;
    end;
end;
v8.calculateStraightenedLimb = function(v65, v66, v67) --[[ Line: 167 ]] --[[ Name: calculateStraightenedLimb ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v8 (copy), v2 (copy)
    local v68 = true;
    if v65 ~= Enum.AssetType.LeftArm then
        v68 = true;
        if v65 ~= Enum.AssetType.RightArm then
            v68 = true;
            if v65 ~= Enum.AssetType.LeftLeg then
                v68 = v65 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v68);
    local v69 = v1.Dictionary.join(v66);
    v68 = nil;
    local v70 = CFrame.new();
    for _, v72 in v5(v65) do
        local v73 = v67(v72);
        local l_v70_0 = v70;
        local v75 = v6.getAssetRigChild(v65, v72);
        local v76 = v75 == nil;
        if not v76 then
            l_v70_0 = v8.calculatePartCFrameFromRigAttachments(v65, v73, v66[v72]) or l_v70_0;
        end;
        local l_l_v70_0_0 = l_v70_0;
        local v78 = v66[v72];
        local v79 = l_l_v70_0_0.Rotation:Inverse() * v78.Rotation;
        local v80 = l_l_v70_0_0.Rotation:Inverse() * (v78.Position - l_l_v70_0_0.Position);
        v69[v72] = CFrame.new(v80) * v79;
        if v68 then
            l_l_v70_0_0 = v2.getRigAttachmentToParent(v65, v72);
            v78 = v69[v72];
            v79 = v73:FindFirstChild(l_l_v70_0_0);
            assert(v79);
            l_l_v70_0_0 = v68 - (v78 * v79.CFrame).Position;
            v69[v72] = CFrame.new(v69[v72].Position + l_l_v70_0_0) * v69[v72].Rotation;
        end;
        if not v76 then
            v70 = l_v70_0;
            l_l_v70_0_0 = v2.getRigAttachmentToParent(v65, v75);
            v78 = v69[v72];
            v79 = v73:FindFirstChild(l_l_v70_0_0);
            assert(v79);
            v68 = (v78 * v79.CFrame).Position;
        end;
    end;
    return v69;
end;
v8.calculateAssetCFrame = function(v81, v82) --[[ Line: 220 ]] --[[ Name: calculateAssetCFrame ]]
    -- upvalues: v8 (copy), v48 (copy)
    local v83 = v8.calculateAllTransformsForAsset(v81, v82);
    if Enum.AssetType.DynamicHead == v81 then
        return v83.Head;
    elseif Enum.AssetType.Torso == v81 then
        return v83.LowerTorso;
    else
        return v48(v81, v83);
    end;
end;
v8.calculateAllTransformsForAsset = function(v84, v85) --[[ Line: 231 ]] --[[ Name: calculateAllTransformsForAsset ]]
    -- upvalues: v37 (copy), v6 (copy)
    if Enum.AssetType.DynamicHead == v84 then
        return {
            Head = CFrame.new()
        };
    else
        return (v37(v6.assetHierarchy[v84], function(v86) --[[ Line: 236 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v85 (copy)
            return (v85:FindFirstChild(v86));
        end));
    end;
end;
v8.calculateAllTransformsForFullBody = function(v87) --[[ Line: 243 ]] --[[ Name: calculateAllTransformsForFullBody ]]
    -- upvalues: v37 (copy), v7 (copy)
    return (v37(v7, function(v88) --[[ Line: 244 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v87 (copy)
        return v87[v88];
    end));
end;
v8.calculatePartsLocalToAsset = function(v89, v90) --[[ Line: 251 ]] --[[ Name: calculatePartsLocalToAsset ]]
    -- upvalues: v5 (copy), v14 (copy)
    local v91 = true;
    if v89 ~= Enum.AssetType.LeftArm then
        v91 = true;
        if v89 ~= Enum.AssetType.RightArm then
            v91 = true;
            if v89 ~= Enum.AssetType.LeftLeg then
                v91 = v89 == Enum.AssetType.RightLeg;
            end;
        end;
    end;
    assert(v91);
    v91 = v5(v89);
    local l_Position_2 = v90[v91[1]].Position;
    local l_Position_3 = v90[v91[3]].Position;
    local v94 = v14(l_Position_2, l_Position_3);
    v91 = {};
    for _, v96 in v5(v89) do
        local v97;
        if v94 then
            local v98 = v90[v96];
            local v99 = v94.Rotation:Inverse() * v98.Rotation;
            local v100 = v94.Rotation:Inverse() * (v98.Position - v94.Position);
            v97 = CFrame.new(v100) * v99;
        else
            v97 = v90[v96];
        end;
        v91[v96] = v97;
    end;
    return v91;
end;
return v8;