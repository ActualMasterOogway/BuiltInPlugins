local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v3.UI.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v10 = v1.PureComponent:extend("FaceControlsEditorWindow");
local v11 = Vector2.new(v7.faceControlsEditorOriginalWidth, 310);
local v12 = Vector2.new(185, 110);
local l_Slider_0 = v3.UI.Slider;
local l_DragBox_0 = v3.UI.DragBox;
local l_Checkbox_0 = v3.UI.Checkbox;
local l_Pane_0 = v3.UI.Pane;
local l_Button_0 = v3.UI.Button;
local v18 = require(l_script_FirstAncestor_0.Src.Thunks.ValueChanged);
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetSymmetryEnabled);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetAutoFocusFaceEnabled);
local v22 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v23 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v24 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_FaceControlsMapping_0 = require(script:WaitForChild("FaceControlsMapping"));
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v27 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
v10.init = function(v28) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v28.state = {
        Tooltip = nil, 
        treeArray = {}, 
        showContextMenu = false, 
        currentlyEditedFacsProperties = {}, 
        scaleFactor = 1
    };
    v28.onAbsoluteSizeChange = function(v29) --[[ Line: 79 ]]
        -- upvalues: v7 (ref), v28 (copy)
        local l_X_0 = v29.AbsoluteSize.X;
        local l_Y_0 = v29.AbsoluteSize.Y;
        local v32 = math.clamp(l_X_0 / v7.faceControlsEditorOriginalWidth, 0.05, 1.65);
        local v33 = v7.faceControlsEditorDiagramPadding + (v7.faceControlsEditorFaceFrontDiagramHeight + v7.faceControlsEditorFaceSideDiagramHeight) + v7.faceControlsEditoSpacingBetweenDiagrams;
        v32 = math.min(v32, (l_Y_0 - (v7.faceControlsEditorTogglesContainerHeight + v7.faceControlsEditorDiagramPadding * 2)) / v33);
        v28:setState({
            panelWidth = l_X_0, 
            panelHeight = l_Y_0, 
            scaleFactor = v32
        });
    end;
    v28.showContextMenu = function() --[[ Line: 102 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            showContextMenu = true
        });
    end;
    v28.hideContextMenu = function() --[[ Line: 108 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            showContextMenu = false
        });
    end;
    v28.setValues = function(v34, v35) --[[ Line: 114 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            currentMax = v35, 
            currentMin = v34
        });
    end;
    v28.hideFaceControlsEditor = function() --[[ Line: 121 ]]
        -- upvalues: v28 (copy)
        local l_props_0 = v28.props;
        if l_props_0.ShowFaceControlsEditorPanel then
            l_props_0.SetShowFaceControlsEditorPanel(false);
        end;
        if l_props_0.FaceControlsEditorEnabled then
            l_props_0.SetFaceControlsEditorEnabled(false);
        end;
    end;
    v28.onDockWidgetLoaded = function(v37) --[[ Line: 132 ]]
        -- upvalues: v28 (copy)
        if v37:IsA("PluginGui") then
            v37:BindToClose(v28.hideFaceControlsEditor);
        end;
    end;
    v28.onTreeUpdated = function(v38) --[[ Line: 138 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            treeArray = v38
        });
    end;
    v28.changeSelectedTrack = function(v39) --[[ Line: 144 ]]
        -- upvalues: v28 (copy)
        local l_state_0 = v28.state;
        local l_props_1 = v28.props;
        local l_treeArray_0 = l_state_0.treeArray;
        local l_SelectedTrack_0 = l_props_1.SelectedTrack;
        local l_SetSelectedTracks_0 = l_props_1.SetSelectedTracks;
        local v45 = 0;
        for v46, v47 in ipairs(l_treeArray_0) do
            if l_SelectedTrack_0 and l_SelectedTrack_0[1] == v47 then
                v45 = v46;
                break;
            end;
        end;
        l_SetSelectedTracks_0({
            {
                l_treeArray_0[math.clamp(v45 + v39, 1, #l_treeArray_0)]
            }
        });
    end;
end;
v10.addAction = function(v48, v49, v50) --[[ Line: 166 ]] --[[ Name: addAction ]]
    if v49 then
        v49.Enabled = false;
        table.insert(v48.Actions, v49);
        table.insert(v48.Connections, v49.Triggered:Connect(v50));
    end;
end;
v10.didMount = function(v51) --[[ Line: 174 ]] --[[ Name: didMount ]]
    -- upvalues: v27 (copy), v8 (copy)
    local l_PluginActions_0 = v51.props.PluginActions;
    v51.Connections = {};
    v51.Actions = {};
    v51:addAction(l_PluginActions_0:get("FocusCamera"), function() --[[ Line: 178 ]]
        -- upvalues: v27 (ref), v8 (ref), v51 (copy)
        if v27() then
            v8.focusCameraOnFace(v51.props.RootInstance);
            return;
        else
            focusFace(v51.props);
            return;
        end;
    end);
end;
v10.willUnmount = function(v53) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
    if v53.Connections then
        for _, v55 in ipairs(v53.Connections) do
            v55:Disconnect();
        end;
        v53.Connections = {};
    end;
    if v53.Actions then
        for _, v57 in ipairs(v53.Actions) do
            v57.Enabled = false;
        end;
    end;
    v53.hideFaceControlsEditor();
end;
getFacsListData = function() --[[ Line: 202 ]] --[[ Name: getFacsListData ]]
    -- upvalues: v7 (copy), v24 (copy)
    local v58 = {};
    for v59, _ in pairs(v7.FacsControlToRegionMap) do
        v58[v59] = {
            Name = v59, 
            Instance = "Root", 
            Type = v7.TRACK_TYPES.Facs
        };
    end;
    v58 = v24.Dictionary.values(v58);
    table.sort(v58, function(v61, v62) --[[ Line: 215 ]]
        return v61.Name < v62.Name;
    end);
    return v58;
end;
formatNumber = function(v63) --[[ Line: 222 ]] --[[ Name: formatNumber ]]
    -- upvalues: v7 (copy)
    local l_NUMBER_PRECISION_0 = v7.NUMBER_PRECISION;
    return (tostring(math.floor(0.5 + v63 * l_NUMBER_PRECISION_0) / l_NUMBER_PRECISION_0));
end;
prepAndTriggerSliderContextMenu = function(v65, v66, v67, v68, v69, v70) --[[ Line: 228 ]] --[[ Name: prepAndTriggerSliderContextMenu ]]
    -- upvalues: v7 (copy)
    local v71 = {
        v66.Name
    };
    if v70 then
        table.insert(v71, v70[1]);
        table.insert(v71, v70[2]);
        if v67.SymmetryEnabled then
            local l_symmetryPartner_0 = v7.FacsCrossMappings[v70[1]].symmetryPartner;
            if l_symmetryPartner_0 then
                table.insert(v71, l_symmetryPartner_0);
            end;
            l_symmetryPartner_0 = v7.FacsCrossMappings[v70[2]].symmetryPartner;
            if l_symmetryPartner_0 then
                table.insert(v71, l_symmetryPartner_0);
            end;
        end;
    end;
    if v67.SymmetryEnabled then
        v69 = v68.symmetryPartner;
        if v69 then
            table.insert(v71, v69);
        end;
    end;
    v65.state.currentlyEditedFacsProperties = v71;
    v65.state.showContextMenu = true;
    v65:showContextMenu();
end;
getSliderTooltipText = function(v73, v74) --[[ Line: 258 ]] --[[ Name: getSliderTooltipText ]]
    -- upvalues: v7 (copy)
    local l_Name_0 = v73.Name;
    local l_sliderGroup_0 = v7.FacsCrossMappings[v73.Name].sliderGroup;
    local v77 = formatNumber(v74.currentValue);
    if l_sliderGroup_0 then
        if v74.Tooltip and v74.currentValue == v74.defaultValue then
            l_Name_0 = v74.Tooltip;
            v77 = 0;
        elseif v74.currentValue < 0.5 then
            l_Name_0 = l_sliderGroup_0[1];
            v77 = formatNumber((math.clamp(1 - v74.currentValue * 2, 0, 1)));
        else
            l_Name_0 = l_sliderGroup_0[2];
            v77 = formatNumber((v74.currentValue - 0.5) * 2);
        end;
    end;
    return l_Name_0 .. ": " .. v77;
end;
handleSliderOnValueChanged = function(v78, v79, v80, v81, v82, v83, v84, v85, v86, v87) --[[ Line: 279 ]] --[[ Name: handleSliderOnValueChanged ]]
    -- upvalues: l_FaceControlsMapping_0 (copy), v7 (copy)
    v83.currentValue = v80;
    v78:setState({
        Tooltip = getSliderTooltipText(v79, v83), 
        Value = math.clamp(v83.currentValue, v81, v82)
    });
    local l_Name_1 = v79.Name;
    local l_props_2 = v78.props;
    local l_v80_0 = v80;
    if v85 and v84.indexInGroup == 1 then
        local v91 = nil;
        v91 = if v84.indexInGroup == 1 then v85[2] else v85[1];
        local v92 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v91];
        local v93 = 0;
        if v80 <= 0.5 then
            l_v80_0 = math.clamp(1 - v80 * 2, 0, 1);
            v93 = 0;
        else
            l_v80_0 = 0;
            v93 = (v80 - 0.5) * 2;
        end;
        local v94 = 0.5 + v93 * 0.5;
        v92.currentValue = v94;
        triggerValueChanged(l_props_2, v91, v93);
        if v78.props.SymmetryEnabled then
            local v95 = nil;
            local v96 = nil;
            v96 = v7.FacsCrossMappings[v91].symmetryPartner;
            if v96 then
                v95 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v96];
            end;
            if v95 then
                v95.currentValue = v94;
            end;
            if v96 then
                triggerValueChanged(l_props_2, v96, v93);
            end;
        end;
    end;
    if not v85 or v85 and v84.indexInGroup == 1 then
        triggerValueChanged(l_props_2, l_Name_1, l_v80_0);
    end;
    if v78.props.SymmetryEnabled and v87 then
        v87.currentValue = v80;
        triggerValueChanged(l_props_2, v86, l_v80_0);
    end;
