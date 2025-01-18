local l_plugin_0 = plugin;
local _ = settings;
local l_RunService_0 = game:GetService("RunService");
local v3 = game:DefineFastFlag("DeactivateTransformToolCorrectly", false);
local v4 = game:DefineFastFlag("RemoveTransformToolDefaultShortcut", false);
local v5 = game:DefineFastFlag("TransformToolCorrectCamera", false);
local v6 = game:DefineFastFlag("TransformToolFixDeferredDrag", false);
local l_ImprovedCursors_0 = game:GetFastFlag("ImprovedCursors");
local v8 = game:DefineFastFlag("TransformToolCursor", false);
local v9 = require(script.Parent.Collision);
local v10 = require(script.Parent.Utility);
local v11 = require(script.Parent.List);
local v12 = require(script.Parent.Selection);
local v13 = require(script.Parent.Metapart);
local v14 = require(script.Parent.FuzzyMath);
local v15 = require(script.Parent.Round);
local v16 = require(script.Parent.Extent);
local v17 = require(script.Parent.Adornments);
local v18 = require(script.Parent.Input);
local v19 = require(script.Parent.Rubberband);
local v20 = require(script.Parent.Analytics);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Selection_0 = game:GetService("Selection");
local l_StudioService_0 = game:GetService("StudioService");
local v25 = nil;
local v26 = nil;
local v27 = 0;
local v28 = nil;
do
    local l_v25_0, l_v26_0, l_v27_0, l_v28_0 = v25, v26, v27, v28;
    analyticsSessionBegin = function() --[[ Line: 51 ]] --[[ Name: analyticsSessionBegin ]]
        -- upvalues: l_v27_0 (ref), l_v25_0 (ref), v20 (copy)
        l_v27_0 = tick();
        l_v25_0 = {
            freeformDrags = 0, 
            handleDrags = 0, 
            clickSelects = 0, 
            dragSelects = 0, 
            dragTilts = 0, 
            dragRotates = 0, 
            toolName = "Transform", 
            wasAutoSelected = false
        };
        v20:sendEvent("toolSelected", {
            toolName = "Transform", 
            wasAutoSelected = false
        });
        v20:reportCounter("studioLua" .. "Transform" .. "DraggerSelected");
    end;
    analyticsSendSession = function() --[[ Line: 70 ]] --[[ Name: analyticsSendSession ]]
        -- upvalues: l_v27_0 (ref), l_v25_0 (ref), v20 (copy)
        l_v25_0.duration = tick() - l_v27_0;
        v20:sendEvent("toolSession", l_v25_0);
    end;
    local l_l_UserInputService_0_0 = l_UserInputService_0 --[[ copy: 21 -> 112 ]];
    analyticsSendClick = function(v34, v35) --[[ Line: 76 ]] --[[ Name: analyticsSendClick ]]
        -- upvalues: v20 (copy), l_l_UserInputService_0_0 (copy), l_v25_0 (ref)
        v20:sendEvent("clickedObject", {
            altPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftAlt), 
            ctrlPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftControl), 
            shiftPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftShift), 
            clickedAttachment = v34 and v34:IsA("Attachment"), 
            clickedConstraint = v34 and (v34:IsA("Constraint") or v34:IsA("WeldConstraint")), 
            didAlterSelection = v35
        });
        if v35 then
            l_v25_0.clickSelects = l_v25_0.clickSelects + 1;
        end;
    end;
    local l_l_Selection_0_0 = l_Selection_0 --[[ copy: 23 -> 113 ]];
    analyticsRecordFreeformDragBegin = function() --[[ Line: 91 ]] --[[ Name: analyticsRecordFreeformDragBegin ]]
        -- upvalues: l_l_Selection_0_0 (copy), l_v25_0 (ref), l_v26_0 (ref), l_v28_0 (ref)
        local v37 = 0;
        for _, v39 in pairs(l_l_Selection_0_0:Get()) do
            if v39:IsA("BasePart") then
                v37 = v37 + 1;
            end;
            for _, v41 in pairs(v39:GetDescendants()) do
                if v41:IsA("BasePart") then
                    v37 = v37 + 1;
                end;
            end;
        end;
        l_v25_0.freeformDrags = l_v25_0.freeformDrags + 1;
        l_v26_0 = {
            dragTilts = 0, 
            dragRotates = 0, 
            partCount = v37, 
            attachmentCount = 0, 
            timeToStartDrag = 0
        };
        l_v28_0 = nil;
    end;
    local l_l_Workspace_0_0 = l_Workspace_0 --[[ copy: 22 -> 114 ]];
    analyticsRecordFreeformDragUpdate = function(v43) --[[ Line: 114 ]] --[[ Name: analyticsRecordFreeformDragUpdate ]]
        -- upvalues: l_v26_0 (ref), l_v28_0 (ref), l_l_Workspace_0_0 (copy)
        if l_v26_0 then
            l_v26_0.dragTargetType = "Polygon";
            if l_v28_0 then
                l_v26_0.dragDistance = (v43 - l_v28_0).Magnitude;
            else
                l_v26_0.dragDistance = 0;
                l_v28_0 = v43;
            end;
            l_v26_0.distanceToCamera = (l_l_Workspace_0_0.CurrentCamera.CFrame.Position - v43).Magnitude;
        end;
    end;
    local l_l_StudioService_0_0 = l_StudioService_0 --[[ copy: 24 -> 115 ]];
    analyticsSendFreeformDragged = function() --[[ Line: 127 ]] --[[ Name: analyticsSendFreeformDragged ]]
        -- upvalues: l_v26_0 (ref), l_l_StudioService_0_0 (copy), v20 (copy)
        if l_v26_0 then
            l_v26_0.gridSize = l_l_StudioService_0_0.GridSize;
            l_v26_0.toolName = "Transform";
            l_v26_0.wasAutoSelected = false;
            l_v26_0.joinSurfaces = false;
            l_v26_0.useConstraints = false;
            v20:sendEvent("freeformDragged", l_v26_0);
            l_v26_0 = nil;
        end;
    end;
    analyticsSendHandleDragged = function(v45) --[[ Line: 141 ]] --[[ Name: analyticsSendHandleDragged ]]
        -- upvalues: v20 (copy), l_l_StudioService_0_0 (copy)
        v20:sendEvent("handleDragged", {
            toolName = "Transform", 
            gridSize = l_l_StudioService_0_0.GridSize, 
            rotateIncrement = l_l_StudioService_0_0.RotateIncrement, 
            useLocalSpace = false, 
            joinSurfaces = false, 
            useConstraints = false, 
            haveCollisions = false, 
            wasAutoSelected = false
        });
        v20:sendEvent("transformHandleDragged", {
            gridSize = l_l_StudioService_0_0.GridSize, 
            rotateIncrement = l_l_StudioService_0_0.RotateIncrement, 
            handleName = v45
        });
    end;
    analyticsSendBoxSelect = function() --[[ Line: 159 ]] --[[ Name: analyticsSendBoxSelect ]]
        -- upvalues: v20 (copy), l_l_Selection_0_0 (copy), l_l_UserInputService_0_0 (copy)
        v20:sendEvent("boxSelected", {
            toolName = "Transform", 
            objectCount = #l_l_Selection_0_0:Get(), 
            altPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftAlt), 
            ctrlPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftControl), 
            shiftPressed = l_l_UserInputService_0_0:IsKeyDown(Enum.KeyCode.LeftShift), 
            wasAutoSelected = false
        });
    end;
    analyticsSendSetPlane = function() --[[ Line: 170 ]] --[[ Name: analyticsSendSetPlane ]]
        -- upvalues: v20 (copy)
        v20:sendEvent("setPlane", {
            toolName = "Transform"
        });
    end;
end;
l_UserInputService_0 = false;
l_Workspace_0 = false;
l_Selection_0 = l_plugin_0:GetMouse(true);
v18.setMouse(l_Selection_0);
l_StudioService_0 = false;
v25 = false;
v26 = true;
v27 = game:GetService("CoreGui");
v28 = game:GetService("UserInputService");
local v46 = nil;
local v47 = nil;
local v48 = false;
local v49 = nil;
local _ = {
    n = 0
};
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = Vector3.new(0, 0, 0, 0);
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = 0;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = CFrame.new();
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local v84 = nil;
local v85 = nil;
local v86 = nil;
local v87 = nil;
local v88 = false;
local v89 = false;
local v90 = false;
local v91 = nil;
local v92 = nil;
local function v93() --[[ Line: 289 ]] --[[ Name: getWorkplane ]]
    -- upvalues: v74 (ref), v64 (ref)
    return v74, v64;
end;
v17.setWorkplaneAccessor(v93);
local v94 = {
    [0] = "None", 
    [1] = "Translate", 
    [2] = "ScaleEdge", 
    [3] = "ScaleEdge", 
    [4] = "ScaleEdge", 
    [5] = "ScaleEdge", 
    [6] = "ScaleEdge", 
    [7] = "ScaleCorner", 
    [8] = "ScaleCorner", 
    [9] = "ScaleCorner", 
    [10] = "ScaleCorner", 
    [11] = "Rotate", 
    [12] = "Rotate", 
    [13] = "Rotate", 
    [14] = "Plane"
};
local _ = {};
local v96 = false;
local v97 = {};
local function v99(v98) --[[ Line: 334 ]] --[[ Name: BreakJoints ]]
    if v98:IsA("Wrapped") then
        workspace:UnjoinFromOutsiders({
            v98.Object
        });
        return;
    else
        if v98:IsA("BasePart") then
            workspace:UnjoinFromOutsiders({
                v98
            });
        end;
        return;
    end;
end;
local function _() --[[ Line: 342 ]] --[[ Name: JoinSelection ]]
    -- upvalues: v12 (copy), l_plugin_0 (copy)
    local v100 = v12.getFilteredSelection();
    workspace:JoinToOutsiders(v100, l_plugin_0:GetJoinMode());
end;
local function _() --[[ Line: 347 ]] --[[ Name: UnjoinSelection ]]
    -- upvalues: v12 (copy)
    local v102 = v12.getFilteredSelection();
    workspace:UnjoinFromOutsiders(v102);
end;
local v104 = {};
local function v105(v106) --[[ Line: 355 ]] --[[ Name: getAllRoots ]]
    -- upvalues: v104 (ref), v105 (copy)
    if v106:IsA("BasePart") and v106:GetRootPart() then
        v104[v106:GetRootPart()] = true;
    end;
    local l_v106_Children_0 = v106:GetChildren();
    for _, v109 in ipairs(l_v106_Children_0) do
        v105(v109);
    end;
end;
local function v113() --[[ Line: 366 ]] --[[ Name: getSelectionRoots ]]
    -- upvalues: v12 (copy), v104 (ref), v105 (copy)
    local v110 = v12.getFilteredSelection();
    v104 = {};
    for _, v112 in ipairs(v110) do
        v105(v112);
    end;
    return v104;
end;
local function v119(v114, v115) --[[ Line: 377 ]] --[[ Name: setModelCFrame ]]
    -- upvalues: v104 (ref), v105 (copy)
    v104 = {};
    v105(v114);
    local l_v114_ModelCFrame_0 = v114:GetModelCFrame();
    for v117, _ in pairs(v104) do
        v117.CFrame = v115:toWorldSpace(l_v114_ModelCFrame_0:toObjectSpace(v117.CFrame));
    end;
end;
local _ = function(v120, v121) --[[ Line: 388 ]] --[[ Name: moveSelection ]]
    -- upvalues: v113 (copy)
    local v122 = v113();
    for v123, _ in pairs(v122) do
        v123.CFrame = v121:toWorldSpace(v120:toObjectSpace(v123.CFrame));
    end;
end;
local function v127() --[[ Line: 396 ]] --[[ Name: updateRotatePart ]]
    -- upvalues: v12 (copy), v49 (ref), v17 (copy)
    if #v12.getFilteredSelection() > 0 then
        if not v49 then
            v49 = Instance.new("Part", game.CoreGui);
            v49.Name = "RotateAdornPart";
        end;
        local v126 = v12.getFilteredSelectionMetapart();
        v49.CFrame = v126.CFrame;
        v49.Size = v126.Size;
        v17.adornInstanceWithRotate(v49);
    end;
end;
local function _() --[[ Line: 412 ]] --[[ Name: updateAdornments ]]
    -- upvalues: v12 (copy), v127 (copy)
    local v128 = v12.getFilteredSelectionMetapart();
    if v128 then
        v128.ClearCache();
    end;
    updateInvisiblePart();
    v127();
end;
local function v131() --[[ Line: 422 ]] --[[ Name: onPressMouse ]]
    -- upvalues: l_StudioService_0 (ref), v17 (copy), v75 (ref), l_Selection_0 (copy)
    l_StudioService_0 = false;
    v17.grabHandle();
    local v130 = v17.getCurrentHandle();
    if v130 == 0 and not v17.isPlaneSelectingModeOn() then
        selectPart();
    end;
    if v130 == 14 then
        v75 = l_Selection_0.Origin.p;
        analyticsSendSetPlane();
    elseif v17.getCurrentAdornment() then
        v75 = v17.getAdornmentWorldCFrame(v17.getCurrentAdornment()[1]).p;
    end;
    grabHandle(v130, v75);
end;
local function v132() --[[ Line: 447 ]] --[[ Name: onReleaseMouse ]]
    -- upvalues: v75 (ref), l_StudioService_0 (ref), v19 (copy), v17 (copy), v48 (ref)
    v75 = nil;
    if l_StudioService_0 then
        if v19.isRubberBandDragInProgress() then
            analyticsSendBoxSelect();
        else
            analyticsSendFreeformDragged();
        end;
    end;
    if not v19.isRubberBandDragInProgress() then
        releaseHandle();
    end;
    releasePart();
    v17.releaseHandle();
    v48 = false;
end;
l_plugin_0:OnInvoke("buttonClicked", function(_) --[[ Line: 472 ]]
    -- upvalues: l_Workspace_0 (ref), l_UserInputService_0 (ref)
    if l_Workspace_0 and Off then
        Off();
        return;
    else
        if l_UserInputService_0 and On then
            On();
        end;
        return;
    end;
end);
l_plugin_0:OnInvoke("Disable", function() --[[ Line: 484 ]]
    -- upvalues: l_plugin_0 (copy)
    l_plugin_0:Deactivate();
end);
l_plugin_0.Deactivation:connect(function() --[[ Line: 488 ]]
    -- upvalues: l_Workspace_0 (ref)
    if l_Workspace_0 and Off then
        Off();
    end;
end);
squaredMagnitude = function(v134) --[[ Line: 495 ]] --[[ Name: squaredMagnitude ]]
    return v134.X * v134.X + v134.Y * v134.Y + v134.Z * v134.Z;
