local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.ConstraintData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AttachmentMover);
local v7 = require(l_DraggerFramework_0.Utility.DragHelper);
local v8 = require(l_DraggerFramework_0.Utility.roundRotation);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AttachmentToolRenderer);
local v10 = require(l_script_FirstAncestor_0.Src.Util.AttachmentToolAnimator);
local l_EnableConstraintToolGhostAssemblyFeature_0 = game:GetFastFlag("EnableConstraintToolGhostAssemblyFeature");
local l_EnableConstraintToolPartPassthroughFeature_0 = game:GetFastFlag("EnableConstraintToolPartPassthroughFeature");
local l_SimFlipConstraintTool_0 = game:GetFastFlag("SimFlipConstraintTool");
local l_SimFixConstraintSelection_0 = game:GetFastFlag("SimFixConstraintSelection");
local l_SimMultipleConstraintMode_0 = game:GetFastFlag("SimMultipleConstraintMode");
local l_SimUseExistingAttachmentName_0 = game:GetFastFlag("SimUseExistingAttachmentName");
local l_SimPreserveOrientationOnFace_0 = game:GetFastFlag("SimPreserveOrientationOnFace");
local l_SimPreserveFirstAttachmentOrientation_0 = game:GetFastFlag("SimPreserveFirstAttachmentOrientation");
local l_SimConstraintToolRuntimeUndoFix_0 = game:GetFastFlag("SimConstraintToolRuntimeUndoFix");
local l_SimTwoAttachmentFixOutputSpam_0 = game:GetFastFlag("SimTwoAttachmentFixOutputSpam");
local v21 = {};
v21.__index = v21;
local v22 = nil;
local v23 = Color3.fromRGB(255, 255, 0);
local v24 = Color3.fromRGB(255, 170, 0);
local v25 = Color3.fromRGB(0, 255, 0);
local v26 = Color3.fromRGB(255, 0, 0);
local v27 = Color3.fromRGB(121, 172, 255);
local v28 = Color3.fromRGB(255, 0, 0);
local v29 = Color3.fromRGB(108, 107, 107);
local v30 = table.freeze({
    AllowDragSelect = true, 
    ShowLocalSpaceIndicator = false, 
    WasAutoSelected = false, 
    ShowPivotIndicator = false, 
    ShowDragSelect = true
});
local v31 = table.freeze({
    AnalyticsName = true
});
local v32 = table.freeze({
    WeldConstraint = true, 
    NoCollisionConstraint = true
});
local v33 = table.freeze({
    Vector3.new(1, 0, 0, 0), 
    Vector3.new(-1, 0, 0, 0), 
    Vector3.new(0, 1, 0, 0), 
    Vector3.new(0, -1, 0, 0), 
    Vector3.new(0, 0, 1, 0), 
    (Vector3.new(0, 0, -1, 0))
});
local v34 = CFrame.new(0, 0, 0, 0, 1, 0, -1, 0, 0, 0, 0, 1);
if l_SimFlipConstraintTool_0 then
    v34 = CFrame.new(0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, -1);
end;
v21.new = function(v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45) --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v30 (copy), v31 (copy), v6 (copy), v34 (ref), v21 (copy), v9 (copy), v10 (copy), v22 (ref), l_SimMultipleConstraintMode_0 (copy)
    for v46, _ in v37 do
        if v30[v46] == nil and v31[v46] == nil then
            error("Unexpected ConstraintToolModel prop `" .. v46 .. "`");
        end;
    end;
    local v48 = {};
    for v49, _ in v31 do
        local v51 = v37[v49];
        if v51 == nil then
            error("Required prop `" .. v49 .. "` missing from ConstraintToolModel props");
        else
            v48[v49] = v51;
        end;
    end;
    for v52, v53 in v30 do
        if v37[v52] ~= nil then
            v48[v52] = v37[v52];
        else
            v48[v52] = v53;
        end;
    end;
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "ConstraintTool";
    l_Folder_0.Parent = game.CoreGui;
    local v55 = setmetatable({
        _draggerContext = v35, 
        _draggerSchema = v36, 
        _modelProps = v48, 
        _closePluginCallback = v38, 
        _requestRenderCallback = v44, 
        _constraintToolVisualsFolder = l_Folder_0, 
        _markViewDirtyCallback = v45, 
        _undoAttachmentStack = v39, 
        _redoAttachmentStack = v40, 
        _plugin = v42, 
        _openedTimestamp = os.clock(), 
        _attachmentMover = v6.new(), 
        _attachmentArrowVisuals = {}, 
        _partPassthroughEnabled = false, 
        _addMultipleConstraintsEnabled = false, 
        _ancestryChangedConnection = nil, 
        _selectionHighlight = nil, 
        _ghostAssembly = nil, 
        _attachmentAdornment = nil, 
        _initialInstanceAdornment = nil, 
        _constraintType = nil, 
        _tiltRotate = v34, 
        _recordingIdentifier = nil, 
        _lastDraggedInstanceDefaultOrientation = nil
    }, v21);
    v55._attachmentToolRenderer = v9.new(v55._draggerContext, v55._draggerSchema, v55);
    v55._attachmentToolAnimator = v10.new(v55);
    v22 = v41;
    if l_SimMultipleConstraintMode_0 then
        v55._addMultipleConstraintsEnabled = v55._draggerContext:getSetting("MultipleConstraintMode") and true or false;
    end;
    v55._mainUndo = v43(v55).undo;
    return v55;
