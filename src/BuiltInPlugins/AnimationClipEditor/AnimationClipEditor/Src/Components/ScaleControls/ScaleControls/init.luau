local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleHandle);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.TimeTag);
local v11 = v1.PureComponent:extend("PureComponent");
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v13 = UDim2.new(0, 30, 0, 18);
v11.init = function(v14) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v7 (copy), v2 (copy), v5 (copy)
    v14.leftScaleHandleDragStart = function() --[[ Line: 53 ]]
        -- upvalues: v14 (copy)
        if v14.props.OnScaleHandleDragStart then
            local l_latestKeyframe_0 = v14.getSelectionData().latestKeyframe;
            v14.props.OnScaleHandleDragStart(l_latestKeyframe_0);
        end;
    end;
    v14.rightScaleHandleDragStart = function() --[[ Line: 60 ]]
        -- upvalues: v14 (copy)
        if v14.props.OnScaleHandleDragStart then
            local l_earliestKeyframe_0 = v14.getSelectionData().earliestKeyframe;
            v14.props.OnScaleHandleDragStart(l_earliestKeyframe_0);
        end;
    end;
    v14.getSelectionChannelExtents = function(v17) --[[ Line: 67 ]]
        -- upvalues: v14 (copy), v6 (ref), v7 (ref), v2 (ref), v5 (ref)
        local l_props_0 = v14.props;
        local l_Tracks_0 = l_props_0.Tracks;
        local l_TopTrackIndex_0 = l_props_0.TopTrackIndex;
        local v21 = 1;
        local l_topSelectedChannelIndex_0 = v17.topSelectedChannelIndex;
        local l_bottomSelectedChannelIndex_0 = v17.bottomSelectedChannelIndex;
        local v24 = nil;
        local v25 = nil;
        local l_l_TopTrackIndex_0_0 = l_TopTrackIndex_0;
        while #l_Tracks_0 >= l_l_TopTrackIndex_0_0 do
            local v27 = l_Tracks_0[l_l_TopTrackIndex_0_0];
            local function v28(v29, v30) --[[ Line: 81 ]] --[[ Name: traverse ]]
                -- upvalues: v6 (ref), l_l_TopTrackIndex_0_0 (ref), l_topSelectedChannelIndex_0 (copy), v24 (ref), v21 (ref), l_bottomSelectedChannelIndex_0 (copy), v25 (ref), v14 (ref), v7 (ref), v28 (copy), v2 (ref), v5 (ref)
                local v31 = v6.getPathValue(v30);
                local v32 = l_l_TopTrackIndex_0_0 + v31;
                if l_topSelectedChannelIndex_0 <= v32 and v24 == nil then
                    v24 = v21;
                end;
                if v32 <= l_bottomSelectedChannelIndex_0 then
                    v25 = v21;
                end;
                if v29.Expanded then
                    if v14.props.IsChannelAnimation then
                        v21 = v21 + 1;
                        for _, v34 in ipairs(v7.COMPONENT_TRACK_TYPES[v29.Type]._Order) do
                            local v35 = v29.Components and v29.Components[v34];
                            if v35 then
                                v28(v35, v2.List.join(v30, {
                                    v34
                                }));
                            end;
                        end;
                        return;
                    else
                        v21 = v21 + v5.getExpandedSize(v29);
                        return;
                    end;
                else
                    v21 = v21 + 1;
                    return;
                end;
            end;
            v28(v27, {});
            l_l_TopTrackIndex_0_0 = l_l_TopTrackIndex_0_0 + 1;
        end;
        return v24, v25;
    end;
    v14.calculateScaleHandleExtents = function(v36) --[[ Line: 113 ]]
        -- upvalues: v14 (copy), v5 (ref), v7 (ref)
        local l_props_1 = v14.props;
        local l_StartTick_0 = l_props_1.StartTick;
        local l_EndTick_0 = l_props_1.EndTick;
        local l_DopeSheetWidth_0 = l_props_1.DopeSheetWidth;
        if l_props_1.UseFullHeight then
            return {
                left = v5.getScaledKeyframePosition(v36.earliestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0), 
                right = v5.getScaledKeyframePosition(v36.latestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0)
            };
        else
            local v41, v42 = v14.getSelectionChannelExtents(v36);
            if v41 and v42 then
                return {
                    top = v7.SUMMARY_TRACK_HEIGHT + (v41 - 1) * v7.TRACK_HEIGHT, 
                    bottom = v7.SUMMARY_TRACK_HEIGHT + v42 * v7.TRACK_HEIGHT, 
                    left = v5.getScaledKeyframePosition(v36.earliestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0), 
                    right = v5.getScaledKeyframePosition(v36.latestKeyframe, l_StartTick_0, l_EndTick_0, l_DopeSheetWidth_0)
                };
            else
                return nil;
            end;
        end;
    end;
    v14.getSelectionData = function() --[[ Line: 161 ]]
        -- upvalues: v14 (copy), v6 (ref), v2 (ref), v5 (ref)
        local v43 = v14.props.EndTick + 1;
        local v44 = 0;
        local l_SelectedKeyframes_0 = v14.props.SelectedKeyframes;
        local v46 = nil;
        local v47 = nil;
        local function v48(v49, v50, v51) --[[ Line: 168 ]] --[[ Name: traverse ]]
            -- upvalues: v14 (ref), v6 (ref), v46 (ref), v47 (ref), v43 (ref), v44 (ref), v2 (ref), v48 (copy)
            if v49.Selection then
                if not v14.props.UseFullHeight then
                    local v52 = v50 + v6.getPathValue(v51);
                    if v46 == nil then
                        v46 = v52;
                        v47 = v52;
                    else
                        v46 = math.min(v46, v52);
                        v47 = math.max(v47, v52);
                    end;
                end;
                local l_pairs_0 = pairs;
                local v54 = v49.Selection or {};
                for v55, _ in l_pairs_0(v54) do
                    v43 = math.min(v43, v55);
                    v44 = math.max(v44, v55);
                end;
            end;
            local l_pairs_1 = pairs;
            local v58 = v49.Components or {};
            for v59, v60 in l_pairs_1(v58) do
                local v61 = v2.List.join(v51, {
                    v59
                });
                v48(v60, v50, v61);
            end;
        end;
        for _, v63 in pairs(l_SelectedKeyframes_0) do
            for v64, v65 in pairs(v63) do
                if not v14.props.UseFullHeight then
                    local v66 = v5.getTrackIndex(v14.props.Tracks, v64);
                    if v66 then
                        v48(v65, v66, {});
                    end;
                else
                    v48(v65, nil, {});
                end;
            end;
        end;
        return {
            earliestKeyframe = v43, 
            latestKeyframe = v44, 
            topSelectedChannelIndex = v46 or nil, 
            bottomSelectedChannelIndex = v47 or nil
        };
    end;