end;
vector3Direction = function(v135) --[[ Line: 499 ]] --[[ Name: vector3Direction ]]
    local v136 = 1 / math.sqrt((squaredMagnitude(v135)));
    return (Vector3.new(v135.X * v136, v135.Y * v136, v135.Z * v136));
end;
vector3LessThanOrEqualTo = function(v137, v138) --[[ Line: 505 ]] --[[ Name: vector3LessThanOrEqualTo ]]
    local v139 = false;
    if v137.x <= v138.x then
        v139 = false;
        if v137.y <= v138.y then
            v139 = v137.z <= v138.z;
        end;
    end;
    return v139;
end;
vector3GreaterThanOrEqualTo = function(v140, v141) --[[ Line: 509 ]] --[[ Name: vector3GreaterThanOrEqualTo ]]
    local v142 = false;
    if v140.x >= v141.x then
        v142 = false;
        if v140.y >= v141.y then
            v142 = v140.z >= v141.z;
        end;
    end;
    return v142;
end;
createPlane = function(v143, v144, v145) --[[ Line: 513 ]] --[[ Name: createPlane ]]
    local v146 = (v144 - v143):Cross(v145 - v143);
    local v147 = vector3Direction(v146);
    local v148 = v147:Dot(v143);
    return {
        v0 = v143, 
        v1 = v144, 
        v2 = v145, 
        normal = v147, 
        distance = v148
    };
end;
rayPlaneIntersection = function(v149, v150) --[[ Line: 522 ]] --[[ Name: rayPlaneIntersection ]]
    local v151 = v149.Direction:Dot(v150.normal);
    local v152 = -(-v150.distance + v149.Origin:Dot(v150.normal)) / v151;
    return v149.Origin + v149.Direction * v152;
end;
boxSideTest = function(v153, v154, v155, _) --[[ Line: 530 ]] --[[ Name: boxSideTest ]]
    local v157 = v155 * v154;
    local v158 = -(-v154:Dot(v157) + v153.Origin:Dot(v154)) / v153.Direction:Dot(v154);
    local v159 = v153.Origin + v153.Direction * v158;
    if (v157.x ~= 0 or v159.x <= v155.x) and (v157.x ~= 0 or v159.x >= -v155.x) and (v157.y ~= 0 or v159.y <= v155.y) and (v157.y ~= 0 or v159.y >= -v155.y) and (v157.z ~= 0 or v159.z <= v155.z) and (v157.z ~= 0 or v159.z >= -v155.z) then
        return v159;
    else
        return nil;
    end;
end;
rayBoxIntersection = function(v160, v161, v162) --[[ Line: 549 ]] --[[ Name: rayBoxIntersection ]]
    v162 = v162 / 2;
    local v163 = Ray.new(v161:pointToObjectSpace(v160.Origin), v161:pointToObjectSpace(v160.Direction + v161.p).unit);
    if v163.Origin.x < -v162.x and v163.Direction.x > 0 then
        local v164 = boxSideTest(v163, Vector3.new(-1, 0, 0, 0), v162);
        if v164 then
            return v161:pointToWorldSpace(v164);
        end;
    elseif v163.Origin.x > v162.x and v163.Direction.x < 0 then
        local v165 = boxSideTest(v163, Vector3.new(1, 0, 0, 0), v162, true);
        if v165 then
            return v161:pointToWorldSpace(v165);
        end;
    end;
    if v163.Origin.y < -v162.y and v163.Direction.y > 0 then
        local v166 = boxSideTest(v163, Vector3.new(0, -1, 0, 0), v162);
        if v166 then
            return v161:pointToWorldSpace(v166);
        end;
    elseif v163.Origin.y > v162.y and v163.Direction.y < 0 then
        local v167 = boxSideTest(v163, Vector3.new(0, 1, 0, 0), v162);
        if v167 then
            return v161:pointToWorldSpace(v167);
        end;
    end;
    if v163.Origin.z < -v162.z and v163.Direction.z > 0 then
        local v168 = boxSideTest(v163, Vector3.new(0, 0, -1, 0), v162);
        if v168 then
            return v161:pointToWorldSpace(v168);
        end;
    elseif v163.Origin.z > v162.z and v163.Direction.z < 0 then
        local v169 = boxSideTest(v163, Vector3.new(0, 0, 1, 0), v162);
        if v169 then
            return v161:pointToWorldSpace(v169);
        end;
    end;
    return v161:pointToWorldSpace((Vector3.new(0, 0, 0, 0)));
end;
projectVectorToPlane = function(v170, v171) --[[ Line: 592 ]] --[[ Name: projectVectorToPlane ]]
    return v170 - v170:Dot(v171.Unit) * v171.Unit;
end;
local function _(v172, v173, v174, v175, v176) --[[ Line: 597 ]] --[[ Name: moveUntilCollideWrapper ]]
    -- upvalues: v9 (copy)
    if not v174 then
        v174 = {};
    end;
    return v9.moveUntilCollide(v172, v174, v175, v173, v176);
end;
local _ = function(v178, _, v180, v181) --[[ Line: 604 ]] --[[ Name: safeMoveWrapper ]]
    -- upvalues: v9 (copy)
    v9.SafeMove(v178, v180, v181);
end;
local function _(v183, v184, v185) --[[ Line: 608 ]] --[[ Name: safeMoveWhiteList ]]
    -- upvalues: v9 (copy), v11 (copy)
    v9.SafeMove(v183, v11.createIgnoreListGivenWhiteList(game.Workspace, v185), v184);
end;
local function _(v187, v188) --[[ Line: 612 ]] --[[ Name: safeRotate ]]
    v187.CFrame = v188 * v187.CFrame;
end;
getRotationalIntervalFromGrid = function() --[[ Line: 619 ]] --[[ Name: getRotationalIntervalFromGrid ]]
    -- upvalues: l_plugin_0 (copy), v14 (copy)
    local l_GridSize_0 = l_plugin_0.GridSize;
    if v14.fuzzyCompare(l_GridSize_0, 0.2) then
        return 15;
    elseif v14.fuzzyCompare(l_GridSize_0, 0.01) then
        return 1;
    else
        return 45;
    end;
end;
roundToNearestGrid = function(v191) --[[ Line: 632 ]] --[[ Name: roundToNearestGrid ]]
    -- upvalues: l_plugin_0 (copy), v15 (copy)
    local l_GridSize_1 = l_plugin_0.GridSize;
    if l_GridSize_1 ~= 0 then
        return v15.roundToNearest(v191, l_GridSize_1);
    else
        return v191;
    end;
end;
Vector3ToNearestGrid = function(v193) --[[ Line: 640 ]] --[[ Name: Vector3ToNearestGrid ]]
    return (Vector3.new(roundToNearestGrid(v193.X), roundToNearestGrid(v193.Y), roundToNearestGrid(v193.Z)));
end;
getScaleHandleLocalVector = function(v194) --[[ Line: 644 ]] --[[ Name: getScaleHandleLocalVector ]]
    if v194 == 2 then
        return (Vector3.new(1, 0, 0, 0));
    elseif v194 == 3 then
        return (Vector3.new(-1, 0, 0, 0));
    elseif v194 == 4 then
        return (Vector3.new(0, 0, 1, 0));
    elseif v194 == 5 then
        return (Vector3.new(0, 0, -1, 0));
    elseif v194 == 6 then
        return (Vector3.new(0, 1, 0, 0));
    elseif v194 == 7 then
        return (Vector3.new(1, 0, 1, 0));
    elseif v194 == 8 then
        return (Vector3.new(1, 0, -1, 0));
    elseif v194 == 9 then
        return (Vector3.new(-1, 0, 1, 0));
    elseif v194 == 10 then
        return (Vector3.new(-1, 0, -1, 0));
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
snapVector3ByHandle = function(v195, v196) --[[ Line: 669 ]] --[[ Name: snapVector3ByHandle ]]
    -- upvalues: l_plugin_0 (copy)
    if v196 == 2 or v196 == 3 or v196 == 7 or v196 == 8 or v196 == 9 or v196 == 10 then
        v195 = Vector3.new(math.max(roundToNearestGrid(v195.X), l_plugin_0.GridSize), v195.Y, v195.Z);
    end;
    if v196 == 4 or v196 == 5 or v196 == 7 or v196 == 8 or v196 == 9 or v196 == 10 then
        v195 = Vector3.new(v195.X, v195.Y, (math.max(roundToNearestGrid(v195.Z), l_plugin_0.GridSize)));
    end;
    if v196 == 6 or v196 == 1 then
        v195 = Vector3.new(v195.X, math.max(roundToNearestGrid(v195.Y), l_plugin_0.GridSize), v195.Z);
    end;
    return v195;
end;
getSelectedPart = function() --[[ Line: 701 ]] --[[ Name: getSelectedPart ]]
    -- upvalues: v12 (copy)
    local v197 = v12.getFilteredSelection();
    if #v197 < 1 then
        return nil;
    else
        return v197[1];
    end;
end;
getCurrentSelectionWithChildren = function(v198, v199) --[[ Line: 710 ]] --[[ Name: getCurrentSelectionWithChildren ]]
    -- upvalues: v12 (copy)
    if not v199 then
        v199 = {};
    end;
    if not v198 then
        v198 = v12.getFilteredSelection();
    end;
    for _, v201 in pairs(v198) do
        if v201:IsA("BasePart") then
            table.insert(v199, v201);
        end;
        if #v201:GetChildren() then
            v199 = getCurrentSelectionWithChildren(v201:GetChildren(), v199);
        end;
    end;
    return v199;
end;
setPartPosition = function(v202, v203) --[[ Line: 730 ]] --[[ Name: setPartPosition ]]
    v202.CFrame = v202.CFrame - v202.CFrame.p + v203;
end;
setPartRotation = function(v204, v205) --[[ Line: 734 ]] --[[ Name: setPartRotation ]]
    v204.CFrame = v205 - v205.p + v204.CFrame.p;
end;
cosineSimilarity = function(v206, v207) --[[ Line: 740 ]] --[[ Name: cosineSimilarity ]]
    return (math.deg((math.acos((v206.x * v207.x + v206.y * v207.y + v206.z * v207.z) / (math.sqrt(math.pow(v206.x, 2) + math.pow(v206.y, 2) + math.pow(v206.z, 2)) * math.sqrt(math.pow(v207.x, 2) + math.pow(v207.y, 2) + math.pow(v207.z, 2)))))));
end;
setWaypoint = function() --[[ Line: 751 ]] --[[ Name: setWaypoint ]]
    -- upvalues: v12 (copy), v17 (copy), v55 (ref), v52 (ref)
    removeDragPart();
    local v208 = v12.getFilteredSelectionMetapart();
    local v209 = v17.getCurrentHandle();
    local v210 = "Unknown";
    if v209 == 2 or v209 == 6 or v209 == 4 or v209 == 3 or v209 == 5 or v209 == 7 or v209 == 9 or v209 == 10 or v209 == 8 then
        v210 = "Scale";
    elseif v209 == 1 then
        v210 = "Move";
    elseif v209 == 11 or v209 == 12 or v209 == 13 then
        v210 = "Rotate";
    end;
    if v208 and (v208.CFrame ~= v55 or v208.Size ~= v52) then
        game:GetService("ChangeHistoryService"):SetWaypoint(v210);
    end;
end;
local function _(v211) --[[ Line: 784 ]] --[[ Name: setSelection ]]
    game:GetService("Selection"):Set(v211);
end;
rotateCFrame = function(v213, v214) --[[ Line: 788 ]] --[[ Name: rotateCFrame ]]
    if v214 == 1 then
        return v213 * CFrame.Angles(3.141592653589793, 0, 0);
    elseif v214 == 3 then
        return v213 * CFrame.Angles(0, 0, -1.5707963267948966);
    elseif v214 == 2 then
        return v213 * CFrame.Angles(0, 0, 1.5707963267948966);
    elseif v214 == 4 then
        return v213 * CFrame.Angles(-1.5707963267948966, 0, 0);
    else
        if v214 == 5 then
            v213 = v213 * CFrame.Angles(1.5707963267948966, 0, 0);
        end;
        return v213;
    end;
end;
updateInvisiblePart = function() --[[ Line: 804 ]] --[[ Name: updateInvisiblePart ]]
    -- upvalues: v65 (ref), v12 (copy), v60 (ref), v74 (ref), v16 (copy), v63 (ref), v61 (ref), v64 (ref)
    if not v65 then
        return;
    else
        local v215 = v12.getFilteredSelection();
        if #v215 < 1 then
            return;
        else
            if #v215 > 1 then

            end;
            local v216 = v12.getFilteredSelectionMetapart();
            if v60 then
                if v216 then
                    v216.UpdatePlaneCFrame = v74;
                    v65.CFrame = v216.PlaneAlignedCFrame;
                    v65.Size = v216.PlaneAlignedSize;
                else
                    local l_CFrame_0 = v60.CFrame;
                    v65.CFrame = CFrame.new(v65.CFrame.p);
                    v16.setPartCFrameToExtents(v65, rotateCFrame(l_CFrame_0, v63));
                end;
            else
                v16.setPartCFrameToExtents(v65, nil);
            end;
            if v61 then
                v64 = -v65.CFrame:pointToObjectSpace(v61).y;
            end;
            return;
        end;
    end;
end;
local function _() --[[ Line: 838 ]] --[[ Name: resetDragger ]]
    -- upvalues: v17 (copy)
    v17.resetDragger();
end;
local function v225(v219, v220, v221) --[[ Line: 846 ]] --[[ Name: adjustScalingInCaseOfSpecialParts ]]
    if not v219:IsA("Part") or v221 == 1 or v221 == 13 or v221 == 12 or v221 == 11 or v221 == 14 then
        return v220;
    elseif v219.Shape == Enum.PartType.Ball then
        local l_Y_0 = v220.Y;
        return v221 == 6 and Vector3.new(l_Y_0, l_Y_0, l_Y_0) or v220;
    elseif v219.Shape == Enum.PartType.Cylinder then
        if v221 == 6 then
            local l_Y_1 = v220.Y;
            return (Vector3.new(0, l_Y_1, l_Y_1));
        else
            local l_Z_0 = v220.Z;
            return (Vector3.new(v220.X, l_Z_0, l_Z_0));
        end;
    else
        return v220;
    end;