end;
v21._onUndo = function(v56, v57) --[[ Line: 167 ]] --[[ Name: _onUndo ]]
    local v58 = v56._undoAttachmentStack[1];
    if v58 and v58.attachment.Parent and v58.type == "initial" then
        v56:_selectInitialInstance(v58.attachment);
        v56:_updateAttachment();
        return;
    else
        if v57 and v57.attachmentParent then
            v56:_setInitialInstanceTransparency(0, v57.attachmentParent);
        end;
        return;
    end;
end;
v21._onRedo = function(v59, v60) --[[ Line: 178 ]] --[[ Name: _onRedo ]]
    if v60 then
        if v60.type == "initial" then
            v59:_selectInitialInstance(v60.attachment);
            v59:_updateAttachment();
            return;
        else
            v59:_clearInitialInstance();
            v59:_removeConstraintVisuals();
        end;
    end;
end;
v21._createAttachmentAdornment = function(v61) --[[ Line: 190 ]] --[[ Name: _createAttachmentAdornment ]]
    -- upvalues: v25 (copy)
    local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
    l_SphereHandleAdornment_0.AlwaysOnTop = true;
    l_SphereHandleAdornment_0.ZIndex = 1;
    l_SphereHandleAdornment_0.Radius = 0.14;
    l_SphereHandleAdornment_0.Color3 = v25;
    l_SphereHandleAdornment_0.Adornee = workspace.Terrain;
    l_SphereHandleAdornment_0.Parent = v61._constraintToolVisualsFolder;
    v61:_createAttachmentAdornmentArrows(l_SphereHandleAdornment_0);
    return l_SphereHandleAdornment_0;
end;
v21._initAttachmentAdornment = function(v63) --[[ Line: 204 ]] --[[ Name: _initAttachmentAdornment ]]
    -- upvalues: l_Selection_0 (copy)
    v63._attachmentAdornment = v63:_createAttachmentAdornment();
    local v64 = l_Selection_0:Get();
    if #v64 == 1 and v64[1]:IsA("Attachment") then
        v63:_selectInitialInstance(v64[1]);
    end;
end;
v21._initSelectionHighlight = function(v65) --[[ Line: 214 ]] --[[ Name: _initSelectionHighlight ]]
    -- upvalues: v27 (copy), v32 (copy), l_Selection_0 (copy)
    local l_Highlight_0 = Instance.new("Highlight");
    l_Highlight_0.FillTransparency = 1;
    l_Highlight_0.OutlineColor = v27;
    l_Highlight_0.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
    l_Highlight_0.Parent = v65._constraintToolVisualsFolder;
    v65._selectionHighlight = l_Highlight_0;
    if v32[v65._constraintType] then
        local v67 = l_Selection_0:Get();
        if #v67 == 1 and v67[1]:IsA("BasePart") then
            v65:_selectInitialInstance(v67[1]);
        end;
    end;
end;
v21._createAttachmentAdornmentArrows = function(v68, v69) --[[ Line: 232 ]] --[[ Name: _createAttachmentAdornmentArrows ]]
    -- upvalues: v23 (copy), v24 (copy)
    local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_0.Height = 1;
    l_CylinderHandleAdornment_0.Radius = 0.02;
    l_CylinderHandleAdornment_0.Transparency = 0;
    l_CylinderHandleAdornment_0.AlwaysOnTop = true;
    l_CylinderHandleAdornment_0.ZIndex = 1;
    l_CylinderHandleAdornment_0.Adornee = workspace.Terrain;
    l_CylinderHandleAdornment_0.Color3 = v23;
    l_CylinderHandleAdornment_0.Parent = v68._constraintToolVisualsFolder;
    local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_1.Height = 1;
    l_CylinderHandleAdornment_1.Radius = 0.02;
    l_CylinderHandleAdornment_1.Transparency = 0;
    l_CylinderHandleAdornment_1.AlwaysOnTop = true;
    l_CylinderHandleAdornment_1.ZIndex = 1;
    l_CylinderHandleAdornment_1.Adornee = workspace.Terrain;
    l_CylinderHandleAdornment_1.Color3 = v24;
    l_CylinderHandleAdornment_1.Parent = v68._constraintToolVisualsFolder;
    local l_ConeHandleAdornment_0 = Instance.new("ConeHandleAdornment");
    l_ConeHandleAdornment_0.Height = 0.2;
    l_ConeHandleAdornment_0.Radius = 0.05;
    l_ConeHandleAdornment_0.Transparency = 0;
    l_ConeHandleAdornment_0.AlwaysOnTop = true;
    l_ConeHandleAdornment_0.ZIndex = 1;
    l_ConeHandleAdornment_0.Adornee = workspace.Terrain;
    l_ConeHandleAdornment_0.Color3 = v23;
    l_ConeHandleAdornment_0.Parent = v68._constraintToolVisualsFolder;
    local l_ConeHandleAdornment_1 = Instance.new("ConeHandleAdornment");
    l_ConeHandleAdornment_1.Height = 0.2;
    l_ConeHandleAdornment_1.Radius = 0.05;
    l_ConeHandleAdornment_1.Transparency = 0;
    l_ConeHandleAdornment_1.AlwaysOnTop = true;
    l_ConeHandleAdornment_1.ZIndex = 1;
    l_ConeHandleAdornment_1.Adornee = workspace.Terrain;
    l_ConeHandleAdornment_1.Color3 = v24;
    l_ConeHandleAdornment_1.Parent = v68._constraintToolVisualsFolder;
    v69.Visible = false;
    v69.Visible = true;
    v68._attachmentArrowVisuals[v69] = {
        shaftRight = l_CylinderHandleAdornment_0, 
        shaftTop = l_CylinderHandleAdornment_1, 
        tipRight = l_ConeHandleAdornment_0, 
        tipTop = l_ConeHandleAdornment_1
    };
    v68:_orientAttachmentAdornment(v69, CFrame.new(1e999, 0, 0));
