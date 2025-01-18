local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v11 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Components.TrackList.SummaryTrack);
local v13 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v14 = require(l_script_FirstAncestor_0.Src.Components.TrackList.Track);
local v15 = require(l_script_FirstAncestor_0.Src.Components.TrackList.WideScrollingFrame);
local v16 = v1.PureComponent:extend("TrackList");
v16.init = function(v17) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v9 (copy)
    v17.maxTrackWidth = 0;
    v17.trackCount = 1;
    v17.resetTrackCount = function() --[[ Line: 57 ]]
        -- upvalues: v17 (copy)
        v17.trackCount = 1;
    end;
    v17.incrementTrackCount = function() --[[ Line: 60 ]]
        -- upvalues: v17 (copy)
        v17.trackCount = v17.trackCount + 1;
    end;
    v17.state = {
        AbsoluteSize = Vector2.new()
    };
    v17.getTextWidth = function(v18, v19) --[[ Line: 68 ]]
        -- upvalues: v5 (ref)
        local l_font_0 = v19.font;
        local l_textSize_0 = v19.trackTheme.textSize;
        return v5.getTextWidth(v18, l_textSize_0, l_font_0);
    end;
    v17.sizeChanged = function(v22) --[[ Line: 74 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            AbsoluteSize = v22.AbsoluteSize
        });
    end;
    v17.inputChanged = function(_, v24) --[[ Line: 80 ]]
        -- upvalues: v17 (copy)
        if v24.UserInputType == Enum.UserInputType.MouseWheel and v17.props.OnScroll then
            v17.props.OnScroll(v24.Position.Z);
        end;
    end;
    v17.onTrackExpandToggled = function(v25, v26) --[[ Line: 86 ]]
        -- upvalues: v17 (copy)
        if v17.props.ToggleTrackExpanded then
            v17.props.ToggleTrackExpanded({
                v25
            }, v26);
        end;
    end;
    v17.onContextButtonClick = function(v27, v28, v29, v30) --[[ Line: 92 ]]
        -- upvalues: v17 (copy)
        if v17.props.OpenContextMenu then
            v17.props.OpenContextMenu(v27, v28, v29, v30);
        end;
    end;
    v17.onTrackAdded = function(v31, v32, v33) --[[ Line: 98 ]]
        -- upvalues: v17 (copy)
        if v17.props.OnTrackAdded then
            v17.props.OnTrackAdded(v31, v32, v33);
        end;
    end;
    v17.onTrackSelected = function(v34) --[[ Line: 104 ]]
        -- upvalues: v17 (copy)
        if v17.props.OnTrackSelected then
            v17.props.OnTrackSelected(v34);
        end;
    end;
    v17.onValueChanged = function(v35, v36, v37, v38, v39, v40) --[[ Line: 110 ]]
        -- upvalues: v17 (copy)
        if v17.props.OnValueChanged then
            v17.props.OnValueChanged(v35, v36, v37, v38, v39, v40);
        end;
    end;
    v17.getTrackWidth = function(v41, v42) --[[ Line: 116 ]]
        -- upvalues: v9 (ref)
        return v9.INDENT_PADDING * v41 + v42 + v9.TRACKLIST_RIGHT_PADDING;
    end;
end;
v16.renderSummaryTrack = function(v43, v44, v45, v46) --[[ Line: 121 ]] --[[ Name: renderSummaryTrack ]]
    -- upvalues: v9 (copy), v1 (copy), v12 (copy)
    local v47 = v43.getTextWidth(v44, v46);
    local v48 = v43.getTrackWidth(1, v47 + v9.TRACKLIST_BUTTON_SIZE);
    v43.maxTrackWidth = math.max(v43.maxTrackWidth, v48);
    v45.SummaryTrack = v1.createElement(v12, {
        LayoutOrder = v43.trackCount, 
        Name = v44, 
        UnusedTracks = v43.props.UnusedTracks, 
        OnTrackAdded = v43.onTrackAdded, 
        UnusedFacs = v43.props.UnusedFacs, 
        OnFacsAdded = v43.onFacsAdded
    });
    v43.incrementTrackCount();
