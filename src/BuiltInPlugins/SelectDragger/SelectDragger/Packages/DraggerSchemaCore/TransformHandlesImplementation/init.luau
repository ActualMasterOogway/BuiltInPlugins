local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.DraggerFramework;
local l_Utility_0 = l_DraggerFramework_0.Utility;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Utility_0.TemporaryTransparency);
local v5 = require(l_Utility_0.getBoundingBoxScale);
local v6 = require(l_Utility_0.PartMover);
local v7 = require(l_Utility_0.AttachmentMover);
local v8 = require(l_Utility_0.getGeometry);
local v9 = require(l_Utility_0.getSoftSnaps);
local v10 = require(l_Utility_0.Math);
local v11 = require(l_DraggerFramework_0.Components.WireframeHandleAdornment);
local v12 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v13 = require(l_DraggerFramework_0.Flags.getFFlagDraggerLockedSummon);
local v14 = require(l_DraggerFramework_0.Flags.getFFlagDraggerTerrainSummonFix);
local v15 = {};
v15.__index = v15;
v15.new = function(v16, v17) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v7 (copy), v15 (copy)
    return (setmetatable({
        _draggerContext = v16, 
        _ikTransformFunction = v17, 
        _partMover = v6.new(), 
        _attachmentMover = v7.new()
    }, v15));
end;
v15.beginDrag = function(v18, v19, v20) --[[ Line: 53 ]] --[[ Name: beginDrag ]]
    -- upvalues: v4 (copy)
    local v21, v22, v23 = v20:getObjectsToTransform();
    v18._initialSelectionInfo = v20;
    v18._lastGoodGeometricTransform = CFrame.new();
    v18._lastAppliedTransform = CFrame.new();
    v18._hasPartsToMove = #v21 > 0;
    local _ = nil;
    local _ = nil;
    local v26, v27, v28 = v20:getBoundingBox();
    v18._boundingBoxSize = v28;
    v18._centerPoint = v26 * CFrame.new(v27);
    v26 = not v18:_shouldSolveConstraints();
    v18._partMover:setDragged(v21, v20:getOriginalCFrameMap(), v26, v18._centerPoint.Position, v19, v23, v20:getRootMapping());
    v18._attachmentMover:setDragged(v22);
    if not v18._draggerContext:areCollisionsEnabled() then
        v18._temporaryTransparency = v4.new(v21);
    end;
end;
v15.getSoftSnaps = function(v29, v30, v31) --[[ Line: 85 ]] --[[ Name: getSoftSnaps ]]
    -- upvalues: v13 (copy), v10 (copy), v9 (copy)
    if v29._draggerContext:areCollisionsEnabled() then
        return {};
    else
        local v32, _, v34 = v29._initialSelectionInfo:getBoundingBox();
        local v35 = nil;
        local v36 = nil;
        if v31 then
            v35 = v32 * v31;
            v36 = Vector3.one * (v13() and 0.05 or 0.01);
        else
            v35 = v32;
            local v37 = v32:VectorToObjectSpace(v30);
            v36 = (v34 + Vector3.one * 0.2) * v10.complimentDirection(v37);
        end;
        local v38 = v29._draggerContext:getMaxSoftSnaps();
        local v39 = {
            -1, 
            1
        };
        return v9(v35, v36, v30, v29._initialSelectionInfo:getObjectsToTransform(), v39, v39, v38);
    end;
end;
v15.updateDrag = function(v40, v41) --[[ Line: 128 ]] --[[ Name: updateDrag ]]
    if v40:_shouldSolveConstraints() then
        return v40:_transformInverseKinematics(v41);
    else
        return v40:_transformGeometric(v41);
    end;
end;
v15.endDrag = function(v42) --[[ Line: 139 ]] --[[ Name: endDrag ]]
    -- upvalues: v12 (copy)
    if v12() then
        v42._pivotSnapTarget = nil;
        v42._pivotSnapTo = nil;
        v42._pivotSnapFrom = nil;
    end;
    if v42._draggerContext:shouldJoinSurfaces() and v42._jointPairs then
        v42._jointPairs:createJoints();
    end;
    v42._jointPairs = nil;
    v42._partMover:commit();
    v42._attachmentMover:commit();
    if v42._temporaryTransparency then
        v42._temporaryTransparency:destroy();
        v42._temporaryTransparency = nil;
    end;
    return v42._initialSelectionInfo:getTransformedCopy(v42._lastAppliedTransform);
