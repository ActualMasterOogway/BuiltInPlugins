local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v9 = require(l_Actions_0.SetEventEditingTick);
local v10 = require(l_Actions_0.SetSelectedEvents);
local v11 = require(l_Actions_0.SetSelectedKeyframes);
local v12 = require(l_Actions_0.SetShowEvents);
local v13 = require(l_Actions_0.SetTool);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.ContextMenu);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local _ = require(l_Thunks_0.AddKeyframe);
local v18 = require(l_Thunks_0.History.AddWaypoint);
local v19 = require(l_Thunks_0.Selection.CopySelectedKeyframes);
local v20 = require(l_Thunks_0.Selection.DeleteSelectedKeyframes);
local v21 = require(l_Thunks_0.PasteKeyframes);
local v22 = require(l_Thunks_0.History.Redo);
local v23 = require(l_Thunks_0.Selection.ResetSelectedKeyframes);
local v24 = require(l_Thunks_0.Selection.SelectAllKeyframes);
local v25 = require(l_Actions_0.SetRightClickContextInfo);
local v26 = require(l_Thunks_0.SplitTrack);
local v27 = require(l_Thunks_0.ToggleBoneVisibility);
local v28 = require(l_Thunks_0.ToggleGridVisibility);
local v29 = require(l_Thunks_0.Playback.TogglePlay);
local v30 = require(l_Thunks_0.History.Undo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v32 = require(l_Util_0.AnimationData);
local v33 = require(l_Util_0.Constants);
local v34 = require(l_Util_0.isEmpty);
local v35 = require(l_Util_0.SelectionUtils);
local v36 = require(l_Util_0.TrackUtils);
local v37 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAddKeyframeUniqueWaypoint);
local v38 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridVisualization);
local v39 = v3.PureComponent:extend("KeyframeActions");
v39.getSharedPropertyValue = function(v40, v41) --[[ Line: 116 ]] --[[ Name: getSharedPropertyValue ]]
    -- upvalues: v35 (copy)
    local l_props_0 = v40.props;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local v45 = false;
    local v46 = nil;
    for v47, v48 in pairs(l_SelectedKeyframes_0) do
        local v49 = l_AnimationData_0.Instances[v47];
        for v50, v51 in pairs(v48) do
            v35.traverse(v51, v49.Tracks[v50], function(v52, v53) --[[ Line: 129 ]]
                -- upvalues: v45 (ref), v46 (ref), v41 (copy)
                if not v52.Selection or not v53.Data or v45 then
                    return;
                else
                    for v54, _ in pairs(v52.Selection) do
                        local v56 = v53.Data[v54];
                        if v56 then
                            if v46 == nil then
                                v46 = v56[v41];
                            elseif v46 ~= v56[v41] then
                                v46 = nil;
                                v45 = true;
                                return;
                            end;
                        end;
                    end;
                    return;
                end;
            end, nil, nil);
        end;
    end;
    return if v46 then v46.Value else nil;
end;
v39.makeInterpolationModeMenu = function(v57) --[[ Line: 154 ]] --[[ Name: makeInterpolationModeMenu ]]
    -- upvalues: v33 (copy)
    local l_props_1 = v57.props;
    local v59 = {
        Text = l_props_1.Localization:getText("ContextMenu", "InterpolationMode")
    };
    local v60 = v57:getSharedPropertyValue("InterpolationMode");
    local function v62(v61) --[[ Line: 163 ]] --[[ Name: onItemClicked ]]
        -- upvalues: l_props_1 (copy)
        l_props_1.OnInterpolationSelected(v61.Data);
    end;
    for _, v64 in v33.KEY_INTERPOLATION_MODE_ORDER do
        table.insert(v59, {
            Text = v64.Name, 
            Data = v64, 
            Checked = v60 == v64.Value, 
            OnItemClicked = v62
        });
    end;
    return v59;
