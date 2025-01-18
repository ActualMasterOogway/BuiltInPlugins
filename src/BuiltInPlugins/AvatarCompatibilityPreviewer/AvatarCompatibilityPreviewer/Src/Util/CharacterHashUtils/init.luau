local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util["sha256.global"]);
local v3 = require(l_script_FirstAncestor_0.Src.Util.BoundingBoxUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagHumanoidModelScalingFix);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagNoHashingScalingValues);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSafeCharaterEncoding);
local v9 = {
    canEncodeStringSafely = function(v7) --[[ Line: 40 ]] --[[ Name: canEncodeStringSafely ]]
        if type(v7) ~= "string" then
            return false;
        elseif not utf8.len(v7) then
            return false;
        else
            return true;
        end;
    end, 
    canEncodeNumberSafely = function(v8) --[[ Line: 54 ]] --[[ Name: canEncodeNumberSafely ]]
        if type(v8) ~= "number" then
            return false;
        elseif v8 ~= v8 then
            return false;
        else
            return true;
        end;
    end
};
v9.cutPrecision = function(v10) --[[ Line: 68 ]] --[[ Name: cutPrecision ]]
    -- upvalues: v6 (copy), v9 (copy)
    if v6() and not v9.canEncodeNumberSafely(v10) then
        return 0;
    else
        return (math.floor(v10 * 256 + 0.5));
    end;
end;
v9.cutListPrecision = function(v11) --[[ Line: 78 ]] --[[ Name: cutListPrecision ]]
    local v12 = {};
    for _, v14 in v11 do
        table.insert(v12, (math.floor(v14 * 256 + 0.5)));
    end;
    return v12;
