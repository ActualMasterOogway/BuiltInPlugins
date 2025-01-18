local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utility.Analytics);
local v2 = require(l_Parent_0.Utility.setInsertPoint);
local l_SourceStrings_0 = l_Parent_0.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Resources.LocalizedStrings;
local v5 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v6 = require(l_Parent_0.Flags.getFFlagDraggerHandleTracking);
local v7 = require(l_Parent_0.Flags.getFFlagDraggerFinalShortcuts);
local v8 = require(l_Parent_0.Flags.getFFlagDraggerExternalHover);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12, v13) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return (setmetatable({
        _editDataModel = v11, 
        _plugin = v10, 
        _userSettings = v12, 
        _studioService = v11:GetService("StudioService"), 
        _draggerService = v11:GetService("DraggerService"), 
        _runService = v11:GetService("RunService"), 
        _studioSettings = v12.Studio, 
        _workspace = v11:GetService("Workspace"), 
        _userInputService = v11:GetService("UserInputService"), 
        _changeHistoryService = v11:GetService("ChangeHistoryService"), 
        _mouse = v10:GetMouse(), 
        _selection = v13, 
        _selectionService = v11:GetService("Selection"), 
        LocaleChangedSignal = v11:GetService("StudioService"):GetPropertyChangedSignal("StudioLocaleId"), 
        _fallbackTranslators = {}, 
        _translators = {}, 
        _settingCache = {}
    }, v9));
end;
v9.getGuiParent = function(v14) --[[ Line: 54 ]] --[[ Name: getGuiParent ]]
    return v14._editDataModel:GetService("CoreGui");
end;
v9.setHoverInstance = function(v15, v16) --[[ Line: 58 ]] --[[ Name: setHoverInstance ]]
    -- upvalues: v8 (copy)
    if v8() then
        v15._ignoreNextHoverChange = true;
        v15._studioService.HoverInstance = v16;
        task.defer(function() --[[ Line: 62 ]]
            -- upvalues: v15 (copy)
            v15._ignoreNextHoverChange = false;
        end);
        return;
    else
        v15._studioService.HoverInstance = v16;
        return;
    end;
end;
v9.onInstanceHovered = function(v17, v18) --[[ Line: 70 ]] --[[ Name: onInstanceHovered ]]
    local v20 = v17._studioService:GetPropertyChangedSignal("HoverInstance"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if not v17._ignoreNextHoverChange then
            local l_HoverInstance_0 = v17._studioService.HoverInstance;
            v18(l_HoverInstance_0, l_HoverInstance_0);
        end;
    end);
    return function() --[[ Line: 78 ]]
        -- upvalues: v20 (copy)
        v20:Disconnect();
    end;
end;
v9.shouldUseLocalSpace = function(v21) --[[ Line: 83 ]] --[[ Name: shouldUseLocalSpace ]]
    return v21._studioService.UseLocalSpace;
end;
v9.areCollisionsEnabled = function(v22) --[[ Line: 87 ]] --[[ Name: areCollisionsEnabled ]]
    return v22._plugin.CollisionEnabled;
end;
v9.areConstraintsEnabled = function(v23) --[[ Line: 91 ]] --[[ Name: areConstraintsEnabled ]]
    return v23._studioService.DraggerSolveConstraints;
end;
v9.areConstraintDetailsShown = function(v24) --[[ Line: 95 ]] --[[ Name: areConstraintDetailsShown ]]
    return v24._studioService.ShowConstraintDetails;
end;
v9.shouldDrawConstraintsOnTop = function(v25) --[[ Line: 99 ]] --[[ Name: shouldDrawConstraintsOnTop ]]
    return v25._studioService.DrawConstraintsOnTop;
end;
v9.shouldJoinSurfaces = function(v26) --[[ Line: 103 ]] --[[ Name: shouldJoinSurfaces ]]
    return v26._plugin:GetJoinMode() ~= Enum.JointCreationMode.None;
end;
v9.getShowBoundingBox = function(v27) --[[ Line: 107 ]] --[[ Name: getShowBoundingBox ]]
    local l_RenderMode_0 = v27._selectionService.RenderMode;
    local v29 = true;
    if l_RenderMode_0 ~= Enum.SelectionRenderMode.BoundingBoxes then
        v29 = l_RenderMode_0 == Enum.SelectionRenderMode.Both;
    end;
    return v29;
