local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local v11 = {
    rigAttachmentToParentMap = {
        Head = "NeckRigAttachment", 
        UpperTorso = "WaistRigAttachment", 
        LowerTorso = "RootRigAttachment", 
        RightHand = "RightWristRigAttachment", 
        RightLowerArm = "RightElbowRigAttachment", 
        RightUpperArm = "RightShoulderRigAttachment", 
        LeftHand = "LeftWristRigAttachment", 
        LeftLowerArm = "LeftElbowRigAttachment", 
        LeftUpperArm = "LeftShoulderRigAttachment", 
        RightFoot = "RightAnkleRigAttachment", 
        RightLowerLeg = "RightKneeRigAttachment", 
        RightUpperLeg = "RightHipRigAttachment", 
        LeftFoot = "LeftAnkleRigAttachment", 
        LeftLowerLeg = "LeftKneeRigAttachment", 
        LeftUpperLeg = "LeftHipRigAttachment"
    }, 
    getRules = function(v1) --[[ Line: 23 ]] --[[ Name: getRules ]]
        -- upvalues: l_AvatarCreationService_0 (copy)
        if not v1.rules then
            v1.rules = l_AvatarCreationService_0:GetValidationRules();
        end;
        return v1.rules;
    end, 
    getBodyPartMaxTrianglesRule = function(v2, v3) --[[ Line: 31 ]] --[[ Name: getBodyPartMaxTrianglesRule ]]
        return v2:getRules().MeshRules.BodyPartMaxTriangles[v3];
    end, 
    getAccessoryRules = function(v4, v5) --[[ Line: 35 ]] --[[ Name: getAccessoryRules ]]
        for v6, v7 in v4:getRules().AccessoryRules do
            local v8 = {
                rigidAllowed = v7.RigidAllowed, 
                attachmentNames = {}, 
                bounds = {}
            };
            for _, v10 in v7.Attachments do
                table.insert(v8.attachmentNames, v10.Name);
                v8.bounds[v10.Name] = {
                    size = v10.Size, 
                    offset = v10.Offset
                };
            end;
            v5[v6] = v8;
        end;
    end
};
v11.getBodyPartRules = function(v12, v13) --[[ Line: 53 ]] --[[ Name: getBodyPartRules ]]
    -- upvalues: v11 (copy)
    for v14, v15 in v12:getRules().BodyPartRules do
        local v16 = {
            isBodyPart = true, 
            bounds = {}, 
            subParts = {}
        };
        for v17, v18 in v15.Bounds do
            v16.bounds[v17] = {
                minSize = v18.MinSize, 
                maxSize = v18.MaxSize
            };
        end;
        for v19, v20 in v15.SubParts do
            local v21 = {
                rigAttachmentToParent = {}, 
                otherAttachments = {}
            };
            local v22 = v11.rigAttachmentToParentMap[v19];
            for v23, v24 in v20 do
                if v22 == v23 then
                    v21.rigAttachmentToParent = {
                        name = v23, 
                        bounds = {
                            min = v24.LowerBound, 
                            max = v24.UpperBound
                        }
                    };
                else
                    v21.otherAttachments[v23] = {
                        bounds = {
                            min = v24.LowerBound, 
                            max = v24.UpperBound
                        }
                    };
                end;
            end;
            v16.subParts[v19] = v21;
        end;
        v13[v14] = v16;
    end;
end;
v11.getFullBodyRulesBounds = function(v25) --[[ Line: 96 ]] --[[ Name: getFullBodyRulesBounds ]]
    local v26 = {};
    for v27, v28 in v25:getRules().FullBodyRules.Bounds do
        v26[v27] = {
            minSize = v28.MinSize, 
            maxSize = v28.MaxSize
        };
    end;
    return v26;
end;
return v11;