local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.tryYield);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.util.AssetCalculator);
local v6 = require(l_Parent_0.util.BoundsCalculator);
local v7 = require(l_Parent_0.util.RasterUtil);
local v8 = require(l_Parent_0.ConstantsTransparencyValidation);
local v9 = require(l_Parent_0.flags.getEngineFeatureEditableImageDrawTriangleEnabled);
local v10 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v11 = require(l_Parent_0.flags.getFFlagRefactorValidateAssetTransparency);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateStraightenLimbsTransparency);
local function _() --[[ Line: 20 ]] --[[ Name: checkFlags ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy)
    return v9() and v10() and v11();
end;
local function v14() --[[ Line: 26 ]] --[[ Name: getViews ]]
    -- upvalues: v8 (copy)
    return {
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, -1, 0), 
            viewId = v8.CAMERA_ANGLES.Front
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(0, 0, 1, 0), 
            viewId = v8.CAMERA_ANGLES.Back
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(-1, 0, 0, 0), 
            viewId = v8.CAMERA_ANGLES.Left
        }, 
        {
            axis1 = Vector3.new(0, 0, 1, 0), 
            axis2 = Vector3.new(0, 1, 0, 0), 
            normal = Vector3.new(1, 0, 0, 0), 
            viewId = v8.CAMERA_ANGLES.Right
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, -1, 0, 0), 
            viewId = v8.CAMERA_ANGLES.Top
        }, 
        {
            axis1 = Vector3.new(1, 0, 0, 0), 
            axis2 = Vector3.new(0, 0, 1, 0), 
            normal = Vector3.new(0, 1, 0, 0), 
            viewId = v8.CAMERA_ANGLES.Bottom
        }
    };