end;
v9.getShowOutline = function(v30) --[[ Line: 112 ]] --[[ Name: getShowOutline ]]
    local l_RenderMode_1 = v30._selectionService.RenderMode;
    local v32 = true;
    if l_RenderMode_1 ~= Enum.SelectionRenderMode.Outlines then
        v32 = l_RenderMode_1 == Enum.SelectionRenderMode.Both;
    end;
    return v32;
end;
v9.shouldShowHover = function(v33) --[[ Line: 117 ]] --[[ Name: shouldShowHover ]]
    return v33._studioSettings["Show Hover Over"];
end;
v9.shouldAnimateHover = function(v34) --[[ Line: 121 ]] --[[ Name: shouldAnimateHover ]]
    return v34._studioSettings["Animate Hover Over"];
end;
v9.shouldSelectScopeByDefault = function(v35) --[[ Line: 125 ]] --[[ Name: shouldSelectScopeByDefault ]]
    return v35._studioSettings["Physical Draggers Select Scope By Default"];
end;
v9.getHoverAnimationSpeedInSeconds = function(v36) --[[ Line: 129 ]] --[[ Name: getHoverAnimationSpeedInSeconds ]]
    local v37 = v36._studioSettings["Hover Animate Speed"];
    if v37 == Enum.HoverAnimateSpeed.VerySlow then
        return 2;
    elseif v37 == Enum.HoverAnimateSpeed.Slow then
        return 1;
    elseif v37 == Enum.HoverAnimateSpeed.Medium then
        return 0.5;
    elseif v37 == Enum.HoverAnimateSpeed.Fast then
        return 0.25;
    elseif v37 == Enum.HoverAnimateSpeed.VeryFast then
        return 0.1;
    else
        return 0;
    end;
end;
v9.getHoverBoxColor = function(v38, v39) --[[ Line: 145 ]] --[[ Name: getHoverBoxColor ]]
    if v39 then
        return v38._studioSettings["Active Hover Over Color"];
    else
        return v38._studioSettings["Hover Over Color"];
    end;
end;
v9.getHoverThickness = function(v40) --[[ Line: 153 ]] --[[ Name: getHoverThickness ]]
    return v40._draggerService.HoverThickness;
end;
v9.getHoverLineThickness = function(v41) --[[ Line: 157 ]] --[[ Name: getHoverLineThickness ]]
    return v41._draggerService.HoverLineThickness;
end;
v9.getSelectionBoxColor = function(v42, v43) --[[ Line: 161 ]] --[[ Name: getSelectionBoxColor ]]
    if v43 then
        return v42._studioSettings["Active Color"];
    else
        return v42._studioSettings["Select Color"];
    end;
end;
v9.useBoundingBoxMoveHandles = function(v44) --[[ Line: 169 ]] --[[ Name: useBoundingBoxMoveHandles ]]
    return v44._studioSettings["Use Bounding Box Move Handles"];
end;
v9.getGeometrySnapColor = function(v45) --[[ Line: 173 ]] --[[ Name: getGeometrySnapColor ]]
    return v45._draggerService.GeometrySnapColor;
end;
v9.getGridColor = function(v46) --[[ Line: 177 ]] --[[ Name: getGridColor ]]
    return v46._studioSettings.DraggerPassiveColor;
end;
v9.getChosenColor = function(v47) --[[ Line: 181 ]] --[[ Name: getChosenColor ]]
    return v47._studioSettings.DraggerActiveColor;
end;
v9.shouldShowHoverGrids = function(v48) --[[ Line: 185 ]] --[[ Name: shouldShowHoverGrids ]]
    return v48._studioSettings.DraggerShowHoverRuler;
end;
v9.shouldShowTargetGrids = function(v49) --[[ Line: 189 ]] --[[ Name: shouldShowTargetGrids ]]
    return v49._studioSettings.DraggerShowTargetSnap;
end;
v9.shouldShowPreciseInput = function(v50) --[[ Line: 193 ]] --[[ Name: shouldShowPreciseInput ]]
    return v50._studioSettings.DraggerShowMeasurement;