end;
v16.renderExpandedCFrameTrack = function(v49, v50, v51, v52) --[[ Line: 138 ]] --[[ Name: renderExpandedCFrameTrack ]]
    -- upvalues: v9 (copy), v4 (copy), v1 (copy), v14 (copy)
    local l_props_0 = v49.props;
    local l_Depth_0 = v50.Depth;
    local l_Instance_0 = v50.Instance;
    local l_Name_0 = v50.Name;
    local l_PROPERTY_KEYS_0 = v9.PROPERTY_KEYS;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local l_Playhead_0 = l_props_0.Playhead;
    local v60 = v49.props.PlayState ~= v9.PLAY_STATE.Pause;
    local v61 = math.max(v49.getTextWidth(l_PROPERTY_KEYS_0.Position, v52), v49.getTextWidth(l_PROPERTY_KEYS_0.Rotation, v52));
    local v62 = v49.getTrackWidth(l_Depth_0, v61);
    local v63 = v4.getCurrentValue(v50, l_Playhead_0, l_AnimationData_0, l_props_0.DefaultEulerAnglesOrder);
    local v64 = v4.getItemsForProperty(v50, v63, nil, l_props_0.DefaultEulerAnglesOrder);
    v62 = v62 + #v64.Position * (v9.NUMBERBOX_WIDTH + v9.NUMBERTRACK_PADDING * 2);
    v49.maxTrackWidth = math.max(v49.maxTrackWidth, v62);
    local v65 = if v50.Type == v9.TRACK_TYPES.Facs then v9.NUMBERBOX_FACS_DRAG_MULTIPLIER else v9.NUMBERBOX_DRAG_MULTIPLIER;
    local function v73(v66, v67) --[[ Line: 162 ]] --[[ Name: makeNumberTrack ]]
        -- upvalues: v51 (copy), v1 (ref), v14 (ref), v49 (copy), v61 (copy), v64 (copy), v9 (ref), l_Depth_0 (copy), v60 (copy), v65 (copy), v50 (copy), v4 (ref), l_props_0 (copy), l_Instance_0 (copy), l_Playhead_0 (copy)
        v51[v66 .. "_" .. v67] = v1.createElement(v14, {
            LayoutOrder = v49.trackCount, 
            Name = v67, 
            NameWidth = v61, 
            Items = v64[v67], 
            Height = v9.TRACK_HEIGHT, 
            Indent = l_Depth_0, 
            ReadOnly = v60, 
            DragMultiplier = v65, 
            OnItemChanged = function(v68, v69) --[[ Line: 172 ]] --[[ Name: OnItemChanged ]]
                -- upvalues: v50 (ref), v9 (ref), v64 (ref), v67 (copy), v4 (ref), l_props_0 (ref), v49 (ref), l_Instance_0 (ref), v66 (copy), l_Playhead_0 (ref)
                if v50.Type == v9.TRACK_TYPES.Facs then
                    v69 = math.clamp(math.floor(0.5 + v69 * 100) / 100, 0, 1);
                end;
                for _, v71 in ipairs(v64[v67]) do
                    if v71.Key == v68 then
                        v71.Value = v69;
                    end;
                end;
                local v72 = v4.getPropertyForItems(v50, v64, l_props_0.DefaultEulerAnglesOrder);
                v49.onValueChanged(l_Instance_0, {
                    v66
                }, v50.Type, nil, l_Playhead_0, v72);
                return v69;
            end, 
            OnChangeBegan = l_props_0.OnChangeBegan
        });
        v49.incrementTrackCount();
    end;
    v73(l_Name_0, l_PROPERTY_KEYS_0.Position);
    v73(l_Name_0, l_PROPERTY_KEYS_0.Rotation);
end;
v16.renderExpandedGenericTrack = function(v74, v75, v76, _) --[[ Line: 194 ]] --[[ Name: renderExpandedGenericTrack ]]
    -- upvalues: v1 (copy), v13 (copy), v9 (copy)
    local l_Depth_1 = v75.Depth;
    v76["Expanded_" .. v75.Name] = v1.createElement(v13, {
        LayoutOrder = v74.trackCount, 
        Height = v9.TRACK_HEIGHT, 
        Indent = l_Depth_1
    });
    v74.incrementTrackCount();
