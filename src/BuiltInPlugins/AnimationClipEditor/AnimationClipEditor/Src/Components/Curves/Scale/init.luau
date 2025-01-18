local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Curves.ScaleTick);
local v6 = v1.PureComponent:extend("Scale");
v6.init = function(v7) --[[ Line: 55 ]] --[[ Name: init ]]
    v7.state = {
        majorInterval = 1, 
        minorInterval = 1
    };
end;
v6.calculateInterval = function(v8) --[[ Line: 62 ]] --[[ Name: calculateInterval ]]
    -- upvalues: v4 (copy)
    local v9 = math.min(v8.VerticalZoom, 0.99);
    local v10 = (v8.MaxValue - v8.MinValue) * (1 - v9);
    local l_Y_0 = v8.ParentSize.Y;
    local v12 = v4.SCALE_TICK_SPACING * v10 / l_Y_0;
    local v13 = math.pow(10, (math.floor((math.log10(v12)))));
    local v14 = v4.SCALE_NUM_TICKS * v13;
    if v12 < v14 then
        return v13;
    else
        return v14;
    end;
end;
v6.scale = function(v15, v16) --[[ Line: 80 ]] --[[ Name: scale ]]
    -- upvalues: v4 (copy)
    local l_props_0 = v15.props;
    local l_MinValue_0 = l_props_0.MinValue;
    local l_MaxValue_0 = l_props_0.MaxValue;
    local l_VerticalScroll_0 = l_props_0.VerticalScroll;
    local v21 = math.min(l_props_0.VerticalZoom, 0.99);
    local v22 = 1 / (1 - v21);
    return ((l_MaxValue_0 - v16) / (l_MaxValue_0 - l_MinValue_0) - l_VerticalScroll_0 * v21) * v22 * l_props_0.ParentSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING) + l_props_0.ParentSize.Y * v4.CURVE_CANVAS_PADDING;
end;
v6.inverseScale = function(v23, v24) --[[ Line: 99 ]] --[[ Name: inverseScale ]]
    -- upvalues: v4 (copy)
    local l_props_1 = v23.props;
    local l_MinValue_1 = l_props_1.MinValue;
    local l_MaxValue_1 = l_props_1.MaxValue;
    local l_VerticalScroll_1 = l_props_1.VerticalScroll;
    local v29 = math.min(l_props_1.VerticalZoom, 0.99);
    local v30 = 1 / (1 - v29);
    return l_MaxValue_1 - ((v24 - l_props_1.ParentSize.Y * v4.CURVE_CANVAS_PADDING) / (l_props_1.ParentSize.Y * (1 - 2 * v4.CURVE_CANVAS_PADDING)) / v30 + l_VerticalScroll_1 * v29) * (l_MaxValue_1 - l_MinValue_1);
end;
v6.getDerivedStateFromProps = function(v31, _) --[[ Line: 116 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v6 (ref), v4 (copy)
    if v31.ParentSize.Y == 0 then
        return {};
    else
        local v33 = v6.calculateInterval(v31);
        return {
            majorInterval = v33, 
            minorInterval = v33 / v4.SCALE_NUM_TICKS
        };
    end;
end;
v6.renderTick = function(v34, v35, v36, v37, v38) --[[ Line: 128 ]] --[[ Name: renderTick ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_props_2 = v34.props;
    local l_Width_0 = l_props_2.Width;
    local l_ScaleType_0 = l_props_2.ScaleType;
    table.insert(v35, v1.createElement(v5, {
        Value = v37 or "", 
        Width = l_Width_0, 
        Position = UDim2.new(0, 0, 0, v34:scale(v36)), 
        TickWidthScale = v38, 
        ScaleType = l_ScaleType_0
    }));
end;
v6.formatLabel = function(v42, v43) --[[ Line: 145 ]] --[[ Name: formatLabel ]]
    -- upvalues: v4 (copy)
    if v42.props.ScaleType == v4.SCALE_TYPE.Angle then
        return string.format("%d\194\176", (math.floor(v43)));
    else
        return string.format("%0.3f", v43);
    end;
end;
v6.render = function(v44) --[[ Line: 154 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_3 = v44.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_timelineTheme_0 = l_Stylizer_0.timelineTheme;
    if l_props_3.ParentSize.Y == 0 then
        return;
    else
        local v48 = {};
        local v49 = v44:inverseScale(l_props_3.ParentSize.Y);
        local v50 = v44:inverseScale(0);
        for v51 = math.floor(v49 / v44.state.majorInterval) * v44.state.majorInterval, math.ceil(v50 / v44.state.majorInterval) * v44.state.majorInterval, v44.state.majorInterval do
            v44:renderTick(v48, v51, v44:formatLabel(v51), l_props_3.TickWidthScale);
            for v52 = 1, 4 do
                v44:renderTick(v48, v51 + v52 * v44.state.minorInterval, "", l_props_3.SmallTickWidthScale);
            end;
        end;
        return v1.createElement("Frame", {
            Size = l_props_3.Size, 
            Position = l_props_3.Position, 
            BackgroundColor3 = l_timelineTheme_0.barColor, 
            BorderColor3 = l_Stylizer_0.borderColor, 
            BorderSizePixel = 1, 
            ZIndex = l_props_3.ZIndex
        }, v48);
    end;
end;
v6 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6);
return v6;