end;
v9.getMajorGridIncrement = function(v51) --[[ Line: 197 ]] --[[ Name: getMajorGridIncrement ]]
    return v51._studioSettings.DraggerMajorGridIncrement;
end;
v9.getTiltRotateDuration = function(v52) --[[ Line: 201 ]] --[[ Name: getTiltRotateDuration ]]
    return v52._studioSettings.DraggerTiltRotateDuration;
end;
v9.getMaxSoftSnaps = function(v53) --[[ Line: 205 ]] --[[ Name: getMaxSoftSnaps ]]
    return v53._studioSettings.DraggerMaxSoftSnaps;
end;
v9.getSoftSnapMarginFactor = function(v54) --[[ Line: 209 ]] --[[ Name: getSoftSnapMarginFactor ]]
    return v54._studioSettings.DraggerSoftSnapMarginFactor;
end;
v9.getSummonMarginFactor = function(v55) --[[ Line: 213 ]] --[[ Name: getSummonMarginFactor ]]
    return v55._studioSettings.DraggerSummonMarginFactor;
end;
v9.getCameraCFrame = function(v56) --[[ Line: 217 ]] --[[ Name: getCameraCFrame ]]
    return v56._workspace.CurrentCamera.CFrame;
end;
v9.getCamera = function(v57) --[[ Line: 221 ]] --[[ Name: getCamera ]]
    return v57._workspace.CurrentCamera;
end;
v9.getMouseUnitRay = function(v58) --[[ Line: 225 ]] --[[ Name: getMouseUnitRay ]]
    return v58._mouse.UnitRay;
end;
v9.getHandleScale = function(v59, v60) --[[ Line: 229 ]] --[[ Name: getHandleScale ]]
    -- upvalues: v6 (copy), v5 (copy)
    if v6() then
        local v61 = v59:getCameraCFrame();
        local v62 = (v60 - v61.Position):Dot(v61.LookVector);
        return math.sin((math.rad(v59._workspace.CurrentCamera.FieldOfView))) * v62 * 0.05;
    elseif v5() then
        local v63 = v59:getCameraCFrame():PointToObjectSpace(v60);
        return math.sin((math.rad(v59._workspace.CurrentCamera.FieldOfView))) * -v63.Z * 0.05;
    else
        local l_Magnitude_0 = (v59:getCameraCFrame().Position - v60).Magnitude;
        return math.sin((math.rad(v59._workspace.CurrentCamera.FieldOfView))) * l_Magnitude_0 * 0.05;
    end;
end;
v9.getMouseRay = function(v65) --[[ Line: 246 ]] --[[ Name: getMouseRay ]]
    local v66 = v65:getMouseUnitRay();
    return Ray.new(v66.Origin, v66.Direction * 10000);
end;
v9.getMouseLocation = function(v67) --[[ Line: 251 ]] --[[ Name: getMouseLocation ]]
    return v67._userInputService:GetMouseLocation();
end;
v9.viewportPointToRay = function(v68, v69) --[[ Line: 255 ]] --[[ Name: viewportPointToRay ]]
    return v68._workspace.CurrentCamera:ViewportPointToRay(v69.X, v69.Y);
end;
v9.worldToViewportPoint = function(v70, v71) --[[ Line: 259 ]] --[[ Name: worldToViewportPoint ]]
    return v70._workspace.CurrentCamera:WorldToViewportPoint(v71);
end;
v9.getViewportSize = function(v72) --[[ Line: 263 ]] --[[ Name: getViewportSize ]]
    return v72._workspace.CurrentCamera.ViewportSize;
end;
v9.setMouseIcon = function(v73, v74) --[[ Line: 267 ]] --[[ Name: setMouseIcon ]]
    v73._mouse.Icon = v74;
end;
v9.getSelection = function(v75) --[[ Line: 271 ]] --[[ Name: getSelection ]]
    return v75._selection;
end;
v9.isSimulating = function(v76) --[[ Line: 277 ]] --[[ Name: isSimulating ]]
    return v76._runService:IsRunning();
end;
v9.isTabKeyDown = function(v77) --[[ Line: 281 ]] --[[ Name: isTabKeyDown ]]
    return v77._userInputService:IsKeyDown(Enum.KeyCode.Tab);