end;
makeFacsOnFaceDiagramSliderUIItems = function(v97, _, _) --[[ Line: 360 ]] --[[ Name: makeFacsOnFaceDiagramSliderUIItems ]]
    -- upvalues: v7 (copy), l_FaceControlsMapping_0 (copy), v1 (copy), l_Slider_0 (copy)
    local v100 = {};
    local l_Stylizer_0 = v97.props.Stylizer;
    local v102 = getFacsListData();
    for _, v104 in ipairs(v102) do
        local v105 = "Facs_" .. v104.Name;
        local v106 = v7.FacsCrossMappings[v104.Name];
        local v107 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v104.Name];
        local l_sliderGroup_1 = v106.sliderGroup;
        if v107 and (not l_sliderGroup_1 or l_sliderGroup_1 and v106.indexInGroup == 1) then
            local v109 = nil;
            local v110 = nil;
            if v97.props.SymmetryEnabled then
                v110 = v106.symmetryPartner;
                if v110 then
                    v109 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v110];
                end;
            end;
            local v111 = 43;
            if v107.customWidth then
                v111 = v107.customWidth;
            end;
            local v112 = math.clamp(v107.currentValue, 0, 1);
            local v113 = l_sliderGroup_1 ~= nil;
            local v114 = l_Stylizer_0.faceSliderMaxValueTheme and (v112 == 0 or v112 == 1 or v113 and v112 == 0.5);
            do
                local l_v109_0, l_v110_0 = v109, v110;
                v100[v105 .. "_rotatedSliderContainer"] = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(v107.position.X.Scale, v107.position.X.Offset * v97.state.scaleFactor, v107.position.Y.Scale, v107.position.Y.Offset * v97.state.scaleFactor), 
                    Size = UDim2.new(0, v111 * v97.state.scaleFactor, 0, 2 * v97.state.scaleFactor), 
                    Rotation = v107.rotation, 
                    LayoutOrder = 2, 
                    ZIndex = 100
                }, {
                    Scrubber = v1.createElement(l_Slider_0, {
                        Style = if v114 then l_Stylizer_0.faceSliderMaxValueTheme else l_Stylizer_0.faceSliderTheme, 
                        Disabled = false, 
                        Min = 0, 
                        Max = 1, 
                        Tooltip = getSliderTooltipText(v104, v107), 
                        Value = v112, 
                        FillFromCenter = v113, 
                        OnRightClick = function() --[[ Line: 423 ]] --[[ Name: OnRightClick ]]
                            -- upvalues: v97 (copy), v104 (copy), v106 (copy), l_v110_0 (ref), l_sliderGroup_1 (copy)
                            prepAndTriggerSliderContextMenu(v97, v104, v97.props, v106, l_v110_0, l_sliderGroup_1);
                        end, 
                        OnChangeBegan = function() --[[ Line: 433 ]] --[[ Name: OnChangeBegan ]]
                            -- upvalues: v97 (copy), v104 (copy), l_v110_0 (ref), l_sliderGroup_1 (copy), v7 (ref)
                            v97.props.AddWaypoint();
                            local v117 = {
                                {
                                    v104.Name
                                }
                            };
                            if l_v110_0 then
                                table.insert(v117, {
                                    l_v110_0
                                });
                            end;
                            if l_sliderGroup_1 then
                                local v118 = l_sliderGroup_1[2];
                                table.insert(v117, {
                                    v118
                                });
                                if l_v110_0 then
                                    table.insert(v117, {
                                        v7.FacsCrossMappings[v118].symmetryPartner
                                    });
                                end;
                            end;
                            v97.props.SetSelectedTracks(v117);
                        end, 
                        OnValueChanged = function(v119) --[[ Line: 453 ]] --[[ Name: OnValueChanged ]]
                            -- upvalues: v97 (copy), v104 (copy), v107 (copy), v106 (copy), l_sliderGroup_1 (copy), l_v110_0 (ref), l_v109_0 (ref)
                            handleSliderOnValueChanged(v97, v104, v119, 0, 1, v107, v106, l_sliderGroup_1, l_v110_0, l_v109_0);
                        end, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 8), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
    end;
    return v1.createFragment(v100);
end;
triggerValueChanged = function(v120, v121, v122) --[[ Line: 478 ]] --[[ Name: triggerValueChanged ]]
    -- upvalues: v7 (copy)
    if not v120.ReadOnly then
        v120.ValueChanged("Root", {
            v121
        }, v7.TRACK_TYPES.Facs, nil, v120.Playhead, v122, v120.Analytics);
    end;
end;
makeEyesControlDragBox = function(v123, _, _) --[[ Line: 492 ]] --[[ Name: makeEyesControlDragBox ]]
    -- upvalues: l_FaceControlsMapping_0 (copy), v1 (copy), l_DragBox_0 (copy), v7 (copy)
    local v126 = {};
    local l_Stylizer_1 = v123.props.Stylizer;
    local l_EyesDragBox_0 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
    local v129 = Vector2.new(math.clamp(l_EyesDragBox_0.currentValue.X, -1, 1), (math.clamp(l_EyesDragBox_0.currentValue.Y, -1, 1)));
    local v130 = true;
    if v129.X ~= -1 then
        v130 = true;
        if v129.X ~= 1 then
            v130 = true;
            if v129.Y ~= -1 then
                v130 = true;
                if v129.Y ~= 1 then
                    v130 = false;
                    if v129.X == -0 then
                        v130 = v129.Y == 0;
                    end;
                end;
            end;
        end;
    end;
    v126.EyesDragBox = v1.createElement(l_DragBox_0, {
        Style = if v130 then l_Stylizer_1.faceDragBoxMaxValueTheme else l_Stylizer_1.faceDragBoxTheme, 
        Disabled = false, 
        MinX = -1, 
        MaxX = 1, 
        MinY = -1, 
        MaxY = 1, 
        Tooltip = "EyesLook", 
        Value = v129, 
        OnRightClick = function() --[[ Line: 522 ]] --[[ Name: OnRightClick ]]
            -- upvalues: v7 (ref), v123 (copy)
            local v131 = {};
            table.insert(v131, v7.FacsNames.EyesLookLeft);
            table.insert(v131, v7.FacsNames.EyesLookRight);
            table.insert(v131, v7.FacsNames.EyesLookUp);
            table.insert(v131, v7.FacsNames.EyesLookDown);
            v123.state.currentlyEditedFacsProperties = v131;
            v123.state.showContextMenu = true;
            v123:showContextMenu();
        end, 
        OnChangeBegan = function() --[[ Line: 532 ]] --[[ Name: OnChangeBegan ]]
            -- upvalues: v123 (copy), v7 (ref)
            v123.props.AddWaypoint();
            v123.props.SetSelectedTracks({
                {
                    v7.FacsNames.EyesLookLeft
                }, 
                {
                    v7.FacsNames.EyesLookRight
                }, 
                {
                    v7.FacsNames.EyesLookUp
                }, 
                {
                    v7.FacsNames.EyesLookDown
                }
            });
        end, 
        OnValueChanged = function(v132) --[[ Line: 542 ]] --[[ Name: OnValueChanged ]]
            -- upvalues: l_EyesDragBox_0 (copy), v123 (copy), v7 (ref)
            l_EyesDragBox_0.currentValue = v132;
            v123:setState({
                Tooltip = "EyesLook", 
                Value = Vector2.new(math.clamp(l_EyesDragBox_0.currentValue.X, -1, 1), (math.clamp(l_EyesDragBox_0.currentValue.Y, -1, 1)))
            });
            local l_props_3 = v123.props;
            local v134 = v132.X <= 0 and -v132.X or 0;
            local v135 = v132.X >= 0 and v132.X or 0;
            local v136 = v132.Y <= 0 and -v132.Y or 0;
            local v137 = v132.Y >= 0 and v132.Y or 0;
            triggerValueChanged(l_props_3, v7.FacsNames.EyesLookRight, v134);
            triggerValueChanged(l_props_3, v7.FacsNames.EyesLookLeft, v135);
            triggerValueChanged(l_props_3, v7.FacsNames.EyesLookUp, v136);
            triggerValueChanged(l_props_3, v7.FacsNames.EyesLookDown, v137);
        end, 
        Position = UDim2.new(l_EyesDragBox_0.position.X.Scale, l_EyesDragBox_0.position.X.Offset * v123.state.scaleFactor, l_EyesDragBox_0.position.Y.Scale, l_EyesDragBox_0.position.Y.Offset * v123.state.scaleFactor), 
        Size = UDim2.new(0, 36 * v123.state.scaleFactor, 0, 28 * v123.state.scaleFactor), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
    return v1.createFragment(v126);
end;
getTrackValuesForEyeDragBox = function(v138, v139) --[[ Line: 578 ]] --[[ Name: getTrackValuesForEyeDragBox ]]
    -- upvalues: v7 (copy), l_FaceControlsMapping_0 (copy), v22 (copy)
    if not v138 then
        return;
    else
        local v140 = v138.Tracks[v7.FacsNames.EyesLookLeft];
        local v141 = v138.Tracks[v7.FacsNames.EyesLookRight];
        local v142 = v138.Tracks[v7.FacsNames.EyesLookUp];
        local v143 = v138.Tracks[v7.FacsNames.EyesLookDown];
        local l_EyesDragBox_1 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
        if v140 or v141 or v142 or v143 then
            local v145 = v140 and v22.getValue(v140, v139) or 0;
            local v146 = v141 and v22.getValue(v141, v139) or 0;
            local v147 = v142 and v22.getValue(v142, v139) or 0;
            local v148 = v143 and v22.getValue(v143, v139) or 0;
            local v149 = v145 ~= 0 and v145 or -v146;
            local v150 = v147 ~= 0 and -v147 or v148;
            l_EyesDragBox_1.currentValue = Vector2.new(v149, v150);
            return;
        else
            l_EyesDragBox_1.currentValue = l_EyesDragBox_1.defaultValue;
            return;
        end;
    end;
end;
v10.makeContextMenuActions = function(v151, v152) --[[ Line: 605 ]] --[[ Name: makeContextMenuActions ]]
    local l_props_4 = v151.props;
    local v154 = {};
    table.insert(v154, {
        Text = v152:getText("ContextMenu", "ResetSelected"), 
        OnItemClicked = function() --[[ Line: 610 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v151 (copy), l_props_4 (copy)
            if v151.state.currentlyEditedFacsProperties then
                for _, v156 in ipairs(v151.state.currentlyEditedFacsProperties) do
                    triggerValueChanged(l_props_4, v156, 0);
                end;
            end;
        end
    });
    return v154;
end;
v10.getCurrentValues = function(v157) --[[ Line: 622 ]] --[[ Name: getCurrentValues ]]
    -- upvalues: v9 (copy), v7 (copy), l_FaceControlsMapping_0 (copy), v22 (copy)
    local l_props_5 = v157.props;
    local l_Root_0 = l_props_5.AnimationData.Instances.Root;
    if l_Root_0 == nil then
        return;
    else
        local l_Playhead_0 = l_props_5.Playhead;
        local v161 = v9.getFaceControls(l_props_5.RootInstance);
        if v161 ~= nil then
            for _, v163 in pairs(v7.FacsNames) do
                local v164 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v163];
                if l_Root_0 and l_Root_0.Tracks ~= nil then
                    local v165 = l_Root_0.Tracks[v163];
                    if v165 == nil or v165.Type ~= v7.TRACK_TYPES.Facs then
                        v161[v163] = 0;
                        if v164 then
                            v164.currentValue = v164.defaultValue;
                        end;
                    end;
                else
                    v161[v163] = 0;
                end;
            end;
        end;
        if l_Root_0.Tracks == nil then
            return;
        else
            getTrackValuesForEyeDragBox(l_Root_0, l_Playhead_0);
            for v166, v167 in pairs(l_Root_0.Tracks) do
                local v168 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v166];
                v167.Instance = "Root";
                local v169 = nil;
                if v168 ~= nil then
                    local v170 = v7.FacsCrossMappings[v166];
                    local l_sliderGroup_2 = v170.sliderGroup;
                    v168.currentValue = v168.defaultValue;
                    v169 = v22.getValue(v167, l_Playhead_0);
                    if v169 ~= nil then
                        if l_sliderGroup_2 then
                            local v172 = nil;
                            v172 = if v170.indexInGroup == 1 then l_sliderGroup_2[2] else l_sliderGroup_2[1];
                            if v170.indexInGroup == 1 then
                                v168.currentValue = math.clamp(0.5 - v169 * 0.5, 0, 1);
                                if l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v172].currentValue > 0.5 then
                                    local v173 = 0;
                                    local v174 = l_Root_0.Tracks[v172];
                                    if v174 then
                                        v173 = v22.getValue(v174, l_Playhead_0);
                                    end;
                                    local v175 = 0.5 + v173 * 0.5;
                                    if v173 > 0 then
                                        v168.currentValue = v175;
                                    end;
                                end;
                            else
                                local _ = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v172];
                                local v177 = 0.5 + v169 * 0.5;
                                if v169 > 0 then
                                    v168.currentValue = v177;
                                end;
                            end;
                        else
                            v168.currentValue = v169;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
resetAllValuesInMapping = function() --[[ Line: 729 ]] --[[ Name: resetAllValuesInMapping ]]
    -- upvalues: l_FaceControlsMapping_0 (copy)
    local v178 = getFacsListData();
    for _, v180 in ipairs(v178) do
        local v181 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v180.Name];
        if v181 then
            v181.currentValue = v181.defaultValue;
        end;
    end;
    local l_EyesDragBox_2 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
    l_EyesDragBox_2.currentValue = l_EyesDragBox_2.defaultValue;
end;
v10.willUpdate = function(v183, v184) --[[ Line: 741 ]] --[[ Name: willUpdate ]]
    -- upvalues: v8 (copy)
    if v184.RootInstance ~= v183.props.RootInstance then
        local l_RootInstance_0 = v183.props.RootInstance;
        if l_RootInstance_0 ~= nil then
            v8.resetAllFacsValuesInFaceControls(l_RootInstance_0);
        end;
        resetAllValuesInMapping();
        handleFocusFace(v184);
    end;
    if v184.ShowFaceControlsEditorPanel ~= v183.ShowFaceControlsEditorPanel and v184.ShowFaceControlsEditorPanel == true then
        v183.ShowFaceControlsEditorPanel = true;
        handleFocusFace(v184);
    end;
end;
getFacsKeysWithNonZerovalueCount = function(v186, v187) --[[ Line: 760 ]] --[[ Name: getFacsKeysWithNonZerovalueCount ]]
    -- upvalues: v7 (copy), v22 (copy)
    local v188 = 0;
    if not v186 then
        return v188;
    else
        local l_Root_1 = v186.Instances.Root;
        if not l_Root_1 then
            return v188;
        else
            for _, v191 in pairs(v7.FacsNames) do
                local v192 = l_Root_1.Tracks[v191];
                if v192 then
                    local v193 = v22.getValue(v192, v187);
                    if v193 and v193 ~= 0 then
                        v188 = v188 + 1;
                    end;
                end;
            end;
            return v188;
        end;
    end;
end;
handleFocusFace = function(v194) --[[ Line: 785 ]] --[[ Name: handleFocusFace ]]
    -- upvalues: v27 (copy), v8 (copy)
    if v194.AutoFocusFaceEnabled then
        if v27() then
            v8.focusCameraOnFace(v194.RootInstance);
            return;
        else
            focusFace(v194);
        end;
    end;
end;
focusFace = function(v195) --[[ Line: 798 ]] --[[ Name: focusFace ]]
    -- upvalues: v9 (copy)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local v197 = v9.getFaceControls(v195.RootInstance);
    if v197 ~= nil then
        local l_Parent_0 = v197.Parent;
        if not l_Parent_0 or not l_Parent_0:IsA("BasePart") then
            return;
        else
            local v199 = 0.75;
            v199 = 0.75;
            if l_CurrentCamera_0.FieldOfView ~= 70 then
                v199 = 0.75 / (l_CurrentCamera_0.FieldOfView / 70);
            end;
            local v200 = l_Parent_0.Position + l_Parent_0.CFrame.LookVector * (v199 * 2);
            l_CurrentCamera_0.CFrame = CFrame.new(v200, l_Parent_0.CFrame.Position);
            l_CurrentCamera_0.Focus = l_Parent_0.CFrame;
        end;
    end;
end;
v10.render = function(v201) --[[ Line: 819 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_StyleModifier_0 (copy), v1 (copy), l_DockWidget_0 (copy), v11 (copy), v12 (copy), l_Pane_0 (copy), v7 (copy), v23 (copy), l_Checkbox_0 (copy), l_Button_0 (copy), v22 (copy)
    local l_Localization_0 = v201.props.Localization;
    local l_props_6 = v201.props;
    if not v8.canUseFaceControlsEditor(l_props_6.RootInstance) then
        v201.hideFaceControlsEditor();
        return;
    else
        local l_showContextMenu_0 = v201.state.showContextMenu;
        local l_Stylizer_2 = l_props_6.Stylizer;
        local l_Stylizer_3 = v201.props.Stylizer;
        local l_AnimationData_0 = l_props_6.AnimationData;
        local l_Playhead_1 = l_props_6.Playhead;
        l_props_6.PluginActions:get("FocusCamera").Enabled = true;
        if l_AnimationData_0 ~= nil then
            v201:getCurrentValues();
        end;
        local v209 = getFacsKeysWithNonZerovalueCount(l_AnimationData_0, l_Playhead_1);
        local v210 = nil;
        if v209 == 0 then
            v210 = l_StyleModifier_0.Disabled;
        end;
        return v1.createElement(l_DockWidget_0, {
            Id = "FaceControlsEditor", 
            Title = l_Localization_0:getText("Title", "FaceControlsEditor"), 
            Name = "FaceControlsEditor", 
            ZIndexBehavior = Enum.ZIndexBehavior.Global, 
            InitialDockState = Enum.InitialDockState.Left, 
            InitialEnabled = true, 
            InitialEnabledShouldOverrideRestore = true, 
            Size = v11, 
            MinSize = v12, 
            OnClose = v201.hideFaceControlsEditor, 
            Enabled = true, 
            [v1.Ref] = v201.onDockWidgetLoaded
        }, {
            Container = v1.createElement(l_Pane_0, {
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = -2, 
                [v1.Change.AbsoluteSize] = v201.onAbsoluteSizeChange
            }, {
                FaceFrontContainer = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                    Size = UDim2.new(1, 0, 0, 213), 
                    Position = UDim2.new(0, v7.faceControlsEditorDiagramPadding, 0, v7.faceControlsEditorDiagramPadding), 
                    ZIndex = -1
                }, {
                    FaceFrontViewImage = v1.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0, 0), 
                        Size = UDim2.new(0, v7.faceControlsEditorFaceFrontDiagramWidth * v201.state.scaleFactor, 0, v7.faceControlsEditorFaceFrontDiagramHeight * v201.state.scaleFactor), 
                        Position = UDim2.new(0, 0, 0, 6), 
                        Image = "rbxasset://textures/FaceControlsEditor/face_frontView.png", 
                        BackgroundTransparency = 1, 
                        ImageTransparency = 0, 
                        ZIndex = 0
                    }); 
                    makeFacsOnFaceDiagramSliderUIItems(v201, l_Stylizer_3, l_Localization_0), 
                    makeEyesControlDragBox(v201, l_Stylizer_3, l_Localization_0)
                }), 
                FaceSideContainer = v1.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                    Size = UDim2.new(1, 0, 0, 213), 
                    Position = UDim2.new(0, v7.faceControlsEditorDiagramPadding, 0, (v7.faceControlsEditoSpacingBetweenDiagrams + v7.faceControlsEditorFaceFrontDiagramHeight) * v201.state.scaleFactor), 
                    BackgroundTransparency = 1
                }, {
                    SideviewImage = v1.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0, 0), 
                        Size = UDim2.new(0, v7.faceControlsEditorFaceSideDiagramWidth * v201.state.scaleFactor, 0, v7.faceControlsEditorFaceSideDiagramHeight * v201.state.scaleFactor), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Image = "rbxasset://textures/FaceControlsEditor/face_sideView.png", 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    })
                }), 
                ContextMenu = l_showContextMenu_0 and v1.createElement(v23, {
                    Actions = v201:makeContextMenuActions(l_Localization_0), 
                    OnMenuOpened = v201.hideContextMenu
                }), 
                AdditionalControlsContainer = v1.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 10, 1, -v7.faceControlsEditorTogglesContainerHeight), 
                    Size = UDim2.new(0, 200, 0, v7.faceControlsEditorTogglesContainerHeight), 
                    ZIndex = 400
                }, {
                    CheckboxesList = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    CheckboxSymmetry = v1.createElement(l_Checkbox_0, {
                        Text = l_Localization_0:getText("Title", "Symmetry"), 
                        Checked = v201.props.SymmetryEnabled, 
                        size = v201.props.elementSize, 
                        OnClick = function(_) --[[ Line: 968 ]] --[[ Name: OnClick ]]
                            -- upvalues: v201 (copy)
                            v201.props.SymmetryEnabled = not v201.props.SymmetryEnabled;
                            v201.props.SetSymmetryEnabled(v201.props.SymmetryEnabled);
                        end, 
                        LayoutOrder = 1, 
                        ZIndex = 401
                    }), 
                    CheckboxAutoFocusFace = v1.createElement(l_Checkbox_0, {
                        Text = l_Localization_0:getText("Title", "AutoFocusFace"), 
                        Checked = v201.props.AutoFocusFaceEnabled, 
                        size = v201.props.elementSize, 
                        LayoutOrder = 2, 
                        OnClick = function(_) --[[ Line: 980 ]] --[[ Name: OnClick ]]
                            -- upvalues: v201 (copy)
                            v201.props.AutoFocusFaceEnabled = not v201.props.AutoFocusFaceEnabled;
                            v201.props.SetAutoFocusFaceEnabled(v201.props.AutoFocusFaceEnabled);
                            handleFocusFace(v201.props);
                        end
                    })
                }), 
                BottomFrame = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 52), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = l_Stylizer_2.ikTheme.headerColor, 
                    BorderSizePixel = 0
                }, {
                    WideResetAllButton = v1.createElement(l_Button_0, {
                        Text = l_Localization_0:getText("Title", "ResetAll"), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        Position = UDim2.new(0.5, 0, 1, -10), 
                        IsRound = true, 
                        Size = UDim2.new(1, -10, 0, 32), 
                        StyleModifier = v210, 
                        LayoutOrder = 3, 
                        OnClick = function() --[[ Line: 1003 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_props_6 (copy), v8 (ref), l_AnimationData_0 (copy), v7 (ref), v22 (ref)
                            l_props_6.AddWaypoint();
                            v8.resetAllFacsValuesInFaceControls(l_props_6.RootInstance);
                            local l_Root_2 = l_AnimationData_0.Instances.Root;
                            resetAllValuesInMapping();
                            for _, v215 in pairs(v7.FacsNames) do
                                local v216 = l_Root_2.Tracks[v215];
                                if v216 and v22.getValue(v216, l_props_6.Playhead) then
                                    triggerValueChanged(l_props_6, v215, 0);
                                end;
                            end;
                        end
                    })
                })
            })
        });
    end;