end;
v39.makeGenerateCurveMenu = function(v65) --[[ Line: 179 ]] --[[ Name: makeGenerateCurveMenu ]]
    local l_props_2 = v65.props;
    local l_Localization_0 = l_props_2.Localization;
    local function v71(v68) --[[ Line: 183 ]] --[[ Name: makeSubmenu ]]
        -- upvalues: l_props_2 (copy)
        local function v70(v69) --[[ Line: 184 ]] --[[ Name: onItemClicked ]]
            -- upvalues: l_props_2 (ref), v68 (copy)
            l_props_2.OnGenerateCurve(v68, v69.Data);
        end;
        return {
            Text = v68.Name; 
            {
                Text = Enum.PoseEasingDirection.In.Name, 
                Data = Enum.PoseEasingDirection.In, 
                OnItemClicked = v70
            }, 
            {
                Text = Enum.PoseEasingDirection.Out.Name, 
                Data = Enum.PoseEasingDirection.Out, 
                OnItemClicked = v70
            }, 
            {
                Text = Enum.PoseEasingDirection.InOut.Name, 
                Data = Enum.PoseEasingDirection.InOut, 
                OnItemClicked = v70
            }
        };
    end;
    return {
        Text = l_Localization_0:getText("ContextMenu", "GenerateCurve"); 
        v71(Enum.PoseEasingStyle.Bounce), 
        (v71(Enum.PoseEasingStyle.Elastic))
    };
end;
v39.multipleSelected = function(v72) --[[ Line: 215 ]] --[[ Name: multipleSelected ]]
    -- upvalues: v32 (copy)
    local l_props_3 = v72.props;
    local l_AnimationData_1 = l_props_3.AnimationData;
    local l_SelectedKeyframes_1 = l_props_3.SelectedKeyframes;
    local v76, v77 = v32.getSelectionBounds(l_AnimationData_1, l_SelectedKeyframes_1);
    return l_SelectedKeyframes_1 and v76 ~= v77;
end;
v39.makeMenuActions = function(v78) --[[ Line: 224 ]] --[[ Name: makeMenuActions ]]
    -- upvalues: v33 (copy), v34 (copy)
    local l_SelectedKeyframes_2 = v78.props.SelectedKeyframes;
    local l_PluginActions_0 = v78.props.PluginActions;
    local v81 = {
        l_PluginActions_0:get("DeleteSelected"), 
        v33.MENU_SEPARATOR, 
        l_PluginActions_0:get("CutSelected"), 
        l_PluginActions_0:get("CopySelected"), 
        l_PluginActions_0:get("PasteKeyframes")
    };
    if l_SelectedKeyframes_2 and not v34(l_SelectedKeyframes_2) then
        table.insert(v81, v33.MENU_SEPARATOR);
        table.insert(v81, l_PluginActions_0:get("ResetSelected"));
        table.insert(v81, v33.MENU_SEPARATOR);
        table.insert(v81, l_PluginActions_0:get("ChangeDuration"));
        table.insert(v81, v33.MENU_SEPARATOR);
        table.insert(v81, v78:makeInterpolationModeMenu());
        table.insert(v81, l_PluginActions_0:get("ClearBothTangents"));
        if v78:multipleSelected() then
            table.insert(v81, v78:makeGenerateCurveMenu());
        end;
    end;
    table.insert(v81, v33.MENU_SEPARATOR);
    table.insert(v81, l_PluginActions_0:get("AddEvent"));
    return v81;
end;
v39.addAction = function(v82, v83, v84) --[[ Line: 256 ]] --[[ Name: addAction ]]
    if v83 then
        v83.Enabled = false;
        table.insert(v82.Actions, v83);
        table.insert(v82.Connections, v83.Triggered:Connect(v84));
    end;
