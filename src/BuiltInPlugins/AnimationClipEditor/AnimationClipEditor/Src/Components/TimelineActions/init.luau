local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v7 = require(l_Actions_0.SetEventEditingTick);
local v8 = require(l_Actions_0.SetRightClickContextInfo);
local v9 = require(l_Actions_0.SetSelectedEvents);
local v10 = require(l_Actions_0.SetSelectedKeyframes);
local v11 = require(l_Actions_0.SetShowEvents);
local v12 = require(l_Actions_0.SetTool);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.ContextMenu);
local l_Context_0 = l_script_FirstAncestor_0.Src.Context;
local v16 = require(l_Context_0.Signals);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v18 = require(l_Thunks_0.AddKeyframe);
local v19 = require(l_Thunks_0.History.AddWaypoint);
local v20 = require(l_Thunks_0.Selection.CopySelectedKeyframes);
local v21 = require(l_Thunks_0.Selection.DeleteSelectedKeyframes);
local v22 = require(l_Thunks_0.PasteKeyframes);
local v23 = require(l_Thunks_0.History.Redo);
local v24 = require(l_Thunks_0.Selection.ResetSelectedKeyframes);
local v25 = require(l_Thunks_0.Selection.SelectAllKeyframes);
local v26 = require(l_Thunks_0.SplitTrack);
local v27 = require(l_Thunks_0.ToggleBoneVisibility);
local v28 = require(l_Thunks_0.ToggleGridVisibility);
local v29 = require(l_Thunks_0.Playback.TogglePlay);
local v30 = require(l_Thunks_0.History.Undo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v32 = require(l_Util_0.AnimationData);
local v33 = require(l_Util_0.Constants);
local v34 = require(l_Util_0.isEmpty);
local v35 = require(l_Util_0.KeyframeUtils);
local v36 = require(l_Util_0.SelectionUtils);
local v37 = require(l_Util_0.TrackUtils);
local v38 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAddKeyframeUniqueWaypoint);
local v39 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridVisualization);
local v40 = v1.PureComponent:extend("TimelineActions");
v40.getSharedPropertyValue = function(v41, v42) --[[ Line: 79 ]] --[[ Name: getSharedPropertyValue ]]
    -- upvalues: v36 (copy)
    local l_props_0 = v41.props;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local v46 = false;
    local v47 = nil;
    for v48, v49 in pairs(l_SelectedKeyframes_0) do
        local v50 = l_AnimationData_0.Instances[v48];
        for v51, v52 in pairs(v49) do
            local v53 = v50.Tracks[v51];
            v36.traverse(v52, v53, function(v54, v55) --[[ Line: 90 ]]
                -- upvalues: v46 (ref), v47 (ref), v42 (copy)
                if not v54.Selection or not v55.Data or v46 then
                    return;
                else
                    for v56, _ in pairs(v54.Selection) do
                        local v58 = v55.Data[v56];
                        if v58 then
                            if v47 == nil then
                                v47 = v58[v42];
                            elseif v47 ~= v58[v42] then
                                v47 = nil;
                                v46 = true;
                                return;
                            end;
                        end;
                    end;
                    return;
                end;
            end);
        end;
    end;
    return v47 and v47.Value;
end;
v40.makeSelectionSubMenu = function(v59, v60, v61, v62) --[[ Line: 113 ]] --[[ Name: makeSelectionSubMenu ]]
    local l_props_1 = v59.props;
    local v64 = {
        Text = l_props_1.Localization:getText("ContextMenu", v61)
    };
    local v65 = v59:getSharedPropertyValue(v61);
    local function v67(v66) --[[ Line: 122 ]] --[[ Name: onItemClicked ]]
        -- upvalues: l_props_1 (copy), v61 (copy)
        l_props_1.OnItemSelected(v61, v66.Data);
    end;
    for _, v69 in v60 do
        name = v69.Name;
        if v62 ~= nil and v62[v69] ~= nil then
            name = v62[v69];
        end;
        table.insert(v64, {
            Text = name, 
            Data = v69, 
            Checked = v65 == v69.Value, 
            OnItemClicked = v67
        });
    end;
    return v64;