end;
local function _(v15, v16) --[[ Line: 67 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v8 (copy)
    if v16 == v8.CAMERA_ANGLES.Front or v16 == v8.CAMERA_ANGLES.Back then
        return v15.X / v15.Y;
    elseif v16 == v8.CAMERA_ANGLES.Left or v16 == v8.CAMERA_ANGLES.Right then
        return v15.Z / v15.Y;
    else
        return v15.X / v15.Z;
    end;
end;
local function v25(v18, v19) --[[ Line: 84 ]] --[[ Name: getScaleFactor ]]
    -- upvalues: v8 (copy)
    local v20 = if not (v19 ~= v8.CAMERA_ANGLES.Front) or v19 == v8.CAMERA_ANGLES.Back then v18.X / v18.Y else if not (v19 ~= v8.CAMERA_ANGLES.Left) or v19 == v8.CAMERA_ANGLES.Right then v18.Z / v18.Y else v18.X / v18.Z;
    local v21 = nil;
    local v22 = nil;
    if v20 > 1 then
        v22 = v8.ASSET_TRANSPARENCY_RASTER_SIZE / v20;
        v21 = v8.ASSET_TRANSPARENCY_RASTER_SIZE;
    elseif v20 < 1 then
        v21 = v8.ASSET_TRANSPARENCY_RASTER_SIZE * v20;
        v22 = v8.ASSET_TRANSPARENCY_RASTER_SIZE;
    else
        v21 = v8.ASSET_TRANSPARENCY_RASTER_SIZE;
        v22 = v8.ASSET_TRANSPARENCY_RASTER_SIZE;
    end;
    local v23 = Vector2.new(v21 / v8.ASSET_TRANSPARENCY_RASTER_SIZE, v22 / v8.ASSET_TRANSPARENCY_RASTER_SIZE);
    local v24 = math.max(v23.X, v23.Y);
    if v24 > 1 then
        return v23 / v24;
    else
        return v23;
    end;
end;
local function v39(v26, v27, v28, v29, v30) --[[ Line: 111 ]] --[[ Name: addTransformedTriangle ]]
    -- upvalues: v12 (copy)
    local v31 = {
        orderedVerts = {}
    };
    local l_v26_FaceVertices_0 = v26:GetFaceVertices(v28);
    local l_v26_Position_0 = v26:GetPosition(l_v26_FaceVertices_0[1]);
    local l_v26_Position_1 = v26:GetPosition(l_v26_FaceVertices_0[2]);
    local l_v26_Position_2 = v26:GetPosition(l_v26_FaceVertices_0[3]);
    v31.normal = (l_v26_Position_1 - l_v26_Position_0):Cross(l_v26_Position_2 - l_v26_Position_0).Unit;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    if v12() then
        v36 = v30 * l_v26_Position_0;
        v37 = v30 * l_v26_Position_1;
        v38 = v30 * l_v26_Position_2;
    else
        v36 = v29:inverse() * (v30 * l_v26_Position_0);
        v37 = v29:inverse() * (v30 * l_v26_Position_1);
        v38 = v29:inverse() * (v30 * l_v26_Position_2);
    end;
    table.insert(v31.orderedVerts, v36);
    table.insert(v31.orderedVerts, v37);
    table.insert(v31.orderedVerts, v38);
    table.insert(v27, v31);
    return v31;
end;
local function v51(v40, v41) --[[ Line: 148 ]] --[[ Name: updateMinMaxBounds ]]
    local l_X_0 = v40.min.X;
    local l_X_1 = v40.max.X;
    local l_Y_0 = v40.min.Y;
    local l_Y_1 = v40.max.Y;
    local l_Z_0 = v40.min.Z;
    local l_Z_1 = v40.max.Z;
    local v48 = v41.orderedVerts[1];
    local v49 = v41.orderedVerts[2];
    local v50 = v41.orderedVerts[3];
    l_X_0 = math.min(v48.X, v49.X, v50.X, l_X_0);
    l_X_1 = math.max(v48.X, v49.X, v50.X, l_X_1);
    l_Y_0 = math.min(v48.Y, v49.Y, v50.Y, l_Y_0);
    l_Y_1 = math.max(v48.Y, v49.Y, v50.Y, l_Y_1);
    l_Z_0 = math.min(v48.Z, v49.Z, v50.Z, l_Z_0);
    l_Z_1 = math.max(v48.Z, v49.Z, v50.Z, l_Z_1);
    v40.min = Vector3.new(l_X_0, l_Y_0, l_Z_0);
    v40.max = Vector3.new(l_X_1, l_Y_1, l_Z_1);
end;
local function v61(v52, v53, v54, v55, v56, v57) --[[ Line: 171 ]] --[[ Name: getCombinedMeshData ]]
    -- upvalues: v39 (copy), v51 (copy), v2 (copy)
    for _, v59 in (v52:GetFaces()) do
        local v60 = v39(v52, v53, v59, v54, v55);
        v51(v56, v60);
        v2(v57);
    end;
end;
local function v70(v62) --[[ Line: 187 ]] --[[ Name: getOpacity ]]
    local v63 = v62:ReadPixelsBuffer(Vector2.new(0, 0), v62.Size);
    local v64 = 0;
    local v65 = 0;
    for v66 = 0, buffer.len(v63) - 1, 4 do
        local v67 = buffer.readu8(v63, v66);
        local v68 = buffer.readu8(v63, v66 + 1);
        local v69 = buffer.readu8(v63, v66 + 2);
        if v67 == 0 and v68 == 0 and v69 == 0 then
            v65 = v65 + 1;
        end;
        v64 = v64 + 1;
    end;
    if v64 == 0 then
        return false;
    else
        return true, 1 - v65 / v64;
    end;
end;
return function(v71, v72) --[[ Line: 210 ]] --[[ Name: validateAssetTransparency ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy), v6 (copy), v5 (copy), v3 (copy), v61 (copy), v4 (copy), v14 (copy), v8 (copy), v25 (copy), v7 (copy), v70 (copy)
    if not (v9() and v10() and v11()) then
        return true;
    else
        local l_assetTypeEnum_0 = v72.assetTypeEnum;
        local v74 = {};
        if v71:IsA("MeshPart") and v72.assetTypeEnum == Enum.AssetType.DynamicHead then
            table.insert(v74, v71);
        else
            assert(v71:IsA("Folder") and v72.assetTypeEnum ~= Enum.AssetType.DynamicHead, string.format("BodyPart %s is not in the correct format.", v71:GetFullName()));
            for _, v76 in v71:GetChildren() do
                assert(v76:IsA("MeshPart"), string.format("BodyPart %s contained child that is not a MeshPart.", v71:GetFullName()));
                table.insert(v74, v76);
            end;
        end;
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local v80 = nil;
        if v12() then
            local v81, v82, v83 = v6.calculateIndividualAssetPartsData(v71, v72);
            v79 = v81;
            v80 = v82;
            v78 = v83;
            if not v79 then
                return false, v80;
            end;
        else
            v77 = v5.calculateAssetCFrame(l_assetTypeEnum_0, v71);
            v78 = v5.calculateAllTransformsForAsset(l_assetTypeEnum_0, v71);
        end;
        local v84 = {};
        local v85 = {
            min = Vector3.new(1e999, 1e999, 1e999, 0), 
            max = Vector3.new(-1e999, -1e999, -1e999, 0)
        };
        for _, v87 in v74 do
            local v88, v89 = v3(v87, "MeshId", v72);
            if not v88 then
                return false, {
                    string.format("Failed to load mesh for MeshPart '%s'. Make sure mesh exists and try again.", v87.Name)
                };
            else
                v89:Triangulate();
                v61(v89, v84, v77, if v12() then v78[v87.Name].cframe else v78[v87.Name], v85, v72);
            end;
        end;
        if (v85.max - v85.min).Magnitude == 0 then
            return false, {
                string.format("Meshes %s should not have zero size", l_assetTypeEnum_0.Name)
            };
        else
            local v90 = v4.new();
            for _, v92 in (v14()) do
                if #v84 == 0 then
                    v90:updateReasons(false, {
                        string.format("Mesh for %s has no triangles.", l_assetTypeEnum_0.Name)
                    });
                else
                    local v93 = v85.max - v85.min;
                    local v94 = v85.min + v93 / 2;
                    local v95 = Vector2.new(v8.ASSET_TRANSPARENCY_RASTER_SIZE, v8.ASSET_TRANSPARENCY_RASTER_SIZE) * v25(v93, v92.viewId);
                    local v96 = v7.rasterMesh(v84, v95, v92, v94, v93, v72);
                    local v97 = v8.ASSET_TRANSPARENCY_THRESHOLDS[l_assetTypeEnum_0][v92.viewId];
                    local v98, v99 = v70(v96);
                    if not v98 then
                        v90:updateReasons(false, {
                            string.format("Mesh for %s is completely invisible.", l_assetTypeEnum_0.Name)
                        });
                        v96:Destroy();
                    else
                        if v99 < v97 then
                            v90:updateReasons(false, {
                                string.format("%s is not opague enough. Opacity is %f but needs to be above %f.", l_assetTypeEnum_0.Name, v99, v97)
                            });
                        end;
                        v96:Destroy();
                    end;
                end;
            end;
            return v90:getFinalResults();
        end;
    end;
end;