end;
v21._orientAttachmentAdornment = function(v74, v75, v76) --[[ Line: 287 ]] --[[ Name: _orientAttachmentAdornment ]]
    if not v76 then
        v76 = v75:IsA("Attachment") and v75.WorldCFrame or v75.CFrame;
    end;
    local v77 = v74._attachmentArrowVisuals[v75];
    v77.shaftRight.CFrame = v76 * CFrame.Angles(0, -1.5707963267948966, 0) * CFrame.new(0, 0, -v77.shaftRight.Height * 0.15);
    v77.shaftTop.CFrame = v76 * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, 0, -v77.shaftRight.Height * 0.15);
    v77.tipRight.CFrame = v77.shaftRight.CFrame * CFrame.new(0, 0, -v77.shaftRight.Height / 2);
    v77.tipTop.CFrame = v77.shaftTop.CFrame * CFrame.new(0, 0, -v77.shaftTop.Height / 2);
    if v75:IsA("Attachment") then
        v75.WorldCFrame = v76;
        return;
    else
        v75.CFrame = v76;
        return;
    end;
end;
v21.setMouseCursor = function(v78, v79) --[[ Line: 314 ]] --[[ Name: setMouseCursor ]]
    if v78._mouseCursor ~= v79 then
        v78._mouseCursor = v79;
        v78._draggerContext:setMouseIcon(v79);
    end;
end;
v21.render = function(v80) --[[ Line: 321 ]] --[[ Name: render ]]
    -- upvalues: v32 (copy), v4 (copy)
    v80:setMouseCursor("rbxasset://textures/ConstraintCursor.png");
    if v32[v80._constraintType] then
        return;
    else
        return v4.createElement(v4.Portal, {
            target = v80._draggerContext:getGuiParent()
        }, {
            DraggerUI = v4.createElement("Folder", {}, v80._attachmentToolRenderer:render())
        });
    end;
end;
v21.update = function(v81) --[[ Line: 338 ]] --[[ Name: update ]]
    if v81._draggerContext:isSimulating() then
        v81._markViewDirtyCallback();
    end;
    if v81._plugin:GetSelectedRibbonTool() ~= Enum.RibbonTool.None and os.clock() - v81._openedTimestamp > 0.016666666666666666 then
        v81:_processDeselected();
    end;
end;
v21.getSchema = function(v82) --[[ Line: 351 ]] --[[ Name: getSchema ]]
    return v82._draggerSchema;
end;
v21.doesAllowDragSelect = function(v83) --[[ Line: 355 ]] --[[ Name: doesAllowDragSelect ]]
    return v83._modelProps.AllowDragSelect;
end;
v21.shouldShowDragSelect = function(v84) --[[ Line: 359 ]] --[[ Name: shouldShowDragSelect ]]
    return v84._modelProps.ShowDragSelect;
end;
v21.shouldShowLocalSpaceIndicator = function(v85) --[[ Line: 363 ]] --[[ Name: shouldShowLocalSpaceIndicator ]]
    return v85._modelProps.ShowLocalSpaceIndicator;
end;
v21.shouldShowSelectionDot = function(v86) --[[ Line: 367 ]] --[[ Name: shouldShowSelectionDot ]]
    return v86._modelProps.ShowSelectionDot;
end;
v21.shouldUseCollisionTransparency = function(v87) --[[ Line: 371 ]] --[[ Name: shouldUseCollisionTransparency ]]
    return v87._modelProps.UseCollisionsTransparency;
end;
v21.shouldAlignDraggedObjects = function(v88) --[[ Line: 375 ]] --[[ Name: shouldAlignDraggedObjects ]]
    return v88._draggerContext:shouldAlignDraggedObjects();
end;
v21.getRaycastIgnoreList = function(v89) --[[ Line: 379 ]] --[[ Name: getRaycastIgnoreList ]]
    -- upvalues: l_EnableConstraintToolGhostAssemblyFeature_0 (copy)
    local v90 = {};
    if v89._partPassthroughEnabled and v89._initialInstance then
        table.insert(v90, v89._initialInstance.Parent);
    end;
    if l_EnableConstraintToolGhostAssemblyFeature_0 and v89._ghostAssembly then
        table.insert(v90, v89._ghostAssembly);
    end;
    return v90;