end;
local v226 = 0;
local v227 = false;
local v228 = nil;
preUpdatePart = function() --[[ Line: 888 ]] --[[ Name: preUpdatePart ]]
    -- upvalues: v17 (copy), v75 (ref), l_Selection_0 (copy), v51 (ref), v53 (ref), v228 (ref), v227 (ref), v76 (ref)
    local v229 = v17.getCurrentHandle();
    if v229 == 0 then
        return;
    elseif not v75 then
        return;
    elseif v229 == 14 then
        return;
    else
        local v230 = v17.getCurrentAdornment();
        local l_Adornee_0 = v230[1].Adornee;
        if not l_Adornee_0 then
            return;
        else
            local v232 = v17.getAdornmentWorldCFrame(v230[1]);
            local l_UnitRay_0 = l_Selection_0.UnitRay;
            if v229 == 1 or v229 == 6 then
                local l_Unit_0 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0, 0))) - l_Adornee_0.CFrame.p).Unit;
                local v235 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_0) * l_Unit_0;
                local v236 = v235:Dot(v232.p);
                local v237 = l_UnitRay_0.Direction:Dot(v235);
                local v238 = -(-v236 + l_UnitRay_0.Origin:Dot(v235)) / v237;
                local v239 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * v238;
                local _ = v75 - l_Unit_0.Unit * 800;
                local v241 = Ray.new(v75, l_Unit_0.Unit):ClosestPoint(v239);
                local v242 = Vector3.new(0, 1, 0, 0);
                if v241 == v75 then
                    v241 = Ray.new(v75, -l_Unit_0.Unit):ClosestPoint(v239);
                    v242 = v242 * -1;
                end;
                v51 = (v241 - v75).Magnitude * v242;
            elseif v229 == 2 or v229 == 3 then
                local l_Unit_1 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(1, 0, 0, 0))) - l_Adornee_0.CFrame.p).Unit;
                local v244 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_1) * l_Unit_1;
                local v245 = v244:Dot(v232.p);
                local v246 = l_UnitRay_0.Direction:Dot(v244);
                local v247 = -(-v245 + l_UnitRay_0.Origin:Dot(v244)) / v246;
                local v248 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * v247;
                local _ = v75 - l_Unit_1.Unit * 800;
                local v250 = Ray.new(v75, l_Unit_1.Unit):ClosestPoint(v248);
                local v251 = Vector3.new(1, 0, 0, 0);
                if v250 == v75 then
                    v250 = Ray.new(v75, -l_Unit_1.Unit):ClosestPoint(v248);
                    v251 = v251 * -1;
                end;
                v51 = (v250 - v75).Magnitude * v251;
                if v229 == 3 then
                    v51 = v51 * -1;
                end;
            elseif v229 == 4 or v229 == 5 then
                local l_Unit_2 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 0, 1, 0))) - l_Adornee_0.CFrame.p).Unit;
                local v253 = l_UnitRay_0.Direction - l_UnitRay_0.Direction:Dot(l_Unit_2) * l_Unit_2;
                local v254 = v253:Dot(v232.p);
                local v255 = l_UnitRay_0.Direction:Dot(v253);
                local v256 = -(-v254 + l_UnitRay_0.Origin:Dot(v253)) / v255;
                local v257 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * v256;
                local _ = v75 - l_Unit_2.Unit * 800;
                local v259 = Ray.new(v75, l_Unit_2.Unit):ClosestPoint(v257);
                local v260 = Vector3.new(0, 0, 1, 0);
                if v259 == v75 then
                    v259 = Ray.new(v75, -l_Unit_2.Unit):ClosestPoint(v257);
                    v260 = v260 * -1;
                end;
                v51 = (v259 - v75).Magnitude * v260;
                if v229 == 5 then
                    v51 = v51 * -1;
                end;
            elseif v229 == 7 or v229 == 10 or v229 == 8 or v229 == 9 then
                local l_Unit_3 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0, 0))) - l_Adornee_0.CFrame.p).Unit;
                local v262 = l_Unit_3:Dot(v232.p);
                local v263 = l_UnitRay_0.Direction:Dot(l_Unit_3);
                local v264 = -(-v262 + l_UnitRay_0.Origin:Dot(l_Unit_3)) / v263;
                local v265 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * v264;
                v51 = v53:pointToObjectSpace(v265 + v53.p) - v53:pointToObjectSpace(v75 + v53.p);
                if v229 == 9 or v229 == 10 then
                    v51 = v51 * Vector3.new(-1, 1, 1, 0);
                end;
                if v229 == 8 or v229 == 10 then
                    v51 = v51 * Vector3.new(1, 1, -1, 0);
                end;
            elseif v229 == 11 or v229 == 12 or v229 == 13 then
                local l_Unit_4 = (l_Adornee_0.CFrame:pointToWorldSpace((Vector3.new(v229 == 13 and 1 or 0, v229 == 12 and 1 or 0, v229 == 11 and 1 or 0))) - l_Adornee_0.CFrame.p).Unit;
                local v267 = l_Unit_4:Dot(v232.p);
                local v268 = l_UnitRay_0.Direction:Dot(l_Unit_4);
                local v269 = -(-v267 + l_UnitRay_0.Origin:Dot(l_Unit_4)) / v268;
                v228 = l_UnitRay_0.Origin + l_UnitRay_0.Direction * v269;
                v51 = v53:pointToObjectSpace(v228 + v53.p) - v53:pointToObjectSpace(v75 + v53.p);
                v227 = false;
            end;
            if not v76 then
                v76 = v51;
                return;
            else
                v51 = v51 - v76;
                return;
            end;
        end;
    end;
end;
local v270 = nil;
local function _(v271) --[[ Line: 1048 ]] --[[ Name: sanitizeFloatTest ]]
    return v271 > 0 and math.ceil(v271 * 1000000 - 0.5) / 1000000 or math.floor(v271 * 1000000 + 0.5) / 1000000;
end;
local function _(v273) --[[ Line: 1053 ]] --[[ Name: sanitizeCFrameTest ]]
    local v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285 = v273:components();
    return CFrame.new(sanitizeFloat(v274), sanitizeFloat(v275), sanitizeFloat(v276), sanitizeFloat(v277), sanitizeFloat(v278), sanitizeFloat(v279), sanitizeFloat(v280), sanitizeFloat(v281), sanitizeFloat(v282), sanitizeFloat(v283), sanitizeFloat(v284), sanitizeFloat(v285));
end;
getShapeRenderSize = function(v287, v288) --[[ Line: 1071 ]] --[[ Name: getShapeRenderSize ]]
    if v287 == Enum.PartType.Cylinder then
        local v289 = math.min(v288.Y, v288.Z);
        return (Vector3.new(v288.X, v289, v289));
    else
        return v288;
    end;
end;
updatePivotAndChildAttachments = function(v290, v291, v292) --[[ Line: 1080 ]] --[[ Name: updatePivotAndChildAttachments ]]
    if not v290:IsA("BasePart") then
        return;
    else
        local l_v290_Children_0 = v290:GetChildren();
        local l_Shape_0 = v290.Shape;
        v291 = getShapeRenderSize(l_Shape_0, v291);
        v292 = getShapeRenderSize(l_Shape_0, v292);
        for v295 = 1, #l_v290_Children_0 do
            local v296 = l_v290_Children_0[v295];
            if v296:IsA("Attachment") then
                v296.Position = v296.Position / v291 * v292;
            end;
        end;
        v290:UpdatePivot(v291, v292);
        return;
    end;
