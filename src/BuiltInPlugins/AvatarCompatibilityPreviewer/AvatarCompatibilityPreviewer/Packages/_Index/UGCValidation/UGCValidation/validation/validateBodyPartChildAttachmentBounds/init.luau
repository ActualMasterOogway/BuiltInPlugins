local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.prettyPrintVector3);
local v6 = require(l_Parent_0.util.floatEquals);
local v7 = require(l_Parent_0.util.getDiffBetweenOrientations);
local v8 = require(l_Parent_0.util.getExpectedPartSize);
local v9 = require(l_Parent_0.util.BoundsCalculator);
local v10 = require(l_Parent_0.util.AssetCalculator);
local v11 = require(l_Parent_0.util.BoundsDataUtils);
local v12 = require(l_Parent_0.flags.getFFlagCheckOrientationOnAllAttachments);
local v13 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateOrientedAttachmentPositionCheck);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidateOrientedAttachmentOrientationCheck);
local v16 = require(l_Parent_0.flags.getFFlagUGCValidateFixAttachmentErrorMessage);
local v17 = {
    RootAttachment = game:DefineFastInt("UGCValidationRootAttachmentThreshold", 0), 
    LeftGripAttachment = game:DefineFastInt("UGCValidationLeftGripAttachmentThreshold", 0), 
    RightGripAttachment = game:DefineFastInt("UGCValidationRightGripAttachmentThreshold", 0), 
    FaceFrontAttachment = game:DefineFastInt("UGCValidationFaceFrontAttachmentThreshold", 90), 
    HatAttachment = game:DefineFastInt("UGCValidationHatAttachmentThreshold", 90), 
    HairAttachment = game:DefineFastInt("UGCValidationHairAttachmentThreshold", 90), 
    FaceCenterAttachment = game:DefineFastInt("UGCValidationFaceCenterAttachmentThreshold", 90), 
    RightFootAttachment = game:DefineFastInt("UGCValidationRightFootAttachmentThreshold", 90), 
    LeftFootAttachment = game:DefineFastInt("UGCValidationLeftFootAttachmentThreshold", 90), 
    BodyFrontAttachment = game:DefineFastInt("UGCValidationBodyFrontAttachmentThreshold", 90), 
    BodyBackAttachment = game:DefineFastInt("UGCValidationBodyBackAttachmentThreshold", 90), 
    LeftCollarAttachment = game:DefineFastInt("UGCValidationLeftCollarAttachmentThreshold", 90), 
    RightCollarAttachment = game:DefineFastInt("UGCValidationRightCollarAttachmentThreshold", 90), 
    NeckAttachment = game:DefineFastInt("UGCValidationNeckAttachmentThreshold", 90), 
    WaistCenterAttachment = game:DefineFastInt("UGCValidationWaistCenterAttachmentThreshold", 90), 
    WaistFrontAttachment = game:DefineFastInt("UGCValidationWaistFrontAttachmentThreshold", 90), 
    WaistBackAttachment = game:DefineFastInt("UGCValidationWaistBackAttachmentThreshold", 90), 
    LeftShoulderAttachment = game:DefineFastInt("UGCValidationLeftShoulderAttachmentThreshold", 90), 
    RightShoulderAttachment = game:DefineFastInt("UGCValidationRightShoulderAttachmentThreshold", 90)
};
local function v33(v18, v19, v20, v21, v22) --[[ Line: 52 ]] --[[ Name: validateInMeshSpace ]]
    -- upvalues: v14 (copy), v11 (copy), v13 (copy), v8 (copy), v2 (copy), v16 (copy), v5 (copy)
    local v23 = nil;
    local v24 = nil;
    if v14() then
        local v25 = v22.cframe * v18.CFrame;
        local v26 = v11.calculateBoundsCenters(v22.boundsData);
        local v27 = v11.calculateBoundsDimensions(v22.boundsData);
        if not v26 or not v27 then
            return false, {
                "Missing mesh data for " .. v19.Name
            };
        else
            local v28 = v25.Position - v26;
            v24 = v27 / 2;
            v23 = v28 / v24;
        end;
    else
        v24 = if v13() then v8(v19, v21) / 2 else v19.Size / 2;
        v23 = v18.CFrame.Position / v24;
    end;
    local l_min_0 = v20.min;
    local l_max_0 = v20.max;
    for _, v32 in {
        "X", 
        "Y", 
        "Z"
    } do
        if v23[v32] < l_min_0[v32] or v23[v32] > l_max_0[v32] then
            v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition, nil, v21);
            return false, {
                if v16() then string.format("Attachment (%s) in %s is placed at a position [%s] that is outside the valid range. You need to adjust the attachment position.", v18.Name, v19.Name, v5(v18.CFrame.Position)) else string.format("Attachment (%s) in %s is placed at a position [%s] that is outside the valid range of ([%s] to [%s]). You need to adjust the attachment position.", v18.Name, v19.Name, v5(v18.CFrame.Position), v5(l_min_0 * v24), v5(l_max_0 * v24))
            };
        end;
    end;
    return true;
end;
local function v44(v34, _, v36, v37, v38) --[[ Line: 117 ]] --[[ Name: checkAll ]]
    -- upvalues: v4 (copy), v33 (copy)
    local v39 = v4.new();
    local l_v34_FirstChild_0 = v34:FindFirstChild(v36.rigAttachmentToParent.name);
    assert(l_v34_FirstChild_0);
    v39:updateReasons(v33(l_v34_FirstChild_0, v34, v36.rigAttachmentToParent.bounds, v37, v38));
    for v41, v42 in pairs(v36.otherAttachments) do
        local l_v34_FirstChild_1 = v34:FindFirstChild(v41);
        assert(l_v34_FirstChild_1);
        v39:updateReasons(v33(l_v34_FirstChild_1, v34, v42.bounds, v37, v38));
    end;
    return v39:getFinalResults();
