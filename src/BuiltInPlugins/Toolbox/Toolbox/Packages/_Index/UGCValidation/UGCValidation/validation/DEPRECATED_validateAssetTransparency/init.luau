local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTransparency);
local v2 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationGetImageTransparency);
local v3 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationRemoveRotationCheck);
local v5 = game:DefineFastInt("UGCValidationHeadThreshold", 30);
local v6 = game:DefineFastInt("UGCValidationTorsoThresholdFront", 50);
local v7 = game:DefineFastInt("UGCValidationTorsoThresholdBack", 48);
local v8 = game:DefineFastInt("UGCValidationTorsoThresholdSide", 46);
local v9 = game:DefineFastInt("UGCValidationLeftArmThresholdFront", 35);
local v10 = game:DefineFastInt("UGCValidationLeftArmThresholdBack", 33);
local v11 = game:DefineFastInt("UGCValidationLeftArmThresholdSide", 50);
local v12 = game:DefineFastInt("UGCValidationRightArmThresholdFront", 35);
local v13 = game:DefineFastInt("UGCValidationRightArmThresholdBack", 33);
local v14 = game:DefineFastInt("UGCValidationRightArmThresholdSide", 50);
local v15 = game:DefineFastInt("UGCValidationLeftLegThresholdFront", 50);
local v16 = game:DefineFastInt("UGCValidationLeftLegThresholdBack", 50);
local v17 = game:DefineFastInt("UGCValidationLeftLegThresholdSide", 46);
local v18 = game:DefineFastInt("UGCValidationRightLegThresholdFront", 50);
local v19 = game:DefineFastInt("UGCValidationRightLegThresholdBack", 50);
local v20 = game:DefineFastInt("UGCValidationRightLegThresholdSide", 48);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v22 = require(l_Parent_0.Constants);
local v23 = require(l_Parent_0.util.Thumbnailer);
local v24 = require(l_Parent_0.util.setupTransparentPartSize);
local v25 = require(l_Parent_0.util.floatEquals);
local v26 = {
    Vector3.new(0, 0, -1, 0), 
    Vector3.new(0, 0, 1, 0), 
    (Vector3.new(1, 0, 0, 0))
};
local v27 = nil;
if v2() then
    v27 = {
        [v26[1]] = "front", 
        [v26[2]] = "back", 
        [v26[3]] = "side"
    };
end;
local v28 = {
    [Enum.AssetType.DynamicHead] = {
        [v26[1]] = v5 / 100, 
        [v26[2]] = v5 / 100, 
        [v26[3]] = v5 / 100
    }, 
    [Enum.AssetType.Torso] = {
        [v26[1]] = v6 / 100, 
        [v26[2]] = v7 / 100, 
        [v26[3]] = v8 / 100
    }, 
    [Enum.AssetType.LeftArm] = {
        [v26[1]] = v9 / 100, 
        [v26[2]] = v10 / 100, 
        [v26[3]] = v11 / 100
    }, 
    [Enum.AssetType.RightArm] = {
        [v26[1]] = v12 / 100, 
        [v26[2]] = v13 / 100, 
        [v26[3]] = v14 / 100
    }, 
    [Enum.AssetType.LeftLeg] = {
        [v26[1]] = v15 / 100, 
        [v26[2]] = v16 / 100, 
        [v26[3]] = v17 / 100
    }, 
    [Enum.AssetType.RightLeg] = {
        [v26[1]] = v18 / 100, 
        [v26[2]] = v19 / 100, 
        [v26[3]] = v20 / 100
    }
};
local v29 = nil;
if v2() then
    v29 = "%s is difficult to see from the %s. %d%% of the bounding box is visible, but over %d%% is required. Please expand the body part to fill in more room.";