end;
local function _() --[[ Line: 1102 ]] --[[ Name: needsAnchorDuringMove ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsRunning();
end;
updatePart = function() --[[ Line: 1106 ]] --[[ Name: updatePart ]]
    -- upvalues: v12 (copy), v17 (copy), l_RunService_0 (copy), v96 (ref), v97 (ref), v52 (ref), v53 (ref), v51 (ref), v270 (ref), v90 (ref), l_plugin_0 (copy), v65 (ref), v11 (copy), v225 (copy), v99 (copy), v10 (copy), v9 (copy), v5 (copy), v66 (ref), v61 (ref), v75 (ref), v228 (ref), v55 (ref), v15 (copy), v119 (copy), v48 (ref), v46 (ref), v27 (copy), v47 (ref), v127 (copy), v26 (ref)
    local v298 = v12.getFilteredSelectionMetapart();
    local v299 = v12.getFilteredSelection();
    local v300 = v17.getCurrentHandle();
    if v300 == 0 then
        return;
    else
        if l_RunService_0:IsRunning() and not v96 then
            local v301 = getCurrentSelectionWithChildren();
            v96 = true;
            for v302, v303 in ipairs(v301) do
                v97[v302] = v303.Anchored;
                v303.Anchored = true;
            end;
        end;
        preUpdatePart();
        if ((not v52 or not v53) and v300 ~= 1 or not v51) and v300 ~= 11 and v300 ~= 12 and v300 ~= 13 and v300 ~= 14 then
            return;
        else
            local v304 = true;
            if selectedPart then
                local v305 = v12.getFilteredSelection();
                workspace:UnjoinFromOutsiders(v305);
            end;
            local v306 = nil;
            local v307 = nil;
            if selectedPart and not v270 then
                v306 = selectedPart.CFrame;
                v307 = selectedPart.Size;
            end;
            v90 = true;
            local v308 = v12.getFilteredSelection();
            if #v308 == 0 then
                v17.resetDragger();
                return;
            else
                local v309 = false;
                if l_plugin_0.CollisionEnabled then
                    v65.Parent = workspace;
                    if v11.itemsHasItemNotInList(v65:GetTouchingParts(), v308) then
                        v309 = true;
                    end;
                    v65.Parent = nil;
                end;
                v51 = v225(selectedPart, v51, v300);
                if v300 == 6 then
                    local v310 = -v17.getYScale();
                    v51 = v51 * -v310;
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    local v311 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v311);
                    v99(selectedPart);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(v310 * ((v52 - selectedPart.Size) / 2)));
                    v311 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                    local l_unit_0 = (v306.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v307;
                        local v313 = v12.getFilteredSelection();
                        workspace:UnjoinFromOutsiders(v313);
                        v99(selectedPart);
                        selectedPart.CFrame = v306;
                        if v309 then
                            return;
                        else
                            v313 = selectedPart;
                            local v314 = nil;
                            local v315 = l_unit_0 * -1;
                            local v316 = v311 * 2;
                            if not v314 then
                                v314 = {};
                            end;
                            local _ = v9.moveUntilCollide(v313, v314, v315, 1.0E-5, v316);
                            v313 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                            v314 = v306.p - selectedPart.CFrame.p;
                            selectedPart.Size = v307 - v313 * getScaleHandleLocalVector(v300) * v310;
                            v315 = v12.getFilteredSelection();
                            workspace:UnjoinFromOutsiders(v315);
                            v99(selectedPart);
                            selectedPart.CFrame = v306 - v314 / 2;
                        end;
                    end;
                    local v318 = selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(0, 1, 0, 0)) - selectedPart.CFrame.p;
                    local v319 = nil;
                    v319 = if v5 then game.Workspace.CurrentCamera.CFrame.LookVector else game.Workspace.Camera.CoordinateFrame.lookVector;
                    local l_unit_1 = (v319 - v319:Dot(v318) * v318):Cross(v318).unit;
                    v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(0, -1, 0, 0)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(0, 1, 0, 0)), l_unit_1);
                elseif v300 == 2 or v300 == 4 then
                    local v321 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v321);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(-((v52 - selectedPart.Size) * 0.5)));
                    v321 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                    local l_unit_2 = (v306.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v307;
                        local v323 = v12.getFilteredSelection();
                        workspace:UnjoinFromOutsiders(v323);
                        v99(selectedPart);
                        selectedPart.CFrame = v306;
                        if v309 then
                            return;
                        else
                            v323 = selectedPart;
                            local v324 = nil;
                            local v325 = l_unit_2 * -1;
                            local v326 = v321 * 2;
                            if not v324 then
                                v324 = {};
                            end;
                            local _ = v9.moveUntilCollide(v323, v324, v325, 1.0E-5, v326);
                            v323 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                            v324 = v306.p - selectedPart.CFrame.p;
                            selectedPart.Size = v307 + v323 * getScaleHandleLocalVector(v300);
                            v325 = v12.getFilteredSelection();
                            workspace:UnjoinFromOutsiders(v325);
                            v99(selectedPart);
                            selectedPart.CFrame = v306 - v324 / 2;
                        end;
                    end;
                    if v300 == 2 then
                        local v328 = nil;
                        v328 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                        local v329 = v10.getVector3Sign(v328);
                        v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v329.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v329.z)), selectedPart.CFrame:pointToWorldSpace(v329 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    elseif v300 == 4 then
                        local v330 = nil;
                        v330 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                        local v331 = v10.getVector3Sign(v330);
                        v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v331.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v331.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v331 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                    end;
                elseif v300 == 3 or v300 == 5 then
                    local v332 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v332);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new((v52 - selectedPart.Size) * 0.5));
                    v332 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                    local l_unit_3 = (v306.p - selectedPart.CFrame.p).unit;
                    if l_plugin_0.CollisionEnabled and #selectedPart:GetTouchingParts() > 0 then
                        selectedPart.Size = v307;
                        local v334 = v12.getFilteredSelection();
                        workspace:UnjoinFromOutsiders(v334);
                        v99(selectedPart);
                        selectedPart.CFrame = v306;
                        if v309 then
                            return;
                        else
                            v334 = selectedPart;
                            local v335 = nil;
                            local v336 = l_unit_3 * -1;
                            local v337 = v332 * 2;
                            if not v335 then
                                v335 = {};
                            end;
                            local _ = v9.moveUntilCollide(v334, v335, v336, 1.0E-5, v337);
                            v334 = v10.distanceVector3(v306.p, selectedPart.CFrame.p);
                            v335 = v306.p - selectedPart.CFrame.p;
                            selectedPart.Size = v307 - v334 * getScaleHandleLocalVector(v300);
                            v336 = v12.getFilteredSelection();
                            workspace:UnjoinFromOutsiders(v336);
                            v99(selectedPart);
                            selectedPart.CFrame = v306 - v335 / 2;
                        end;
                    end;
                    if v300 == 3 then
                        local v339 = nil;
                        v339 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                        local v340 = v10.getVector3Sign(v339);
                        v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v340.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v340.z)), selectedPart.CFrame:pointToWorldSpace(v340 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    elseif v300 == 5 then
                        local v341 = nil;
                        v341 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                        local v342 = v10.getVector3Sign(v341);
                        v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v342.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v342.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v342 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                    end;
                elseif v300 == 7 then
                    local v343 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v343);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(-((v52 - selectedPart.Size) / 2)));
                    v343 = nil;
                    v343 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                    local v344 = v10.getVector3Sign(v343);
                    v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v344.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v344.z)), selectedPart.CFrame:pointToWorldSpace(v344 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    v17.scaleTwo(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v344.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v344.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v344 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                elseif v300 == 9 then
                    local v345 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v345);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(-((v52 - selectedPart.Size) / 2) * Vector3.new(-1, 0, 1, 0)));
                    v345 = nil;
                    v345 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                    local v346 = v10.getVector3Sign(v345);
                    v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v346.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v346.z)), selectedPart.CFrame:pointToWorldSpace(v346 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    v17.scaleTwo(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v346.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v346.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v346 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                elseif v300 == 10 then
                    local v347 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v347);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(-((v52 - selectedPart.Size) / 2) * Vector3.new(-1, 0, -1, 0)));
                    v347 = nil;
                    v347 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                    local v348 = v10.getVector3Sign(v347);
                    v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v348.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v348.z)), selectedPart.CFrame:pointToWorldSpace(v348 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    v17.scaleTwo(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v348.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v348.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v348 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                elseif v300 == 8 then
                    local v349 = v12.getFilteredSelection();
                    workspace:UnjoinFromOutsiders(v349);
                    v99(selectedPart);
                    selectedPart.Size = snapVector3ByHandle(v52 + v51, v300);
                    selectedPart.CFrame = v53:toWorldSpace(CFrame.new(-((v52 - selectedPart.Size) / 2) * Vector3.new(1, 0, -1, 0)));
                    v349 = nil;
                    v349 = if v5 then selectedPart.CFrame:PointToObjectSpace(game.Workspace.CurrentCamera.CFrame.Position) else selectedPart.CFrame:pointToObjectSpace(game.Workspace.Camera.CoordinateFrame.p);
                    local v350 = v10.getVector3Sign(v349);
                    v17.scaleOne(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(-1, -1, v350.z)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(1, -1, v350.z)), selectedPart.CFrame:pointToWorldSpace(v350 * Vector3.new(0, 0, 1, 0)) - selectedPart.CFrame.p);
                    v17.scaleTwo(selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v350.x, -1, -1)), selectedPart.CFrame:pointToWorldSpace(selectedPart.Size / 2 * Vector3.new(v350.x, -1, 1)), selectedPart.CFrame:pointToWorldSpace(v350 * Vector3.new(1, 0, 0, 0)) - selectedPart.CFrame.p);
                elseif v300 == 1 then
                    local l_CFrame_1 = v65.CFrame;
                    v65.CFrame = v66:toWorldSpace(CFrame.new(v51));
                    local v352 = -v65.CFrame:pointToObjectSpace(v61).y - v65.Size.Y / 2;
                    local v353 = -v65.CFrame:pointToObjectSpace(v61).y + v65.Size.Y / 2;
                    local v354 = roundToNearestGrid(v352);
                    local v355 = roundToNearestGrid(v353);
                    local v356 = v354 - v352;
                    local v357 = v355 - v353;
                    local v358 = math.abs(v356) <= math.abs(v357) and v356 or v357;
                    local v359 = v65.CFrame:pointToWorldSpace((Vector3.new(0, v358, 0)));
                    v65.CFrame = v65.CFrame - v65.CFrame.p + v359;
                    if l_plugin_0.CollisionEnabled then
                        local v360 = v65.CFrame.p - l_CFrame_1.p;
                        local v361 = v10.distanceVector3(l_CFrame_1.p, v65.CFrame.p);
                        if v298.CanSimulate then
                            v298.TranslateFromTo(l_CFrame_1, v65.CFrame);
                            if v11.itemsHasItemNotInList(v298:GetTouchingParts(), v298.Children) then
                                local l_Unit_5 = v360.Unit;
                                v298.TranslateFromTo(v65.CFrame, l_CFrame_1);
                                v9.moveUntilCollideMetapart(v298, v298.Children, l_Unit_5, v361);
                            end;
                        else
                            v65.Parent = workspace;
                            if v11.itemsHasItemNotInList(v65:GetTouchingParts(), v298.Children) then
                                local l_Unit_6 = v360.Unit;
                                v65.CFrame = l_CFrame_1;
                                local l_v65_0 = v65;
                                local v365 = v298.Children or {};
                                local _ = v9.moveUntilCollide(l_v65_0, v365, l_Unit_6, 2.0E-4, v361);
                            end;
                            v65.Parent = nil;
                            v298.TranslateFromTo(l_CFrame_1, v65.CFrame);
                        end;
                    else
                        v298.TranslateFromTo(l_CFrame_1, v65.CFrame);
                    end;
                elseif v300 == 11 then
                    local v367 = v52 * 0.5;
                    local v368 = v53:pointToObjectSpace(v75);
                    v368 = v368.Z / math.abs(v368.Z);
                    local v369 = math.max(v52.X, v52.Y);
                    local v370 = (v53:toWorldSpace(CFrame.new((Vector3.new(0, 0, v367.Z * v368)))).p - v228).magnitude < v369;
                    local v371 = v53:pointToObjectSpace(v55);
                    local v372 = v371 + v51;
                    local v373 = math.atan2(v372.Y, v372.X) - math.atan2(v371.Y, v371.X);
                    local v374 = v15.roundToNearest(math.deg(v373), v370 and 22.5 or 1);
                    local v375 = v53 * CFrame.Angles(0, 0, (math.rad(v374)));
                    if v298:IsA("BasePart") then
                        v298.CFrame = v375;
                    elseif v298:IsA("Model") and not v298:IsA("Workspace") then
                        local l_v298_ModelCFrame_0 = v298:GetModelCFrame();
                        v119(v298, v375);
                        if l_plugin_0.CollisionEnabled and #v298:GetTouchingParts() > 0 then
                            v119(v298, l_v298_ModelCFrame_0);
                        end;
                    elseif v298:IsA("Grouping") then
                        local l_CFrame_2 = v298.CFrame;
                        v298.CFrame = v375;
                        if l_plugin_0.CollisionEnabled and #v298:GetTouchingParts() > 0 then
                            v298.CFrame = l_CFrame_2;
                        end;
                    end;
                    if v298 and (not l_plugin_0.CollisionEnabled or not v11.itemsHasItemNotInList(v298:GetTouchingParts(), v308)) then
                        local _ = (v53:pointToWorldSpace((Vector3.new(0, 0, 1, 0))) - v53.p).Unit;
                        local l_unit_4 = (v53:pointToObjectSpace(v75) * Vector3.new(1, 1, 0, 0)).unit;
                        local v380 = cosineSimilarity(Vector3.new(0, -1, 0, 0), l_unit_4);
                        v380 = if l_unit_4.X > 0 then v380 + 90 else if l_unit_4.Y > 0 then v380 + 180 + 45 else v380 - 45;
                        v17.showRotate(v53:toWorldSpace(CFrame.new((Vector3.new(0, 0, v367.Z * v368)))) * CFrame.Angles(0, 0, (math.rad(v380))), v369, v374, v228);
                    end;
                elseif v300 == 12 then
                    local v381 = v52 * 0.5;
                    local v382 = v53:pointToObjectSpace(v75);
                    v382 = v382.Y / math.abs(v382.Y);
                    local v383 = math.max(v52.X, v52.Z);
                    local v384 = (v53:toWorldSpace(CFrame.new((Vector3.new(0, v381.Y * v382, 0)))).p - v228).magnitude < v383;
                    local v385 = v53:pointToObjectSpace(v55);
                    local v386 = v385 + v51;
                    local v387 = math.atan2(v386.Z, v386.X) - math.atan2(v385.Z, v385.X);
                    local v388 = v15.roundToNearest(math.deg(v387), v384 and 22.5 or 1);
                    local v389 = v53 * CFrame.Angles(0, -math.rad(v388), 0);
                    if v298:IsA("BasePart") then
                        v298.CFrame = v389;
                    elseif v298:IsA("Grouping") or v298:IsA("Model") and not v298:IsA("Workspace") then
                        local l_CFrame_3 = v298.CFrame;
                        v298.CFrame = v389;
                        if l_plugin_0.CollisionEnabled and #v298:GetTouchingParts() > 0 then
                            v298.CFrame = l_CFrame_3;
                        end;
                    end;
                    if v298 and (not l_plugin_0.CollisionEnabled or not v11.itemsHasItemNotInList(v298:GetTouchingParts(), v308)) then
                        local _ = (v53:pointToWorldSpace((Vector3.new(v300 == 13 and 1 or 0, v300 == 12 and 1 or 0, v300 == 11 and 1 or 0))) - v53.p).Unit;
                        local l_unit_5 = (v53:pointToObjectSpace(v75) * Vector3.new(1, 0, 1, 0)).unit;
                        local v393 = cosineSimilarity(Vector3.new(0, 0, -1, 0), l_unit_5) * (l_unit_5.X > 0 and 1 or -1) + 90;
                        v17.showRotate(v53:toWorldSpace(CFrame.new((Vector3.new(0, v381.Y * v382, 0)))) * CFrame.Angles(1.5707963267948966, 0, (math.rad(v393))), v383, v388, v228);
                    end;
                elseif v300 == 13 then
                    local v394 = v52 * 0.5;
                    local v395 = v53:pointToObjectSpace(v75);
                    v395 = v395.X / math.abs(v395.X);
                    local v396 = math.max(v52.Y, v52.Z);
                    local v397 = (v53:toWorldSpace(CFrame.new((Vector3.new(v394.X * v395, 0, 0)))).p - v228).magnitude < v396;
                    local v398 = v53:pointToObjectSpace(v55);
                    local v399 = v398 + v51;
                    local v400 = math.atan2(v399.Z, v399.Y) - math.atan2(v398.Z, v398.Y);
                    local v401 = v15.roundToNearest(math.deg(v400), v397 and 22.5 or 1);
                    local v402 = v53 * CFrame.Angles(math.rad(v401), 0, 0);
                    if v298:IsA("BasePart") then
                        v298.CFrame = v402;
                    elseif v298:IsA("Model") and not v298:IsA("Workspace") then
                        local l_v298_ModelCFrame_1 = v298:GetModelCFrame();
                        v119(v298, v402);
                        if l_plugin_0.CollisionEnabled and #v298:GetTouchingParts() > 0 then
                            v119(v298, l_v298_ModelCFrame_1);
                        end;
                    elseif v298:IsA("Grouping") then
                        local l_CFrame_4 = v298.CFrame;
                        v298.CFrame = v402;
                        if l_plugin_0.CollisionEnabled and #v298:GetTouchingParts() > 0 then
                            v298.CFrame = l_CFrame_4;
                        end;
                    end;
                    if v298 and (not l_plugin_0.CollisionEnabled or not v11.itemsHasItemNotInList(v298:GetTouchingParts(), v308)) then
                        local _ = (v53:pointToWorldSpace((Vector3.new(1, 0, 0, 0))) - v53.p).Unit;
                        local l_unit_6 = (v53:pointToObjectSpace(v75) * Vector3.new(0, 1, 1, 0)).unit;
                        local v407 = cosineSimilarity(Vector3.new(0, 0, -1, 0), l_unit_6) * (l_unit_6.Y > 0 and 1 or -1) + 180;
                        v17.showRotate(v53:toWorldSpace(CFrame.new((Vector3.new(v394.X * v395, 0, 0)))) * CFrame.Angles(0, 1.5707963267948966, (math.rad(v407))), v396, v401, v228);
                    end;
                elseif v300 == 14 then
                    v17.setAllAdornVisibility(false);
                    if not v48 then
                        if not v17.isPlaneSelectingModeOn() then
                            return;
                        else
                            v48 = true;
                            if not v46 then
                                v46 = Instance.new("Part", v27);
                                v46.Size = Vector3.new(50, 50, 0.009999999776482582, 0);
                                v46.Position = Vector3.new(0, 0, 0, 0);
                                v46.Transparency = 1;
                            end;
                            if not v47 then
                                v47 = Instance.new("BoxHandleAdornment", v27);
                                v47.Visible = false;
                                v47.Adornee = v46;
                                v47.Size = v47.Adornee.Size;
                                v47.Transparency = 0.6;
                                v47.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
                            end;
                        end;
                    end;
                else
                    v304 = false;
                end;
                if l_plugin_0.CollisionEnabled and #game:GetService("Selection"):Get() == 1 and (v300 == 6 or v300 == 4 or v300 == 3 or v300 == 5 or v300 == 7 or v300 == 9 or v300 == 10 or v300 == 8 or v300 == 11 or v300 == 12 or v300 == 13) and selectedPart and v11.itemsHasItemNotInList(selectedPart:GetTouchingParts(), v299) then
                    if v306 then
                        selectedPart.CFrame = v306;
                    end;
                    if v307 then
                        selectedPart.Size = v307;
                    end;
                end;
                if selectedPart then
                    updatePivotAndChildAttachments(selectedPart, v307, selectedPart.Size);
                end;
                if v304 then
                    updateDragPart();
                end;
                if v300 ~= 11 and v300 ~= 12 and v300 ~= 13 then
                    updateInvisiblePart();
                end;
                if v300 == 1 then
                    v127();
                end;
                v26 = true;
                return;
            end;
        end;
    end;