end;
v16.renderExpandedTracks = function(v79, v80, v81, v82) --[[ Line: 206 ]] --[[ Name: renderExpandedTracks ]]
    -- upvalues: v9 (copy)
    if v80.Type == v9.TRACK_TYPES.CFrame then
        v79:renderExpandedCFrameTrack(v80, v81, v82);
        return;
    else
        v79:renderExpandedGenericTrack(v80, v81, v82);
        return;
    end;
end;
v16.isSelected = function(v83, v84) --[[ Line: 216 ]] --[[ Name: isSelected ]]
    if v83.props.SelectedTracks then
        for _, v86 in ipairs(v83.props.SelectedTracks) do
            if v84 == v86 then
                return true;
            end;
        end;
    end;
    return false;
end;
v16.renderTrack = function(v87, v88, v89, v90, v91, _, v93) --[[ Line: 227 ]] --[[ Name: renderTrack ]]
    -- upvalues: v4 (copy), v9 (copy), v10 (copy), v2 (copy), v11 (copy), v1 (copy), v14 (copy)
    local l_props_1 = v87.props;
    local l_SelectedTracks_0 = l_props_1.SelectedTracks;
    local l_Name_1 = v88.Name;
    local l_Instance_1 = v88.Instance;
    local l_Depth_2 = v88.Depth;
    local l_Type_0 = v88.Type;
    local v100 = v93 or v4.getRotationType(v88);
    local l_Expanded_0 = v88.Expanded;
    local l_Playhead_1 = l_props_1.Playhead;
    local l_AnimationData_1 = l_props_1.AnimationData;
    local v104 = l_props_1.PlayState ~= v9.PLAY_STATE.Pause;
    local l_ReadOnly_0 = l_props_1.ReadOnly;
    local v106 = l_AnimationData_1 and l_AnimationData_1.Metadata and l_AnimationData_1.Metadata.IsChannelAnimation;
    local v107 = nil;
    v107 = if v106 then v88.Components and not v10(v88.Components) else l_Type_0 == v9.TRACK_TYPES.CFrame;
    local v108 = v87.getTextWidth(l_Name_1, v90);
    local v109 = v87.getTrackWidth(0, v108) + (v9.NUMBERBOX_WIDTH + v9.NUMBERTRACK_PADDING * 2);
    local v110 = v2.List.join(v91 or {}, {
        l_Name_1
    });
    local v111 = table.concat(v110, "_");
    local v112 = nil;
    if l_Type_0 ~= v9.TRACK_TYPES.CFrame then
        local v113 = v4.getCurrentValueForPath(v110, l_Instance_1, l_Playhead_1, l_AnimationData_1, l_Type_0, l_props_1.DefaultEulerAnglesOrder);
        v112 = v106 and l_Expanded_0 and {} or v4.getItemsForProperty(v88, v113, l_Name_1, l_props_1.DefaultEulerAnglesOrder);
    else
        v112 = {};
    end;
    local v114 = v11.findPath(l_SelectedTracks_0, v110) ~= nil;
    v87.maxTrackWidth = math.max(v87.maxTrackWidth, v109);
    local v115 = if v88.Type == v9.TRACK_TYPES.Facs then v9.NUMBERBOX_FACS_DRAG_MULTIPLIER else v9.NUMBERBOX_DRAG_MULTIPLIER;
    v89["Track_" .. v111] = v1.createElement(v14, {
        LayoutOrder = v87.trackCount, 
        Name = l_Name_1, 
        NameWidth = v108, 
        Items = v112, 
        Height = v9.TRACK_HEIGHT, 
        Indent = l_Depth_2, 
        ReadOnly = v104 or l_ReadOnly_0, 
        Expanded = l_Expanded_0, 
        Selected = v114, 
        DragMultiplier = v115, 
        OnItemChanged = function(v116, v117) --[[ Line: 293 ]] --[[ Name: OnItemChanged ]]
            -- upvalues: v88 (copy), v9 (ref), v112 (ref), v4 (ref), l_props_1 (copy), v87 (copy), l_Instance_1 (copy), v110 (copy), l_Type_0 (copy), v100 (copy), l_Playhead_1 (copy)
            if v88.Type == v9.TRACK_TYPES.Facs then
                v117 = math.clamp(v117, 0, 1);
            end;
            for _, v119 in ipairs(v112) do
                if v119.Key == v116 then
                    v119.Value = v117;
                end;
            end;
            local v120 = v4.getPropertyForItems(v88, v112, l_props_1.DefaultEulerAnglesOrder);
            v87.onValueChanged(l_Instance_1, v110, l_Type_0, v100, l_Playhead_1, v120);
            return v117;
        end, 
        OnExpandToggled = v107 and function(v121) --[[ Line: 306 ]]
            -- upvalues: v87 (copy), v110 (copy)
            v87.onTrackExpandToggled(v110, v121);
        end or nil, 
        OnChangeBegan = l_props_1.OnChangeBegan, 
        OnContextButtonClick = function() --[[ Line: 311 ]] --[[ Name: OnContextButtonClick ]]
            -- upvalues: v87 (copy), l_Instance_1 (copy), v110 (copy), l_Type_0 (copy), v100 (copy)
            v87.onContextButtonClick(l_Instance_1, v110, l_Type_0, v100);
        end, 
        OnTrackSelected = function() --[[ Line: 314 ]] --[[ Name: OnTrackSelected ]]
            -- upvalues: v87 (copy), v110 (copy)
            v87.onTrackSelected(v110);
        end
    });
    v87.incrementTrackCount();
    if l_Expanded_0 then
        if v106 then
            for _, v123 in ipairs(v9.COMPONENT_TRACK_TYPES[v88.Type]._Order) do
                v87:renderTrack(v88.Components[v123], v89, v90, v110, v88.Type, v100);
            end;
        else
            v87:renderExpandedTracks(v88, v89, v90);
        end;
    end;