end;
v15.render = function(v43, v44) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v5 (copy), v3 (copy), v11 (copy)
    if v12() then
        local v45 = {};
        local v46 = v44 * v43._centerPoint;
        if v43._draggerContext:shouldJoinSurfaces() and v43._jointPairs then
            local v47 = v5(v43._draggerContext, v46, v43._boundingBoxSize);
            v45.JoinedSurfaces = v43._jointPairs:renderJoints(v47);
        end;
        if v43._pivotSnapTarget then
            v45.SnapToLine = v3.createElement(v11, {
                Color3 = v43._draggerContext:getChosenColor(), 
                AlwaysOnTop = true, 
                Render = function(v48) --[[ Line: 180 ]] --[[ Name: Render ]]
                    -- upvalues: v43 (copy)
                    v48:AddLine(v43._pivotSnapFrom.Position, v43._pivotSnapTo.Position);
                end
            });
            v45.SnapBecauseLine = v3.createElement(v11, {
                Color3 = v43._draggerContext:getChosenColor(), 
                AlwaysOnTop = true, 
                Render = function(v49) --[[ Line: 187 ]] --[[ Name: Render ]]
                    -- upvalues: v43 (copy)
                    v49:AddLine(v43._pivotSnapTo.Position, v43._pivotSnapTarget.Position);
                end
            });
        end;
        return v3.createFragment(v45);
    else
        local v50 = v44 * v43._centerPoint;
        if v43._draggerContext:shouldJoinSurfaces() and v43._jointPairs then
            local v51 = v5(v43._draggerContext, v50, v43._boundingBoxSize);
            return v43._jointPairs:renderJoints(v51);
        else
            return nil;
        end;
    end;
end;
v15._transformGeometric = function(v52, v53) --[[ Line: 209 ]] --[[ Name: _transformGeometric ]]
    if v53 == v52._lastGoodGeometricTransform then
        return v53;
    else
        local v54 = v52:_safelyTransformParts(v52._lastGoodGeometricTransform, v53);
        if v52._draggerContext:shouldJoinSurfaces() then
            v52._jointPairs = v52._partMover:computeJointPairs(v54);
        end;
        v52._attachmentMover:transformTo(v54);
        v52._lastGoodGeometricTransform = v54;
        v52._lastAppliedTransform = v54;
        return v54;
    end;
end;
v15._transformInverseKinematics = function(v55, v56) --[[ Line: 231 ]] --[[ Name: _transformInverseKinematics ]]
    local v57 = v55._draggerContext:areCollisionsEnabled() and Enum.IKCollisionsMode.IncludeContactedMechanisms or Enum.IKCollisionsMode.NoCollisions;
    local v58 = v55._ikTransformFunction(v55._partMover, v56, v57);
    if v55._draggerContext:shouldJoinSurfaces() then
        v55._jointPairs = v55._partMover:computeJointPairs(v58);
    end;
    v55._attachmentMover:transformTo(v58);
    v55._lastAppliedTransform = v58;
    return v58;
end;
local function _(v59, v60, v61) --[[ Line: 249 ]] --[[ Name: cframesAreWithinThreshold ]]
    local l_Magnitude_0 = (v59.Position - v60.Position).Magnitude;
    local v63 = math.max((v59.XVector - v60.XVector).Magnitude, (v59.YVector - v60.YVector).Magnitude, (v59.ZVector - v60.ZVector).Magnitude);
    local v64 = false;
    if l_Magnitude_0 < v61 then
        v64 = v63 < v61;
    end;
    return v64, l_Magnitude_0, v63;
end;
v15._toLocalTransform = function(v66, v67) --[[ Line: 259 ]] --[[ Name: _toLocalTransform ]]
    return v66._centerPoint:Inverse() * v67 * v66._centerPoint;
end;
v15._toGlobalTransform = function(v68, v69) --[[ Line: 262 ]] --[[ Name: _toGlobalTransform ]]
    return v68._centerPoint * v69 * v68._centerPoint:Inverse();