end;
v21._setInitialInstanceTransparency = function(v91, v92, v93) --[[ Line: 393 ]] --[[ Name: _setInitialInstanceTransparency ]]
    -- upvalues: v32 (copy)
    local v94 = v93 or v91._initialInstance.Parent;
    if not v94 or v32[v91._constraintType] then
        return;
    else
        v94.LocalTransparencyModifier = v92;
        for _, v96 in v94:GetChildren() do
            if v96:IsA("Decal") then
                v96.LocalTransparencyModifier = v92;
            end;
        end;
        return;
    end;
end;
local function v106(v97) --[[ Line: 411 ]] --[[ Name: axisAlign ]]
    local v98 = table.create(3);
    local v99 = {
        v97.XVector, 
        v97.YVector, 
        v97.ZVector
    };
    local v100 = {
        1, 
        2, 
        3
    };
    table.sort(v100, function(v101, v102) --[[ Line: 421 ]]
        -- upvalues: v99 (copy)
        return math.abs((v99[v101]:Dot((Vector3.new(1, 0, 0, 0))))) < math.abs((v99[v102]:Dot((Vector3.new(1, 0, 0, 0)))));
    end);
    local v103 = table.remove(v100);
    v98[v103] = Vector3.new(1, 0, 0, 0) * math.sign((Vector3.new(1, 0, 0, 0):Dot(v99[v103])));
    table.sort(v100, function(v104, v105) --[[ Line: 429 ]]
        -- upvalues: v99 (copy)
        return math.abs((v99[v104]:Dot((Vector3.new(0, 1, 0, 0))))) < math.abs((v99[v105]:Dot((Vector3.new(0, 1, 0, 0)))));
    end);
    v103 = table.remove(v100);
    v98[v103] = Vector3.new(0, 1, 0, 0) * math.sign((Vector3.new(0, 1, 0, 0):Dot(v99[v103])));
    v103 = table.remove(v100);
    v98[v103] = Vector3.new(0, 0, 1, 0) * math.sign((Vector3.new(0, 0, 1, 0):Dot(v99[v103])));
    return CFrame.fromMatrix(v97.Position, v98[1], v98[2], v98[3]);