end;
local function v66(v45, v46, v47) --[[ Line: 157 ]] --[[ Name: validateAttachmentRotation ]]
    -- upvalues: v4 (copy), v12 (copy), v6 (copy), v2 (copy), v17 (copy), v15 (copy), v7 (copy), v5 (copy)
    local v48 = v4.new();
    for _, v50 in v45:GetDescendants() do
        if v12() then
            if v50.ClassName == "Attachment" then
                if string.find(v50.Name, "RigAttachment") then
                    local v51, v52, v53 = v50.CFrame:ToOrientation();
                    if not v6(v51, 0) or not v6(v52, 0) or not v6(v53, 0) then
                        v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_AttachmentRotated, nil, v47);
                        v48:updateReasons(false, {
                            string.format("Detected rotation in Attachment '%s'. You must reset all rotation values for this attachment to zero.", v50:GetFullName())
                        });
                    end;
                elseif v17[v50.Name] ~= nil then
                    local v54 = string.find(v50.Name, "Grip");
                    local v55 = v54 and CFrame.Angles(-1.5707963267948966, 0, 0) or CFrame.Angles(0, 0, 0);
                    if v15() then
                        v55 = v46.Rotation * v55;
                    end;
                    local v56 = v7(v55, v50.CFrame);
                    local v57 = v17[v50.Name];
                    if v57 + 0.01 < v56 then
                        v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_AttachmentRotated, nil, v47);
                        local v58 = nil;
                        if v15() then
                            local v59, v60, v61 = v55:ToOrientation();
                            v58 = Vector3.new(math.deg(v59), math.deg(v60), (math.deg(v61)));
                        end;
                        v48:updateReasons(false, {
                            string.format("Detected invalid orientation for '%s'. Attachment orientation should be %s, but can be rotated up to %d degrees in total", v50.Name, v5(if v15() then v58 else Vector3.new(v54 and -90 or 0, 0, 0)), (math.floor(v57)))
                        });
                    end;
                end;
            end;
        else
            local v62 = false;
            if v50.ClassName == "Attachment" then
                v62 = string.find(v50.Name, "RigAttachment");
            end;
            if v62 then
                local v63, v64, v65 = v50.CFrame:ToOrientation();
                if not v6(v63, 0) or not v6(v64, 0) or not v6(v65, 0) then
                    v2.reportFailure(v2.ErrorType.validateBodyPartChildAttachmentBounds_AttachmentRotated, nil, v47);
                    v48:updateReasons(false, {
                        string.format("Detected rotation in Attachment '%s'. You must reset all rotation values for this attachment to zero.", v50:GetFullName())
                    });
                end;
            end;
        end;
    end;
    return v48:getFinalResults();
end;
local function _(v67, v68) --[[ Line: 250 ]] --[[ Name: calculateAssetCFrame ]]
    -- upvalues: v10 (copy)
    local v69 = v10.calculateAssetCFrame(v67, v68);
    if not v69 then
        return false, {
            string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", v67.Name)
        };
    else
        return true, nil, v69;
    end;
end;
return function(v71, v72) --[[ Line: 264 ]] --[[ Name: validateBodyPartChildAttachmentBounds ]]
    -- upvalues: v3 (copy), v4 (copy), v15 (copy), v10 (copy), v66 (copy), v14 (copy), v9 (copy), v44 (copy), v2 (copy)
    local v73 = tick();
    local l_assetTypeEnum_0 = v72.assetTypeEnum;
    local l_isServer_0 = v72.isServer;
    local v76 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    assert(v76);
    local v77 = v4.new();
    local v78 = CFrame.new();
    if v15() then
        local v79 = v10.calculateAssetCFrame(l_assetTypeEnum_0, v71);
        local v80, v81, v82;
        if not v79 then
            v80 = false;
            v81 = {
                string.format("Failed to calculate %s asset CFrame. Make sure the character is in I pose, A pose, or T pose, and the parts are not all in the same position", l_assetTypeEnum_0.Name)
            };
            v82 = nil;
        else
            v80 = true;
            v81 = nil;
            v82 = v79;
        end;
        if not v80 then
            return v80, v81;
        else
            v78 = v82;
        end;
    end;
    v77:updateReasons(v66(v71, v78, v72));
    local v83 = nil;
    if v14() then
        local v84, v85, v86 = v9.calculateIndividualAssetPartsData(v71, v72);
        if not v84 then
            return v84, v85;
        else
            v83 = v86;
        end;
    end;
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        local v87 = if v14() then v83[v71.Name] else nil;
        v77:updateReasons(v44(v71, l_isServer_0, v76.subParts.Head, v72, v87));
    else
        for v88, v89 in pairs(v76.subParts) do
            local l_v71_FirstChild_0 = v71:FindFirstChild(v88);
            assert(l_v71_FirstChild_0);
            local v91 = if v14() then v83[v88] else nil;
            v77:updateReasons(v44(l_v71_FirstChild_0, l_isServer_0, v89, v72, v91));
        end;
    end;
    v2.recordScriptTime(script.Name, v73, v72);
    return v77:getFinalResults();
end;