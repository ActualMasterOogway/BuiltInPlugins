if game:GetFastFlag("PathEditorRotation") then
    local l_Parent_0 = script.Parent.Parent.Parent;
    local _ = require(l_Parent_0.Src.Types);
    local v2 = require(l_Parent_0.Packages.React);
    local v3 = require(l_Parent_0.Packages.RoactRodux);
    local v4 = require(l_Parent_0.Packages.Framework);
    local l_Actions_0 = l_Parent_0.Src.Actions;
    local v6 = require(l_Actions_0.SetIsDraggingPoint);
    local v7 = require(l_Actions_0.SetAddPointSubMode);
    local l_Thunks_0 = l_Parent_0.Src.Thunks;
    local v9 = require(l_Thunks_0.AddControlPoint);
    local v10 = require(l_Thunks_0.SetControlPointTangent);
    local v11 = require(l_Thunks_0.SelectControlPoint);
    local l_Components_0 = l_Parent_0.Src.Components;
    local v13 = require(l_Components_0.DraggablePoint);
    local v14 = require(l_Components_0.GuiShim);
    local v15 = require(l_Components_0.Line);
    local l_Image_0 = v4.UI.Image;
    local v17 = require(l_Parent_0.Src.Resources.Constants);
    local l_Util_0 = l_Parent_0.Src.Util;
    local v19 = require(l_Util_0.getClosestControlPointToPosition);
    local v20 = require(l_Util_0.getPositionMatchesControlPoint);
    local v21 = require(l_Util_0.getSnapToControlPoint);
    local v22 = require(l_Util_0.getUDim2FromVector2);
    local v23 = require(l_Util_0.makeNewPath2DControlPoint);
    local v24 = require(l_Util_0.getRelativePosFromAbsPos);
    local v25 = require(l_Util_0.getAbsPosFromRelative);
    local v26 = game:DefineFastFlag("PathEditorShowInsertDragTangents", false);
    local v27 = v2.Component:extend("AddPointComponent");
    v27.init = function(v28) --[[ Line: 68 ]] --[[ Name: init ]]
        -- upvalues: v24 (copy), v21 (copy), v20 (copy), v19 (copy), v17 (copy), v26 (copy)
        v28.onDragAreaClicked = function(v29) --[[ Line: 69 ]]
            -- upvalues: v28 (copy), v24 (ref), v21 (ref), v20 (ref), v19 (ref), v17 (ref), v26 (ref)
            if v28.props.SelectedObject == nil then
                return;
            else
                local l_props_0 = v28.props;
                local l_Parent_1 = l_props_0.SelectedObject.Parent;
                v29 = v24(v29, l_Parent_1);
                if l_props_0.AddPointSubMode == "Append" then
                    l_props_0.dispatchAddControlPoint(v21(v29, l_props_0.ControlPoints, l_Parent_1), #l_props_0.ControlPoints + 1);
                    return;
                elseif l_props_0.AddPointSubMode == "Prepend" then
                    l_props_0.dispatchAddControlPoint(v21(v29, l_props_0.ControlPoints, l_Parent_1), 1);
                    return;
                else
                    local v32 = v20(v29, l_props_0.ControlPoints[1], l_Parent_1);
                    local v33 = v20(v29, l_props_0.ControlPoints[#l_props_0.ControlPoints], l_Parent_1);
                    if v32 then
                        l_props_0.dispatchSetAddPointSubMode("Prepend");
                        return;
                    elseif v33 then
                        l_props_0.dispatchSetAddPointSubMode("Append");
                        return;
                    else
                        if #l_props_0.ControlPoints > 1 then
                            local v34 = v19(l_props_0.SelectedObject, v29);
                            local v35 = v34[1] + 2;
                            local v36 = v34[2];
                            local v37 = v34[3];
                            if v36 ~= nil and v36 < v17.SnapToSegmentEpsilon then
                                l_props_0.dispatchAddControlPoint(l_props_0.SelectedObject:GetPositionOnCurve(v37), if v26 then math.floor(v35) else v35);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
        v28.onDragAreaHoverMoved = function(v38, v39) --[[ Line: 110 ]]
            -- upvalues: v28 (copy), v24 (ref), v20 (ref)
            if v39 or v28.props.SelectedObject == nil then
                return;
            else
                local l_props_1 = v28.props;
                local l_Parent_2 = l_props_1.SelectedObject.Parent;
                local v42 = v24(v38, l_Parent_2);
                v28:setState({
                    dragLocationAbs = v38, 
                    dragLocationRelative = v42
                });
                if #l_props_1.ControlPoints > 0 and l_props_1.SelectedObject ~= nil and l_props_1.AddPointSubMode == "Unselected" then
                    if v20(v42, l_props_1.ControlPoints[1], l_Parent_2) then
                        l_props_1.dispatchSelectControlPoint(1);
                        v28:setState({
                            hoveringSelectablePoint = true
                        });
                        return;
                    elseif v20(v42, l_props_1.ControlPoints[#l_props_1.ControlPoints], l_Parent_2) then
                        l_props_1.dispatchSelectControlPoint(#l_props_1.ControlPoints);
                        v28:setState({
                            hoveringSelectablePoint = true
                        });
                        return;
                    elseif l_props_1.SelectedControlPointIndex ~= 0 then
                        l_props_1.dispatchSelectControlPoint(0);
                        v28:setState({
                            hoveringSelectablePoint = false
                        });
                    end;
                end;
                return;
            end;
        end;
        v28.onDragAreaDragged = function(_, v44) --[[ Line: 144 ]]
            -- upvalues: v28 (copy)
            if v28.props.SelectedObject == nil then
                return;
            else
                local l_props_2 = v28.props;
                local l_SelectedObject_0 = l_props_2.SelectedObject;
                local v47 = l_props_2.AddPointSubMode == "Append" and "Right" or "Left";
                if #l_props_2.ControlPoints > 0 and l_SelectedObject_0 ~= nil and (l_props_2.AddPointSubMode ~= "Unselected" or l_props_2.SelectedControlPointIndex ~= 0) then
                    l_props_2.dispatchSetControlPointTangent(l_SelectedObject_0.SelectedControlPoint, v47, v44, false, false);
                end;
                return;
            end;
        end;
        v28:setState({
            hoveringSelectablePoint = false
        });
    end;
    v27.render = function(v48) --[[ Line: 169 ]] --[[ Name: render ]]
        -- upvalues: v22 (copy), v25 (copy), v21 (copy), v19 (copy), v17 (copy), v23 (copy), v2 (copy), v14 (copy), v13 (copy), v15 (copy), l_Image_0 (copy)
        local l_props_3 = v48.props;
        local l_state_0 = v48.state;
        if l_props_3.SelectedObject == nil then
            return nil;
        else
            local l_SelectedObject_1 = l_props_3.SelectedObject;
            if l_props_3.Path2DToolMode ~= "AddPoint" or l_SelectedObject_1.Parent == nil then
                return nil;
            else
                local l_Parent_3 = l_SelectedObject_1.Parent;
                local v53 = #l_props_3.ControlPoints == 0;
                if #l_props_3.ControlPoints < 2 and l_props_3.AddPointSubMode ~= "Append" then
                    l_props_3.dispatchSetAddPointSubMode("Append");
                end;
                local v54 = nil;
                local v55 = nil;
                if v53 or l_props_3.AddPointSubMode == "Unselected" then
                    v54 = UDim2.new();
                else
                    if l_props_3.AddPointSubMode == "Append" then
                        v55 = l_props_3.ControlPoints[#l_props_3.ControlPoints];
                    elseif l_props_3.AddPointSubMode == "Prepend" then
                        v55 = l_props_3.ControlPoints[1];
                    end;
                    if v55 ~= nil then
                        v54 = v22(v25(v55.Position, l_Parent_3), l_Parent_3);
                    end;
                end;
                local v56 = if l_state_0.dragLocationAbs ~= nil then v22(l_state_0.dragLocationAbs) else UDim2.new();
                local v57 = not l_props_3.ToolbarHovered and not l_props_3.IsDraggingPoint and l_state_0.dragLocationAbs ~= nil;
                local v58 = v57 and not v53 and v55 ~= nil and l_props_3.AddPointSubMode ~= "Unselected";
                local v59 = false;
                if l_props_3.AddPointSubMode ~= "Unselected" and v57 then
                    v56 = v22(v25(v21(l_state_0.dragLocationRelative, l_props_3.ControlPoints, l_Parent_3), l_Parent_3), l_Parent_3);
                    v59 = true;
                elseif l_props_3.AddPointSubMode == "Unselected" and v57 and #l_props_3.ControlPoints > 1 then
                    local v60 = v19(l_SelectedObject_1, l_state_0.dragLocationRelative);
                    local v61 = v60[2];
                    local v62 = v60[3];
                    if v61 ~= nil and v61 < v17.SnapToSegmentEpsilon then
                        v56 = v22(v25(l_SelectedObject_1:GetPositionOnCurve(v62), l_Parent_3));
                        v59 = not l_state_0.hoveringSelectablePoint;
                    end;
                end;
                local v63 = nil;
                if v58 and v55 ~= nil and l_SelectedObject_1 ~= nil then
                    local v64 = if l_props_3.AddPointSubMode == "Append" then v55.RightTangent else v55.LeftTangent;
                    v63 = {
                        v23(v54, v64, v64), 
                        v23(v56)
                    };
                end;
                return v2.createElement(if game:GetFastFlag("PathEditorSurfaceGui") then v14 else "ScreenGui", {
                    DisplayOrder = 3, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                }, {
                    v2.createElement(v13, {
                        Style = "AddPoint", 
                        Size = UDim2.fromScale(1, 1), 
                        FollowCursorOnDrag = false, 
                        OnSelected = v48.onDragAreaClicked, 
                        OnDragStart = function(_) --[[ Line: 263 ]] --[[ Name: OnDragStart ]]
                            -- upvalues: l_props_3 (copy)
                            l_props_3.dispatchSetIsDraggingPoint(true);
                        end, 
                        OnDragMoved = v48.onDragAreaDragged, 
                        OnDragEnd = function() --[[ Line: 267 ]] --[[ Name: OnDragEnd ]]
                            -- upvalues: l_props_3 (copy)
                            l_props_3.dispatchSetIsDraggingPoint(false);
                        end, 
                        OnHoverMoved = v48.onDragAreaHoverMoved
                    }, {
                        Line = if v58 then v2.createElement(v15, {
                            Color = l_SelectedObject_1.Color3, 
                            Style = "Tangent", 
                            Thickness = l_SelectedObject_1.Thickness, 
                            ControlPoints = v63
                        }) else nil, 
                        ControlPoint = if v59 then v2.createElement(l_Image_0, {
                            Style = "ControlPoint", 
                            Position = v56, 
                            ZIndex = 1
                        }) else nil
                    })
                });
            end;
        end;
    end;
    return v3.connect(function(v66, _) --[[ Line: 292 ]]
        return {
            Refreshed = v66.PathReducer.Refreshed, 
            SelectedObject = v66.PathReducer.SelectedObject, 
            ParentAbsPos = v66.PathReducer.ParentAbsPos, 
            ParentAbsSize = v66.PathReducer.ParentAbsSize, 
            ParentAbsRotation = v66.PathReducer.ParentAbsRotation, 
            Path2DToolMode = v66.PathReducer.Path2DToolMode, 
            ControlPoints = v66.PathReducer.ControlPoints, 
            ToolbarHovered = v66.PathReducer.ToolbarHovered, 
            IsDraggingPoint = v66.PathReducer.IsDraggingPoint, 
            AddPointSubMode = v66.PathReducer.AddPointSubMode, 
            SelectedControlPointIndex = v66.PathReducer.SelectedControlPointIndex
        };
    end, function(v68) --[[ Line: 306 ]]
        -- upvalues: v9 (copy), v11 (copy), v10 (copy), v6 (copy), v7 (copy)
        return {
            dispatchAddControlPoint = function(v69, v70) --[[ Line: 308 ]] --[[ Name: dispatchAddControlPoint ]]
                -- upvalues: v68 (copy), v9 (ref)
                v68(v9(v69, v70));
            end, 
            dispatchSelectControlPoint = function(v71) --[[ Line: 311 ]] --[[ Name: dispatchSelectControlPoint ]]
                -- upvalues: v68 (copy), v11 (ref)
                v68(v11(v71));
            end, 
            dispatchSetControlPointTangent = function(v72, v73, v74, v75, v76) --[[ Line: 314 ]] --[[ Name: dispatchSetControlPointTangent ]]
                -- upvalues: v68 (copy), v10 (ref)
                v68(v10(v72, v73, v74, v75, v76));
            end, 
            dispatchSetIsDraggingPoint = function(v77) --[[ Line: 323 ]] --[[ Name: dispatchSetIsDraggingPoint ]]
                -- upvalues: v68 (copy), v6 (ref)
                v68(v6(v77));
            end, 
            dispatchSetAddPointSubMode = function(v78) --[[ Line: 326 ]] --[[ Name: dispatchSetAddPointSubMode ]]
                -- upvalues: v68 (copy), v7 (ref)
                v68(v7(v78));
            end
        };
    end)(v27);
else
    local l_Parent_4 = script.Parent.Parent.Parent;
    local _ = require(l_Parent_4.Src.Types);
    local v81 = require(l_Parent_4.Packages.React);
    local v82 = require(l_Parent_4.Packages.RoactRodux);
    local v83 = require(l_Parent_4.Packages.Framework);
    local l_Actions_1 = l_Parent_4.Src.Actions;
    local v85 = require(l_Actions_1.SetIsDraggingPoint);
    local v86 = require(l_Actions_1.SetAddPointSubMode);
    local l_Thunks_1 = l_Parent_4.Src.Thunks;
    local v88 = require(l_Thunks_1.AddControlPoint);
    local v89 = require(l_Thunks_1.SetControlPointTangent);
    local v90 = require(l_Thunks_1.SelectControlPoint);
    local l_Components_1 = l_Parent_4.Src.Components;
    local v92 = require(l_Components_1.DraggablePoint);
    local v93 = require(l_Components_1.GuiShim);
    local v94 = require(l_Components_1.Line);
    local l_Image_1 = v83.UI.Image;
    local v96 = require(l_Parent_4.Src.Resources.Constants);
    local l_Util_1 = l_Parent_4.Src.Util;
    local v98 = require(l_Util_1.getAbsolutePosition);
    local v99 = require(l_Util_1.makeNewPath2DControlPoint);
    local v100 = require(l_Util_1.getSnapToControlPoint);
    local v101 = require(l_Util_1.getUDim2FromVector2);
    local v102 = require(l_Util_1.getUDim2OffsetFromScale);
    local v103 = require(l_Util_1.getPositionMatchesControlPoint);
    local v104 = require(l_Util_1.getPosOnCurveOffset);
    local v105 = require(l_Util_1.getClosestControlPointToPosition);
    local v106 = game:DefineFastFlag("PathEditorInsertPointSnappingFix", false);
    local v107 = v81.Component:extend("AddPointComponent");
    v107.init = function(v108) --[[ Line: 395 ]] --[[ Name: init ]]
        -- upvalues: v98 (copy), v101 (copy), v100 (copy), v103 (copy), v106 (copy), v105 (copy), v96 (copy), v104 (copy)
        v108.onDragAreaClicked = function(v109) --[[ Line: 396 ]]
            -- upvalues: v108 (copy), v98 (ref), v101 (ref), v100 (ref), v103 (ref), v106 (ref), v105 (ref), v96 (ref), v104 (ref)
            local l_props_4 = v108.props;
            local v111 = v98(l_props_4.SelectedObject);
            local l_ParentAbsPos_0 = l_props_4.ParentAbsPos;
            local l_ParentAbsSize_0 = l_props_4.ParentAbsSize;
            local v114 = v101(v109 - v111);
            if l_props_4.AddPointSubMode == "Append" then
                l_props_4.dispatchAddControlPoint(v100(v114, l_props_4.ControlPoints, l_ParentAbsPos_0, l_ParentAbsSize_0), #l_props_4.ControlPoints + 1);
                return;
            elseif l_props_4.AddPointSubMode == "Prepend" then
                l_props_4.dispatchAddControlPoint(v100(v114, l_props_4.ControlPoints, l_ParentAbsPos_0, l_ParentAbsSize_0), 1);
                return;
            else
                local v115 = v103(v114, l_props_4.ControlPoints[1], l_ParentAbsPos_0, l_ParentAbsSize_0);
                local v116 = v103(v114, l_props_4.ControlPoints[#l_props_4.ControlPoints], l_ParentAbsPos_0, l_ParentAbsSize_0);
                if v115 then
                    l_props_4.dispatchSetAddPointSubMode("Prepend");
                    return;
                elseif v116 then
                    l_props_4.dispatchSetAddPointSubMode("Append");
                    return;
                else
                    if #l_props_4.ControlPoints > 1 then
                        local v117 = if v106 then v105(l_props_4.SelectedObject, v109 - v111) else v105(l_props_4.SelectedObject, v109);
                        local v118 = v117[1] + 2;
                        local v119 = v117[2];
                        local v120 = v117[3];
                        if v119 ~= nil and v119 < v96.SnapToSegmentEpsilon then
                            local v121 = v101(l_ParentAbsPos_0) - v101(v111);
                            local v122 = v104(l_props_4.SelectedObject, v120) + v121;
                            l_props_4.dispatchAddControlPoint(v122, v118);
                        end;
                    end;
                    return;
                end;
            end;
        end;
        v108.onDragAreaHoverMoved = function(v123) --[[ Line: 443 ]]
            -- upvalues: v108 (copy), v98 (ref), v101 (ref), v103 (ref)
            v108:setState({
                dragLocation = v123
            });
            local l_props_5 = v108.props;
            if #l_props_5.ControlPoints > 0 and l_props_5.SelectedObject ~= nil and l_props_5.AddPointSubMode == "Unselected" then
                local v125 = v98(l_props_5.SelectedObject);
                local v126 = v101(v123 - v125);
                if v103(v126, l_props_5.ControlPoints[1], l_props_5.ParentAbsPos, l_props_5.ParentAbsSize) then
                    l_props_5.dispatchSelectControlPoint(1);
                    v108:setState({
                        hoveringSelectablePoint = true
                    });
                    return;
                elseif v103(v126, l_props_5.ControlPoints[#l_props_5.ControlPoints], l_props_5.ParentAbsPos, l_props_5.ParentAbsSize) then
                    l_props_5.dispatchSelectControlPoint(#l_props_5.ControlPoints);
                    v108:setState({
                        hoveringSelectablePoint = true
                    });
                    return;
                elseif l_props_5.SelectedControlPointIndex ~= 0 then
                    l_props_5.dispatchSelectControlPoint(0);
                    v108:setState({
                        hoveringSelectablePoint = false
                    });
                end;
            end;
        end;
        v108.onDragAreaDragged = function(_, v128) --[[ Line: 484 ]]
            -- upvalues: v108 (copy)
            local l_props_6 = v108.props;
            local l_SelectedObject_2 = l_props_6.SelectedObject;
            local v131 = l_props_6.AddPointSubMode == "Append" and "Right" or "Left";
            if #l_props_6.ControlPoints > 0 and l_SelectedObject_2 ~= nil and l_props_6.AddPointSubMode ~= "Unselected" then
                l_props_6.dispatchSetControlPointTangent(l_SelectedObject_2.SelectedControlPoint, v131, v128, false, false);
            end;
        end;
        v108:setState({
            hoveringSelectablePoint = false
        });
    end;
    v107.render = function(v132) --[[ Line: 506 ]] --[[ Name: render ]]
        -- upvalues: v98 (copy), v102 (copy), v101 (copy), v100 (copy), v106 (copy), v105 (copy), v96 (copy), v104 (copy), v99 (copy), v81 (copy), v93 (copy), v92 (copy), v94 (copy), l_Image_1 (copy)
        local l_props_7 = v132.props;
        local l_state_1 = v132.state;
        if not l_props_7.SelectedObject or l_props_7.Path2DToolMode ~= "AddPoint" then
            return nil;
        else
            local v135 = v98(l_props_7.SelectedObject);
            local v136 = #l_props_7.ControlPoints == 0;
            if #l_props_7.ControlPoints < 2 and l_props_7.AddPointSubMode ~= "Append" then
                l_props_7.dispatchSetAddPointSubMode("Append");
            end;
            local v137 = nil;
            local v138 = nil;
            if v136 or l_props_7.AddPointSubMode == "Unselected" then
                v137 = UDim2.new();
            else
                if l_props_7.AddPointSubMode == "Append" then
                    v138 = l_props_7.ControlPoints[#l_props_7.ControlPoints];
                elseif l_props_7.AddPointSubMode == "Prepend" then
                    v138 = l_props_7.ControlPoints[1];
                end;
                if v138 ~= nil and l_props_7.SelectedObject ~= nil then
                    v137 = v102(v138.Position, l_props_7.SelectedObject.Parent) + v101(v135);
                end;
            end;
            local v139 = if l_state_1.dragLocation ~= nil then v101(l_state_1.dragLocation) else UDim2.new();
            local v140 = not l_props_7.ToolbarHovered and not l_props_7.IsDraggingPoint and l_state_1.dragLocation ~= nil;
            local v141 = v140 and not v136 and v138 ~= nil and l_props_7.AddPointSubMode ~= "Unselected";
            local v142 = false;
            if l_props_7.AddPointSubMode ~= "Unselected" and v140 and l_props_7.SelectedObject ~= nil then
                v139 = v102(v100(v101(l_state_1.dragLocation - v135), l_props_7.ControlPoints, l_props_7.ParentAbsPos, l_props_7.ParentAbsSize) + v101(v135), l_props_7.SelectedObject.Parent);
                v142 = true;
            elseif l_props_7.AddPointSubMode == "Unselected" and v140 and #l_props_7.ControlPoints > 1 and l_props_7.SelectedObject ~= nil then
                local v143 = v98(l_props_7.SelectedObject.Parent);
                local v144 = if v106 then v105(l_props_7.SelectedObject, l_state_1.dragLocation - v143) else v105(l_props_7.SelectedObject, l_state_1.dragLocation);
                local v145 = v144[2];
                local v146 = v144[3];
                if v145 ~= nil and v145 < v96.SnapToSegmentEpsilon then
                    v139 = v104(l_props_7.SelectedObject, v146) + v101(v143);
                    v142 = not l_state_1.hoveringSelectablePoint;
                end;
            end;
            local v147 = nil;
            if v141 and v138 ~= nil and l_props_7.SelectedObject ~= nil then
                local v148 = if l_props_7.AddPointSubMode == "Append" then v138.RightTangent else v138.LeftTangent;
                v148 = v102(v148, l_props_7.SelectedObject.Parent);
                v147 = {
                    v99(v137, v148, v148), 
                    v99(v139)
                };
            end;
            return v81.createElement(if game:GetFastFlag("PathEditorSurfaceGui") then v93 else "ScreenGui", {
                DisplayOrder = 3, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                v81.createElement(v92, {
                    Style = "AddPoint", 
                    Size = UDim2.fromScale(1, 1), 
                    FollowCursorOnDrag = false, 
                    OnSelected = v132.onDragAreaClicked, 
                    OnDragStart = function(_) --[[ Line: 603 ]] --[[ Name: OnDragStart ]]
                        -- upvalues: l_props_7 (copy)
                        l_props_7.dispatchSetIsDraggingPoint(true);
                    end, 
                    OnDragMoved = v132.onDragAreaDragged, 
                    OnDragEnd = function() --[[ Line: 607 ]] --[[ Name: OnDragEnd ]]
                        -- upvalues: l_props_7 (copy)
                        l_props_7.dispatchSetIsDraggingPoint(false);
                    end, 
                    OnHoverMoved = v132.onDragAreaHoverMoved
                }, {
                    Line = if v141 then v81.createElement(v94, {
                        Color = if l_props_7.SelectedObject then l_props_7.SelectedObject.Color3 else nil, 
                        Style = "Tangent", 
                        Thickness = if l_props_7.SelectedObject then l_props_7.SelectedObject.Thickness else nil, 
                        ControlPoints = v147
                    }) else nil, 
                    ControlPoint = if v142 then v81.createElement(l_Image_1, {
                        Style = "ControlPoint", 
                        Position = v139, 
                        ZIndex = 1
                    }) else nil
                })
            });
        end;
    end;
    return v82.connect(function(v150, _) --[[ Line: 632 ]]
        return {
            Refreshed = v150.PathReducer.Refreshed, 
            SelectedObject = v150.PathReducer.SelectedObject, 
            ParentAbsPos = v150.PathReducer.ParentAbsPos, 
            ParentAbsSize = v150.PathReducer.ParentAbsSize, 
            Path2DToolMode = v150.PathReducer.Path2DToolMode, 
            ControlPoints = v150.PathReducer.ControlPoints, 
            ToolbarHovered = v150.PathReducer.ToolbarHovered, 
            IsDraggingPoint = v150.PathReducer.IsDraggingPoint, 
            AddPointSubMode = v150.PathReducer.AddPointSubMode
        };
    end, function(v152) --[[ Line: 644 ]]
        -- upvalues: v88 (copy), v90 (copy), v89 (copy), v85 (copy), v86 (copy)
        return {
            dispatchAddControlPoint = function(v153, v154) --[[ Line: 646 ]] --[[ Name: dispatchAddControlPoint ]]
                -- upvalues: v152 (copy), v88 (ref)
                v152(v88(v153, v154));
            end, 
            dispatchSelectControlPoint = function(v155) --[[ Line: 649 ]] --[[ Name: dispatchSelectControlPoint ]]
                -- upvalues: v152 (copy), v90 (ref)
                v152(v90(v155));
            end, 
            dispatchSetControlPointTangent = function(v156, v157, v158, v159, v160) --[[ Line: 652 ]] --[[ Name: dispatchSetControlPointTangent ]]
                -- upvalues: v152 (copy), v89 (ref)
                v152(v89(v156, v157, v158, v159, v160));
            end, 
            dispatchSetIsDraggingPoint = function(v161) --[[ Line: 661 ]] --[[ Name: dispatchSetIsDraggingPoint ]]
                -- upvalues: v152 (copy), v85 (ref)
                v152(v85(v161));
            end, 
            dispatchSetAddPointSubMode = function(v162) --[[ Line: 664 ]] --[[ Name: dispatchSetAddPointSubMode ]]
                -- upvalues: v152 (copy), v86 (ref)
                v152(v86(v162));
            end
        };
    end)(v107);
end;