local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Keyframe);
local v6 = require(l_script_FirstAncestor_0.Src.Components.KeyframeCluster);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v8 = v1.PureComponent:extend("SummaryTrack");
v8.getSummaryKeyframes = function(v9) --[[ Line: 41 ]] --[[ Name: getSummaryKeyframes ]]
    -- upvalues: v4 (copy)
    local l_props_0 = v9.props;
    local l_Tracks_0 = l_props_0.Tracks;
    local l_StartTick_0 = l_props_0.StartTick;
    local l_EndTick_0 = l_props_0.EndTick;
    local l_PreviewKeyframes_0 = l_props_0.PreviewKeyframes;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    return v4.getSummaryKeyframes(l_Tracks_0, l_StartTick_0, l_EndTick_0, l_SelectedKeyframes_0, l_PreviewKeyframes_0);
end;
v8.renderKeyframe = function(v16, v17, v18, v19, v20) --[[ Line: 52 ]] --[[ Name: renderKeyframe ]]
    -- upvalues: v1 (copy), v5 (copy), v3 (copy), v7 (copy)
    local l_props_1 = v16.props;
    return v1.createElement(v5, {
        Selected = v17, 
        KeyframeStyle = v3.KEYFRAME_STYLE.Primary, 
        Position = UDim2.new(0, v18, 0.5, 0), 
        ZIndex = l_props_1.ZIndex, 
        Width = v3.SUMMARY_KEYFRAME_WIDTH, 
        BorderSizePixel = v17 and 2 or 1, 
        Filled = true, 
        Named = v20 ~= nil, 
        OnActivated = l_props_1.OnKeyActivated, 
        OnRightClick = function(_, _) --[[ Line: 65 ]] --[[ Name: OnRightClick ]]
            -- upvalues: l_props_1 (copy), v19 (copy), v17 (copy)
            l_props_1.OnKeyRightClick(nil, nil, v19, v17);
        end, 
        OnInputBegan = function(_, v25) --[[ Line: 69 ]] --[[ Name: OnInputBegan ]]
            -- upvalues: l_props_1 (copy), v19 (copy), v17 (copy)
            l_props_1.OnKeyInputBegan(nil, nil, v19, v17, v25);
        end, 
        OnInputEnded = function(_, v27) --[[ Line: 73 ]] --[[ Name: OnInputEnded ]]
            -- upvalues: l_props_1 (copy), v19 (copy), v17 (copy)
            l_props_1.OnKeyInputEnded(v19, v17, v27);
        end
    }, {
        Tooltip = v20 and v1.createElement(v7, {
            Text = v20, 
            ShowDelay = 0
        })
    });
end;
v8.renderKeyframeCluster = function(_, v29, v30, v31, v32) --[[ Line: 84 ]] --[[ Name: renderKeyframeCluster ]]
    -- upvalues: v1 (copy), v6 (copy)
    return v1.createElement(v6, {
        Primary = true, 
        Position = UDim2.new(0, v29, 0.5, 0), 
        Size = UDim2.new(0, v30 - v29, 0, v31), 
        ZIndex = v32
    });
end;
v8.renderKeyframes = function(v33, v34) --[[ Line: 93 ]] --[[ Name: renderKeyframes ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v35, v36 = v33:getSummaryKeyframes();
    table.sort(v35);
    if #v35 == 0 then
        return;
    else
        local l_props_2 = v33.props;
        local l_Width_0 = l_props_2.Width;
        local l_StartTick_1 = l_props_2.StartTick;
        local l_EndTick_1 = l_props_2.EndTick;
        local l_ShowCluster_0 = l_props_2.ShowCluster;
        local l_NamedKeyframes_0 = l_props_2.NamedKeyframes;
        local v43, v44 = v4.getKeyframesExtents(v35, l_StartTick_1, l_EndTick_1);
        if l_ShowCluster_0 then
            v34[v44] = v33:renderKeyframeCluster(v4.getScaledKeyframePosition(v35[v43], l_StartTick_1, l_EndTick_1, l_Width_0), v4.getScaledKeyframePosition(v35[v44], l_StartTick_1, l_EndTick_1, l_Width_0), v3.MIN_SPACE_BETWEEN_KEYS);
            return;
        else
            if v43 ~= nil and v44 ~= nil then
                for v45 = v43, v44 do
                    local v46 = v35[v45];
                    local v47 = v4.getScaledKeyframePosition(v46, l_StartTick_1, l_EndTick_1, l_Width_0);
                    v34[v45] = v33:renderKeyframe(v36[v46], v47, v46, l_NamedKeyframes_0[v46]);
                end;
            end;
            return;
        end;
    end;
end;
v8.render = function(v48) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_props_3 = v48.props;
    l_props_3.Primary = true;
    local v50 = {};
    v48:renderKeyframes(v50);
    return v1.createElement(v2, l_props_3, v50);
end;
return v8;