end;
local function v220(v217, _) --[[ Line: 1023 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v217.Status;
    return {
        Tool = v217.Status.Tool, 
        SelectedTrackInstances = v217.Status.SelectedTrackInstances, 
        RootInstance = v217.Status.RootInstance, 
        faceControlsEditorEnabled = v217.Status.FaceControlsEditorEnabled, 
        Playhead = v217.Status.Playhead, 
        Tracks = v217.Status.Tracks, 
        PlayState = l_Status_0.PlayState, 
        AnimationData = v217.AnimationData, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        SymmetryEnabled = l_Status_0.SymmetryEnabled, 
        AutoFocusFaceEnabled = l_Status_0.AutoFocusFaceEnabled, 
        ReadOnly = l_Status_0.ReadOnly
    };
end;
local function v231(v221) --[[ Line: 1042 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy)
    return {
        ValueChanged = function(v222, v223, v224, v225, v226, v227, v228) --[[ Line: 1044 ]] --[[ Name: ValueChanged ]]
            -- upvalues: v221 (copy), v18 (ref)
            v221(v18(v222, v223, v224, v225, v226, v227, v228));
        end, 
        AddWaypoint = function() --[[ Line: 1048 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v221 (copy), v19 (ref)
            v221(v19());
        end, 
        SetSymmetryEnabled = function(v229) --[[ Line: 1052 ]] --[[ Name: SetSymmetryEnabled ]]
            -- upvalues: v221 (copy), v20 (ref)
            v221(v20(v229));
        end, 
        SetAutoFocusFaceEnabled = function(v230) --[[ Line: 1056 ]] --[[ Name: SetAutoFocusFaceEnabled ]]
            -- upvalues: v221 (copy), v21 (ref)
            v221(v21(v230));
        end
    };
end;
v10 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions
})(v10);
return v2.connect(v220, v231)(v10);