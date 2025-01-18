local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.BoundsCalculator);
local v4 = require(l_Parent_0.util.BoundsDataUtils);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.getMeshInfo);
local v7 = require(l_Parent_0.util.getMeshVerts);
local v8 = require(l_Parent_0.util.calculateMinMax);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidateCalculateScaleToValidateBounds);
local v10 = require(l_Parent_0.flags.getFFlagUGCValidateUseMeshSizeProperty);
local v11 = {};
local v12 = {
    MeshPart = {
        "MeshId"
    }
};
local v13 = {
    MeshPart = {
        MeshId = true
    }
};
local function v16(v14, v15) --[[ Line: 41 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v5 (copy), v12 (copy), v13 (copy)
    if not v5.parseWithErrorCheck({}, {}, v14, v12, v13, v15) then
        return false, {
            v14.Name .. " does not have a MeshId"
        };
    else
        return true;
    end;
end;
local function v32(v17, v18) --[[ Line: 59 ]] --[[ Name: validateAllMeshParts ]]
    -- upvalues: v1 (copy), v16 (copy)
    for _, v20 in v1.ASSET_TYPE_INFO do
        if v20.isBodyPart then
            for v21, v22 in pairs(v20.subParts) do
                local v23 = v17[v21];
                if not v23 or v23.ClassName ~= "MeshPart" then
                    return false, {
                        v21 .. " missing"
                    };
                elseif v23.Name ~= v21 then
                    return false, {
                        v21 .. " input data is incorrectly set-up"
                    };
                else
                    local v24, v25 = v16(v23, v18);
                    if not v24 then
                        return false, v25;
                    else
                        local v26 = {
                            [v22.rigAttachmentToParent.name] = 0
                        };
                        local v27 = 1;
                        for v28 in v22.otherAttachments do
                            if string.find(v28, "RigAttachment$") ~= nil then
                                v26[v28] = 0;
                                v27 = v27 + 1;
                            end;
                        end;
                        local v29 = 0;
                        for _, v31 in v23:GetChildren() do
                            if v31.ClassName == "Attachment" and v26[v31.Name] then
                                if v26[v31.Name] == 1 then
                                    return false, {
                                        v21 .. " has duplicate rig attachments: " .. v31.Name
                                    };
                                else
                                    v26[v31.Name] = v26[v31.Name] + 1;
                                    v29 = v29 + 1;
                                end;
                            end;
                        end;
                        if v29 ~= v27 then
                            return false, {
                                "Missing rig attachments"
                            };
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
local function _(v33, v34) --[[ Line: 114 ]] --[[ Name: isWindowValid ]]
    return v33 <= v34;
end;
local v36 = {
    "X", 
    "Y", 
    "Z"
};
local function v48(v37, v38) --[[ Line: 123 ]] --[[ Name: calculateScalingWindow ]]
    -- upvalues: v4 (copy), v36 (copy)
    local v39 = {};
    local v40, _, v42 = v4.calculateBoundsDimensions(v37);
    v39.meshSize = v40;
    v39.overallSize = v42;
    v39.scaleTypes = {};
    for v43, v44 in v38 do
        local v45 = {
            max = 1e999, 
            min = -1e999
        };
        for _, v47 in v36 do
            v45[v47] = {
                min = 5.0E-5 + v44.minSize[v47] / v40[v47], 
                max = v44.maxSize[v47] / v42[v47] - 5.0E-5
            };
            v45[v47].ok = v45[v47].min <= v45[v47].max;
            v45.max = math.min(v45.max, v45[v47].max);
            v45.min = math.max(v45.min, v45[v47].min);
        end;
        v45.ok = v45.min <= v45.max;
        v39.scaleTypes[v43] = v45;
    end;
    return v39;
end;
local function v55(v49) --[[ Line: 151 ]] --[[ Name: combineScalingWindows ]]
    local v50 = {};
    for _, v52 in v49 do
        for v53, v54 in v52.scaleTypes do
            v50[v53] = v50[v53] or {
                max = 1e999, 
                min = -1e999
            };
            v50[v53].max = math.min(v50[v53].max, v54.max);
            v50[v53].min = math.max(v50[v53].min, v54.min);
        end;
    end;
    return v50;
end;
local function v63(v56) --[[ Line: 167 ]] --[[ Name: createFinalResults ]]
    -- upvalues: v36 (copy)
    local v57 = {
        meshSize = v56.meshSize, 
        overallSize = v56.overallSize
    };
    for v58, v59 in v56.scaleTypes do
        local v60 = {};
        for _, v62 in v36 do
            v60[v62] = v59[v62];
        end;
        v60.ok = v59.ok;
        v60.min = v59.min;
        v60.max = v59.max;
        v57[v58] = v60;
    end;
    return v57;
end;
v11.preprocessDataAsync = function(v64, v65) --[[ Line: 187 ]] --[[ Name: preprocessDataAsync ]]
    -- upvalues: v32 (copy), v1 (copy), v6 (copy), v7 (copy), v10 (copy), v8 (copy)
    local v66, v67 = v32(v64, v65);
    if not v66 then
        return {
            ok = false, 
            errors = v67
        };
    else
        local v68 = {};
        for _, v70 in v1.ASSET_TYPE_INFO do
            if v70.isBodyPart then
                for v71 in v70.subParts do
                    assert(v64[v71].ClassName == "MeshPart");
                    local v72 = v64[v71];
                    local v73, v74, v75 = v6(v72, v65);
                    if not v73 then
                        return {
                            ok = false, 
                            errors = v74
                        };
                    else
                        v68[v72.MeshId] = {};
                        local v76 = v68[v72.MeshId];
                        local v77 = nil;
                        local v78, v79, v80 = v7(v75, v65);
                        v73 = v78;
                        v74 = v79;
                        v77 = v80;
                        if not v73 then
                            return {
                                ok = false, 
                                errors = v74
                            };
                        else
                            v76.verts = v77;
                            if not v10() then
                                v78 = v76.verts;
                                if not v78 or #v78 == 0 then
                                    return {
                                        ok = false, 
                                        errors = {
                                            "Mesh: " .. v75.fullName .. " contains no verts"
                                        }
                                    };
                                else
                                    for _, v82 in v78 do
                                        local v83, v84 = v8(v76.meshMin, v76.meshMax, v82, v82);
                                        v76.meshMin = v83;
                                        v76.meshMax = v84;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return {
            ok = true, 
            cache = {
                meshData = v68
            }
        };
    end;
end;
v11.isPreprocessDataCached = function(v85, v86) --[[ Line: 251 ]] --[[ Name: isPreprocessDataCached ]]
    -- upvalues: v1 (copy), v10 (copy)
    local l_meshData_0 = v86.meshData;
    for _, v89 in v1.ASSET_TYPE_INFO do
        if v89.isBodyPart then
            for v90 in pairs(v89.subParts) do
                local v91 = v85[v90];
                if v91 and v91.ClassName == "MeshPart" and v91.MeshId ~= "" then
                    if not l_meshData_0 then
                        return false;
                    else
                        local v92 = l_meshData_0[v91.MeshId];
                        if not v92 then
                            return false;
                        elseif not v92.verts then
                            return false;
                        elseif not v10() and (not v92.meshMin or not v92.meshMax) then
                            return false;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
v11.calculateScaleToValidateBoundsAsync = function(v93, v94, v95) --[[ Line: 293 ]] --[[ Name: calculateScaleToValidateBoundsAsync ]]
    -- upvalues: v9 (copy), v32 (copy), v3 (copy), v4 (copy), v48 (copy), v1 (copy), v55 (copy), v63 (copy)
    if not v9() then
        return {
            ok = false, 
            errors = {
                "Feature flag not enabled"
            }
        };
    else
        local v96, v97 = v32(v93, v94);
        if not v96 then
            return {
                ok = false, 
                errors = v97
            };
        else
            local v98, v99, v100 = v3.calculateIndividualFullBodyPartsData(v93, v94, v95);
            if not v98 then
                return {
                    ok = false, 
                    errors = v99 or {
                        "Errors calculating parts metrics"
                    }
                };
            else
                local v101 = {};
                for _, v103 in v100 do
                    v101 = v4.combineBounds(v101, v103.boundsData);
                end;
                local v104 = {
                    FullBody = v48(v101, v1.FULL_BODY_BOUNDS)
                };
                for v105, v106 in v1.ASSET_TYPE_INFO do
                    if v106.isBodyPart then
                        local v107 = {};
                        for v108 in v106.subParts do
                            v107 = v4.combineBounds(v107, v100[v108].boundsData);
                        end;
                        v104[v105.Name] = v48(v107, v1.ASSET_TYPE_INFO[v105].bounds);
                    end;
                end;
                local v109 = nil;
                local v110 = nil;
                for v111, v112 in v55(v104) do
                    if v112.min <= v112.max then
                        if v112.min <= 1 and v112.max >= 1 then
                            v109 = 1;
                            v110 = v111;
                            break;
                        else
                            local v113 = if math.abs(1 - v112.min) < math.abs(1 - v112.max) then v112.min else v112.max;
                            if not v109 or math.abs(1 - v113) < math.abs(1 - v109) then
                                v109 = v113;
                                v110 = v111;
                            end;
                        end;
                    end;
                end;
                local v114 = {
                    ok = true, 
                    Overall = {
                        ok = v109 ~= nil, 
                        scale = v109, 
                        scaleType = v110
                    }
                };
                for v115, v116 in v104 do
                    v114[v115] = v63(v116);
                end;
                return v114;
            end;
        end;
    end;
end;
return v11;