end;
local function v46(v30, v31) --[[ Line: 93 ]] --[[ Name: arePartsRotated ]]
    -- upvalues: v25 (copy), v22 (copy)
    local function _(v32) --[[ Line: 94 ]] --[[ Name: isCFrameRotated ]]
        -- upvalues: v25 (ref)
        local v33, v34, v35 = v32:ToOrientation();
        return not v25(v33, 0) or not v25(v34, 0) or not v25(v35, 0);
    end;
    local v37 = v22.ASSET_TYPE_INFO[v31];
    assert(v37);
    if Enum.AssetType.DynamicHead == v31 then
        local v38, v39, v40 = v30.CFrame:ToOrientation();
        if not v25(v38, 0) or not v25(v39, 0) or not v25(v40, 0) then
            return true;
        end;
    else
        for v41 in pairs(v37.subParts) do
            local l_v30_FirstChild_0 = v30:FindFirstChild(v41);
            assert(l_v30_FirstChild_0);
            local v43, v44, v45 = l_v30_FirstChild_0.CFrame:ToOrientation();
            if not v25(v43, 0) or not v25(v44, 0) or not v25(v45, 0) then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v59(v47, v48, v49, v50, v51) --[[ Line: 119 ]] --[[ Name: flattenParts ]]
    -- upvalues: v22 (copy)
    local v52 = v22.ASSET_TYPE_INFO[v48];
    assert(v52);
    local function v56(v53) --[[ Line: 129 ]] --[[ Name: flattenIndividualPart ]]
        -- upvalues: v49 (copy), v50 (copy), v51 (copy)
        local l_Position_0 = v49[v53].Position;
        local l_Size_0 = v49[v53].Size;
        if math.abs(v50.Z) > math.abs(v50.X) then
            v53.Size = Vector3.new(l_Size_0.X, l_Size_0.Y, 0.01);
            v53.Position = Vector3.new(l_Position_0.X, l_Position_0.Y, v51.Z);
            return;
        else
            v53.Size = Vector3.new(0.01, l_Size_0.Y, l_Size_0.Z);
            v53.Position = Vector3.new(v51.X, l_Position_0.Y, l_Position_0.Z);
            return;
        end;
    end;
    if Enum.AssetType.DynamicHead == v48 then
        v56(v47);
        return;
    else
        for v57 in pairs(v52.subParts) do
            local l_v47_FirstChild_0 = v47:FindFirstChild(v57);
            assert(l_v47_FirstChild_0);
            v56(l_v47_FirstChild_0);
        end;
        return;
    end;
end;
local function v66(v60, v61) --[[ Line: 153 ]] --[[ Name: getInitialSizePosition ]]
    -- upvalues: v22 (copy)
    local v62 = v22.ASSET_TYPE_INFO[v61];
    assert(v62);
    local v63 = {};
    if Enum.AssetType.DynamicHead == v61 then
        v63[v60] = {
            Position = v60.Position, 
            Size = v60.Size
        };
        return v63;
    else
        for v64 in pairs(v62.subParts) do
            local l_v60_FirstChild_0 = v60:FindFirstChild(v64);
            assert(l_v60_FirstChild_0);
            v63[l_v60_FirstChild_0] = {
                Position = l_v60_FirstChild_0.Position, 
                Size = l_v60_FirstChild_0.Size
            };
        end;
        return v63;
    end;
end;
local function v72(v67) --[[ Line: 174 ]] --[[ Name: calculateMaxAspectRatio ]]
    -- upvalues: v22 (copy)
    local l_Classic_0 = v22.ASSET_TYPE_INFO[v67].bounds.Classic;
    local l_ProportionsSlender_0 = v22.ASSET_TYPE_INFO[v67].bounds.ProportionsSlender;
    local l_ProportionsNormal_0 = v22.ASSET_TYPE_INFO[v67].bounds.ProportionsNormal;
    local v71 = math.min(l_Classic_0.minSize.Y, l_ProportionsSlender_0.minSize.Y, l_ProportionsNormal_0.minSize.Y);
    return math.max(math.max(l_Classic_0.maxSize.X, l_ProportionsSlender_0.maxSize.X, l_ProportionsNormal_0.maxSize.X), (math.max(l_Classic_0.maxSize.Z, l_ProportionsSlender_0.maxSize.Z, l_ProportionsNormal_0.maxSize.Z))) / v71;