end;
updateDragPart = function() --[[ Line: 1795 ]] --[[ Name: updateDragPart ]]
    -- upvalues: v91 (ref), v99 (copy), v92 (ref), v27 (copy), v13 (copy), v65 (ref)
    if not v91 then
        v91 = Instance.new("Part", nil);
        v91.Name = "DragParte1b1aec5";
        v91.BottomSurface = Enum.SurfaceType.Smooth;
        v91.TopSurface = Enum.SurfaceType.Smooth;
        v91.Transparency = 1;
        v99(v91);
    end;
    if not v92 then
        v92 = Instance.new("BoxHandleAdornment", v27);
        v92.Visible = false;
        v92.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
        v92.Transparency = 0.5;
        v92.AlwaysOnTop = true;
    end;
    if v91 then
        if #game:GetService("Selection"):Get() == 1 then
            local v408 = v13.convertToPart(game:GetService("Selection"):Get()[1]);
            v91.Size = v408.Size;
            v91.CFrame = v408.CFrame;
        else
            v91.Size = v65.Size;
            v91.CFrame = v65.CFrame;
        end;
        v91.Name = "DragParte1b1aec5";
        v91.Archivable = false;
        v91.Parent = nil;
        v91.BottomSurface = Enum.SurfaceType.Smooth;
        v91.TopSurface = Enum.SurfaceType.Smooth;
        v99(v91);
    end;
    if v92 and selectedPart then
        v92.Adornee = v91;
        v92.Size = v92.Adornee.Size;
        v92.AlwaysOnTop = true;
        v92.CFrame = v91.CFrame - v91.CFrame.p;
    end;
end;
grabPart = function() --[[ Line: 1848 ]] --[[ Name: grabPart ]]
    -- upvalues: v12 (copy), v56 (ref), v52 (ref), v53 (ref), v66 (ref), v91 (ref), v16 (copy)
    updateInvisiblePart();
    local v409 = v12.getFilteredSelectionMetapart();
    if not v409 then
        return;
    else
        v56 = true;
        v52 = v409.Size;
        v53 = v409.CFrame;
        v66 = v409.PlaneAlignedCFrame;
        local v410 = getBestExtentRotation();
        if not v410 then
            return;
        else
            originalDragPartOrientation = v410 + v66.p;
            updateDragPart();
            setPartRotation(v91, originalDragPartOrientation);
            v16.setPartCFrameToExtents(v91, originalDragPartOrientation);
            return;
        end;
    end;
end;
getAllFaceNormals = function(v411) --[[ Line: 1878 ]] --[[ Name: getAllFaceNormals ]]
    local v412 = {};
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(1, 0, 0, 0))) - v411.CFrame.p).Unit);
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(-1, 0, 0, 0))) - v411.CFrame.p).Unit);
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0, 0))) - v411.CFrame.p).Unit);
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(0, -1, 0, 0))) - v411.CFrame.p).Unit);
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(0, 0, 1, 0))) - v411.CFrame.p).Unit);
    table.insert(v412, (v411.CFrame:pointToWorldSpace((Vector3.new(0, 0, -1, 0))) - v411.CFrame.p).Unit);
    return v412;
end;
getDirectedNormalsFromPart = function(v413, v414) --[[ Line: 1891 ]] --[[ Name: getDirectedNormalsFromPart ]]
    -- upvalues: v65 (ref), v14 (copy)
    local v415 = getAllFaceNormals(v413);
    local v416 = {};
    local v417 = v65.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0, 0))) - v65.Position;
    local v418 = v417:Cross(v414) / v417:Cross(v414).Magnitude;
    for _, v420 in ipairs(v415) do
        local v421 = projectVectorToPlane(v420, v417);
        v421 = projectVectorToPlane(v421, v418).Unit;
        if v14.fuzzyCompareVector3(v421, v414) then
            table.insert(v416, v420);
        end;
    end;
    return v416;
end;
getClosestNormalFromPart = function(v422, v423) --[[ Line: 1916 ]] --[[ Name: getClosestNormalFromPart ]]
    local v424 = nil;
    local v425 = {};
    for v426 = 1, 3 do
        for v427 = 1, 2 do
            local v428 = Vector3.new(v426 == 1 and 1 or 0, v426 == 2 and 1 or 0, v426 == 3 and 1 or 0) * (v427 == 1 and 1 or -1);
            local v429 = v422.CFrame:pointToWorldSpace(v428) - v422.CFrame.p;
            local v430 = cosineSimilarity(v429.Unit, v423);
            if v424 == nil or v430 < v424 then
                v424 = v430;
                v425 = {
                    v429.Unit
                };
            elseif v430 == v424 then
                table.insert(v425, v429.Unit);
            end;
        end;
    end;
    if v424 ~= v424 then
        for _, v432 in ipairs(v425) do
            v432 = v432 * -1;
        end;
    end;
    return v425;
end;
getFirstPart = function(v433) --[[ Line: 1946 ]] --[[ Name: getFirstPart ]]
    local v434 = nil;
    for _, v436 in ipairs(v433) do
        if v436:IsA("BasePart") then
            return v436;
        else
            v434 = getFirstPart(v436:GetChildren());
            if v434 then
                return v434;
            end;
        end;
    end;
    return nil;
end;
getBestExtentRotation = function() --[[ Line: 1960 ]] --[[ Name: getBestExtentRotation ]]
    local v437 = game:GetService("Selection"):Get();
    if #v437 == 0 then
        return CFrame.new();
    else
        for _, v439 in ipairs(v437) do
            if v439:IsA("Model") and not v439:IsA("Workspace") then
                if v439.PrimaryPart then
                    return v439.PrimaryPart.CFrame;
                else
                    local v440 = getFirstPart(v437);
                    if not v440 then
                        return CFrame.new();
                    else
                        return v440.CFrame;
                    end;
                end;
            elseif v439:IsA("BasePart") then
                return v439.CFrame;
            end;
        end;
        return nil;
    end;
end;
getNormalOfFace = function(v441, v442) --[[ Line: 1987 ]] --[[ Name: getNormalOfFace ]]
    -- upvalues: v14 (copy)
    if not v441 or not v442 then
        return;
    else
        local v443 = v441.Size / 2;
        local v444 = v441.CFrame:pointToObjectSpace(v442);
        local v445 = Vector3.new(0, 0, 0, 0);
        if v14.fuzzyCompare(v444.X, v443.X) then
            v445 = Vector3.new(1, 0, 0, 0);
        elseif v14.fuzzyCompare(v444.X, -v443.X) then
            v445 = Vector3.new(-1, 0, 0, 0);
        elseif v14.fuzzyCompare(v444.Y, v443.Y) then
            v445 = Vector3.new(0, 1, 0, 0);
        elseif v14.fuzzyCompare(v444.Y, -v443.Y) then
            v445 = Vector3.new(0, -1, 0, 0);
        elseif v14.fuzzyCompare(v444.Z, v443.Z) then
            v445 = Vector3.new(0, 0, 1, 0);
        elseif v14.fuzzyCompare(v444.Z, -v443.Z) then
            v445 = Vector3.new(0, 0, -1, 0);
        end;
        return v441.CFrame:pointToWorldSpace(v445) - v441.CFrame.p;
    end;
end;
getNormalFromClosestPoint = function(v446, v447) --[[ Line: 2019 ]] --[[ Name: getNormalFromClosestPoint ]]
    -- upvalues: v10 (copy)
    if not v446 or not v447 then
        return nil;
    else
        local v448 = v446.CFrame:pointToObjectSpace(v447);
        local v449 = v446.Size / 2;
        local v450 = v10.absVector3(v448);
        local v451 = v449.x / v449.z;
        local v452 = v450.x / v450.z;
        local v453 = Vector3.new(0, 0, 0, 0);
        v453 = if v451 < v452 then if v449.x / v449.y < v450.x / v450.y then if v448.x < 0 then Vector3.new(-1, 0, 0, 0) else Vector3.new(1, 0, 0, 0) else if v448.y < 0 then Vector3.new(0, -1, 0, 0) else Vector3.new(0, 1, 0, 0) else if v449.y / v449.z < v450.y / v450.z then if v448.y < 0 then Vector3.new(0, -1, 0, 0) else Vector3.new(0, 1, 0, 0) else if v448.z < 0 then Vector3.new(0, 0, -1, 0) else Vector3.new(0, 0, 1, 0);
        return (v446.CFrame:pointToWorldSpace(v453) - v446.CFrame.p).Unit;
    end;
end;
normalExistsInTable = function(v454, v455) --[[ Line: 2070 ]] --[[ Name: normalExistsInTable ]]
    for _, v457 in pairs(v454) do
        if v457[2] == v455 then
            return true;
        end;
    end;
    return false;
end;
getNormalOfCollidingFace = function(v458, v459, v460) --[[ Line: 2079 ]] --[[ Name: getNormalOfCollidingFace ]]
    local v461 = v460 * -1;
    return v458 + (v459 - v458):Dot(v461) / v461:Dot(v461) * v461;
end;
sanitizeFloat = function(v462) --[[ Line: 2095 ]] --[[ Name: sanitizeFloat ]]
    return v462 > 0 and math.ceil(v462 * 1000000 - 0.5) / 1000000 or math.floor(v462 * 1000000 + 0.5) / 1000000;
end;
sanitizeVector3 = function(v463) --[[ Line: 2100 ]] --[[ Name: sanitizeVector3 ]]
    return (Vector3.new(sanitizeFloat(v463.x), sanitizeFloat(v463.y), sanitizeFloat(v463.z)));
end;
sanitizeCFrame = function(v464) --[[ Line: 2104 ]] --[[ Name: sanitizeCFrame ]]
    local v465, v466, v467, v468, v469, v470, v471, v472, v473, v474, v475, v476 = v464:components();
    return CFrame.new(sanitizeFloat(v465), sanitizeFloat(v466), sanitizeFloat(v467), v468, v469, v470, v471, v472, v473, v474, v475, v476);
