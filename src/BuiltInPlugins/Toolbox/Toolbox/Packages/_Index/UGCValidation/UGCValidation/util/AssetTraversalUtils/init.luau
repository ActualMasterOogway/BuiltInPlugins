local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.calculateMinMax);
local v3 = require(l_Parent_0.util.getExpectedPartSize);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v25 = {
    calculateBounds = function(v7, v8, v9, v10, v11) --[[ Line: 25 ]] --[[ Name: calculateBounds ]]
        -- upvalues: v6 (copy), v3 (copy), v2 (copy), v4 (copy)
        if v6() and v11 then
            local v12 = v3(v8, v11);
            local v13, v14 = v2(v10.minMeshCorner, v10.maxMeshCorner, v9:PointToWorldSpace(-(v12 / 2)), v9:PointToWorldSpace(-(v12 / 2)));
            v10.minMeshCorner = v13;
            v10.maxMeshCorner = v14;
            v13, v14 = v2(v10.minMeshCorner, v10.maxMeshCorner, v9:PointToWorldSpace(v12 / 2), v9:PointToWorldSpace(v12 / 2));
            v10.minMeshCorner = v13;
            v10.maxMeshCorner = v14;
        else
            local v15, v16 = v2(v10.minMeshCorner, v10.maxMeshCorner, v9:PointToWorldSpace(-(v8.Size / 2)), v9:PointToWorldSpace(-(v8.Size / 2)));
            v10.minMeshCorner = v15;
            v10.maxMeshCorner = v16;
            v15, v16 = v2(v10.minMeshCorner, v10.maxMeshCorner, v9:PointToWorldSpace(v8.Size / 2), v9:PointToWorldSpace(v8.Size / 2));
            v10.minMeshCorner = v15;
            v10.maxMeshCorner = v16;
        end;
        for _, v18 in v4.getAttachments(v7, v8.Name) do
            local l_v8_FirstChild_0 = v8:FindFirstChild(v18);
            assert(l_v8_FirstChild_0);
            if string.match(l_v8_FirstChild_0.Name, "RigAttachment$") ~= nil then
                local v20 = v9 * l_v8_FirstChild_0.CFrame;
                local v21, v22 = v2(v10.minRigAttachment, v10.maxRigAttachment, v20.Position, v20.Position);
                v10.minRigAttachment = v21;
                v10.maxRigAttachment = v22;
            end;
        end;
        local v23, v24 = v2(v10.minOverall, v10.maxOverall, v10.minMeshCorner, v10.maxMeshCorner);
        v10.minOverall = v23;
        v10.maxOverall = v24;
        v23, v24 = v2(v10.minOverall, v10.maxOverall, v10.minRigAttachment, v10.maxRigAttachment);
        v10.minOverall = v23;
        v10.maxOverall = v24;
    end
};
v25.traverseHierarchy = function(v26, v27, v28, v29, v30, v31, v32, v33, v34) --[[ Line: 97 ]] --[[ Name: traverseHierarchy ]]
    -- upvalues: v4 (copy), v25 (copy)
    local v35 = v27 and v28;
    assert(v26 ~= nil ~= (v35 ~= nil));
    local v36 = nil;
    v36 = if v26 then v26[v31] else v27:FindFirstChild(v31);
    assert(v36);
    local l_v30_0 = v30;
    if v29 then
        local v38 = nil;
        v38 = if v26 then v26[v29] else v27:FindFirstChild(v29);
        assert(v38);
        local v39 = v4.getRigAttachmentToParent(v28, v31);
        local l_v38_FirstChild_0 = v38:FindFirstChild(v39);
        assert(l_v38_FirstChild_0);
        local l_v36_FirstChild_0 = v36:FindFirstChild(v39);
        assert(l_v36_FirstChild_0);
        l_v30_0 = l_v30_0 * l_v38_FirstChild_0.CFrame * l_v36_FirstChild_0.CFrame:Inverse();
    else
        l_v30_0 = CFrame.new();
    end;
    v25.calculateBounds(v28, v36, l_v30_0, v33, v34);
    if v32.children then
        for v42, v43 in v32.children do
            v25.traverseHierarchy(v26, v27, v28, v31, l_v30_0, v42, v43, v33, v34);
        end;
    end;
end;
local v44 = nil;
local function v49() --[[ Line: 159 ]] --[[ Name: initRigParentToChild ]]
    -- upvalues: v44 (ref), v5 (copy)
    if v44 then
        return;
    else
        v44 = {};
        for _, v46 in {
            Enum.AssetType.LeftArm, 
            Enum.AssetType.RightArm, 
            Enum.AssetType.LeftLeg, 
            Enum.AssetType.RightLeg
        } do
            local v47 = v5(v46);
            v44[v46] = {};
            for v48 = 1, #v47 - 1 do
                v44[v46][v47[v48]] = v47[v48 + 1];
            end;
        end;
        return;
    end;
end;
v25.getAssetRigChild = function(v50, v51) --[[ Line: 175 ]] --[[ Name: getAssetRigChild ]]
    -- upvalues: v49 (copy), v44 (ref)
    v49();
    return assert(v44[v50], "Invalid asset type")[v51];
end;
v25.assetHierarchy = {
    [Enum.AssetType.DynamicHead] = {
        root = "Head"
    }, 
    [Enum.AssetType.Torso] = {
        root = "LowerTorso", 
        children = {
            UpperTorso = {}
        }
    }, 
    [Enum.AssetType.LeftArm] = {
        root = "LeftUpperArm", 
        children = {
            LeftLowerArm = {
                children = {
                    LeftHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightArm] = {
        root = "RightUpperArm", 
        children = {
            RightLowerArm = {
                children = {
                    RightHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.LeftLeg] = {
        root = "LeftUpperLeg", 
        children = {
            LeftLowerLeg = {
                children = {
                    LeftFoot = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightLeg] = {
        root = "RightUpperLeg", 
        children = {
            RightLowerLeg = {
                children = {
                    RightFoot = {}
                }
            }
        }
    }
};
return v25;