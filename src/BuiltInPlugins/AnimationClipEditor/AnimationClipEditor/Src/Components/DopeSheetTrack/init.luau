local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Keyframe);
local v6 = require(l_script_FirstAncestor_0.Src.Components.KeyframeCluster);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v8 = v1.PureComponent:extend("DopeSheetTrack");
v8.renderKeyframe = function(v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 45 ]] --[[ Name: renderKeyframe ]]
    -- upvalues: v1 (copy), v5 (copy), v3 (copy), v7 (copy)
    local l_props_0 = v9.props;
    local v18 = l_props_0.Path or {
        v12.Name
    };
    local v19 = nil;
    v19 = if l_props_0.IsChannelAnimation then v15 and v15.InterpolationMode and v15.InterpolationMode ~= Enum.KeyInterpolationMode.Linear and v15.InterpolationMode.Name or nil else v15 and v15.EasingStyle and v15.EasingStyle ~= Enum.PoseEasingStyle.Linear and v15.EasingStyle.Name .. ", " .. v15.EasingDirection.Name or nil;
    return v1.createElement(v5, {
        Selected = v10, 
        Position = UDim2.new(0, v11, 0.5, 0), 
        ZIndex = l_props_0.ZIndex, 
        Width = v3.KEYFRAME_WIDTH, 
        BorderSizePixel = v10 and 2 or 1, 
        KeyframeStyle = v3.KEYFRAME_STYLE[v14] or nil, 
        Filled = v16, 
        OnActivated = l_props_0.OnKeyActivated, 
        OnRightClick = function(_, _) --[[ Line: 73 ]] --[[ Name: OnRightClick ]]
            -- upvalues: l_props_0 (copy), v12 (copy), v18 (copy), v13 (copy), v10 (copy)
            l_props_0.OnKeyRightClick(v12.Instance, v18, v13, v10);
        end, 
        OnInputBegan = function(_, v23) --[[ Line: 77 ]] --[[ Name: OnInputBegan ]]
            -- upvalues: l_props_0 (copy), v12 (copy), v18 (copy), v13 (copy), v10 (copy)
            l_props_0.OnKeyInputBegan(v12.Instance, v18, v13, v10, v23);
        end, 
        OnInputEnded = function(_, v25) --[[ Line: 81 ]] --[[ Name: OnInputEnded ]]
            -- upvalues: l_props_0 (copy), v13 (copy), v10 (copy)
            l_props_0.OnKeyInputEnded(v13, v10, v25);
        end
    }, {
        Tooltip = v19 and v1.createElement(v7, {
            Text = v19, 
            ShowDelay = 0
        }) or nil
    });
end;
v8.renderKeyframeCluster = function(_, v27, v28, v29, v30) --[[ Line: 92 ]] --[[ Name: renderKeyframeCluster ]]
    -- upvalues: v1 (copy), v6 (copy)
    return v1.createElement(v6, {
        Position = UDim2.new(0, v27, 0.5, 0), 
        Size = UDim2.new(0, v28 - v27, 0, v29), 
        ZIndex = v30
    });
end;
v8.renderKeyframes = function(v31, v32) --[[ Line: 100 ]] --[[ Name: renderKeyframes ]]
    -- upvalues: v4 (copy), v3 (copy)
    local l_props_1 = v31.props;
    local l_Width_0 = l_props_1.Width;
    local l_Track_0 = l_props_1.Track;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_SelectedKeyframes_0 = l_props_1.SelectedKeyframes;
    local l_ShowCluster_0 = l_props_1.ShowCluster;
    local l_IsChannelAnimation_0 = l_props_1.IsChannelAnimation;
    local v41 = l_props_1.Path or {
        l_Track_0.Name
    };
    local l_Keyframes_0 = l_Track_0.Keyframes;
    local l_Data_0 = l_Track_0.Data;
    local l_Instance_0 = l_Track_0.Instance;
    if l_ShowCluster_0 then
        local v45, v46 = v4.getKeyframesExtents(l_Keyframes_0, l_StartTick_0, l_EndTick_0);
        if v45 ~= nil and v46 ~= nil then
            v32[v46] = v31:renderKeyframeCluster(v4.getScaledKeyframePosition(l_Keyframes_0[v45], l_StartTick_0, l_EndTick_0, l_Width_0), v4.getScaledKeyframePosition(l_Keyframes_0[v46], l_StartTick_0, l_EndTick_0, l_Width_0), v3.MIN_SPACE_BETWEEN_KEYS);
            return;
        end;
    else
        local v47 = v4.getComponentsInfo(l_Track_0, l_StartTick_0, l_EndTick_0);
        local v48 = l_SelectedKeyframes_0[l_Instance_0];
        for _, v50 in ipairs(v41) do
            if v48 then
                v48 = v48.Components and v48.Components[v50] or v48[v50];
            else
                break;
            end;
        end;
        for v51, v52 in pairs(v47) do
            local v53 = nil;
            local v54 = l_Data_0 and l_Data_0[v51];
            local v55 = not l_IsChannelAnimation_0 or v52.Complete;
            if v47[v51].Complete then
                v53 = l_IsChannelAnimation_0 and v47[v51].InterpolationMode or v47[v51].EasingStyle;
            end;
            local v56 = v4.getScaledKeyframePosition(v51, l_StartTick_0, l_EndTick_0, l_Width_0);
            table.insert(v32, v31:renderKeyframe(v48 and v48.Selection and v48.Selection[v51], v56, l_Track_0, v51, v53, v54, v55));
        end;
    end;
end;
v8.render = function(v57) --[[ Line: 151 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_props_2 = v57.props;
    local v59 = {};
    v57:renderKeyframes(v59);
    return v1.createElement(v2, l_props_2, v59);
end;
return v8;