end;
local v477 = true;
local v478 = false;
movePart = function(v479, v480) --[[ Line: 2112 ]] --[[ Name: movePart ]]
    -- upvalues: v17 (copy), v60 (ref), v91 (ref), v478 (ref), v26 (ref), l_RunService_0 (copy), v96 (ref), v97 (ref), v74 (ref), v477 (ref), v16 (copy), v88 (ref), v65 (ref), v12 (copy), v66 (ref), v11 (copy), v9 (copy), v10 (copy), v14 (copy), v15 (copy)
    v17.setAllAdornVisibility(false);
    if not v60 then
        return;
    elseif not v91 then
        return;
    else
        v478 = true;
        v26 = true;
        local v481 = getCurrentSelectionWithChildren();
        if l_RunService_0:IsRunning() and not v96 then
            v96 = true;
            for v482, v483 in ipairs(v481) do
                v97[v482] = v483.Anchored;
                v483.Anchored = true;
            end;
        end;
        local v484 = getBestExtentRotation();
        if not v484 or not selectedPart then
            return;
        else
            setPartRotation(v91, #v481 > 1 and v74 or v484);
            if v477 then
                v477 = false;
                v16.setPartCFrameToExtents(v91, v91.CFrame);
            end;
            local l_CFrame_5 = v91.CFrame;
            if not v88 then
                local v486 = v65.CFrame:pointToObjectSpace(v479 + v91.Position) * Vector3.new(1, 0, 1, 0);
                v479 = v65.CFrame:pointToWorldSpace(v486) - v65.Position;
            end;
            local v487 = v12.getFilteredSelectionMetapart();
            setPartPosition(v91, v66.p + v479);
            local v488 = v12.getFilteredSelection();
            workspace:UnjoinFromOutsiders(v488);
            v488 = v74:toObjectSpace(v91.CFrame);
            local v489 = {};
            local _ = selectedPart.Size / 2;
            local v491 = v91.Size / 2;
            v489[1] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(-1, -1, -1, 0)));
            v489[2] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(-1, -1, 1, 0)));
            v489[3] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(-1, 1, -1, 0)));
            v489[4] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(-1, 1, 1, 0)));
            v489[5] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(1, -1, -1, 0)));
            v489[6] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(1, -1, 1, 0)));
            v489[7] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(1, 1, -1, 0)));
            v489[8] = v74:pointToObjectSpace(v91.CFrame:pointToWorldSpace(v491 * Vector3.new(1, 1, 1, 0)));
            local v492 = 100;
            local v493 = 100;
            local v494 = 100;
            local v495 = 0;
            local v496 = 0;
            local v497 = 0;
            for v498 = 1, #v489 do
                local v499 = v489[v498].x - roundToNearestGrid(v489[v498].x);
                local v500 = v489[v498].y - roundToNearestGrid(v489[v498].y);
                local v501 = v489[v498].z - roundToNearestGrid(v489[v498].z);
                if math.abs(v499) < v492 then
                    v492 = math.abs(v499);
                    v495 = v499;
                end;
                if math.abs(v500) < v493 then
                    v493 = math.abs(v500);
                    v496 = v500;
                end;
                if math.abs(v501) < v494 then
                    v494 = math.abs(v501);
                    v497 = v501;
                end;
            end;
            local v502 = Vector3.new(v495, v496, v497) * Vector3.new(1, 0, 1, 0);
            v488 = v488 - sanitizeVector3(v502);
            v488 = sanitizeCFrame(v488);
            if v480 and not v88 then
                local v503 = v65.CFrame:pointToWorldSpace((Vector3.new(0, 1, 0, 0))) - v65.Position;
                setPartPosition(v91, v74:toWorldSpace(v488).p);
                if not originalDragPartOrientation then
                    return;
                else
                    setPartRotation(v91, #v481 > 1 and v74 or originalDragPartOrientation);
                    local l_CFrame_6 = v91.CFrame;
                    table.insert(v481, v91);
                    v91.Parent = workspace;
                    v91.CFrame = l_CFrame_5;
                    v91.CFrame = l_CFrame_6;
                    if v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) then
                        local l_Unit_10 = (v91.CFrame.p - l_CFrame_5.p).Unit;
                        if l_Unit_10.x ~= l_Unit_10.x then
                            l_Unit_10 = Vector3.new(0, 0, 0, 0);
                        end;
                        local v506 = {};
                        local l_v91_0 = v91;
                        local v508 = l_Unit_10 * -1;
                        v9.SafeMove(l_v91_0, v481, v508);
                        if v10.distanceVector3(l_CFrame_5.p, l_CFrame_6.p) <= v10.distanceVector3(v91.CFrame.p, l_CFrame_6.p) then
                            v91.CFrame = l_CFrame_5;
                        end;
                        l_v91_0 = v91.CFrame;
                        v91.CFrame = v91.CFrame + l_Unit_10 * 1.0E-4;
                        v508 = 0;
                        while not v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) and v508 < 100 do
                            v91.CFrame = v91.CFrame + l_Unit_10 * 1.0E-4;
                            v508 = v508 + 1;
                        end;
                        local _ = v91.CFrame;
                        local v510 = v11.filterOutItems(v481, v91:GetTouchingParts());
                        local v511 = {};
                        local _ = tick();
                        for _, v514 in pairs(v510) do
                            table.insert(v511, v514.CFrame - v514.CFrame.p);
                            local v515 = getNormalOfCollidingFace(v91.CFrame.p, v514.CFrame.p, v503);
                            local l_Unit_11 = getNormalFromClosestPoint(v514, v515).Unit;
                            l_Unit_11 = l_Unit_11 - l_Unit_11:Dot(v503.Unit) * v503.Unit;
                            l_Unit_11 = Vector3.new(v14.fuzzyCompare(0, l_Unit_11.x) and 0 or l_Unit_11.x, v14.fuzzyCompare(0, l_Unit_11.y) and 0 or l_Unit_11.y, v14.fuzzyCompare(0, l_Unit_11.z) and 0 or l_Unit_11.z);
                            l_Unit_11 = v15.roundVector3ToNearest(l_Unit_11, 1.0E-4);
                            if not normalExistsInTable(v506, l_Unit_11) then
                                table.insert(v506, {
                                    v514, 
                                    l_Unit_11
                                });
                            end;
                        end;
                        local _ = tick();
                        local v518 = {};
                        local v519 = {};
                        for _, v521 in pairs(v506) do
                            v91.CFrame = l_CFrame_5;
                            local v522, v523 = v16.getPartBounds(v91, v521[1].CFrame);
                            v522 = v521[1].CFrame:pointToObjectSpace(v522);
                            v523 = v521[1].CFrame:pointToObjectSpace(v523);
                            v91.CFrame = l_CFrame_6;
                            local v524, v525 = v16.getPartBounds(v91, v521[1].CFrame);
                            v524 = v521[1].CFrame:pointToObjectSpace(v524);
                            v525 = v521[1].CFrame:pointToObjectSpace(v525);
                            local v526, v527 = v16.unionVector3NoSpaceChange(v524, v522, v523);
                            v526, v527 = v16.unionVector3NoSpaceChange(v525, v526, v527);
                            v522 = v526;
                            v523 = v527;
                            v526 = l_v91_0.p;
                            setPartPosition(v91, v521[1].CFrame.p);
                            v527 = v91;
                            local v528 = v521[2];
                            local v529 = {
                                v521[1]
                            };
                            v9.SafeMove(v527, v11.createIgnoreListGivenWhiteList(game.Workspace, v529), v528);
                            v527 = v91.CFrame.p;
                            v528 = (v15.roundVector3ToNearest(v526, 1.0E-4) - v15.roundVector3ToNearest(v527, 1.0E-4)).Unit;
                            if v10.distanceVector3(l_CFrame_6.p, l_v91_0.p - v528) < v10.distanceVector3(l_CFrame_6.p, l_v91_0.p + v528) then
                                v528 = v528 * -1;
                            end;
                            v528 = v528 - v528:Dot(v503.Unit) * v503.Unit;
                            v528 = getClosestNormalFromPart(v521[1], v528);
                            v528 = if #v528 > 0 then v528[1] else nil;
                            v528 = Vector3.new(v14.fuzzyCompare(0, v528.x) and 0 or v528.x, v14.fuzzyCompare(0, v528.y) and 0 or v528.y, v14.fuzzyCompare(0, v528.z) and 0 or v528.z);
                            setPartPosition(v91, l_v91_0.p - v521[2]);
                            v529 = v91;
                            local l_v528_0 = v528;
                            local v531 = {
                                v521[1]
                            };
                            v9.SafeMove(v529, v11.createIgnoreListGivenWhiteList(game.Workspace, v531), l_v528_0);
                            v529 = v10.distanceVector3(v91.CFrame.p, l_CFrame_6);
                            v91.CFrame = l_CFrame_6;
                            l_v528_0 = v91;
                            v531 = v521[2];
                            local v532 = {
                                v521[1]
                            };
                            v9.SafeMove(l_v528_0, v11.createIgnoreListGivenWhiteList(game.Workspace, v532), v531);
                            l_v528_0 = v10.distanceVector3(v91.CFrame.p, l_v91_0);
                            if l_v528_0 < v529 then
                                v529 = l_v528_0;
                            end;
                            v91.CFrame = l_v91_0;
                            v531 = game.Selection:Get();
                            table.insert(v531, v521[1]);
                            local l_v91_1 = v91;
                            local l_v531_0 = v531;
                            local l_v528_1 = v528;
                            local l_v529_0 = v529;
                            if not l_v531_0 then
                                l_v531_0 = {};
                            end;
                            if not v9.moveUntilCollide(l_v91_1, l_v531_0, l_v528_1, 2.0E-4, l_v529_0) then
                                v532 = v91.CFrame.p;
                                v91.CFrame = l_CFrame_6;
                                l_v91_1 = (v91.CFrame.p - v532).Unit;
                                l_v531_0 = v91;
                                l_v528_1 = v521[2];
                                v9.SafeMove(l_v531_0, v481, l_v528_1);
                            else
                                v532 = v10.distanceVector3(v91.CFrame.p, l_v91_0.p);
                            end;
                            v532 = nil;
                            l_v91_1 = v521[1].CFrame:pointToObjectSpace(v91.CFrame.p);
                            l_v531_0 = vector3LessThanOrEqualTo(l_v91_1, v523);
                            l_v528_1 = vector3GreaterThanOrEqualTo(l_v91_1, v522);
                            if l_v531_0 and l_v528_1 then
                                if not v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) then
                                    table.insert(v518, v91.CFrame.p);
                                else
                                    v532 = v91.CFrame.p;
                                end;
                            end;
                            v91.CFrame = l_CFrame_6;
                            l_v529_0 = v91;
                            local v537 = v521[2];
                            v9.SafeMove(l_v529_0, v481, v537);
                            l_v91_1 = v521[1].CFrame:pointToObjectSpace(v91.CFrame.p);
                            if vector3LessThanOrEqualTo(l_v91_1, v523) and vector3GreaterThanOrEqualTo(l_v91_1, v522) and not v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) then
                                table.insert(v518, v91.CFrame.p);
                            end;
                            l_v529_0 = getDirectedNormalsFromPart(v91, v521[2]);
                            if v532 then
                                for _, v539 in pairs(l_v529_0) do
                                    if not v11.itemExistsInList(v539, v519) then
                                        table.insert(v519, v539);
                                        setPartPosition(v91, v532);
                                        local l_v91_2 = v91;
                                        v9.SafeMove(l_v91_2, v481, v539);
                                        l_v91_1 = v521[1].CFrame:pointToObjectSpace(v91.CFrame.p);
                                        if not v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) then
                                            table.insert(v518, v91.CFrame.p);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        local _ = tick();
                        local l_p_0 = l_CFrame_5.p;
                        local v543 = v10.distanceVector3(l_p_0, l_CFrame_6.p);
                        for _, v545 in pairs(v518) do
                            local v546 = v10.distanceVector3(v545, l_CFrame_6.p);
                            if v546 < v543 then
                                v543 = v546;
                                l_p_0 = v545;
                            end;
                        end;
                        setPartPosition(v91, l_p_0);
                    end;
                    if v10.distanceVector3(v91.CFrame.p, l_CFrame_6.p) > v10.distanceVector3(l_CFrame_5.p, l_CFrame_6.p) then
                        setPartPosition(v91, l_CFrame_5.p);
                    end;
                    if v11.itemsHasItemNotInList(v91:GetTouchingParts(), v481) then
                        local _ = v11.filterOutItems(v481, v91:GetTouchingParts());
                        v91.CFrame = l_CFrame_5;
                    end;
                    v91.Parent = nil;
                end;
            else
                local v548 = v74:pointToWorldSpace(v488.p);
                v548 = sanitizeVector3(v548);
                v91.CFrame = v91.CFrame - v91.CFrame.p + v548;
                if v88 then
                    local _ = v91.CFrame.p;
                    v91.Parent = game.Workspace;
                    local l_v91_3 = v91;
                    local v551 = game.Selection:Get();
                    v9.SafeMove(l_v91_3, v551, (Vector3.new(0, 1, 0, 0)));
                    v91.Parent = nil;
                    l_v91_3 = v91.CFrame.p;
                    v88 = false;
                end;
            end;
            v487.TranslateFromTo(l_CFrame_5, v91.CFrame);
            return;
        end;
    end;
end;
planeDrag = function() --[[ Line: 2500 ]] --[[ Name: planeDrag ]]
    -- upvalues: v17 (copy), l_Selection_0 (copy), v47 (ref), v46 (ref), v14 (copy), v58 (ref), v59 (ref), v10 (copy)
    v17.setAllAdornVisibility(false);
    local v552 = nil;
    local l_UnitRay_1 = l_Selection_0.UnitRay;
    local v554 = RaycastParams.new();
    v554.BruteForceAllSlow = true;
    local v555 = game:GetService("Workspace"):Raycast(l_UnitRay_1.Origin, l_UnitRay_1.Direction * 800, v554);
    if not v555 then
        return;
    elseif v555.Instance:IsA("Terrain") then
        return;
    else
        v552 = v555.Instance;
        v47.Visible = true;
        local v556 = v552 and rayBoxIntersection(l_UnitRay_1, v552.CFrame, v552.Size);
        if v552 and v556 then
            local v557 = v552.CFrame:pointToObjectSpace(v556);
            local v558 = nil;
            local v559 = nil;
            local v560 = nil;
            local v561 = v552.Size / 2;
            local v562 = Vector3.new(50, 50, 0.009999999776482582, 0);
            local l_v556_0 = v556;
            v46.CFrame = v552.CFrame;
            v46.CFrame = v46.CFrame * CFrame.Angles(0, 1.5707963267948966, 0);
            if v14.fuzzyCompare(math.abs(v557.X), v561.X) then
                v558 = v557 + Vector3.new(0, 0, 1, 0);
                v559 = v557 + Vector3.new(0, 1, 1, 0);
                v560 = v557 + Vector3.new(0, 1, 0, 0);
                if v14.fuzzyCompare(v557.X, v561.X) then
                    v562 = Vector3.new(v552.Size.z, v552.Size.y, 0.01);
                    l_v556_0 = Vector3.new(v561.x, 0, 0);
                else
                    v562 = Vector3.new(v552.Size.z, v552.Size.y, 0.01);
                    l_v556_0 = Vector3.new(-v561.x, 0, 0);
                end;
            elseif v14.fuzzyCompare(math.abs(v557.Y), v561.Y) then
                v558 = v557 + Vector3.new(0, 0, 1, 0);
                v559 = v557 + Vector3.new(1, 0, 1, 0);
                v560 = v557 + Vector3.new(1, 0, 0, 0);
                v46.CFrame = v46.CFrame * CFrame.Angles(1.5707963267948966, 0, 0);
                if v14.fuzzyCompare(v557.Y, v561.Y) then
                    v562 = Vector3.new(v552.Size.z, v552.Size.x, 0.01);
                    l_v556_0 = Vector3.new(0, v561.y, 0);
                else
                    v562 = Vector3.new(v552.Size.z, v552.Size.x, 0.01);
                    l_v556_0 = Vector3.new(0, -v561.y, 0);
                end;
            elseif v14.fuzzyCompare(math.abs(v557.Z), v561.Z) then
                v558 = v557 + Vector3.new(0, 1, 0, 0);
                v559 = v557 + Vector3.new(1, 1, 0, 0);
                v560 = v557 + Vector3.new(1, 0, 0, 0);
                v46.CFrame = v46.CFrame * CFrame.Angles(0, 1.5707963267948966, 0);
                if v14.fuzzyCompare(v557.Z, v561.Z) then
                    v562 = Vector3.new(v552.Size.x, v552.Size.y, 0.01);
                    l_v556_0 = Vector3.new(0, 0, v561.z);
                else
                    v562 = Vector3.new(v552.Size.x, v552.Size.y, 0.01);
                    l_v556_0 = Vector3.new(0, 0, -v561.z);
                end;
            end;
            if v558 and v559 and v560 then
                local v564 = v552.CFrame:pointToObjectSpace(v556) - v557;
                local v565 = v558 + v564;
                local v566 = v559 + v564;
                local v567 = v560 + v564;
                v558 = v552.CFrame:pointToWorldSpace(v558);
                v559 = v552.CFrame:pointToWorldSpace(v559);
                v560 = v552.CFrame:pointToWorldSpace(v560);
                v565 = v552.CFrame:pointToWorldSpace(v565);
                v566 = v552.CFrame:pointToWorldSpace(v566);
                v567 = v552.CFrame:pointToWorldSpace(v567);
                v58 = createPlane(v558, v559, v560);
                v59 = createPlane(v565, v566, v567);
                l_v556_0 = v552.CFrame:pointToWorldSpace(l_v556_0);
                v46.CFrame = v46.CFrame - v46.CFrame.p + l_v556_0;
                v46.Size = v562;
                v47.Size = v562;
            end;
            local v568 = v552.Size * 0.5;
            local v569 = v557 / v10.absVector3(v557);
            local v570 = v552.CFrame - v552.CFrame.p + v552.CFrame:pointToWorldSpace(v568 * v569);
            v17.drawPlaneCenter(v570);
        end;
        return;
    end;