end;
v40.makeGenerateCurveMenu = function(v70) --[[ Line: 143 ]] --[[ Name: makeGenerateCurveMenu ]]
    local l_props_2 = v70.props;
    local l_Localization_0 = l_props_2.Localization;
    local function v76(v73) --[[ Line: 147 ]] --[[ Name: makeSubmenu ]]
        -- upvalues: l_props_2 (copy)
        local function v75(v74) --[[ Line: 148 ]] --[[ Name: onItemClicked ]]
            -- upvalues: l_props_2 (ref), v73 (copy)
            l_props_2.OnGenerateCurve(v73, v74.Data);
        end;
        return {
            Text = v73.Name; 
            {
                Text = Enum.PoseEasingDirection.In.Name, 
                Data = Enum.PoseEasingDirection.In, 
                OnItemClicked = v75
            }, 
            {
                Text = Enum.PoseEasingDirection.Out.Name, 
                Data = Enum.PoseEasingDirection.Out, 
                OnItemClicked = v75
            }, 
            {
                Text = Enum.PoseEasingDirection.InOut.Name, 
                Data = Enum.PoseEasingDirection.InOut, 
                OnItemClicked = v75
            }
        };
    end;
    return {
        Text = l_Localization_0:getText("ContextMenu", "GenerateCurve"); 
        v76(Enum.PoseEasingStyle.Bounce), 
        (v76(Enum.PoseEasingStyle.Elastic))
    };
end;
v40.multipleSelected = function(v77) --[[ Line: 179 ]] --[[ Name: multipleSelected ]]
    -- upvalues: v32 (copy)
    local l_props_3 = v77.props;
    local l_AnimationData_1 = l_props_3.AnimationData;
    local l_SelectedKeyframes_1 = l_props_3.SelectedKeyframes;
    local v81, v82 = v32.getSelectionBounds(l_AnimationData_1, l_SelectedKeyframes_1);
    return l_SelectedKeyframes_1 and v81 ~= v82;