end;
v39.didMount = function(v85) --[[ Line: 264 ]] --[[ Name: didMount ]]
    -- upvalues: v37 (copy), v32 (copy), v36 (copy), v1 (copy), v38 (copy)
    local l_PluginActions_1 = v85.props.PluginActions;
    v85.Connections = {};
    v85.Actions = {};
    v85:addAction(l_PluginActions_1:get("AddKeyframeAtScrubber"), function() --[[ Line: 269 ]]
        -- upvalues: v85 (copy), v37 (ref), v32 (ref), v36 (ref), v1 (ref)
        local l_props_4 = v85.props;
        local l_Tracks_0 = l_props_4.Tracks;
        local l_Playhead_0 = l_props_4.Playhead;
        local l_SelectedTracks_0 = l_props_4.SelectedTracks;
        if l_SelectedTracks_0 then
            if v37() then
                l_props_4.AddWaypoint();
            end;
            for v91, _ in pairs(l_props_4.AnimationData.Instances) do
                for _, v94 in pairs(l_SelectedTracks_0) do
                    local v95 = v32.getTrack(l_props_4.AnimationData, v91, v94);
                    local v96 = v95 and v95.Type or v36.getComponentTypeFromPath(v94, l_Tracks_0);
                    local v97 = v95 and v36.getRotationType(v95) or l_props_4.DefaultRotationType;
                    v36.traverseComponents(v96, function(v98, v99) --[[ Line: 286 ]]
                        -- upvalues: v1 (ref), v94 (copy), l_props_4 (copy), v91 (copy), v97 (copy), l_Playhead_0 (copy)
                        local v100 = v1.List.join(v94, v99);
                        l_props_4.SplitTrack(v91, v100, v98, v97, l_Playhead_0, l_props_4.Analytics);
                    end, v97);
                end;
            end;
        end;
    end);
    v85:addAction(l_PluginActions_1:get("PasteKeyframes"), function() --[[ Line: 302 ]]
        -- upvalues: v85 (copy), v37 (ref)
        local l_props_5 = v85.props;
        local v102 = l_props_5.Tick or l_props_5.Playhead;
        if v37() then
            l_props_5.AddWaypoint();
        end;
        l_props_5.PasteKeyframes(v102, l_props_5.Analytics);
    end);
    v85:addAction(l_PluginActions_1:get("CutSelected"), function() --[[ Line: 311 ]]
        -- upvalues: v85 (copy), v37 (ref)
        local l_props_6 = v85.props;
        l_props_6.CopySelectedKeyframes();
        if v37() then
            l_props_6.AddWaypoint();
        end;
        l_props_6.DeleteSelectedKeyframes(l_props_6.Analytics);
    end);
    v85:addAction(l_PluginActions_1:get("ToggleTool"), function() --[[ Line: 320 ]]
        -- upvalues: v85 (copy)
        local l_props_7 = v85.props;
        if l_props_7.Tool == Enum.RibbonTool.Move then
            l_props_7.SetTool(Enum.RibbonTool.Rotate);
            return;
        else
            l_props_7.SetTool(Enum.RibbonTool.Move);
            return;
        end;
    end);
    local function v105() --[[ Line: 330 ]] --[[ Name: togglePlayWrapper ]]
        -- upvalues: v85 (copy)
        return v85.props.TogglePlay(v85.props.Analytics);
    end;
    local function v106() --[[ Line: 334 ]] --[[ Name: deleteSelectedKeyframesWrapper ]]
        -- upvalues: v37 (ref), v85 (copy)
        if v37() then
            v85.props.AddWaypoint();
        end;
        return v85.props.DeleteSelectedKeyframes(v85.props.Analytics);
    end;
    local function v107() --[[ Line: 341 ]] --[[ Name: resetSelectedKeyframesWrapper ]]
        -- upvalues: v85 (copy)
        v85.props.AddWaypoint();
        return v85.props.ResetSelectedKeyframes();
    end;
    local function v108() --[[ Line: 346 ]] --[[ Name: undoWrapper ]]
        -- upvalues: v85 (copy)
        return v85.props.Undo(v85.props.Signals);
    end;
    v85:addAction(l_PluginActions_1:get("AddEvent"), function() --[[ Line: 357 ]]
        -- upvalues: v85 (copy)
        v85.props.OnEditEvents(v85.props.Tick);
    end);
    v85:addAction(l_PluginActions_1:get("CopySelected"), v85.props.CopySelectedKeyframes);
    v85:addAction(l_PluginActions_1:get("DeleteSelected"), v106);
    v85:addAction(l_PluginActions_1:get("ResetSelected"), if v37() then v107 else v85.props.ResetSelectedKeyframes);
    v85:addAction(l_PluginActions_1:get("SelectAll"), v85.props.SelectAllKeyframes);
    v85:addAction(l_PluginActions_1:get("DeselectAll"), v85.props.DeselectAllKeyframes);
    v85:addAction(l_PluginActions_1:get("ChangeDuration"), v85.props.OnChangeDuration);
    v85:addAction(l_PluginActions_1:get("Undo"), v108);
    v85:addAction(l_PluginActions_1:get("Redo"), v85.props.Redo);
    v85:addAction(l_PluginActions_1:get("TogglePlay"), v105);
    v85:addAction(l_PluginActions_1:get("ToggleBoneVis"), v85.props.ToggleBoneVisibility);
    if v38() then
        v85:addAction(l_PluginActions_1:get("ToggleGridVis"), v85.props.ToggleGridVisibility);
    end;
    v85:addAction(l_PluginActions_1:get("ClearBothTangents"), v85.props.OnClearTangentsSelected);