end;
freeDrag = function() --[[ Line: 2621 ]] --[[ Name: freeDrag ]]
    -- upvalues: v89 (ref), v48 (ref), v56 (ref), l_StudioService_0 (ref), v19 (copy), l_Selection_0 (copy), v78 (ref), v59 (ref), v88 (ref), v58 (ref), v10 (copy), v14 (copy), v12 (copy), v13 (copy), v57 (ref), l_plugin_0 (copy), v54 (ref)
    if v89 then
        selectPart();
        v89 = false;
        return;
    elseif v48 then
        planeDrag();
        return;
    elseif not v56 then
        l_StudioService_0 = true;
        v19.updateRubberBand(Vector2.new(l_Selection_0.X, l_Selection_0.Y));
        return;
    else
        v78 = nil;
        local l_UnitRay_2 = l_Selection_0.UnitRay;
        l_UnitRay_2 = Ray.new(l_UnitRay_2.Origin, l_UnitRay_2.Direction * 800);
        if not v59 then
            return;
        else
            local v572 = rayPlaneIntersection(l_UnitRay_2, v59);
            if not v88 then
                local v573 = (v572 - l_UnitRay_2.Origin) / l_UnitRay_2.Unit.Direction;
                if v573.X < 0 or v573.Y < 0 or v573.Z < 0 then
                    return;
                end;
            end;
            if v88 then
                v572 = rayPlaneIntersection(l_UnitRay_2, v58);
                local v574 = RaycastParams.new();
                v574.FilterDescendantsInstances = game.Selection:Get();
                v574.BruteForceAllSlow = true;
                local v575 = workspace:Raycast(l_UnitRay_2.Origin, l_UnitRay_2.Direction, v574);
                local v576 = nil;
                v576 = if v575 then v575.Position else l_UnitRay_2.Origin + l_UnitRay_2.Direction;
                local l_p_2 = workspace.CurrentCamera.CoordinateFrame.p;
                local v578 = v10.distanceVector3(v576, l_p_2);
                local v579 = v10.distanceVector3(v572, l_p_2);
                if v14.fuzzyCompareVector3(l_UnitRay_2.Direction.Unit, (l_p_2 - v572).Unit) then
                    v579 = 800;
                end;
                if v579 < 2 then
                    v579 = 800;
                end;
                if v579 > 500 and v578 > 500 then
                    v572 = l_p_2 + l_UnitRay_2.Direction.Unit * 30;
                end;
            end;
            local v580 = Vector3.new(0, 0, 0, 0);
            if selectedPart then
                v580 = selectedPart.Position;
            else
                local v581 = v12.getFilteredSelection();
                if not v581 or #v581 == 0 then
                    return;
                else
                    selectedPart = v13.convertToPart(v581[1]);
                end;
            end;
            if not v57 then
                return;
            else
                if not l_StudioService_0 then
                    analyticsRecordFreeformDragBegin();
                    l_StudioService_0 = true;
                end;
                analyticsRecordFreeformDragUpdate(v572);
                movePart(v572 - v57, l_plugin_0.CollisionEnabled);
                v54 = v54 + (selectedPart.Position - v580);
                updateInvisiblePart();
                return;
            end;
        end;
    end;
end;
selectDragPlane = function(v582) --[[ Line: 2718 ]] --[[ Name: selectDragPlane ]]
    -- upvalues: v17 (copy), l_Selection_0 (copy), v27 (copy), v60 (ref), v61 (ref), v62 (ref), v63 (ref), v70 (ref), v71 (ref), v72 (ref), v73 (ref), v14 (copy), v67 (ref), v68 (ref), v69 (ref), v58 (ref), v59 (ref), v10 (copy), v74 (ref), v12 (copy)
    local v583 = nil;
    if v17.isOverPlaneSelect() then
        v17.setPlaneSelectingMode(false);
        return;
    else
        v583 = l_Selection_0.UnitRay;
        v583 = Ray.new(v583.Origin, v583.Direction * 800);
        local v584 = nil;
        local v585 = nil;
        local v586 = nil;
        if v582 then
            v584 = Instance.new("Part", v27);
            v584.Size = Vector3.new(100, 1, 100, 0);
            v584.CFrame = CFrame.new(0, -0.5, 0);
            v586 = Vector3.new(0, 0, 0, 0);
            v585 = Vector3.new(0, 1, 0, 0);
        else
            local v587 = RaycastParams.new();
            v587.BruteForceAllSlow = true;
            local v588 = game.Workspace:Raycast(v583.Origin, v583.Direction, v587);
            if v588 then
                v584 = v588.Instance;
            end;
        end;
        if not v584 then
            v17.setPlaneSelectingMode(false);
            return;
        else
            if not v582 then
                v586 = rayBoxIntersection(v583, v584.CFrame, v584.Size);
            end;
            if v60 then
                v60:Destroy();
            end;
            v60 = v584;
            v61 = v586;
            local v589 = Instance.new("Part", v27);
            v589.Size = v60.Size;
            v589.CFrame = v60.CFrame;
            v60 = v589;
            v62 = v60.CFrame:toWorldSpace(CFrame.new(v60.Size / 2));
            v63 = nil;
            local v590 = nil;
            local v591 = nil;
            if v60 and v61 then
                v590 = v60.CFrame:pointToObjectSpace(v61);
                local v592 = nil;
                local v593 = nil;
                local v594 = nil;
                local v595 = nil;
                local v596 = nil;
                local v597 = nil;
                local v598 = nil;
                v70 = v595;
                v71 = v596;
                v72 = v597;
                v73 = v598;
                v591 = v60.Size / 2;
                if v14.fuzzyCompare(math.abs(v590.X), v591.X) then
                    v592 = v590 + Vector3.new(0, 0, 1, 0);
                    v593 = v590 + Vector3.new(0, 1, 1, 0);
                    v594 = v590 + Vector3.new(0, 1, 0, 0);
                    v70 = Vector3.new(v590.X, 0, 0) + Vector3.new(0, -1, 1, 0) * v591;
                    v71 = Vector3.new(v590.X, 0, 0) + Vector3.new(0, 1, 1, 0) * v591;
                    v72 = Vector3.new(v590.X, 0, 0) + Vector3.new(0, -1, -1, 0) * v591;
                    v73 = Vector3.new(v590.X, 0, 0) + Vector3.new(0, 1, -1, 0) * v591;
                    if v14.fuzzyCompare(v590.X, v591.X) then
                        v63 = 3;
                    else
                        v63 = 2;
                    end;
                elseif v14.fuzzyCompare(math.abs(v590.Y), v591.Y) then
                    v592 = v590 + Vector3.new(0, 0, 1, 0);
                    v593 = v590 + Vector3.new(1, 0, 1, 0);
                    v594 = v590 + Vector3.new(1, 0, 0, 0);
                    v70 = Vector3.new(0, v590.Y, 0) + Vector3.new(-1, 0, 1, 0) * v591;
                    v71 = Vector3.new(0, v590.Y, 0) + Vector3.new(1, 0, 1, 0) * v591;
                    v72 = Vector3.new(0, v590.Y, 0) + Vector3.new(-1, 0, -1, 0) * v591;
                    v73 = Vector3.new(0, v590.Y, 0) + Vector3.new(1, 0, -1, 0) * v591;
                    if v14.fuzzyCompare(v590.Y, v591.Y) then
                        v63 = 0;
                    else
                        v63 = 1;
                    end;
                elseif v14.fuzzyCompare(math.abs(v590.Z), v591.Z) then
                    v592 = v590 + Vector3.new(0, 1, 0, 0);
                    v593 = v590 + Vector3.new(1, 1, 0, 0);
                    v594 = v590 + Vector3.new(1, 0, 0, 0);
                    v70 = Vector3.new(0, 0, v590.Z) + Vector3.new(-1, 1, 0, 0) * v591;
                    v71 = Vector3.new(0, 0, v590.Z) + Vector3.new(1, 1, 0, 0) * v591;
                    v72 = Vector3.new(0, 0, v590.Z) + Vector3.new(-1, -1, 0, 0) * v591;
                    v73 = Vector3.new(0, 0, v590.Z) + Vector3.new(1, -1, 0, 0) * v591;
                    if v14.fuzzyCompare(v590.Z, v591.Z) then
                        v63 = 5;
                    else
                        v63 = 4;
                    end;
                end;
                if v592 and v593 and v594 then
                    v67 = v592;
                    v68 = v593;
                    v69 = v594;
                    v592 = v60.CFrame:pointToWorldSpace(v592);
                    v593 = v60.CFrame:pointToWorldSpace(v593);
                    v594 = v60.CFrame:pointToWorldSpace(v594);
                    v58 = createPlane(v592, v593, v594);
                    v59 = nil;
                end;
            end;
            local v599 = v590 / v10.absVector3(v590) * -1;
            v599 = v10.cleanVector3(v599);
            v74 = v60.CFrame - (v60.CFrame:pointToWorldSpace(v591 * v599) - v60.CFrame.p);
            if v63 == 2 or v63 == 3 then
                v74 = v74 * CFrame.Angles(0, 0, 1.5707963267948966);
            elseif v63 == 5 or v63 == 4 then
                v74 = v74 * CFrame.Angles(1.5707963267948966, 0, 0);
            end;
            updateInvisiblePart();
            local v600 = v12.getFilteredSelectionMetapart();
            if v600 then
                v600.UpdatePlaneCFrame = v74;
            end;
            v17.setPlaneSelectingMode(false);
            return;
        end;
    end;
end;
removeDragPart = function() --[[ Line: 2874 ]] --[[ Name: removeDragPart ]]
    -- upvalues: v27 (copy)
    local v601 = {};
    local v602 = false;
    local v603 = game:GetService("Selection"):Get();
    for _, v605 in ipairs(v603) do
        if v605.Parent ~= v27 and v605.Name ~= "DragParte1b1aec5" and v605.Name ~= "InvisibleParte1b1aec5" then
            table.insert(v601, v605);
        else
            v605.Parent = game:GetService("CoreGui");
            v602 = true;
        end;
    end;
    if v602 then
        game:GetService("Selection"):Set(v601);
    end;
end;
releasePart = function() --[[ Line: 2892 ]] --[[ Name: releasePart ]]
    -- upvalues: v477 (ref), v226 (ref), v96 (ref), v97 (ref), v19 (copy), v56 (ref), v17 (copy), v54 (ref), v87 (ref), v478 (ref), v12 (copy), l_plugin_0 (copy), v90 (ref), v88 (ref), v91 (ref), v92 (ref), v48 (ref), v47 (ref), v46 (ref), v57 (ref)
    v477 = true;
    v226 = 0;
    if v96 then
        local v606 = getCurrentSelectionWithChildren();
        v96 = false;
        for v607, v608 in ipairs(v606) do
            v608.Anchored = v97[v607];
        end;
        v97 = {};
    end;
    v19.finishRubberbandDrag();
    recreateAdornment();
    setWaypoint();
    if v56 then
        if #game.Selection:Get() == 1 and game.Selection:Get()[1]:IsA("BasePart") then
            v17.setAllAdornVisibility(true);
        end;
        v54 = Vector3.new(0, 0, 0, 0);
        v87 = nil;
        if v478 then
            local v609 = v12.getFilteredSelection();
            workspace:JoinToOutsiders(v609, l_plugin_0:GetJoinMode());
        end;
    elseif v90 then
        local v610 = v12.getFilteredSelection();
        workspace:JoinToOutsiders(v610, l_plugin_0:GetJoinMode());
    end;
    v478 = false;
    v88 = false;
    v90 = false;
    v56 = false;
    originalDragPartOrientation = nil;
    if v91 then
        v92.Visible = false;
        v91.Parent = nil;
        v92.Adornee = v91;
        v92.Size = v92.Adornee.Size;
        v92.AlwaysOnTop = true;
        v92.CFrame = v91.CFrame - v91.CFrame.p;
    end;
    if v48 and v17.isPlaneSelectingModeOn() then
        selectDragPlane();
        v48 = false;
    end;
    if v47 then
        v47:Destroy();
        v47 = nil;
    end;
    if v46 then
        v46:Destroy();
        v46 = nil;
    end;
    v57 = nil;
end;
grabHandle = function(v611, v612) --[[ Line: 2961 ]] --[[ Name: grabHandle ]]
    -- upvalues: v55 (ref), v51 (ref), v12 (copy), v53 (ref), v52 (ref), v66 (ref), v65 (ref), v76 (ref)
    if not v612 then
        return;
    else
        v55 = v612;
        v51 = Vector3.new(0, 0, 0, 0);
        if v611 ~= 11 and v611 ~= 12 and v611 ~= 13 and v611 ~= 14 then
            updateDragPart();
        end;
        local v613 = v12.getFilteredSelectionMetapart();
        if not v613 then
            return;
        else
            v53 = v613.CFrame;
            v52 = v613.Size;
            v66 = v65.CFrame;
            v76 = nil;
            preUpdatePart();
            return;
        end;
    end;
end;
releaseHandle = function() --[[ Line: 2987 ]] --[[ Name: releaseHandle ]]
    -- upvalues: v270 (ref), v226 (ref), v17 (copy), v94 (copy), v12 (copy), l_plugin_0 (copy), v55 (ref), v51 (ref), v52 (ref), v53 (ref), v66 (ref)
    v270 = nil;
    v226 = 0;
    local v614 = v17.getCurrentHandle();
    if v614 == 0 then
        return;
    else
        if v614 ~= 14 then
            analyticsSendHandleDragged(v94[v614]);
        end;
        local v615 = v12.getFilteredSelection();
        workspace:JoinToOutsiders(v615, l_plugin_0:GetJoinMode());
        v55 = nil;
        v51 = nil;
        v52 = nil;
        v53 = nil;
        v66 = nil;
        return;
    end;
end;
recreateAdornment = function() --[[ Line: 3010 ]] --[[ Name: recreateAdornment ]]
    -- upvalues: v26 (ref), v65 (ref), v77 (ref), v17 (copy), v12 (copy), v127 (copy)
    if not v26 then
        return;
    else
        v26 = false;
        if not v65 then
            v65 = Instance.new("Part", nil);
            v65.Name = "InvisibleParte1b1aec5";
            v65.TopSurface = Enum.SurfaceType.Smooth;
            v65.BottomSurface = Enum.SurfaceType.Smooth;
            v65.Archivable = false;
            v65.Transparency = 1;
        end;
        if not v77 then
            v77 = Instance.new("Part");
        end;
        v17.adornInstanceWithTranslate(v65);
        v17.adornInstanceWithPlane(v65);
        local v616 = v12.getFilteredSelection();
        if #v616 > 0 then
            v17.setPlaneVisibility(true);
            if #v616 == 1 and v616[1]:IsA("BasePart") then
                v17.adornInstanceWithScale(v616[1]);
            else
                v17.setScaleAdornVisibility(false);
            end;
        end;
        v127();
        updateInvisiblePart();
        return;
    end;
end;
isInSelection = function(v617) --[[ Line: 3047 ]] --[[ Name: isInSelection ]]
    if not v617 then
        return nil;
    else
        local v618 = game.Selection:Get();
        for _, v620 in ipairs(v618) do
            if v620 == v617 then
                return true;
            end;
        end;
        return false;
    end;
end;
getHighestModelParent = function(v621) --[[ Line: 3062 ]] --[[ Name: getHighestModelParent ]]
    if not v621 then
        return nil;
    elseif v621 == game.Workspace then
        return nil;
    else
        local v622 = getHighestModelParent(v621.Parent);
        if v622 ~= nil then
            return v622;
        elseif v621:IsA("Model") then
            return v621;
        else
            return nil;
        end;
    end;