end;
v21._updateAttachment = function(v107) --[[ Line: 443 ]] --[[ Name: _updateAttachment ]]
    -- upvalues: v32 (copy), v7 (copy), v27 (copy), v28 (copy), v29 (copy), l_SimFlipConstraintTool_0 (copy), v106 (copy), l_SimPreserveOrientationOnFace_0 (copy), l_SimPreserveFirstAttachmentOrientation_0 (copy), l_SimTwoAttachmentFixOutputSpam_0 (copy), l_EnableConstraintToolGhostAssemblyFeature_0 (copy), v25 (copy), v26 (copy)
    local v108 = v107._draggerContext:getMouseRay();
    if v32[v107._constraintType] then
        local v109 = v7.raycast(v108, {});
        if v109 then
            v107._selectionHighlight.Adornee = v109.Instance;
            if v107._constraintConnectionVisual then
                local l_Magnitude_0 = (v109.Position - v107._initialInstance.Position).Magnitude;
                v107._constraintConnectionVisual.CFrame = CFrame.lookAt(v107._initialInstance.Position, v109.Position) * CFrame.new(0, 0, -l_Magnitude_0 * 0.5);
                v107._constraintConnectionVisual.Height = l_Magnitude_0;
            end;
        end;
        if v107._constraintConnectionVisual then
            local l_v27_0 = v27;
            if not v107:_canMouseDown() then
                l_v27_0 = v28;
            elseif v107._initialInstance and v107._currentHoveringInstance and (v107._currentHoveringInstance.AssemblyRootPart == v107._initialInstance.AssemblyRootPart or v107._currentHoveringInstance.Anchored and v107._initialInstance.Anchored) then
                l_v27_0 = v29;
            end;
            v107._constraintConnectionVisual.Color3 = l_v27_0;
        end;
        v107._selectionHighlight.Enabled = v109 ~= nil;
        v107._currentHoveringInstance = v109 and v109.Instance;
        return;
    else
        local v112 = nil;
        if v107._lastDragTarget then
            v112 = v107._lastDragTarget.targetMatrix;
        end;
        local l__tiltRotate_0 = v107._tiltRotate;
        if not l_SimFlipConstraintTool_0 and v107._initialInstance and v107._initialInstance:IsA("Attachment") then
            l__tiltRotate_0 = l__tiltRotate_0 * v106(v107._initialInstance.CFrame.Rotation);
        end;
        local v114 = v7.getDragTarget(v107:getRaycastIgnoreList(), CFrame.identity, Vector3.zero, Vector3.zero, Vector3.zero, v108, if v107._draggerContext:shouldGridSnap() then v107._draggerContext:getGridSize() else nil, l__tiltRotate_0, v112, v107:shouldAlignDraggedObjects() and not v107._draggerContext:isAltKeyDown(), false, v107._draggerContext:getSoftSnapMarginFactor(), v107._draggerContext:shouldPartSnap(), true);
        local v115 = v107._draggerContext:gizmoRaycast(v108.Origin, v108.Direction, RaycastParams.new());
        local v116 = nil;
        local v117 = nil;
        if v115 and v115.Instance and v115.Instance:IsA("Attachment") and v115.Instance ~= v107._initialInstance and v107._constraintType ~= "Attachment" then
            v117 = v115.Instance;
            v116 = v117.WorldCFrame;
        elseif v114 and v114.targetPart then
            v117 = v114.targetPart;
            v116 = v114.mainCFrame;
        end;
        if l_SimPreserveOrientationOnFace_0 and (not l_SimPreserveFirstAttachmentOrientation_0 or not v107._initialInstance) then
            local v118 = v7.raycast(v108, {});
            if v118 then
                if v107._lastNormal ~= v118.Normal then
                    v107._lastDraggedInstanceDefaultOrientation = v114.baseCFrame.Rotation;
                end;
                v107._lastNormal = v118.Normal;
            end;
        end;
        if v114 and v114.targetPart then
            v107._lastDragTarget = v114;
        end;
        if v107._initialInstance then
            if l_SimTwoAttachmentFixOutputSpam_0 then
                if v114 then
                    v116 = v114.baseCFrame * v107._tiltRotate;
                end;
            else
                v116 = v114.baseCFrame * v107._tiltRotate;
            end;
        end;
        v107._currentHoveringInstance = v117;
        v107._selectionHighlight.Enabled = v117 ~= nil;
        v107._selectionHighlight.Adornee = v117;
        if v117 then
            if l_EnableConstraintToolGhostAssemblyFeature_0 and (not v107._ghostAssembly or v107._lastHoveringInstance ~= v117) then
                if v107._ghostAssembly then
                    v107._ghostAssembly:Destroy();
                    v107._ghostAssembly = nil;
                end;
                if v107._initialInstance then
                    v107._ghostAssembly = Instance.new("Model");
                    v107._ghostAssembly.Name = "GhostAssembly";
                    v107._ghostAssembly.Archivable = false;
                    v107._ghostAssembly.Parent = workspace.CurrentCamera;
                    local v119 = v107._initialInstance.Parent:Clone();
                    v119.Parent = v107._ghostAssembly;
                    v107._ghostAssembly.PrimaryPart = v119;
                    for _, v121 in v107._initialInstance.Parent:GetConnectedParts(true) do
                        v121:Clone().Parent = v107._ghostAssembly;
                    end;
                end;
            end;
            v107._attachmentAdornment.Color3 = v107:_canMouseDown() and v25 or v26;
            if l_SimPreserveOrientationOnFace_0 and v107._lastDraggedInstanceDefaultOrientation then
                v116 = CFrame.new(v116.Position) * v107._lastDraggedInstanceDefaultOrientation * v107._tiltRotate;
            end;
            if not v107._attachmentToolAnimator:inProgress() then
                v107:_orientAttachmentAdornment(v107._attachmentAdornment, v116);
            end;
            if v107._initialInstance then
                local v122 = v107._initialInstance.WorldCFrame:ToObjectSpace(v107._initialInstance.Parent.CFrame);
                local l_Magnitude_1 = (v116.p - v107._initialInstance.WorldCFrame.p).Magnitude;
                v107._constraintConnectionVisual.CFrame = CFrame.lookAt(v107._initialInstance.WorldCFrame.p, v116.p) * CFrame.new(0, 0, -l_Magnitude_1 * 0.5);
                v107._constraintConnectionVisual.Height = l_Magnitude_1;
                v107:_setInitialInstanceTransparency(v107._partPassthroughEnabled and 0.5 or 0);
                v107:_orientAttachmentAdornment(v107._initialInstanceAdornment, v107._initialInstance.WorldCFrame);
                if l_EnableConstraintToolGhostAssemblyFeature_0 then
                    v107._ghostAssembly:SetPrimaryPartCFrame(v116 * v122);
                end;
            end;
        end;
        return;
    end;