end;
v39.render = function(v109) --[[ Line: 383 ]] --[[ Name: render ]]
    -- upvalues: v34 (copy), v33 (copy), v38 (copy), v3 (copy), v15 (copy)
    local l_props_8 = v109.props;
    local l_ShowMenu_0 = l_props_8.ShowMenu;
    local l_Clipboard_0 = l_props_8.Clipboard;
    local l_ClipboardType_0 = l_props_8.ClipboardType;
    local l_SelectedKeyframes_3 = l_props_8.SelectedKeyframes;
    local l_MultipleSelected_0 = l_props_8.MultipleSelected;
    local l_Tool_0 = l_props_8.Tool;
    local l_Actions_1 = v109.Actions;
    local l_PluginActions_2 = v109.props.PluginActions;
    if not v34(l_PluginActions_2) and l_Actions_1 ~= nil then
        for _, v120 in ipairs(l_Actions_1) do
            v120.Enabled = false;
        end;
        local l_Channels_0 = v33.CLIPBOARD_TYPE.Channels;
        if l_Clipboard_0 and not v34(l_Clipboard_0) and l_ClipboardType_0 == l_Channels_0 then
            l_PluginActions_2:get("PasteKeyframes").Enabled = true;
        end;
        if l_SelectedKeyframes_3 and not v34(l_SelectedKeyframes_3) then
            l_PluginActions_2:get("DeselectAll").Enabled = true;
            l_PluginActions_2:get("CutSelected").Enabled = true;
            l_PluginActions_2:get("CopySelected").Enabled = true;
            l_PluginActions_2:get("ResetSelected").Enabled = true;
            l_PluginActions_2:get("DeleteSelected").Enabled = true;
        else
            l_PluginActions_2:get("SelectAll").Enabled = true;
        end;
        l_PluginActions_2:get("AddKeyframeAtScrubber").Enabled = true;
        if l_MultipleSelected_0 then
            l_PluginActions_2:get("ChangeDuration").Enabled = true;
        end;
        l_PluginActions_2:get("ClearBothTangents").Enabled = true;
        if l_Tool_0 == Enum.RibbonTool.Rotate or l_Tool_0 == Enum.RibbonTool.Move then
            l_PluginActions_2:get("ToggleTool").Enabled = true;
        end;
        l_PluginActions_2:get("Undo").Enabled = true;
        l_PluginActions_2:get("Redo").Enabled = true;
        l_PluginActions_2:get("TogglePlay").Enabled = true;
        l_PluginActions_2:get("AddEvent").Enabled = true;
        l_PluginActions_2:get("ToggleBoneVis").Enabled = true;
        if v38() then
            l_PluginActions_2:get("ToggleGridVis").Enabled = true;
        end;
    end;
    local _ = v109.props.Localization;
    return l_ShowMenu_0 and v3.createElement(v15, {
        Actions = v109:makeMenuActions(), 
        OnMenuOpened = l_props_8.OnMenuOpened
    }) or nil;
end;
v39.willUnmount = function(v123) --[[ Line: 445 ]] --[[ Name: willUnmount ]]
    if v123.Connections then
        for _, v125 in ipairs(v123.Connections) do
            v125:Disconnect();
        end;
        v123.Connections = {};
    end;
    if v123.Actions then
        for _, v127 in ipairs(v123.Actions) do
            v127.Enabled = false;
        end;
    end;