end;
local v15 = {
    "alphaMode", 
    "archivable", 
    "attachmentPoint", 
    "autoJumpEnabled", 
    "autoRotate", 
    "autoSkin", 
    "automaticScalingEnabled", 
    "bindOffset", 
    "breakJointsOnDeath", 
    "c0", 
    "c1", 
    "cageOrigin", 
    "cameraOffset", 
    "cframe", 
    "children", 
    "className", 
    "color", 
    "colorMap", 
    "displayDistanceType", 
    "displayName", 
    "enabled", 
    "evaluateStateMachine", 
    "headColor", 
    "health", 
    "healthDisplayDistance", 
    "healthDisplayType", 
    "hipHeight", 
    "importOrigin", 
    "jump", 
    "jumpPower", 
    "leftArmColor", 
    "leftLegColor", 
    "material", 
    "materialVariant", 
    "maxHealth", 
    "maxSlopeAngle", 
    "meshId", 
    "metalnessMap", 
    "name", 
    "nameDisplayDistance", 
    "nameOcclusion", 
    "normalMap", 
    "order", 
    "part0", 
    "part1", 
    "puffiness", 
    "referenceMeshId", 
    "referenceOrigin", 
    "reflectance", 
    "requiresNeck", 
    "rigType", 
    "rightArmColor", 
    "rightLegColor", 
    "roughnessMap", 
    "shrinkFactor", 
    "sit", 
    "size", 
    "texture", 
    "textureId", 
    "torsoColor", 
    "transparency", 
    "useJumpPower", 
    "value", 
    "walkSpeed"
};
assert(#v15 <= 64, "Too many well known ids");
local v16 = {};
for v17, v18 in v15 do
    v16[v18] = string.char(string.byte("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-", v17));
end;
v9.serialize = function(v19, v20, v21) --[[ Line: 163 ]] --[[ Name: serialize ]]
    -- upvalues: v6 (copy), v9 (copy), v16 (copy)
    if v6() then
        if v21 <= 0 then
            return nil;
        else
            v21 = v21 - 1;
        end;
    end;
    if typeof(v19) == "Instance" then
        if v20.options.ignoreAccessories and v19:IsA("Accessory") then
            return nil;
        else
            local v22 = v20.state.pendingInstances[v19];
            if v22 then
                return (("inst-%*"):format(v22));
            else
                local v23 = v20.state.lastInstanceId + 1;
                v20.state.lastInstanceId = v23;
                v20.state.pendingInstances[v19] = v23;
                local v24 = v9.serializeInstanceRaw(v19, v20, v21);
                if v6() and not v24 then
                    return nil;
                else
                    local v25 = {};
                    for v26, v27 in v24 do
                        local v28 = v16[v27] or v27;
                        if v16[v26] then
                            v25[v16[v26]] = v28;
                        else
                            v25[v26] = v28;
                        end;
                    end;
                    return v25;
                end;
            end;
        end;
    elseif typeof(v19) == "EnumItem" then
        return v19.Value;
    elseif typeof(v19) == "BrickColor" then
        return v19.Number;
    elseif typeof(v19) == "Color3" then
        return v9.cutListPrecision({
            v19.R, 
            v19.G, 
            v19.B
        });
    elseif typeof(v19) == "CFrame" then
        local l_LookVector_0 = v19.LookVector;
        local v30 = math.atan2(-l_LookVector_0.X, -l_LookVector_0.Z);
        local v31 = (l_LookVector_0.X ^ 2 + l_LookVector_0.Z ^ 2) ^ 0.5;
        local v32 = math.atan2(l_LookVector_0.Y, v31);
        local _, _, v35 = ((CFrame.Angles(0, v30, 0) * CFrame.Angles(v32, 0, 0) + v19.Position):Inverse() * v19):ToEulerAnglesXYZ();
        return v9.cutListPrecision({
            v19.X, 
            v19.Y, 
            v19.Z, 
            v30 / 3.141592653589793, 
            v35 / 3.141592653589793, 
            v32 / 1.5707963267948966
        });
    elseif typeof(v19) == "Vector3" then
        return v9.cutListPrecision({
            v19.X, 
            v19.Y, 
            v19.Z
        });
    elseif typeof(v19) == "boolean" then
        if v19 then
            return 1;
        else
            return 0;
        end;
    elseif typeof(v19) == "number" then
        return v9.cutPrecision(v19);
    elseif type(v19) == "string" then
        if v6() then
            if v9.canEncodeStringSafely(v19) then
                return v19;
            else
                return nil;
            end;
        else
            return v19;
        end;
    else
        return v19;
    end;
end;
v9.serializeSize = function(v36, v37, v38) --[[ Line: 253 ]] --[[ Name: serializeSize ]]
    -- upvalues: v9 (copy)
    return v9.serialize(v36 / v37.state.boundingSize, v37, v38);
end;
v9.serializePartCFrame = function(v39, v40, v41) --[[ Line: 261 ]] --[[ Name: serializePartCFrame ]]
    -- upvalues: v9 (copy)
    local v42 = v40.state.boundingCFrame:ToObjectSpace(v39);
    return v9.serialize(v42.Rotation + v42.Position / v40.state.boundingSize, v40, v41);
end;
v9.serializePosition = function(v43, v44, v45) --[[ Line: 274 ]] --[[ Name: serializePosition ]]
    -- upvalues: v9 (copy)
    return v9.serialize(v44.state.boundingCFrame:PointToObjectSpace(v43) / v44.state.boundingSize, v44, v45);
end;
v9.serializeAttachmentCFrame = function(v46, v47, v48) --[[ Line: 286 ]] --[[ Name: serializeAttachmentCFrame ]]
    -- upvalues: v9 (copy)
    return v9.serialize(v46.Rotation + v46.Position / v47.state.boundingSize, v47, v48);
end;
v9.serializeAttachmentPosition = function(v49, v50, v51) --[[ Line: 298 ]] --[[ Name: serializeAttachmentPosition ]]
    -- upvalues: v9 (copy)
    return v9.serialize(v49 / v50.state.boundingSize, v50, v51);
end;
v9.serializeScalingHumanoidNumber = function(v52, v53, v54, v55) --[[ Line: 306 ]] --[[ Name: serializeScalingHumanoidNumber ]]
    -- upvalues: v9 (copy)
    local l_relativeScale_0 = v53.relativeScale;
    if v55 then
        l_relativeScale_0 = v55(v53.relativeScale);
    end;
    return v9.serialize(v9.cutPrecision(v52 / l_relativeScale_0), v53, v54);
end;
v9.serializeReferenceInstance = function(v57, v58, v59) --[[ Line: 321 ]] --[[ Name: serializeReferenceInstance ]]
    -- upvalues: v6 (copy), v9 (copy)
    if v6() then
        if v59 <= 0 then
            return nil;
        else
            v59 = v59 - 1;
        end;
    end;
    if v57 == nil then
        return nil;
    else
        for _, v61 in v58.state.allowedInstancesToSerializeUnder do
            if v57 == v61 or v57:IsDescendantOf(v61) then
                return v9.serialize(v57, v58, v59);
            end;
        end;
        return nil;
    end;
end;
local v62 = {
    BodyHeightScale = true, 
    BodyWidthScale = true, 
    BodyDepthScale = true, 
    HeadScale = true, 
    BodyTypeScale = not v4() or nil, 
    BodyProportionScale = not v4() or nil
};
v9.isScalingHumanoidNumber = function(v63) --[[ Line: 357 ]] --[[ Name: isScalingHumanoidNumber ]]
    -- upvalues: v62 (copy)
    if v63:IsA("NumberValue") then
        return v62[v63.Name];
    else
        return false;
    end;
end;
v9.serializeInstanceRaw = function(v64, v65, v66) --[[ Line: 368 ]] --[[ Name: serializeInstanceRaw ]]
    -- upvalues: v6 (copy), v9 (copy), v5 (copy), v4 (copy)
    if v6() then
        if v66 <= 0 then
            return nil;
        else
            v66 = v66 - 1;
        end;
    end;
    if v64:IsA("MeshPart") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            meshId = v9.serialize(v64.MeshId, v65, v66), 
            textureId = v9.serialize(v64.TextureID, v65, v66), 
            material = v9.serialize(v64.Material, v65, v66), 
            materialVariant = v9.serialize(v64.MaterialVariant, v65, v66), 
            transparency = v9.serialize(v64.Transparency, v65, v66), 
            reflectance = v9.serialize(v64.Reflectance, v65, v66), 
            color = v9.serialize(v64.Color, v65, v66), 
            size = v9.serializeSize(v64.Size, v65, v66), 
            cframe = v9.serializePartCFrame(v64.CFrame, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("BasePart") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            color = v9.serialize(v64.Color, v65, v66), 
            material = v9.serialize(v64.Material, v65, v66), 
            materialVariant = v9.serialize(v64.MaterialVariant, v65, v66), 
            transparency = v9.serialize(v64.Transparency, v65, v66), 
            reflectance = v9.serialize(v64.Reflectance, v65, v66), 
            size = v9.serializeSize(v64.Size, v65, v66), 
            cframe = v9.serializePartCFrame(v64.CFrame, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("WrapLayer") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            cageOrigin = v9.serializeAttachmentCFrame(v64.CageOrigin, v65, v66), 
            importOrigin = v9.serializeAttachmentCFrame(v64.ImportOrigin, v65, v66), 
            order = v9.serialize(v64.Order, v65, v66), 
            puffiness = v9.serialize(v64.Puffiness, v65, v66), 
            referenceMeshId = v9.serialize(v64.ReferenceMeshId, v65, v66), 
            referenceOrigin = v9.serializeAttachmentCFrame(v64.ReferenceOrigin, v65, v66), 
            autoSkin = v9.serialize(v64.AutoSkin, v65, v66), 
            enabled = v9.serialize(v64.Enabled, v65, v66), 
            bindOffset = v9.serialize(v64.BindOffset, v65, v66), 
            shrinkFactor = v9.serialize(v64.ShrinkFactor, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("JointInstance") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            c0 = v9.serializeAttachmentCFrame(v64.C0, v65, v66), 
            c1 = v9.serializeAttachmentCFrame(v64.C1, v65, v66), 
            part0 = v9.serializeReferenceInstance(v64.Part0, v65, v66), 
            part1 = v9.serializeReferenceInstance(v64.Part1, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("Attachment") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            cframe = v9.serializeAttachmentCFrame(v64.CFrame, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("Decal") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            texture = v9.serialize(v64.Texture, v65, v66), 
            transparency = v9.serialize(v64.Transparency, v65, v66)
        };
    elseif v64:IsA("Texture") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            texture = v9.serialize(v64.Texture, v65, v66), 
            transparency = v9.serialize(v64.Transparency, v65, v66)
        };
    elseif v64:IsA("SurfaceAppearance") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            colorMap = v9.serialize(v64.ColorMap, v65, v66), 
            normalMap = v9.serialize(v64.NormalMap, v65, v66), 
            metalnessMap = v9.serialize(v64.MetalnessMap, v65, v66), 
            roughnessMap = v9.serialize(v64.RoughnessMap, v65, v66), 
            color = v9.serialize(v64.Color, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66), 
            alphaMode = v9.serialize(v64.AlphaMode, v65, v66)
        };
    elseif v64:IsA("Accessory") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            attachmentPoint = v9.serializeAttachmentCFrame(v64.AttachmentPoint, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("BodyColors") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            headColor = v9.serialize(v64.HeadColor, v65, v66), 
            leftArmColor = v9.serialize(v64.LeftArmColor, v65, v66), 
            leftLegColor = v9.serialize(v64.LeftLegColor, v65, v66), 
            rightArmColor = v9.serialize(v64.RightArmColor, v65, v66), 
            rightLegColor = v9.serialize(v64.RightLegColor, v65, v66), 
            torsoColor = v9.serialize(v64.TorsoColor, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("NumberValue") and v9.isScalingHumanoidNumber(v64) then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            value = v9.serializeScalingHumanoidNumber(v64.Value, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("ValueBase") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            className = v9.serialize(v64.ClassName, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            value = v9.serialize(v64.Value, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    elseif v64:IsA("Humanoid") then
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            rigType = v9.serialize(v64.RigType, v65, v66), 
            autoRotate = v9.serialize(v64.AutoRotate, v65, v66), 
            breakJointsOnDeath = v9.serialize(v64.BreakJointsOnDeath, v65, v66), 
            evaluateStateMachine = v9.serialize(v64.EvaluateStateMachine, v65, v66), 
            requiresNeck = v9.serialize(v64.RequiresNeck, v65, v66), 
            walkSpeed = if v5() then nil else v9.serializeScalingHumanoidNumber(v64.WalkSpeed, v65, v66), 
            health = v9.serialize(v64.Health, v65, v66), 
            maxHealth = v9.serialize(v64.MaxHealth, v65, v66), 
            hipHeight = v9.serializeScalingHumanoidNumber(v64.HipHeight, v65, v66), 
            maxSlopeAngle = v9.serialize(v64.MaxSlopeAngle, v65, v66), 
            jumpPower = if v5() then nil else v9.serializeScalingHumanoidNumber(v64.JumpPower, v65, v66, function(v67) --[[ Line: 532 ]]
                -- upvalues: v4 (ref)
                if v4() then
                    return (math.sqrt(v67));
                else
                    return v67;
                end;
            end), 
            autoJumpEnabled = v9.serialize(v64.AutoJumpEnabled, v65, v66), 
            useJumpPower = v9.serialize(v64.UseJumpPower, v65, v66), 
            nameDisplayDistance = if v5() then nil else v9.serializeScalingHumanoidNumber(v64.NameDisplayDistance, v65, v66), 
            healthDisplayType = v9.serialize(v64.HealthDisplayType, v65, v66), 
            healthDisplayDistance = if v5() then nil else v9.serializeScalingHumanoidNumber(v64.HealthDisplayDistance, v65, v66), 
            displayName = v9.serialize(v64.DisplayName, v65, v66), 
            displayDistanceType = v9.serialize(v64.DisplayDistanceType, v65, v66), 
            cameraOffset = v9.serializeAttachmentPosition(v64.CameraOffset, v65, v66), 
            automaticScalingEnabled = v9.serialize(v64.AutomaticScalingEnabled, v65, v66), 
            nameOcclusion = v9.serialize(v64.NameOcclusion, v65, v66), 
            sit = v9.serialize(v64.Sit, v65, v66), 
            jump = v9.serialize(v64.Jump, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    else
        return {
            name = v9.serialize(v64.Name, v65, v66), 
            className = v9.serialize(v64.ClassName, v65, v66), 
            archivable = v9.serialize(v64.Archivable, v65, v66), 
            children = v9.serializeChildren(v64, v65, v66)
        };
    end;
end;
v9.serializeChildren = function(v68, v69, v70) --[[ Line: 587 ]] --[[ Name: serializeChildren ]]
    -- upvalues: v6 (copy), v9 (copy)
    if v6() then
        if v70 <= 0 then
            return nil;
        else
            v70 = v70 - 1;
        end;
    end;
    local v71 = {};
    for _, v73 in v68:GetChildren() do
        table.insert(v71, v9.serialize(v73, v69, v70));
    end;
    if #v71 > 0 then
        return v71;
    else
        return nil;
    end;
end;
v9.computeHashSerializeContext = function(v74, v75) --[[ Line: 613 ]] --[[ Name: computeHashSerializeContext ]]
    -- upvalues: v3 (copy)
    local v76 = {};
    local v77 = {};
    local function _(v78) --[[ Line: 620 ]] --[[ Name: handleInstance ]]
        -- upvalues: v76 (copy), v77 (copy)
        if v78:IsA("BasePart") then
            table.insert(v76, v78);
            return;
        else
            if v78:IsA("Model") and v78.PrimaryPart then
                table.insert(v77, v78.PrimaryPart);
            end;
            return;
        end;
    end;
    for _, v81 in v74 do
        if v81:IsA("BasePart") then
            table.insert(v76, v81);
        elseif v81:IsA("Model") and v81.PrimaryPart then
            table.insert(v77, v81.PrimaryPart);
        end;
        for _, v83 in v81:GetDescendants() do
            if v83:IsA("BasePart") then
                table.insert(v76, v83);
            elseif v83:IsA("Model") and v83.PrimaryPart then
                table.insert(v77, v83.PrimaryPart);
            end;
        end;
    end;
    local v84 = nil;
    v84 = if #v77 == 1 then v77[1].CFrame else if #v76 == 1 then v76[1].CFrame else if #v77 > 0 then v77[1].CFrame else if #v76 > 0 then v76[1].CFrame else CFrame.new();
    local v85, v86 = v3.getAABoundingBox(v76, v84);
    if v86.Magnitude == 0 then
        v86 = Vector3.new(1, 1, 1, 0);
    end;
    local v87 = v84 + v84:VectorToWorldSpace(v85);
    local v88 = nil;
    local v89 = nil;
    if not v75.ignoreUniformScaleChanges then
        v89 = 1;
        v88 = Vector3.new(1, 1, 1, 0);
    else
        local v90 = math.max(v86.X, v86.Y, v86.Z);
        v88 = Vector3.new(v90, v90, v90);
        v89 = v90;
    end;
    return {
        options = v75, 
        relativeScale = v89, 
        state = {
            allowedInstancesToSerializeUnder = v74, 
            boundingCFrame = v87, 
            boundingSize = v88, 
            lastInstanceId = 0, 
            pendingInstances = {}
        }
    };
end;
v9.hashCharacter = function(v91, v92) --[[ Line: 688 ]] --[[ Name: hashCharacter ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), v2 (copy)
    local v93 = v9.serialize(v91, v92, 25);
    local v94 = l_HttpService_0:JSONEncode(v93);
    v94 = string.gsub(v94, "[\":,}{[%]]", "");
    return (v2(v94));
end;
return v9;