end;
v15._safelyTransformParts = function(v70, v71, v72) --[[ Line: 273 ]] --[[ Name: _safelyTransformParts ]]
    v70._partMover:transformTo(v72);
    if not v70._draggerContext:areCollisionsEnabled() or not v70._partMover:isIntersectingOthers() then
        return v72;
    else
        local v73 = v70:_toLocalTransform(v71);
        local v74 = v70:_toLocalTransform(v72);
        local v75 = true;
        local v76 = 0;
        while true do
            local l_v73_0 = v73;
            local l_v74_0 = v74;
            local l_Magnitude_1 = (l_v73_0.Position - l_v74_0.Position).Magnitude;
            local v80 = math.max((l_v73_0.XVector - l_v74_0.XVector).Magnitude, (l_v73_0.YVector - l_v74_0.YVector).Magnitude, (l_v73_0.ZVector - l_v74_0.ZVector).Magnitude);
            local v81 = false;
            if l_Magnitude_1 < 5.0E-4 then
                v81 = v80 < 5.0E-4;
            end;
            if not v81 then
                v81 = v73:Lerp(v74, 0.5);
                v70._partMover:transformTo(v70:_toGlobalTransform(v81));
                v75 = v70._partMover:isIntersectingOthers();
                if v75 then
                    v74 = v81;
                else
                    v73 = v81;
                end;
                v76 = v76 + 1;
                if v76 > 32 then
                    v73 = v70:_toLocalTransform(v71);
                    break;
                end;
            else
                break;
            end;
        end;
        local l_v73_1 = v73;
        local v83 = CFrame.new();
        local l_Magnitude_2 = (l_v73_1.Position - v83.Position).Magnitude;
        local v85 = math.max((l_v73_1.XVector - v83.XVector).Magnitude, (l_v73_1.YVector - v83.YVector).Magnitude, (l_v73_1.ZVector - v83.ZVector).Magnitude);
        local v86 = false;
        if l_Magnitude_2 < 0.001 then
            v86 = v85 < 0.001;
        end;
        if v86 then
            v73 = CFrame.new();
            v75 = true;
        end;
        v86 = v70:_toGlobalTransform(v73);
        v83 = v86;
        l_Magnitude_2 = (v83.Position - v71.Position).Magnitude;
        v85 = math.max((v83.XVector - v71.XVector).Magnitude, (v83.YVector - v71.YVector).Magnitude, (v83.ZVector - v71.ZVector).Magnitude);
        l_v73_1 = false;
        if l_Magnitude_2 < 0.001 then
            l_v73_1 = v85 < 0.001;
        end;
        if l_v73_1 then
            v86 = v71;
            v75 = true;
        end;
        if v75 then
            v70._partMover:transformTo(v86);
        end;
        return v86;
    end;
end;
v15._shouldSolveConstraints = function(v87) --[[ Line: 345 ]] --[[ Name: _shouldSolveConstraints ]]
    return v87._draggerContext:areConstraintsEnabled() and v87._hasPartsToMove;
end;
local function _(v88) --[[ Line: 349 ]] --[[ Name: toVector2 ]]
    return Vector2.new(v88.X, v88.Y);
end;
v15.findSummonSnap = function(v90, v91, v92) --[[ Line: 355 ]] --[[ Name: findSummonSnap ]]
    -- upvalues: v12 (copy), v14 (copy), v8 (copy)
    assert(not v12(), "Wrong flag branching");
    if v92:IsA("Terrain") then
        return nil;
    elseif v14() and not v92:IsA("BasePart") then
        return nil;
    else
        local v93 = v8(v92);
        if v93.shape ~= "Mesh" then
            return nil;
        else
            local v94 = nil;
            local v95 = 1e999;
            for _, v97 in ipairs(v93.faces) do
                local v98 = math.abs(((v91 - v97.vertices[1]).Unit:Dot(v97.normal)));
                if v98 < v95 then
                    v95 = v98;
                    v94 = v97;
                end;
            end;
            local v99 = v90._draggerContext:worldToViewportPoint(v91);
            local v100 = Vector2.new(v99.X, v99.Y);
            v99 = nil;
            local v101 = 16;
            for _, v103 in ipairs(v94.vertices) do
                local v104 = v90._draggerContext:worldToViewportPoint(v103);
                v104 = (Vector2.new(v104.X, v104.Y) - v100).Magnitude;
                if v104 < v101 then
                    v101 = v104;
                    v99 = v103;
                end;
            end;
            if v99 then
                return CFrame.fromMatrix(v99, v94.direction, v94.normal), true;
            else
                local v105 = nil;
                local v106 = nil;
                local v107 = 16;
                local v108 = #v94.vertices;
                for v109 = 1, v108 do
                    local v110 = v94.vertices[v109];
                    local v111 = v94.vertices[v109 % v108 + 1];
                    local v112 = v90._draggerContext:worldToViewportPoint(v110);
                    local v113 = Vector2.new(v112.X, v112.Y);
                    local v114 = v90._draggerContext:worldToViewportPoint(v111);
                    v114 = (Vector2.new(v114.X, v114.Y) - v113).Unit;
                    local v115 = v100 - v113;
                    local l_Magnitude_3 = (v115 - v114 * v115:Dot(v114)).Magnitude;
                    if l_Magnitude_3 < v107 then
                        v107 = l_Magnitude_3;
                        local l_Unit_0 = (v111 - v110).Unit;
                        v105 = v110 + l_Unit_0 * (v91 - v110):Dot(l_Unit_0);
                        v106 = l_Unit_0;
                    end;
                end;
                if v105 then
                    return CFrame.fromMatrix(v105, v106, v94.normal), true;
                else
                    local v118 = v90._draggerContext:getMouseLocation();
                    local v119 = v90._draggerContext:worldToViewportPoint(v92.Position);
                    if (v118 - Vector2.new(v119.X, v119.Y)).Magnitude < 20 then
                        return v92.CFrame, false;
                    else
                        return nil;
                    end;
                end;
            end;
        end;
    end;
end;
return v15;