end;
v21._rotateAttachment = function(v124, v125) --[[ Line: 627 ]] --[[ Name: _rotateAttachment ]]
    -- upvalues: l_SimPreserveOrientationOnFace_0 (copy), v33 (copy), v8 (copy), v7 (copy)
    local v126 = nil;
    if v124._lastDragTarget then
        v126 = v124._lastDragTarget.targetMatrix;
    end;
    local v127 = nil;
    if l_SimPreserveOrientationOnFace_0 then
        local v128 = nil;
        if v124._lastDraggedInstanceDefaultOrientation and v125 ~= Vector3.new(0, 1, 0, 0) then
            local v129 = v124._draggerContext:getCameraCFrame():VectorToWorldSpace(v125);
            local v130 = -1e999;
            for _, v132 in ipairs(v33) do
                local v133 = v124._lastDraggedInstanceDefaultOrientation:VectorToWorldSpace(v132):Dot(v129);
                if v130 < v133 then
                    v128 = v132;
                    v130 = v133;
                end;
            end;
            v128 = v128 or Vector3.new(0, 1, 0, 0);
        else
            v128 = v125;
        end;
        v127 = v8(CFrame.fromAxisAngle(v128, 1.5707963267948966)) * v124._tiltRotate;
    else
        v127 = v7.updateTiltRotate(v124._draggerContext:getCameraCFrame(), v124._draggerContext:getMouseRay(), v124:getRaycastIgnoreList(), CFrame.identity, v126, v124._tiltRotate, v125, v124:shouldAlignDraggedObjects() and not v124._draggerContext:isAltKeyDown(), if v124._draggerContext:shouldGridSnap() then v124._draggerContext:getGridSize() else nil, true);
    end;
    if v124._lastDragTarget then
        if l_SimPreserveOrientationOnFace_0 and v124._lastDraggedInstanceDefaultOrientation then
            v124._attachmentToolAnimator._overrideBaseRotation = CFrame.new(v124._lastDragTarget.baseCFrame.Position) * v124._lastDraggedInstanceDefaultOrientation;
        end;
        v124._attachmentToolAnimator:beginAnimation(v127);
    else
        v124._tiltRotate = v127;
    end;
    v124:_updateAttachment();
    v124:_scheduleRender();
end;
v21._closeTool = function(v134) --[[ Line: 698 ]] --[[ Name: _closeTool ]]
    -- upvalues: v32 (copy), l_EnableConstraintToolGhostAssemblyFeature_0 (copy)
    local l__initialInstance_0 = v134._initialInstance;
    v134:_clearInitialInstance();
    if l__initialInstance_0 and not v32[v134._constraintType] then
        l__initialInstance_0:Destroy();
    end;
    if l_EnableConstraintToolGhostAssemblyFeature_0 and v134._ghostAssembly then
        v134._ghostAssembly:Destroy();
        v134._ghostAssembly = nil;
    end;
    if v134._constraintToolVisualsFolder.Parent then
        v134._constraintToolVisualsFolder:Destroy();
    end;
    v134:_removeAttachmentAdorns();
    v134:_removeConstraintVisuals();
    v134._closePluginCallback();
end;
v21._processSelected = function(v136) --[[ Line: 721 ]] --[[ Name: _processSelected ]]
    -- upvalues: l_Selection_0 (copy)
    if v136._modelProps.ShowPivotIndicator then
        v136._oldShowPivot = v136._draggerContext:setPivotIndicator(true);
    end;
    v136._selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 733 ]]
        -- upvalues: v136 (copy)
        v136:_processSelectionChanged();
    end);
end;
v21._processDeselected = function(v137) --[[ Line: 738 ]] --[[ Name: _processDeselected ]]
    if v137._isMouseDown then
        v137:_processMouseUp();
    end;
    if v137._modelProps.ShowPivotIndicator then
        v137._draggerContext:setPivotIndicator(v137._oldShowPivot);
    end;
    if v137._selectionChangedConnection then
        v137._selectionChangedConnection:Disconnect();
        v137._selectionChangedConnection = nil;
    end;
    v137._recordingIdentifier = nil;
    v137:_closeTool();
end;
v21._processSelectionChanged = function(v138) --[[ Line: 756 ]] --[[ Name: _processSelectionChanged ]]
    v138:_scheduleRender();
end;
v21._setConstraintType = function(v139, v140) --[[ Line: 760 ]] --[[ Name: _setConstraintType ]]
    v139._constraintType = v140;
end;
v21._getConstraintData = function(v141) --[[ Line: 764 ]] --[[ Name: _getConstraintData ]]
    -- upvalues: v5 (copy)
    return v5[v141._constraintType];
end;
v21._createConstraintVisuals = function(v142) --[[ Line: 768 ]] --[[ Name: _createConstraintVisuals ]]
    local l_CylinderHandleAdornment_2 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_2.AlwaysOnTop = true;
    l_CylinderHandleAdornment_2.Adornee = workspace.Terrain;
    l_CylinderHandleAdornment_2.ZIndex = 0;
    l_CylinderHandleAdornment_2.Radius = 0.05;
    l_CylinderHandleAdornment_2.Parent = v142._constraintToolVisualsFolder;
    v142._constraintConnectionVisual = l_CylinderHandleAdornment_2;
end;
v21._removeConstraintVisuals = function(v144) --[[ Line: 779 ]] --[[ Name: _removeConstraintVisuals ]]
    if v144._constraintConnectionVisual then
        v144._constraintConnectionVisual:Destroy();
        v144._constraintConnectionVisual = nil;
    end;
end;
v21._removeAttachmentAdorns = function(v145) --[[ Line: 786 ]] --[[ Name: _removeAttachmentAdorns ]]
    for v146, v147 in v145._attachmentArrowVisuals do
        v146:Destroy();
        for _, v149 in v147 do
            v149:Destroy();
        end;
    end;
    table.clear(v145._attachmentArrowVisuals);
