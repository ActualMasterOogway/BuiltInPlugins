local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Components.SummaryTrack);
local v4 = require(l_script_FirstAncestor_0.Src.Components.DopeSheetTrack);
local v5 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v6 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = v1.PureComponent:extend("DopeSheet");
v8.renderSummaryTrack = function(v9, v10, _, _, v13) --[[ Line: 45 ]] --[[ Name: renderSummaryTrack ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_props_0 = v9.props;
    local l_StartTick_0 = l_props_0.StartTick;
    local l_EndTick_0 = l_props_0.EndTick;
    local l_Tracks_0 = l_props_0.Tracks;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    local l_NamedKeyframes_0 = l_props_0.NamedKeyframes;
    local l_SummaryTrackHeight_0 = l_props_0.SummaryTrackHeight;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v22 = l_props_0.Padding or 0;
    local l_OnKeyActivated_0 = l_props_0.OnKeyActivated;
    local l_OnKeyRightClick_0 = l_props_0.OnKeyRightClick;
    local l_OnKeyInputBegan_0 = l_props_0.OnKeyInputBegan;
    local l_OnKeyInputEnded_0 = l_props_0.OnKeyInputEnded;
    local v27 = l_props_0.ParentSize.X - v22;
    v10.SummaryTrack = v1.createElement(v3, {
        Tracks = l_Tracks_0, 
        SelectedKeyframes = l_SelectedKeyframes_0, 
        NamedKeyframes = l_NamedKeyframes_0, 
        LayoutOrder = 0, 
        Size = UDim2.new(1, 0, 0, l_SummaryTrackHeight_0), 
        Width = v27, 
        StartTick = l_StartTick_0, 
        EndTick = l_EndTick_0, 
        ShowCluster = v13, 
        ZIndex = l_ZIndex_0, 
        OnKeyActivated = l_OnKeyActivated_0, 
        OnKeyRightClick = l_OnKeyRightClick_0, 
        OnKeyInputBegan = l_OnKeyInputBegan_0, 
        OnKeyInputEnded = l_OnKeyInputEnded_0
    });
end;
v8.renderTrackHierarchy = function(v28, v29, v30, v31, v32, v33) --[[ Line: 82 ]] --[[ Name: renderTrackHierarchy ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v7 (copy)
    local l_props_1 = v28.props;
    local l_StartTick_1 = l_props_1.StartTick;
    local l_EndTick_1 = l_props_1.EndTick;
    local l_SelectedKeyframes_1 = l_props_1.SelectedKeyframes;
    local l_TrackHeight_0 = l_props_1.TrackHeight;
    local l_ZIndex_1 = l_props_1.ZIndex;
    local v40 = l_props_1.Padding or 0;
    local l_OnKeyActivated_1 = l_props_1.OnKeyActivated;
    local l_OnKeyRightClick_1 = l_props_1.OnKeyRightClick;
    local l_OnKeyInputBegan_1 = l_props_1.OnKeyInputBegan;
    local l_OnKeyInputEnded_1 = l_props_1.OnKeyInputEnded;
    local v45 = l_props_1.ParentSize.X - v40;
    v33 = v2.List.join(v33 or {}, {
        v30.Name
    });
    local v46 = "Track_" .. table.concat(v33, "_");
    v32 = v32 or 0;
    v29[v46] = v1.createElement(v4, {
        Track = v30, 
        Path = v33, 
        SelectedKeyframes = l_SelectedKeyframes_1, 
        LayoutOrder = v32, 
        Size = UDim2.new(1, 0, 0, l_TrackHeight_0), 
        Width = v45, 
        StartTick = l_StartTick_1, 
        EndTick = l_EndTick_1, 
        ShowCluster = v31, 
        ZIndex = l_ZIndex_1, 
        IsChannelAnimation = true, 
        OnKeyActivated = l_OnKeyActivated_1, 
        OnKeyRightClick = l_OnKeyRightClick_1, 
        OnKeyInputBegan = l_OnKeyInputBegan_1, 
        OnKeyInputEnded = l_OnKeyInputEnded_1
    });
    v32 = v32 + 1;
    if v30.Expanded then
        for _, v48 in ipairs(v7.COMPONENT_TRACK_TYPES[v30.Type]._Order) do
            v32 = v28:renderTrackHierarchy(v29, v30.Components[v48], v31, v32, v33);
        end;
    end;
    return v32;
end;
v8.renderTracks = function(v49, v50, v51, v52, v53) --[[ Line: 132 ]] --[[ Name: renderTracks ]]
    -- upvalues: v1 (copy), v4 (copy), v6 (copy), v5 (copy)
    local l_props_2 = v49.props;
    local l_StartTick_2 = l_props_2.StartTick;
    local l_EndTick_2 = l_props_2.EndTick;
    local l_Tracks_1 = l_props_2.Tracks;
    local l_SelectedKeyframes_2 = l_props_2.SelectedKeyframes;
    local l_TrackHeight_1 = l_props_2.TrackHeight;
    local l_ZIndex_2 = l_props_2.ZIndex;
    local v61 = l_props_2.Padding or 0;
    local l_IsChannelAnimation_0 = l_props_2.IsChannelAnimation;
    local l_OnKeyActivated_2 = l_props_2.OnKeyActivated;
    local l_OnKeyRightClick_2 = l_props_2.OnKeyRightClick;
    local l_OnKeyInputBegan_2 = l_props_2.OnKeyInputBegan;
    local l_OnKeyInputEnded_2 = l_props_2.OnKeyInputEnded;
    local v67 = l_props_2.ParentSize.X - v61;
    local v68 = 1;
    local function _() --[[ Line: 151 ]] --[[ Name: incrementTrackCount ]]
        -- upvalues: v68 (ref)
        v68 = v68 + 1;
    end;
    for v70, v71 in ipairs(l_Tracks_1) do
        if v51 <= v70 and v70 <= v52 then
            if l_IsChannelAnimation_0 then
                v68 = v49:renderTrackHierarchy(v50, v71, v53, v68);
            else
                v50["Track_" .. v71.Name] = v1.createElement(v4, {
                    Track = v71, 
                    IsChannelAnimation = false, 
                    SelectedKeyframes = l_SelectedKeyframes_2, 
                    LayoutOrder = v68, 
                    Size = UDim2.new(1, 0, 0, l_TrackHeight_1), 
                    Width = v67, 
                    StartTick = l_StartTick_2, 
                    EndTick = l_EndTick_2, 
                    ShowCluster = v53, 
                    ZIndex = l_ZIndex_2, 
                    OnKeyActivated = l_OnKeyActivated_2, 
                    OnKeyRightClick = l_OnKeyRightClick_2, 
                    OnKeyInputBegan = l_OnKeyInputBegan_2, 
                    OnKeyInputEnded = l_OnKeyInputEnded_2
                });
                v68 = v68 + 1;
                if v71.Expanded then
                    for v72 = 1, v6.getExpandedSize(v71) - 1 do
                        v50["Fill_" .. v71.Name .. "_" .. v72] = v1.createElement(v5, {
                            LayoutOrder = v68, 
                            Size = UDim2.new(1, 0, 0, l_TrackHeight_1), 
                            Width = v67, 
                            ZIndex = l_ZIndex_2
                        });
                        v68 = v68 + 1;
                    end;
                end;
            end;
        end;
    end;
end;
v8.countKeyframes = function(v73, v74) --[[ Line: 200 ]] --[[ Name: countKeyframes ]]
    -- upvalues: v6 (copy)
    local l_props_3 = v73.props;
    local l_StartTick_3 = l_props_3.StartTick;
    local l_EndTick_3 = l_props_3.EndTick;
    local l_Tracks_2 = l_props_3.Tracks;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local v80 = 0;
    local l_l_TopTrackIndex_0_0 = l_TopTrackIndex_0;
    for v82, v83 in ipairs(l_Tracks_2) do
        local l_Keyframes_0 = v83.Keyframes;
        if l_Keyframes_0 and l_TopTrackIndex_0 <= v82 and v82 <= v74 and l_l_TopTrackIndex_0_0 <= v82 then
            v80 = v80 + v6.countVisibleKeyframes(l_Keyframes_0, l_StartTick_3, l_EndTick_3);
            if l_Tracks_2[v82].Expanded then
                l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + v6.getExpandedSize(v83);
            else
                l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + 1;
            end;
        end;
    end;
    return v80;
end;
v8.render = function(v85) --[[ Line: 228 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy)
    local l_props_4 = v85.props;
    local l_TopTrackIndex_1 = l_props_4.TopTrackIndex;
    local l_TrackHeight_2 = l_props_4.TrackHeight;
    local l_SummaryTrackHeight_1 = l_props_4.SummaryTrackHeight;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Position_0 = l_props_4.Position;
    local l_Size_0 = l_props_4.Size;
    local l_Y_0 = l_props_4.ParentSize.Y;
    local v94 = l_TopTrackIndex_1 - 1 + math.ceil((l_Y_0 - l_SummaryTrackHeight_1) / l_TrackHeight_2);
    local v95 = v85:countKeyframes(v94) > v7.MAX_VISIBLE_KEYFRAMES;
    local v96 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    v85:renderSummaryTrack(v96, l_TopTrackIndex_1, v94, v95);
    v85:renderTracks(v96, l_TopTrackIndex_1, v94, v95);
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v96);
end;
return v8;