end;
v16.renderTracks = function(v124, v125, v126, v127) --[[ Line: 332 ]] --[[ Name: renderTracks ]]
    -- upvalues: v1 (copy)
    local l_props_2 = v124.props;
    local l_Tracks_0 = l_props_2.Tracks;
    local l_RootName_0 = l_props_2.RootName;
    local v131 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    v124:renderSummaryTrack(l_RootName_0, v131, v127);
    for v132, v133 in ipairs(l_Tracks_0) do
        if v125 <= v132 and v124.trackCount <= v126 then
            v124:renderTrack(v133, v131, v127);
        end;
    end;
    return v131;
end;
v16.render = function(v134) --[[ Line: 354 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v1 (copy), v15 (copy)
    v134.resetTrackCount();
    v134.maxTrackWidth = 0;
    local l_props_3 = v134.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_state_0 = v134.state;
    local l_Size_0 = l_props_3.Size;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local l_Y_0 = l_state_0.AbsoluteSize.Y;
    local l_X_0 = l_state_0.AbsoluteSize.X;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local _ = nil;
    local v144 = v134:renderTracks(l_TopTrackIndex_0, if l_TopTrackIndex_0 == 0 then math.ceil((l_Y_0 - v9.SUMMARY_TRACK_HEIGHT) / v9.TRACK_HEIGHT) + 1 else l_TopTrackIndex_0 + math.ceil(l_Y_0 / v9.TRACK_HEIGHT) - 1, l_Stylizer_0);
    return v1.createElement(v15, {
        Size = l_Size_0, 
        Width = l_X_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        CanvasSize = UDim2.new(0, v134.maxTrackWidth + v9.TRACKLIST_RIGHT_PADDING, 0, 0), 
        ZIndex = 2, 
        OnInputChanged = v134.inputChanged, 
        OnSizeChanged = v134.sizeChanged
    }, v144);
end;
v16 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v6
})(v16);
return v3.connect(function(v145, _) --[[ Line: 395 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v145.Status;
    return {
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        IsPlaying = l_Status_0.IsPlaying, 
        PlayState = l_Status_0.PlayState, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(_) --[[ Line: 405 ]] --[[ Name: mapDispatchToProps ]]
    return {};
end)(v16);