end;
local v150 = table.freeze({
    [Enum.KeyCode.RightShift] = true, 
    [Enum.KeyCode.LeftShift] = true, 
    [Enum.KeyCode.RightControl] = true, 
    [Enum.KeyCode.LeftControl] = true, 
    [Enum.KeyCode.RightAlt] = true, 
    [Enum.KeyCode.LeftAlt] = true
});
v21._processKeyDown = function(v151, v152) --[[ Line: 808 ]] --[[ Name: _processKeyDown ]]
    -- upvalues: l_EnableConstraintToolPartPassthroughFeature_0 (copy), l_SimMultipleConstraintMode_0 (copy), v150 (copy)
    if v152 == Enum.KeyCode.R then
        v151:_rotateAttachment((Vector3.new(0, 1, 0, 0)));
        return;
    elseif v152 == Enum.KeyCode.T then
        v151:_rotateAttachment((Vector3.new(1, 0, 0, 0)));
        return;
    elseif v152 == Enum.KeyCode.H then
        v151._draggerContext:setSetting("HotkeyUsageHidden", not v151._draggerContext:getSetting("HotkeyUsageHidden"));
        v151:_scheduleRender();
        return;
    elseif v152 == Enum.KeyCode.G and l_EnableConstraintToolPartPassthroughFeature_0 then
        v151._partPassthroughEnabled = not v151._partPassthroughEnabled;
        v151:_updateAttachment();
        v151:_scheduleRender();
        return;
    elseif l_SimMultipleConstraintMode_0 and v152 == Enum.KeyCode.M then
        v151._addMultipleConstraintsEnabled = not v151._addMultipleConstraintsEnabled;
        v151._draggerContext:setSetting("MultipleConstraintMode", v151._addMultipleConstraintsEnabled);
        v151:_updateAttachment();
        v151:_scheduleRender();
        return;
    else
        if v150[v152] then
            v151:_updateAttachment();
            v151:_scheduleRender();
        end;
        return;
    end;
end;
v21._processKeyUp = function(v153, v154) --[[ Line: 835 ]] --[[ Name: _processKeyUp ]]
    -- upvalues: v150 (copy)
    if v150[v154] then
        v153:_updateAttachment();
        v153:_scheduleRender();
    end;
end;
v21._clearInitialInstance = function(v155) --[[ Line: 843 ]] --[[ Name: _clearInitialInstance ]]
    -- upvalues: v32 (copy)
    if v155._ancestryChangedConnection then
        if not v32[v155._constraintType] then
            for _, v157 in v155._attachmentArrowVisuals[v155._initialInstanceAdornment] do
                v157:Destroy();
            end;
            v155._initialInstanceAdornment:Destroy();
            v155._attachmentArrowVisuals[v155._initialInstanceAdornment] = nil;
        end;
        v155:_setInitialInstanceTransparency(0);
        v155._ancestryChangedConnection:Disconnect();
        v155._ancestryChangedConnection = nil;
        v155._initialInstance = nil;
        v155._initialInstanceAdornment = nil;
    end;
end;
v21._selectInitialInstance = function(v158, v159) --[[ Line: 864 ]] --[[ Name: _selectInitialInstance ]]
    -- upvalues: v32 (copy)
    v158:_clearInitialInstance();
    v158._initialInstance = v159;
    v158._ancestryChangedConnection = v159.AncestryChanged:Connect(function() --[[ Line: 868 ]]
        -- upvalues: v159 (copy), v158 (copy)
        if not v159.Parent or not v159:IsDescendantOf(workspace) then
            v158:_clearInitialInstance();
            v158:_removeConstraintVisuals();
        end;
    end);
    if not v32[v158._constraintType] then
        v158._initialInstanceAdornment = v158:_createAttachmentAdornment();
    end;
    v158:_createConstraintVisuals();
end;
v21._canMouseDown = function(v160) --[[ Line: 882 ]] --[[ Name: _canMouseDown ]]
    -- upvalues: v32 (copy)
    local v161 = v160:_getConstraintData();
    local v162 = v32[v160._constraintType];
    if not v160._currentHoveringInstance then
        return false;
    else
        if v161 and v161.Attachments == 2 and v160._initialInstance and not v161.IgnoreSamePartCheck then
            local l__currentHoveringInstance_0 = v160._currentHoveringInstance;
            if l__currentHoveringInstance_0:IsA("Attachment") then
                l__currentHoveringInstance_0 = l__currentHoveringInstance_0.Parent;
            end;
            if v162 and v160._initialInstance == v160._currentHoveringInstance then
                return false;
            elseif not v162 and v160._initialInstance.Parent == l__currentHoveringInstance_0 then
                return false;
            end;
        end;
        return true;
    end;