end;
return function(v73, v74, v75) --[[ Line: 187 ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v46 (copy), v24 (copy), v23 (copy), v66 (copy), v26 (copy), v59 (copy), v72 (copy), v2 (copy), l_UGCValidationService_0 (copy), v28 (copy), v29 (ref), v27 (ref)
    if not v73 then
        return true;
    elseif not v1() then
        return true;
    else
        local v76 = v75 and true or false;
        if not v76 and not v3() then
            return true;
        elseif not v4() and v46(v73, v74) then
            return false, {
                "Transparency validation failed as some parts are rotated. You must reset all rotation values to zero."
            };
        else
            local v77 = v73:Clone();
            local l_MeshPart_0 = Instance.new("MeshPart");
            if not v24(l_MeshPart_0, v77, v74) then
                return false, {
                    "Error getting part sizes "
                };
            else
                local v79 = v23.new(v76, 70, Vector2.new(100, 100));
                v79:init(v77);
                local v80 = v66(v77, v74);
                for _, v82 in v26 do
                    local v83 = if math.abs(v82.Z) > math.abs(v82.X) then l_MeshPart_0.Size.X else l_MeshPart_0.Size.Z;
                    v59(v77, v74, v80, v82, l_MeshPart_0.Position);
                    local v84 = v83 / l_MeshPart_0.Size.Y;
                    if 10 * v72(v74) < v84 then
                        v79:cleanup();
                        return false, {
                            "Transparency validation failed as image would be too large to test"
                        };
                    else
                        local v85 = v84 * 100;
                        if v85 < 1 then
                            v79:cleanup();
                            return false, {
                                "Transparency validation failed as image would be too small to test"
                            };
                        else
                            v79:setImgSize(Vector2.new(v85, 100));
                            local v86 = l_MeshPart_0.Size.Y / 2 / 0.7002075382097097;
                            v79:setCameraTransform(CFrame.lookAt(l_MeshPart_0.CFrame.Position + v82 * v86, l_MeshPart_0.CFrame.Position));
                            local v87, v88 = v79:takeSnapshot();
                            if not v87 then
                                v79:cleanup();
                                local v89 = string.format("Unable to capture snapshot of %s", v74.Name);
                                if v76 then
                                    error(v89);
                                else
                                    return false, {
                                        v89
                                    };
                                end;
                            end;
                            local v90 = nil;
                            local v91 = nil;
                            local v92 = nil;
                            if v2() then
                                if v76 then
                                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 267 ]]
                                        -- upvalues: l_UGCValidationService_0 (ref), v88 (copy)
                                        return l_UGCValidationService_0:getImageTransparencyWithByteString(v88);
                                    end);
                                    v90 = l_status_0;
                                    v92 = l_result_0;
                                else
                                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 271 ]]
                                        -- upvalues: l_UGCValidationService_0 (ref), v88 (copy)
                                        return l_UGCValidationService_0:getImageTransparencyWithTextureID(v88);
                                    end);
                                    v90 = l_status_1;
                                    v92 = l_result_1;
                                end;
                                if v90 then
                                    v91 = v28[v74][v82] < v92;
                                end;
                            elseif v76 then
                                local l_status_2, l_result_2 = pcall(function() --[[ Line: 282 ]]
                                    -- upvalues: l_UGCValidationService_0 (ref), v88 (copy), v28 (ref), v74 (copy), v82 (copy)
                                    return l_UGCValidationService_0:ValidateImageTransparencyThresholdByteString_V2(v88, v28[v74][v82]);
                                end);
                                v90 = l_status_2;
                                v91 = l_result_2;
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 289 ]]
                                    -- upvalues: l_UGCValidationService_0 (ref), v88 (copy), v28 (ref), v74 (copy), v82 (copy)
                                    return l_UGCValidationService_0:ValidateImageTransparencyThresholdTextureID_V2(v88, v28[v74][v82]);
                                end);
                                v90 = l_status_3;
                                v91 = l_result_3;
                            end;
                            if not v90 then
                                v79:cleanup();
                                local v101 = string.format("Failed to read data from snapshot of (%s)", v74.Name);
                                if v76 then
                                    error(v101);
                                else
                                    return false, {
                                        v101
                                    };
                                end;
                            end;
                            if not v91 then
                                v79:cleanup();
                                if v2() then
                                    return false, {
                                        string.format(v29, v74.Name, v27[v82], math.floor(v92 * 100), (math.floor(v28[v74][v82] * 100)))
                                    };
                                else
                                    return false, {
                                        string.format("%s is too transparent. Please fill in more of the mesh.", v74.Name)
                                    };
                                end;
                            end;
                        end;
                    end;
                end;
                v79:cleanup();
                return true;
            end;
        end;
    end;
end;