end;
v9.isAltKeyDown = function(v78) --[[ Line: 285 ]] --[[ Name: isAltKeyDown ]]
    return v78._userInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or v78._userInputService:IsKeyDown(Enum.KeyCode.RightAlt);
end;
v9.isCtrlKeyDown = function(v79) --[[ Line: 290 ]] --[[ Name: isCtrlKeyDown ]]
    return v79._userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v79._userInputService:IsKeyDown(Enum.KeyCode.RightControl);
end;
v9.isShiftKeyDown = function(v80) --[[ Line: 295 ]] --[[ Name: isShiftKeyDown ]]
    return v80._userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v80._userInputService:IsKeyDown(Enum.KeyCode.RightShift);
end;
v9.shouldExtendSelection = function(v81) --[[ Line: 300 ]] --[[ Name: shouldExtendSelection ]]
    return v81:isCtrlKeyDown() or v81:isShiftKeyDown();
end;
v9.getGridSize = function(v82) --[[ Line: 304 ]] --[[ Name: getGridSize ]]
    -- upvalues: v5 (copy)
    if v5() then
        return v82._draggerService.LinearSnapIncrement;
    else
        return v82._studioService.GridSize;
    end;
end;
v9.getGridSnapEnabled = function(v83) --[[ Line: 312 ]] --[[ Name: getGridSnapEnabled ]]
    return v83._draggerService.LinearSnapEnabled;
end;
v9.getPartSnapEnabled = function(v84) --[[ Line: 316 ]] --[[ Name: getPartSnapEnabled ]]
    return v84._draggerService.PartSnapEnabled;
end;
v9.shouldPartSnap = function(v85) --[[ Line: 320 ]] --[[ Name: shouldPartSnap ]]
    -- upvalues: v7 (copy)
    if v7() then
        return v85:getPartSnapEnabled() and not v85:isShiftKeyDown();
    else
        return v85:getPartSnapEnabled() and not v85:isAltKeyDown();
    end;
end;
v9.shouldGridSnap = function(v86) --[[ Line: 328 ]] --[[ Name: shouldGridSnap ]]
    -- upvalues: v7 (copy)
    if v7() then
        return v86:getGridSnapEnabled() and not v86:isShiftKeyDown();
    else
        return v86:getGridSnapEnabled() and not v86:isAltKeyDown();
    end;
end;
v9.shouldAngleSnap = function(v87) --[[ Line: 336 ]] --[[ Name: shouldAngleSnap ]]
    -- upvalues: v7 (copy)
    if v7() then
        return v87._draggerService.AngleSnapEnabled and not v87:isShiftKeyDown();
    else
        return v87._draggerService.AngleSnapEnabled and not v87:isAltKeyDown();
    end;
end;
v9.snapToGridSize = function(v88, v89) --[[ Line: 344 ]] --[[ Name: snapToGridSize ]]
    -- upvalues: v5 (copy)
    if v5() then
        if v88:shouldGridSnap() then
            local l_LinearSnapIncrement_0 = v88._draggerService.LinearSnapIncrement;
            return math.floor(v89 / l_LinearSnapIncrement_0 + 0.5) * l_LinearSnapIncrement_0;
        else
            return v89;
        end;
    elseif v88._draggerService.LinearSnapEnabled then
        local l_LinearSnapIncrement_1 = v88._draggerService.LinearSnapIncrement;
        return math.floor(v89 / l_LinearSnapIncrement_1 + 0.5) * l_LinearSnapIncrement_1;
    else
        return v89;
    end;
end;
v9.getRotateIncrement = function(v92) --[[ Line: 362 ]] --[[ Name: getRotateIncrement ]]
    -- upvalues: v5 (copy)
    if v5() then
        if v92:shouldAngleSnap() then
            return v92._draggerService.AngleSnapIncrement;
        else
            return 0;
        end;
    elseif v92._draggerService.AngleSnapEnabled then
        return v92._draggerService.AngleSnapIncrement;
    else
        return 0;
    end;
end;
v9.getAnalytics = function(_) --[[ Line: 378 ]] --[[ Name: getAnalytics ]]
    -- upvalues: v1 (copy)
    return v1;