end;
v39 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Signals = v7
})(v39);
return v4.connect(function(v128) --[[ Line: 466 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v128.Status;
    return {
        AnimationData = v128.AnimationData, 
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        Playhead = l_Status_0.Playhead, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        Tick = l_Status_0.RightClickContextInfo.Tick, 
        Tool = l_Status_0.Tool, 
        Tracks = l_Status_0.Tracks
    };
end, function(v130) --[[ Line: 483 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy), v25 (copy), v37 (copy), v20 (copy), v11 (copy), v10 (copy), v12 (copy), v9 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v13 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), v30 (copy)
    return {
        AddWaypoint = function() --[[ Line: 485 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v130 (copy), v18 (ref)
            v130(v18());
        end, 
        CopySelectedKeyframes = function() --[[ Line: 489 ]] --[[ Name: CopySelectedKeyframes ]]
            -- upvalues: v130 (copy), v19 (ref), v25 (ref)
            v130(v19());
            v130(v25({}));
        end, 
        DeleteSelectedKeyframes = function(v131) --[[ Line: 494 ]] --[[ Name: DeleteSelectedKeyframes ]]
            -- upvalues: v37 (ref), v130 (copy), v18 (ref), v20 (ref), v25 (ref)
            if not v37() then
                v130(v18());
            end;
            v130(v20(v131));
            v130(v25({}));
        end, 
        DeselectAllKeyframes = function() --[[ Line: 502 ]] --[[ Name: DeselectAllKeyframes ]]
            -- upvalues: v130 (copy), v11 (ref), v10 (ref)
            v130(v11({}));
            v130(v10({}));
        end, 
        OnEditEvents = function(v132) --[[ Line: 507 ]] --[[ Name: OnEditEvents ]]
            -- upvalues: v130 (copy), v12 (ref), v9 (ref)
            v130(v12(true));
            v130(v9(v132));
        end, 
        PasteKeyframes = function(v133, v134) --[[ Line: 512 ]] --[[ Name: PasteKeyframes ]]
            -- upvalues: v37 (ref), v130 (copy), v18 (ref), v21 (ref), v25 (ref)
            if not v37() then
                v130(v18());
            end;
            v130(v21(v133, v134));
            v130(v25({}));
        end, 
        Redo = function() --[[ Line: 520 ]] --[[ Name: Redo ]]
            -- upvalues: v130 (copy), v22 (ref)
            v130(v22());
        end, 
        ResetSelectedKeyframes = function() --[[ Line: 524 ]] --[[ Name: ResetSelectedKeyframes ]]
            -- upvalues: v37 (ref), v130 (copy), v18 (ref), v23 (ref), v25 (ref)
            if not v37() then
                v130(v18());
            end;
            v130(v23());
            v130(v25({}));
        end, 
        SelectAllKeyframes = function() --[[ Line: 532 ]] --[[ Name: SelectAllKeyframes ]]
            -- upvalues: v130 (copy), v24 (ref), v10 (ref)
            v130(v24());
            v130(v10({}));
        end, 
        SetTool = function(v135) --[[ Line: 537 ]] --[[ Name: SetTool ]]
            -- upvalues: v130 (copy), v13 (ref)
            v130(v13(v135));
        end, 
        SplitTrack = function(v136, v137, v138, v139, v140, v141) --[[ Line: 541 ]] --[[ Name: SplitTrack ]]
            -- upvalues: v37 (ref), v130 (copy), v18 (ref), v26 (ref), v25 (ref)
            if not v37() then
                v130(v18());
            end;
            v130(v26(v136, v137, v138, v139, v140, v141));
            v130(v25({}));
        end, 
        ToggleBoneVisibility = function() --[[ Line: 556 ]] --[[ Name: ToggleBoneVisibility ]]
            -- upvalues: v130 (copy), v27 (ref)
            v130(v27());
        end, 
        ToggleGridVisibility = function() --[[ Line: 560 ]] --[[ Name: ToggleGridVisibility ]]
            -- upvalues: v130 (copy), v28 (ref)
            v130(v28());
        end, 
        TogglePlay = function(v142) --[[ Line: 564 ]] --[[ Name: TogglePlay ]]
            -- upvalues: v130 (copy), v29 (ref)
            v130(v29(v142));
        end, 
        Undo = function(v143) --[[ Line: 568 ]] --[[ Name: Undo ]]
            -- upvalues: v130 (copy), v30 (ref)
            v130(v30(v143));
        end
    };
end)(v39);