end;
v11.render = function(v67) --[[ Line: 220 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v7 (copy), v1 (copy), v9 (copy), v10 (copy), v13 (copy), v8 (copy)
    local l_props_2 = v67.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_ShowSelectionArea_0 = l_props_2.ShowSelectionArea;
    local v71 = if v12() then nil else l_props_2.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_2.TimelineUnit;
    local l_Dragging_0 = l_props_2.Dragging;
    local l_FrameRate_0 = l_props_2.FrameRate;
    local l_UseFullHeight_0 = l_props_2.UseFullHeight;
    local l_ZIndex_0 = l_props_2.ZIndex;
    local l_OnScaleHandleDragMoved_0 = l_props_2.OnScaleHandleDragMoved;
    local l_OnScaleHandleDragEnd_0 = l_props_2.OnScaleHandleDragEnd;
    local v79 = v67.getSelectionData();
    local v80 = v67.calculateScaleHandleExtents(v79);
    if not v80 then
        return;
    else
        local l_earliestKeyframe_1 = v79.earliestKeyframe;
        local l_latestKeyframe_1 = v79.latestKeyframe;
        local v83 = UDim.new(0, v80.right - v80.left + 24);
        local v84 = UDim.new(l_UseFullHeight_0 and 1 or 0, l_UseFullHeight_0 and 0 or v80.bottom - v80.top);
        local v85 = nil;
        v85 = if l_UseFullHeight_0 then v7.SUMMARY_TRACK_HEIGHT + (v7.SUMMARY_TRACK_HEIGHT - 18) / 2 else v7.SUMMARY_TRACK_HEIGHT - v80.top + (v7.SUMMARY_TRACK_HEIGHT - 18) / 2;
        return v1.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.selectionBox, 
            BackgroundTransparency = l_ShowSelectionArea_0 and 0.8 or 1, 
            Position = UDim2.new(0, l_props_2.TrackPadding / 2 + v80.left - 12, 0, l_UseFullHeight_0 and 0 or v80.top), 
            Size = UDim2.new(v83, v84), 
            ZIndex = l_ZIndex_0
        }, {
            LeftHandle = v1.createElement(v9, {
                Position = UDim2.new(0, -3, 0, 0), 
                Size = UDim2.new(UDim.new(0, 6), v84), 
                ZIndex = l_ZIndex_0, 
                OnScaleHandleDragStart = v67.leftScaleHandleDragStart, 
                OnScaleHandleDragMoved = l_OnScaleHandleDragMoved_0, 
                OnScaleHandleDragEnd = l_OnScaleHandleDragEnd_0
            }), 
            RightHandle = v1.createElement(v9, {
                Position = UDim2.new(1, -3, 0, 0), 
                Size = UDim2.new(UDim.new(0, 6), v84), 
                ZIndex = l_ZIndex_0, 
                OnScaleHandleDragStart = v67.rightScaleHandleDragStart, 
                OnScaleHandleDragMoved = l_OnScaleHandleDragMoved_0, 
                OnScaleHandleDragEnd = l_OnScaleHandleDragEnd_0
            }), 
            LeftTimeTag = l_Dragging_0 and v1.createElement(v10, {
                Position = UDim2.new(0, 0, 0, v85), 
                Size = v13, 
                AnchorPoint = Vector2.new(1, 1), 
                Time = if v12() then v8.formatTime(l_earliestKeyframe_1, l_FrameRate_0, l_TimelineUnit_0) else v8.formatTime_DEPRECATED(l_earliestKeyframe_1, l_FrameRate_0, v71), 
                ZIndex = l_ZIndex_0
            }), 
            RightTimeTag = l_Dragging_0 and v1.createElement(v10, {
                Position = UDim2.new(1, 0, 0, v85), 
                Size = v13, 
                AnchorPoint = Vector2.new(0, 1), 
                Time = if v12() then v8.formatTime(l_latestKeyframe_1, l_FrameRate_0, l_TimelineUnit_0) else v8.formatTime_DEPRECATED(l_latestKeyframe_1, l_FrameRate_0, v71), 
                ZIndex = l_ZIndex_0
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));