end;
v9.gizmoRaycast = function(v94, v95, v96, v97) --[[ Line: 382 ]] --[[ Name: gizmoRaycast ]]
    return v94._studioService:GizmoRaycast(v95, v96, v97);
end;
v9.setInsertPoint = function(_, v99) --[[ Line: 386 ]] --[[ Name: setInsertPoint ]]
    -- upvalues: v2 (copy)
    v2(v99);
end;
v9.shouldShowActiveInstanceHighlight = function(v100) --[[ Line: 390 ]] --[[ Name: shouldShowActiveInstanceHighlight ]]
    return v100._selectionService.ShowActiveInstanceHighlight;
end;
v9.shouldAlignDraggedObjects = function(v101) --[[ Line: 394 ]] --[[ Name: shouldAlignDraggedObjects ]]
    return v101._studioService.AlignDraggedObjects;
end;
v9.addUndoWaypoint = function(v102, v103, _) --[[ Line: 398 ]] --[[ Name: addUndoWaypoint ]]
    v102._changeHistoryService:SetWaypoint(v103);
end;
v9.getText = function(v105, v106, v107, v108) --[[ Line: 409 ]] --[[ Name: getText ]]
    -- upvalues: l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    v107 = ("Studio.DraggerFramework.%s.%s"):format(v106, v107);
    local l_StudioLocaleId_0 = v105._studioService.StudioLocaleId;
    if l_StudioLocaleId_0 == "en_US" then
        local v110 = v105._fallbackTranslators[l_StudioLocaleId_0];
        if not v110 then
            v110 = l_SourceStrings_0:GetTranslator("en_US");
            v105._fallbackTranslators[l_StudioLocaleId_0] = v110;
        end;
        return v110:FormatByKey(v107, v108);
    else
        local v111 = v105._translators[l_StudioLocaleId_0];
        if not v111 then
            v111 = l_LocalizedStrings_0:GetTranslator(l_StudioLocaleId_0);
            v105._translators[l_StudioLocaleId_0] = v111;
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 425 ]]
            -- upvalues: v111 (ref), v107 (ref), v108 (copy)
            return v111:FormatByKey(v107, v108);
        end);
        if l_status_0 then
            return l_result_0;
        else
            local v114 = v105._fallbackTranslators[l_StudioLocaleId_0];
            if not v114 then
                v114 = l_SourceStrings_0:GetTranslator("en_US");
                v105._fallbackTranslators[l_StudioLocaleId_0] = v114;
            end;
            return v114:FormatByKey(v107, v108);
        end;
    end;
end;
v9.getThemeColor = function(v115, v116, v117) --[[ Line: 442 ]] --[[ Name: getThemeColor ]]
    return v115._studioSettings.Theme:GetColor(v116, v117);
end;
v9.getTheme = function(v118) --[[ Line: 446 ]] --[[ Name: getTheme ]]
    return v118._studioSettings.Theme.Name;
end;
v9.getSetting = function(v119, v120) --[[ Line: 450 ]] --[[ Name: getSetting ]]
    -- upvalues: v5 (copy)
    if v5() then
        local v121 = v119._settingCache[v120];
        if not v121 then
            v121 = {
                Value = v119._plugin:GetSetting(v120)
            };
            v119._settingCache[v120] = v121;
        end;
        return v121.Value;
    else
        return v119._plugin:GetSetting(v120);
    end;
end;
v9.setSetting = function(v122, v123, v124) --[[ Line: 463 ]] --[[ Name: setSetting ]]
    -- upvalues: v5 (copy)
    if v5() then
        local v125 = v122._settingCache[v123];
        if v125 then
            if v125.Value ~= v124 then
                v122._plugin:SetSetting(v123, v124);
                v125.Value = v124;
                return;
            end;
        else
            v122._plugin:SetSetting(v123, v124);
            v122._settingCache[v123] = {
                Value = v124
            };
            return;
        end;
    else
        v122._plugin:SetSetting(v123, v124);
    end;
end;
v9.setPivotIndicator = function(v126, v127) --[[ Line: 480 ]] --[[ Name: setPivotIndicator ]]
    local l_ShowPivotIndicator_0 = v126._draggerService.ShowPivotIndicator;
    v126._draggerService.ShowPivotIndicator = v127;
    return l_ShowPivotIndicator_0;
end;
return v9;