end;
v40.makeMenuActions = function(v83) --[[ Line: 188 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v33 (copy), v34 (copy)
    local l_props_4 = v83.props;
    local l_SelectedKeyframes_2 = l_props_4.SelectedKeyframes;
    local l_SummaryKeyframe_0 = l_props_4.SummaryKeyframe;
    local l_PluginActions_0 = v83.props.PluginActions;
    local l_IsChannelAnimation_0 = l_props_4.IsChannelAnimation;
    local v89 = {
        l_PluginActions_0:get("AddKeyframeHere"), 
        l_PluginActions_0:get("DeleteSelected"), 
        v33.MENU_SEPARATOR, 
        l_PluginActions_0:get("CutSelected"), 
        l_PluginActions_0:get("CopySelected"), 
        l_PluginActions_0:get("PasteKeyframes"), 
        v33.MENU_SEPARATOR
    };
    if l_SelectedKeyframes_2 and not v34(l_SelectedKeyframes_2) then
        table.insert(v89, l_PluginActions_0:get("ResetSelected"));
        table.insert(v89, v33.MENU_SEPARATOR);
        table.insert(v89, l_PluginActions_0:get("ChangeDuration"));
        table.insert(v89, v33.MENU_SEPARATOR);
        if l_IsChannelAnimation_0 then
            table.insert(v89, v83:makeSelectionSubMenu(v33.KEY_INTERPOLATION_MODE_ORDER, "InterpolationMode"));
            table.insert(v89, l_PluginActions_0:get("ClearBothTangents"));
            if v83:multipleSelected() then
                table.insert(v89, v83:makeGenerateCurveMenu());
            end;
        else
            table.insert(v89, v83:makeSelectionSubMenu(v33.EASING_STYLE_ORDER, "EasingStyle", v33.EASING_STYLE_DISPLAY_TEXT));
            table.insert(v89, v83:makeSelectionSubMenu(v33.EASING_DIRECTION_ORDER, "EasingDirection"));
        end;
    else
        table.insert(v89, l_PluginActions_0:get("AddResetKeyframe"));
    end;
    table.insert(v89, v33.MENU_SEPARATOR);
    table.insert(v89, l_PluginActions_0:get("AddEvent"));
    if l_SummaryKeyframe_0 ~= nil then
        table.insert(v89, l_PluginActions_0:get("RenameKeyframe"));
    end;
    return v89;
end;
v40.addAction = function(v90, v91, v92) --[[ Line: 245 ]] --[[ Name: addAction ]]
    if v91 then
        v91.Enabled = false;
        table.insert(v90.Actions, v91);
        table.insert(v90.Connections, v91.Triggered:Connect(v92));
    end;
end;
v40.didMount = function(v93) --[[ Line: 253 ]] --[[ Name: didMount ]]
    -- upvalues: v37 (copy), v3 (copy), v32 (copy), v35 (copy), v38 (copy), v33 (copy), v39 (copy)
    local l_PluginActions_1 = v93.props.PluginActions;
    v93.Connections = {};
    v93.Actions = {};
    v93:addAction(l_PluginActions_1:get("AddKeyframeHere"), function() --[[ Line: 258 ]]
        -- upvalues: v93 (copy), v37 (ref), v3 (ref), v32 (ref), v35 (ref), v38 (ref)
        local l_props_5 = v93.props;
        local l_Tick_0 = l_props_5.Tick;
        local _ = l_props_5.TrackName;
        local l_InstanceName_0 = l_props_5.InstanceName;
        local l_Tracks_0 = l_props_5.Tracks;
        local l_TrackType_0 = l_props_5.TrackType;
        local l_RotationType_0 = l_props_5.RotationType;
        local l_Path_0 = l_props_5.Path;
        local l_AnimationData_2 = l_props_5.AnimationData;
        local l_IsChannelAnimation_1 = l_props_5.IsChannelAnimation;
        local function v113(v105, v106) --[[ Line: 270 ]] --[[ Name: addKeyframe ]]
            -- upvalues: l_TrackType_0 (ref), v37 (ref), l_Tracks_0 (copy), l_RotationType_0 (ref), l_IsChannelAnimation_1 (copy), v3 (ref), l_props_5 (copy), l_Tick_0 (copy), v32 (ref), l_AnimationData_2 (copy), v35 (ref)
            l_TrackType_0 = l_TrackType_0 or v37.getTrackTypeFromName(v106[1], l_Tracks_0);
            l_RotationType_0 = l_RotationType_0 or v37.getRotationTypeFromName(v106[1], l_Tracks_0);
            if l_IsChannelAnimation_1 then
                v37.traverseComponents(l_TrackType_0, function(v107, v108) --[[ Line: 275 ]]
                    -- upvalues: v3 (ref), v106 (copy), l_props_5 (ref), v105 (copy), l_RotationType_0 (ref), l_Tick_0 (ref)
                    local v109 = v3.List.join(v106, v108);
                    l_props_5.SplitTrack(v105, v109, v107, l_RotationType_0, l_Tick_0, l_props_5.Analytics);
                end, l_RotationType_0);
                return;
            else
                local v110 = v32.getTrack(l_AnimationData_2, v105, v106);
                local _ = nil;
                local v112 = {
                    Value = if v110 and v110.Keyframes then v35.getValue(v110, l_Tick_0) else v35.getDefaultValue(l_TrackType_0), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                };
                l_props_5.AddKeyframe(v105, v106, l_TrackType_0, nil, l_Tick_0, v112, l_props_5.Analytics);
                return;
            end;
        end;
        if v38() then
            l_props_5.AddWaypoint();
        end;
        if l_InstanceName_0 and l_Path_0 then
            v113(l_InstanceName_0, l_Path_0);
        else
            for v114, _ in pairs(l_props_5.AnimationData.Instances) do
                for _, v117 in pairs(l_Tracks_0) do
                    v113(v114, {
                        v117.Name
                    });
                end;
            end;
        end;
    end);
    v93:addAction(l_PluginActions_1:get("AddKeyframeAtScrubber"), function() --[[ Line: 315 ]]
        -- upvalues: v93 (copy), v38 (ref), v32 (ref), v37 (ref), v3 (ref), v35 (ref)
        local l_props_6 = v93.props;
        local l_Tracks_1 = l_props_6.Tracks;
        local l_Playhead_0 = l_props_6.Playhead;
        local l_SelectedTracks_0 = l_props_6.SelectedTracks;
        local l_IsChannelAnimation_2 = l_props_6.IsChannelAnimation;
        if l_SelectedTracks_0 then
            if v38() then
                l_props_6.AddWaypoint();
            end;
            for v123, _ in pairs(l_props_6.AnimationData.Instances) do
                for _, v126 in pairs(l_SelectedTracks_0) do
                    local v127 = v32.getTrack(l_props_6.AnimationData, v123, v126);
                    local v128 = v127 and v127.Type or v37.getComponentTypeFromPath(v126, l_Tracks_1);
                    if l_IsChannelAnimation_2 then
                        local v129 = v127 and v37.getRotationType(v127) or l_props_6.DefaultRotationType;
                        v37.traverseComponents(v128, function(v130, v131) --[[ Line: 334 ]]
                            -- upvalues: v3 (ref), v126 (copy), l_props_6 (copy), v123 (copy), v129 (copy), l_Playhead_0 (copy)
                            local v132 = v3.List.join(v126, v131);
                            l_props_6.SplitTrack(v123, v132, v130, v129, l_Playhead_0, l_props_6.Analytics);
                        end, v129);
                    else
                        local _ = nil;
                        local v134 = {
                            Value = if v127 and v127.Keyframes then v35.getValue(v127, l_Playhead_0) else v35.getDefaultValue(v128), 
                            EasingStyle = Enum.PoseEasingStyle.Linear, 
                            EasingDirection = Enum.PoseEasingDirection.In
                        };
                        l_props_6.AddKeyframe(v123, v126, v128, nil, l_Playhead_0, v134, l_props_6.Analytics);
                    end;
                end;
            end;
        end;
    end);
    v93:addAction(l_PluginActions_1:get("AddResetKeyframe"), function() --[[ Line: 372 ]]
        -- upvalues: v93 (copy), v38 (ref), v37 (ref), v3 (ref), v35 (ref), v33 (ref)
        local l_props_7 = v93.props;
        local l_Tick_1 = l_props_7.Tick;
        local l_InstanceName_1 = l_props_7.InstanceName;
        local l_Tracks_2 = l_props_7.Tracks;
        local l_Path_1 = l_props_7.Path;
        local l_IsChannelAnimation_3 = l_props_7.IsChannelAnimation;
        if v38() then
            l_props_7.AddWaypoint();
        end;
        if l_InstanceName_1 and l_Path_1 then
            local v141 = nil;
            local l_TrackType_1 = l_props_7.TrackType;
            local l_RotationType_1 = l_props_7.RotationType;
            if l_IsChannelAnimation_3 then
                v37.traverseComponents(l_TrackType_1, function(v144, v145) --[[ Line: 389 ]]
                    -- upvalues: v3 (ref), l_Path_1 (copy), v141 (ref), v35 (ref), l_props_7 (copy), l_InstanceName_1 (copy), l_RotationType_1 (copy), l_Tick_1 (copy)
                    local v146 = v3.List.join(l_Path_1, v145);
                    v141 = v35.getDefaultValue(v144);
                    local v147 = {
                        Value = v141, 
                        InterpolationMode = Enum.KeyInterpolationMode.Cubic
                    };
                    l_props_7.AddKeyframe(l_InstanceName_1, v146, v144, l_RotationType_1, l_Tick_1, v147, l_props_7.Analytics);
                end, l_RotationType_1);
            else
                local v148 = {
                    Value = v35.getDefaultValue(l_TrackType_1), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                };
                l_props_7.AddKeyframe(l_InstanceName_1, l_Path_1, l_TrackType_1, nil, l_Tick_1, v148, l_props_7.Analytics);
            end;
            return;
        else
            for v149, v150 in pairs(l_props_7.AnimationData.Instances) do
                for _, v152 in pairs(l_Tracks_2) do
                    local l_Name_0 = v152.Name;
                    local v154 = v150.Tracks[l_Name_0];
                    local v155 = nil;
                    local v156 = nil;
                    local v157 = nil;
                    do
                        local l_v155_0, l_v157_0 = v155, v157;
                        if l_IsChannelAnimation_3 then
                            if v154 then
                                v156 = v154.Type;
                                local v160 = v154.Components and v154.Components[v33.PROPERTY_KEYS.Rotation];
                                l_v157_0 = v160 and v160.Type or nil;
                            else
                                v156 = v37.getTrackTypeFromName(l_Name_0, l_Tracks_2);
                                l_v157_0 = v37.getRotationTypeFromName(l_Name_0, l_Tracks_2);
                            end;
                            v37.traverseComponents(v156, function(v161, v162) --[[ Line: 435 ]]
                                -- upvalues: v3 (ref), l_Name_0 (copy), l_v155_0 (ref), v35 (ref), l_props_7 (copy), v149 (copy), l_v157_0 (ref), l_Tick_1 (copy)
                                local v163 = v3.List.join({
                                    l_Name_0
                                }, v162);
                                l_v155_0 = v35.getDefaultValue(v161);
                                local v164 = {
                                    Value = l_v155_0, 
                                    InterpolationMode = Enum.KeyInterpolationMode.Cubic
                                };
                                l_props_7.AddKeyframe(v149, v163, v161, l_v157_0, l_Tick_1, v164, l_props_7.Analytics);
                            end, l_v157_0);
                        else
                            v156 = v154 and v154.Type or v37.getTrackTypeFromName(l_Name_0, l_Tracks_2);
                            local v165 = {
                                Value = v35.getDefaultValue(v156), 
                                EasingStyle = Enum.PoseEasingStyle.Linear, 
                                EasingDirection = Enum.PoseEasingDirection.In
                            };
                            l_props_7.AddKeyframe(v149, {
                                l_Name_0
                            }, v156, nil, l_Tick_1, v165, l_props_7.Analytics);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end);
    v93:addAction(l_PluginActions_1:get("RenameKeyframe"), function() --[[ Line: 475 ]]
        -- upvalues: v93 (copy)
        local l_props_8 = v93.props;
        l_props_8.OnRenameKeyframe(l_props_8.Tick);
    end);
    v93:addAction(l_PluginActions_1:get("PasteKeyframes"), function() --[[ Line: 480 ]]
        -- upvalues: v93 (copy)
        local l_props_9 = v93.props;
        local v168 = l_props_9.Tick or l_props_9.Playhead;
        l_props_9.AddWaypoint();
        l_props_9.PasteKeyframes(v168, l_props_9.Analytics);
    end);
    v93:addAction(l_PluginActions_1:get("CutSelected"), function() --[[ Line: 487 ]]
        -- upvalues: v93 (copy)
        local l_props_10 = v93.props;
        l_props_10.CopySelectedKeyframes();
        l_props_10.DeleteSelectedKeyframes(l_props_10.Analytics);
    end);
    v93:addAction(l_PluginActions_1:get("AddEvent"), function() --[[ Line: 493 ]]
        -- upvalues: v93 (copy)
        v93.props.OnEditEvents(v93.props.Tick);
    end);
    v93:addAction(l_PluginActions_1:get("ToggleTool"), function() --[[ Line: 497 ]]
        -- upvalues: v93 (copy)
        local l_props_11 = v93.props;
        if l_props_11.Tool == Enum.RibbonTool.Move then
            l_props_11.SetTool(Enum.RibbonTool.Rotate);
            return;
        else
            l_props_11.SetTool(Enum.RibbonTool.Move);
            return;
        end;
    end);
    local function v171() --[[ Line: 507 ]] --[[ Name: togglePlayWrapper ]]
        -- upvalues: v93 (copy)
        return v93.props.TogglePlay(v93.props.Analytics);
    end;
    local function v172() --[[ Line: 511 ]] --[[ Name: deleteSelectedKeyframesWrapper ]]
        -- upvalues: v93 (copy)
        v93.props.AddWaypoint();
        return v93.props.DeleteSelectedKeyframes(v93.props.Analytics);
    end;
    local function v173() --[[ Line: 516 ]] --[[ Name: resetSelectedKeyframesWrapper ]]
        -- upvalues: v93 (copy)
        v93.props.AddWaypoint();
        return v93.props.ResetSelectedKeyframes();
    end;
    local function v174() --[[ Line: 521 ]] --[[ Name: undoWrapper ]]
        -- upvalues: v93 (copy)
        return v93.props.Undo(v93.props.Signals);
    end;
    v93:addAction(l_PluginActions_1:get("CopySelected"), v93.props.CopySelectedKeyframes);
    v93:addAction(l_PluginActions_1:get("DeleteSelected"), v172);
    v93:addAction(l_PluginActions_1:get("ResetSelected"), if v38() then v173 else v93.props.ResetSelectedKeyframes);
    v93:addAction(l_PluginActions_1:get("SelectAll"), v93.props.SelectAllKeyframes);
    v93:addAction(l_PluginActions_1:get("DeselectAll"), v93.props.DeselectAllKeyframes);
    v93:addAction(l_PluginActions_1:get("ChangeDuration"), v93.props.OnChangeDuration);
    v93:addAction(l_PluginActions_1:get("Undo"), v174);
    v93:addAction(l_PluginActions_1:get("Redo"), v93.props.Redo);
    v93:addAction(l_PluginActions_1:get("TogglePlay"), v171);
    v93:addAction(l_PluginActions_1:get("ToggleBoneVis"), v93.props.ToggleBoneVisibility);
    if v39() then
        v93:addAction(l_PluginActions_1:get("ToggleGridVis"), v93.props.ToggleGridVisibility);
    end;
    v93:addAction(l_PluginActions_1:get("ClearBothTangents"), v93.props.OnClearTangentsSelected);
end;
v40.render = function(v175) --[[ Line: 546 ]] --[[ Name: render ]]
    -- upvalues: v34 (copy), v33 (copy), v39 (copy), v1 (copy), v14 (copy)
    local l_props_12 = v175.props;
    local l_ShowMenu_0 = l_props_12.ShowMenu;
    local l_Clipboard_0 = l_props_12.Clipboard;
    local l_ClipboardType_0 = l_props_12.ClipboardType;
    local l_SelectedKeyframes_3 = l_props_12.SelectedKeyframes;
    local l_SummaryKeyframe_1 = l_props_12.SummaryKeyframe;
    local l_MultipleSelected_0 = l_props_12.MultipleSelected;
    local l_Tool_0 = l_props_12.Tool;
    local l_Tracks_3 = l_props_12.Tracks;
    local l_IsChannelAnimation_4 = l_props_12.IsChannelAnimation;
    local l_ReadOnly_0 = l_props_12.ReadOnly;
    local l_Actions_1 = v175.Actions;
    local l_PluginActions_2 = v175.props.PluginActions;
    if not v34(l_PluginActions_2) and l_Actions_1 ~= nil then
        for _, v190 in ipairs(l_Actions_1) do
            v190.Enabled = false;
        end;
        local v191 = l_IsChannelAnimation_4 and v33.CLIPBOARD_TYPE.Channels or v33.CLIPBOARD_TYPE.Keyframes;
        if l_Clipboard_0 and not v34(l_Clipboard_0) and l_ClipboardType_0 == v191 then
            l_PluginActions_2:get("PasteKeyframes").Enabled = not l_ReadOnly_0;
        end;
        if l_SelectedKeyframes_3 and not v34(l_SelectedKeyframes_3) then
            l_PluginActions_2:get("DeselectAll").Enabled = true;
            l_PluginActions_2:get("CutSelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("CopySelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("ResetSelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("DeleteSelected").Enabled = not l_ReadOnly_0;
        else
            l_PluginActions_2:get("SelectAll").Enabled = not l_ReadOnly_0;
        end;
        if not l_props_12.OnKeyframe and not v34(l_Tracks_3) then
            l_PluginActions_2:get("AddKeyframeHere").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("AddResetKeyframe").Enabled = not l_ReadOnly_0;
        end;
        l_PluginActions_2:get("AddKeyframeAtScrubber").Enabled = not l_ReadOnly_0;
        if l_MultipleSelected_0 then
            l_PluginActions_2:get("ChangeDuration").Enabled = not l_ReadOnly_0;
        end;
        if l_SummaryKeyframe_1 ~= nil then
            l_PluginActions_2:get("RenameKeyframe").Enabled = true;
        end;
        if l_IsChannelAnimation_4 then
            l_PluginActions_2:get("ClearBothTangents").Enabled = not l_ReadOnly_0;
        end;
        if l_Tool_0 == Enum.RibbonTool.Rotate or l_Tool_0 == Enum.RibbonTool.Move then
            l_PluginActions_2:get("ToggleTool").Enabled = not l_ReadOnly_0;
        end;
        l_PluginActions_2:get("Undo").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("Redo").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("TogglePlay").Enabled = true;
        l_PluginActions_2:get("AddEvent").Enabled = true;
        l_PluginActions_2:get("ToggleBoneVis").Enabled = true;
        if v39() then
            l_PluginActions_2:get("ToggleGridVis").Enabled = true;
        end;
    end;
    if l_ShowMenu_0 and not l_ReadOnly_0 then
        return (v1.createElement(v14, {
            Actions = v175:makeMenuActions(), 
            OnMenuOpened = l_props_12.OnMenuOpened
        }));
    else
        return nil;
    end;
end;
v40.willUnmount = function(v192) --[[ Line: 629 ]] --[[ Name: willUnmount ]]
    if v192.Connections then
        for _, v194 in ipairs(v192.Connections) do
            v194:Disconnect();
        end;
        v192.Connections = {};
    end;
    if v192.Actions then
        for _, v196 in ipairs(v192.Actions) do
            v196.Enabled = false;
        end;
    end;
end;
v40 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v16
})(v40);
return v2.connect(function(v197, _) --[[ Line: 650 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v197.Status;
    return {
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        Playhead = l_Status_0.Playhead, 
        AnimationData = v197.AnimationData, 
        Tracks = l_Status_0.Tracks, 
        Path = l_Status_0.RightClickContextInfo.Path, 
        TrackName = l_Status_0.RightClickContextInfo.TrackName, 
        TrackType = l_Status_0.RightClickContextInfo.TrackType, 
        RotationType = l_Status_0.RightClickContextInfo.RotationType, 
        InstanceName = l_Status_0.RightClickContextInfo.InstanceName, 
        Tick = l_Status_0.RightClickContextInfo.Tick, 
        SummaryKeyframe = l_Status_0.RightClickContextInfo.SummaryKeyframe, 
        OnKeyframe = l_Status_0.RightClickContextInfo.OnKeyframe, 
        Tool = l_Status_0.Tool, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(v200) --[[ Line: 675 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v25 (copy), v9 (copy), v10 (copy), v38 (copy), v19 (copy), v21 (copy), v8 (copy), v24 (copy), v20 (copy), v22 (copy), v26 (copy), v18 (copy), v11 (copy), v7 (copy), v30 (copy), v23 (copy), v29 (copy), v12 (copy), v27 (copy), v28 (copy)
    return {
        SelectAllKeyframes = function() --[[ Line: 677 ]] --[[ Name: SelectAllKeyframes ]]
            -- upvalues: v200 (copy), v25 (ref), v9 (ref)
            v200(v25());
            v200(v9({}));
        end, 
        DeselectAllKeyframes = function() --[[ Line: 682 ]] --[[ Name: DeselectAllKeyframes ]]
            -- upvalues: v200 (copy), v10 (ref), v9 (ref)
            v200(v10({}));
            v200(v9({}));
        end, 
        DeleteSelectedKeyframes = function(v201) --[[ Line: 687 ]] --[[ Name: DeleteSelectedKeyframes ]]
            -- upvalues: v38 (ref), v200 (copy), v19 (ref), v21 (ref), v8 (ref)
            if not v38() then
                v200(v19());
            end;
            v200(v21(v201));
            v200(v8({}));
        end, 
        ResetSelectedKeyframes = function() --[[ Line: 695 ]] --[[ Name: ResetSelectedKeyframes ]]
            -- upvalues: v38 (ref), v200 (copy), v19 (ref), v24 (ref), v8 (ref)
            if not v38() then
                v200(v19());
            end;
            v200(v24());
            v200(v8({}));
        end, 
        CopySelectedKeyframes = function() --[[ Line: 703 ]] --[[ Name: CopySelectedKeyframes ]]
            -- upvalues: v200 (copy), v20 (ref), v8 (ref)
            v200(v20());
            v200(v8({}));
        end, 
        PasteKeyframes = function(v202, v203) --[[ Line: 708 ]] --[[ Name: PasteKeyframes ]]
            -- upvalues: v38 (ref), v200 (copy), v19 (ref), v22 (ref), v8 (ref)
            if not v38() then
                v200(v19());
            end;
            v200(v22(v202, v203));
            v200(v8({}));
        end, 
        SplitTrack = function(v204, v205, v206, v207, v208, v209) --[[ Line: 716 ]] --[[ Name: SplitTrack ]]
            -- upvalues: v38 (ref), v200 (copy), v19 (ref), v26 (ref), v8 (ref)
            if not v38() then
                v200(v19());
            end;
            v200(v26(v204, v205, v206, v207, v208, v209));
            v200(v8({}));
        end, 
        AddWaypoint = function() --[[ Line: 724 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v200 (copy), v19 (ref)
            v200(v19());
        end, 
        AddKeyframe = function(v210, v211, v212, v213, v214, v215, v216) --[[ Line: 728 ]] --[[ Name: AddKeyframe ]]
            -- upvalues: v38 (ref), v200 (copy), v19 (ref), v18 (ref), v8 (ref)
            if not v38() then
                v200(v19());
            end;
            v200(v18(v210, v211, v212, v213, v214, v215, v216));
            v200(v8({}));
        end, 
        OnEditEvents = function(v217) --[[ Line: 736 ]] --[[ Name: OnEditEvents ]]
            -- upvalues: v200 (copy), v11 (ref), v7 (ref)
            v200(v11(true));
            v200(v7(v217));
        end, 
        Undo = function(v218) --[[ Line: 741 ]] --[[ Name: Undo ]]
            -- upvalues: v200 (copy), v30 (ref)
            v200(v30(v218));
        end, 
        Redo = function() --[[ Line: 745 ]] --[[ Name: Redo ]]
            -- upvalues: v200 (copy), v23 (ref)
            v200(v23());
        end, 
        TogglePlay = function(v219) --[[ Line: 749 ]] --[[ Name: TogglePlay ]]
            -- upvalues: v200 (copy), v29 (ref)
            v200(v29(v219));
        end, 
        SetTool = function(v220) --[[ Line: 753 ]] --[[ Name: SetTool ]]
            -- upvalues: v200 (copy), v12 (ref)
            v200(v12(v220));
        end, 
        ToggleBoneVisibility = function() --[[ Line: 757 ]] --[[ Name: ToggleBoneVisibility ]]
            -- upvalues: v200 (copy), v27 (ref)
            v200(v27());
        end, 
        ToggleGridVisibility = function() --[[ Line: 761 ]] --[[ Name: ToggleGridVisibility ]]
            -- upvalues: v200 (copy), v28 (ref)
            v200(v28());
        end
    };
end)(v40);