end;
getPVInstanceForPart = function(v623) --[[ Line: 3089 ]] --[[ Name: getPVInstanceForPart ]]
    local v624 = getHighestModelParent(v623);
    if v624 ~= nil then
        return v624;
    elseif v623:IsA("PVInstance") and not v623:IsA("Workspace") then
        return v623;
    else
        return nil;
    end;
end;
getTopPVInstance = function(v625) --[[ Line: 3105 ]] --[[ Name: getTopPVInstance ]]
    if not v625 then
        return nil;
    elseif v625.Parent == game.Workspace then
        if v625:IsA("PVInstance") and not v625:IsA("Workspace") then
            return v625;
        else
            return nil;
        end;
    else
        local v626 = getTopPVInstance(v625.Parent);
        if not v626 then
            if v625:IsA("PVInstance") and not v625:IsA("Workspace") then
                return v625;
            else
                return nil;
            end;
        else
            return v626;
        end;
    end;
end;
findPartInstance = function(v627) --[[ Line: 3128 ]] --[[ Name: findPartInstance ]]
    for _, v629 in ipairs(v627) do
        if v629:IsA("BasePart") then
            return v629;
        end;
    end;
    for _, v631 in ipairs(v627) do
        local v632 = findPartInstance(v631:GetChildren());
        if v632 then
            return v632;
        end;
    end;
    return nil;
end;
isAncestorSelected = function(v633) --[[ Line: 3145 ]] --[[ Name: isAncestorSelected ]]
    -- upvalues: v11 (copy)
    if not v633.Parent then
        return nil;
    elseif v11.itemExistsInList(v633.Parent, game.Selection:Get()) then
        return v633.Parent;
    else
        return isAncestorSelected(v633.Parent);
    end;
end;
selectPart = function(v634) --[[ Line: 3157 ]] --[[ Name: selectPart ]]
    -- upvalues: v78 (ref), l_Selection_0 (copy), v11 (copy), v88 (ref), v28 (copy), v57 (ref), v67 (ref), v68 (ref), v69 (ref), v13 (copy), v60 (ref), v61 (ref), v59 (ref), v26 (ref), v12 (copy), v6 (copy), v19 (copy)
    v78 = nil;
    local l_UnitRay_3 = l_Selection_0.UnitRay;
    local v636 = RaycastParams.new();
    v636.BruteForceAllSlow = true;
    local v637 = game:GetService("Workspace"):Raycast(l_UnitRay_3.Origin, l_UnitRay_3.Direction * 800, v636);
    local v638 = nil;
    local v639 = nil;
    if v637 then
        v638 = v637.Instance;
        v639 = v637.Position;
    end;
    local v640 = false;
    if v11.itemExistsInList(v638, game.Selection:Get()) then
        v640 = true;
    end;
    if v634 then
        local v641 = findPartInstance(v634);
        v639 = v641.CFrame.p;
        if v641 then
            v638 = v641;
        end;
        if v639.y < 0 then
            v639 = v639 * Vector3.new(1, 0, 1, 0);
        end;
    end;
    if v638 and v638.Locked and not v88 then
        v638 = nil;
    end;
    if v638 and not v28:IsKeyDown(Enum.KeyCode.LeftAlt) and not v640 then
        v638 = isAncestorSelected(v638) or getPVInstanceForPart(v638);
    end;
    local v642 = false;
    if v638 then
        if not isInSelection(v638) then
            if v28:IsKeyDown(Enum.KeyCode.LeftControl) then
                local v643 = game.Selection:Get();
                table.insert(v643, v638);
                game:GetService("Selection"):Set(v643);
            else
                game:GetService("Selection"):Set({
                    v638
                });
            end;
            v642 = true;
        elseif v28:IsKeyDown(Enum.KeyCode.LeftControl) then
            local v644 = {};
            for _, v646 in ipairs(game.Selection:Get()) do
                if v646 ~= v638 then
                    table.insert(v644, v646);
                end;
            end;
            game:GetService("Selection"):Set(v644);
            v642 = true;
        end;
        v57 = v639;
        if v67 and v68 and v69 then
            v638 = v13.convertToPart(v638);
            local v647 = v60.CFrame:pointToObjectSpace(v61);
            local v648 = v60.CFrame:pointToObjectSpace(v639) - v647;
            local v649 = v67 + v648;
            local v650 = v68 + v648;
            local v651 = v69 + v648;
            v649 = v60.CFrame:pointToWorldSpace(v649);
            v650 = v60.CFrame:pointToWorldSpace(v650);
            v651 = v60.CFrame:pointToWorldSpace(v651);
            v59 = createPlane(v649, v650, v651);
            local v652 = v638.CFrame - v638.CFrame.p + v57;
            local v653 = v60.CFrame - v60.CFrame.p;
            local v654 = CFrame.new(v652.p) * v653;
            if v28:IsKeyDown(Enum.KeyCode.LeftShift) then
                v26 = true;
                local v655 = v12.getFilteredSelectionMetapart();
                v655.CFrame = v654:toWorldSpace(v652:toObjectSpace(v655.CFrame));
            end;
        end;
        if v6 then
            task.defer(grabPart);
        else
            grabPart();
        end;
    else
        v19.startRubberbandDrag(Vector2.new(l_Selection_0.X, l_Selection_0.Y));
        if #game.Selection:Get() > 0 then
            v642 = true;
        end;
    end;
    analyticsSendClick(v638, v642);
    recreateAdornment();
end;
waypointChanged = function() --[[ Line: 3272 ]] --[[ Name: waypointChanged ]]
    -- upvalues: l_Workspace_0 (ref), v17 (copy), v127 (copy), v12 (copy)
    removeDragPart();
    if not l_Workspace_0 then
        return;
    else
        v17.resetDragger();
        v127(v12.getFilteredSelection());
        updateInvisiblePart();
        return;
    end;
end;
selectionChanged = function() --[[ Line: 3283 ]] --[[ Name: selectionChanged ]]
    -- upvalues: v26 (ref), v12 (copy), v17 (copy), v19 (copy), v88 (ref), v91 (ref), v52 (ref), v53 (ref), v13 (copy)
    v26 = true;
    v12.updateSelection();
    v17.resetDragger();
    if v19.isRubberBandDragInProgress() then
        return;
    else
        local v656 = v12.getCurrentSelection();
        local v657 = v12.getFilteredSelectionMetapart();
        if #v656 == 0 and v88 then
            v88 = false;
            releasePart();
        end;
        if v91 then
            v91.Parent = nil;
        end;
        if v657 then
            v52 = v657.Size;
            v53 = v657.CFrame;
        end;
        if #v656 == 1 then
            selectedPart = v13.convertToPart(v656[1]);
        end;
        recreateAdornment();
        return;
    end;
end;
onDragEnter = function(v658) --[[ Line: 3318 ]] --[[ Name: onDragEnter ]]
    -- upvalues: v88 (ref), v18 (copy)
    if #v658 == 0 then
        return;
    else
        v88 = true;
        if not v18.getButtonState(v18.Enum.Key.MOUSE_BUTTON1) then
            v18.setButtonState(v18.Enum.Key.MOUSE_BUTTON1, true);
            selectPart(v658);
        end;
        return;
    end;
end;
local function v659() --[[ Line: 3333 ]] --[[ Name: togglePlaneSelection ]]
    -- upvalues: v17 (copy), v48 (ref), v47 (ref), v46 (ref), v27 (copy)
    if v17.isPlaneSelectingModeOn() then
        v17.setPlaneSelectingMode(false);
        v48 = false;
        v47.Visible = false;
        v17.clearExtraAdorns();
        return;
    else
        v17.setPlaneSelectingMode(true);
        v48 = true;
        if not v46 then
            v46 = Instance.new("Part", v27);
            v46.Size = Vector3.new(50, 50, 0.009999999776482582, 0);
            v46.Position = Vector3.new(0, 0, 0, 0);
            v46.Transparency = 1;
        end;
        if not v47 then
            v47 = Instance.new("BoxHandleAdornment", v27);
            v47.Visible = false;
            v47.Adornee = v46;
            v47.Size = v47.Adornee.Size;
            v47.Transparency = 0.6;
            v47.Color3 = Color3.new(0.14901960784313725, 0.5333333333333333, 0.9411764705882353);
        end;
        return;
    end;
end;
keyPress = function(v660, v661) --[[ Line: 3361 ]] --[[ Name: keyPress ]]
    -- upvalues: l_Workspace_0 (ref), v659 (copy), v4 (copy), v28 (copy), v18 (copy), v131 (copy), v132 (copy)
    if v661 then
        return;
    else
        if v660.UserInputType == Enum.UserInputType.Keyboard then
            if v660.UserInputState == Enum.UserInputState.Begin then
                if l_Workspace_0 and v660.KeyCode == Enum.KeyCode.Space then
                    v659();
                end;
                if not v4 and v660.KeyCode == Enum.KeyCode.Five and (v28:IsKeyDown(Enum.KeyCode.LeftControl) or v28:IsKeyDown(Enum.KeyCode.RightControl)) then
                    if not l_Workspace_0 then
                        On();
                        return;
                    else
                        Off();
                        return;
                    end;
                end;
            end;
        elseif l_Workspace_0 and v660.UserInputType == Enum.UserInputType.MouseButton1 then
            if v660.UserInputState == Enum.UserInputState.Begin then
                v18.setButtonState(v18.Enum.Key.MOUSE_BUTTON1, true);
                v131();
                return;
            elseif v660.UserInputState == Enum.UserInputState.End then
                v18.setButtonState(v18.Enum.Key.MOUSE_BUTTON1, v18.Enum.State.UP);
                v132();
            end;
        end;
        return;
    end;
end;
inputChanged = function(v662) --[[ Line: 3395 ]] --[[ Name: inputChanged ]]
    -- upvalues: v18 (copy), v17 (copy), v53 (ref), v12 (copy), v52 (ref)
    if v18.getButtonState(v18.Enum.Key.MOUSE_BUTTON1) and v662.UserInputType == Enum.UserInputType.MouseMovement or v17.isPlaneSelectingModeOn() and v17.getCurrentHandle() == 14 then
        if not v53 then
            local v663 = v12.getFilteredSelectionMetapart();
            if v663 then
                v53 = v663.CFrame;
            end;
        end;
        if not v52 then
            local v664 = v12.getFilteredSelectionMetapart();
            if v664 then
                v52 = v664.Size;
            end;
        end;
        if v53 then
            updatePart();
        end;
    end;
    freeDrag();
end;
local l_updateAdornmentPositions_0 = v17.updateAdornmentPositions;
Off = function() --[[ Line: 3425 ]] --[[ Name: Off ]]
    -- upvalues: l_Workspace_0 (ref), l_plugin_0 (copy), v3 (copy), v79 (ref), v80 (ref), v82 (ref), v83 (ref), v84 (ref), v85 (ref), v86 (ref), v17 (copy)
    if not l_Workspace_0 then
        return;
    else
        l_Workspace_0 = false;
        l_plugin_0:Invoke("setActive", "false");
        if v3 then
            l_plugin_0:Deactivate();
        end;
        v79:disconnect();
        v80:disconnect();
        v82:disconnect();
        v83:disconnect();
        v84:disconnect();
        v85:disconnect();
        v86:disconnect();
        v17.destroyAdorns();
        analyticsSendSession();
        return;
    end;
end;
local function _() --[[ Line: 3454 ]] --[[ Name: getArrowCursor ]]
    -- upvalues: l_RunService_0 (copy), l_ImprovedCursors_0 (copy)
    if l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode() then
        if l_ImprovedCursors_0 then
            return "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png";
        else
            return "rbxasset://textures/advCursor-default.png";
        end;
    else
        return "rbxasset://SystemCursors/Arrow";
    end;
end;
On = function() --[[ Line: 3466 ]] --[[ Name: On ]]
    -- upvalues: l_Workspace_0 (ref), v8 (copy), l_plugin_0 (copy), l_RunService_0 (copy), l_ImprovedCursors_0 (copy), v49 (ref), v17 (copy), v79 (ref), v80 (ref), v82 (ref), v28 (copy), v83 (ref), v84 (ref), v85 (ref), v12 (copy), v127 (copy), l_updateAdornmentPositions_0 (copy), v86 (ref), v26 (ref), v25 (ref)
    if l_Workspace_0 then
        return;
    else
        if v8 then
            task.defer(function() --[[ Line: 3475 ]]
                -- upvalues: l_Workspace_0 (ref), l_plugin_0 (ref), l_RunService_0 (ref), l_ImprovedCursors_0 (ref)
                if l_Workspace_0 then
                    l_plugin_0:GetMouse().Icon = (not l_RunService_0:IsRunning() or l_RunService_0:IsRunMode()) and "rbxasset://SystemCursors/Arrow" or l_ImprovedCursors_0 and "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png" or "rbxasset://textures/advCursor-default.png";
                end;
            end);
        end;
        l_plugin_0:Activate(true);
        l_plugin_0:Invoke("setActive", "true");
        l_Workspace_0 = true;
        if v49 then
            v49:Destroy();
            v49 = nil;
        end;
        v17.initializeAdorns();
        v79 = game:GetService("ChangeHistoryService").OnUndo:connect(waypointChanged);
        v80 = game:GetService("ChangeHistoryService").OnRedo:connect(waypointChanged);
        v82 = v28.InputEnded:connect(keyPress);
        v83 = v28.InputChanged:connect(inputChanged);
        v84 = game:GetService("Selection").SelectionChanged:connect(selectionChanged);
        v85 = game:GetService("RunService").RenderStepped:connect(function() --[[ Line: 3501 ]]
            -- upvalues: v12 (ref), v127 (ref), l_updateAdornmentPositions_0 (ref)
            if v12.getFilteredSelectionMetapart() and v12.getFilteredSelectionMetapart().IsUpdateRequired then
                spawn(function() --[[ Line: 3504 ]]
                    -- upvalues: v12 (ref), v127 (ref)
                    local v667 = v12.getFilteredSelectionMetapart();
                    if v667 then
                        v667.ClearCache();
                    end;
                    updateInvisiblePart();
                    v127();
                end);
            end;
            l_updateAdornmentPositions_0();
        end);
        v86 = l_plugin_0:GetMouse().DragEnter:connect(onDragEnter);
        v26 = true;
        recreateAdornment();
        if not v25 then
            selectDragPlane(true);
        end;
        v25 = true;
        selectionChanged();
        analyticsSessionBegin();
        return;
    end;
end;
l_UserInputService_0 = true;
v81 = v28.InputBegan:connect(keyPress);