end;
v21._processMouseDown = function(v164) --[[ Line: 913 ]] --[[ Name: _processMouseDown ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v22 (ref), v32 (copy), l_Selection_0 (copy), l_SimUseExistingAttachmentName_0 (copy), l_SimFixConstraintSelection_0 (copy), l_EnableConstraintToolGhostAssemblyFeature_0 (copy), l_SimPreserveFirstAttachmentOrientation_0 (copy), l_SimConstraintToolRuntimeUndoFix_0 (copy), l_SimMultipleConstraintMode_0 (copy)
    if v164._isMouseDown then
        return;
    else
        v164._isMouseDown = true;
        if not v164:_canMouseDown() then
            return;
        else
            local v165 = nil;
            local v166 = l_ChangeHistoryService_0:TryBeginRecording(v22, "Placing Constraint");
            local l_Commit_0 = Enum.FinishRecordingOperation.Commit;
            local v168 = v164:_getConstraintData();
            local v169 = "default";
            local v170 = false;
            local v171 = true;
            if v32[v164._constraintType] then
                if v164._initialInstance then
                    v165 = Instance.new(v164._constraintType, v164._initialInstance);
                    v165.Part0 = v164._initialInstance;
                    v165.Part1 = v164._currentHoveringInstance;
                    l_Selection_0:Set({
                        v165
                    });
                    v164:_clearInitialInstance();
                    v164:_removeConstraintVisuals();
                else
                    v164:_selectInitialInstance(v164._currentHoveringInstance);
                    l_Commit_0 = Enum.FinishRecordingOperation.Cancel;
                end;
            else
                if v164._currentHoveringInstance:IsA("Attachment") then
                    v165 = v164._currentHoveringInstance;
                    if l_SimUseExistingAttachmentName_0 then
                        v171 = false;
                    end;
                else
                    v165 = Instance.new("Attachment");
                    v165.CFrame = v164._currentHoveringInstance.CFrame:ToObjectSpace(v164._attachmentAdornment.CFrame);
                    v165.Parent = v164._currentHoveringInstance;
                    if l_SimFixConstraintSelection_0 then
                        l_Selection_0:Set({
                            v165
                        });
                    end;
                end;
                local v172 = nil;
                if v168.Attachments == 2 then
                    if v164._initialInstance then
                        if l_SimUseExistingAttachmentName_0 and v171 then
                            v165.Name = "Attachment1";
                        end;
                        v172 = Instance.new(v164._constraintType, v164._initialInstance.Parent);
                        v172.Attachment0 = v164._initialInstance;
                        v172.Attachment1 = v165;
                        local l_Magnitude_2 = (v165.WorldCFrame.p - v164._initialInstance.WorldCFrame.p).Magnitude;
                        if v164._constraintType == "RopeConstraint" or v164._constraintType == "RodConstraint" then
                            v172.Length = l_Magnitude_2;
                        elseif v164._constraintType == "SpringConstraint" then
                            v172.FreeLength = l_Magnitude_2;
                        end;
                        if l_EnableConstraintToolGhostAssemblyFeature_0 then
                            v164._ghostAssembly:Destroy();
                            v164._ghostAssembly = nil;
                        end;
                        if l_SimPreserveFirstAttachmentOrientation_0 then
                            v164._tiltRotate = CFrame.identity;
                        end;
                        v164:_clearInitialInstance();
                        v164:_removeConstraintVisuals();
                    else
                        if l_SimUseExistingAttachmentName_0 and v171 then
                            v165.Name = "Attachment0";
                        end;
                        v169 = "initial";
                        v164:_selectInitialInstance(v165);
                        if l_SimPreserveFirstAttachmentOrientation_0 then
                            v164._lastDraggedInstanceDefaultOrientation = v164._lastDraggedInstanceDefaultOrientation * v164._tiltRotate;
                            v164._tiltRotate = CFrame.identity;
                        end;
                    end;
                elseif v168.Attachments == 1 and v164._constraintType ~= "Attachment" then
                    v172 = Instance.new(v164._constraintType, v165.Parent);
                    v172.Attachment0 = v165;
                    v164:_clearInitialInstance();
                    v164:_removeConstraintVisuals();
                end;
                if l_SimFixConstraintSelection_0 and v172 then
                    v170 = true;
                    l_Selection_0:Set({
                        v172
                    });
                end;
                if v172 and v168.Properties then
                    for v174, v175 in v168.Properties do
                        v172[v174] = v175;
                    end;
                end;
            end;
            if v165 then
                table.insert(v164._undoAttachmentStack, 1, {
                    attachment = v165, 
                    attachmentParent = v165.Parent, 
                    type = v169
                });
            end;
            if l_SimConstraintToolRuntimeUndoFix_0 then
                if v166 then
                    l_ChangeHistoryService_0:FinishRecording(v166, l_Commit_0);
                end;
            else
                l_ChangeHistoryService_0:FinishRecording(v166, l_Commit_0);
            end;
            v164:_updateAttachment();
            if l_SimMultipleConstraintMode_0 and v170 and not v164._addMultipleConstraintsEnabled then
                v164:_processDeselected();
            end;
            return;
        end;
    end;
end;
v21._processMouseUp = function(v176) --[[ Line: 1056 ]] --[[ Name: _processMouseUp ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    v176._isMouseDown = false;
    if v176._recordingIdentifier and l_ChangeHistoryService_0:IsRecordingInProgress(v176._recordingIdentifier) then
        v176._recordingIdentifier = nil;
    end;
end;
v21._processViewChanged = function(v177) --[[ Line: 1068 ]] --[[ Name: _processViewChanged ]]
    v177:_updateAttachment();
    v177:_scheduleRender();
end;
v21._scheduleRender = function(v178) --[[ Line: 1076 ]] --[[ Name: _scheduleRender ]]
    v178._requestRenderCallback();
end;
return v21;